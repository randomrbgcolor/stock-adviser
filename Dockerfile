# Multi-stage build for Stock Advisor application
FROM node:22-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package files
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Build the application
FROM base AS builder
WORKDIR /app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy dependencies
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Build the application
RUN pnpm build

# Production image
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Create a non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 stockadvisor

# Copy built application
COPY --from=builder --chown=stockadvisor:nodejs /app/dist ./dist
COPY --from=builder --chown=stockadvisor:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=stockadvisor:nodejs /app/package.json ./package.json
COPY --from=builder --chown=stockadvisor:nodejs /app/drizzle ./drizzle

USER stockadvisor

EXPOSE 3000

ENV PORT=3000
ENV HOST=0.0.0.0

CMD ["node", "dist/server/index.js"]
