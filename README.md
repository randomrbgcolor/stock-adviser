# Stock Analysis & Portfolio Advisor

A self-hosted web application for AI-powered stock analysis and portfolio management. Get personalized investment recommendations based on your preferences and track your portfolio with real-time data.

## Features

- **Dynamic Stock Search**: Search for stocks by symbol or company name with autocomplete
- **AI-Powered Analysis**: Get buy/sell/hold recommendations using Google Gemini AI
- **Personalized Recommendations**: Tailored advice based on your age, employment, and investment preferences
- **Portfolio Tracking**: Monitor your stocks with real-time price data and performance metrics
- **Return Calculations**: View 1M, 6M, 1Y, and YTD returns for all tracked stocks
- **Customizable Analysis**: Adjust investment horizon and fundamental vs technical analysis preference
- **Persistent Storage**: All data saved in MySQL/TiDB database

## Technology Stack

- **Frontend**: React 19, TypeScript, Tailwind CSS 4, shadcn/ui
- **Backend**: Node.js, Express, tRPC
- **Database**: MySQL/TiDB (via Drizzle ORM)
- **AI**: Google Gemini Pro API
- **Stock Data**: Alpha Vantage API
- **Authentication**: Manus OAuth (or can be customized)

## Prerequisites

- Node.js 22 or higher
- pnpm package manager
- MySQL or TiDB database
- Alpha Vantage API key (free tier available)
- Google Gemini API key (free tier available)

## Getting Started

### 1. Clone the Repository

\`\`\`bash
git clone <repository-url>
cd stock-advisor
\`\`\`

### 2. Install Dependencies

\`\`\`bash
pnpm install
\`\`\`

### 3. Configure Environment Variables

The following environment variables are required:

#### Required API Keys
- \`ALPHA_VANTAGE_API_KEY\`: Get from https://www.alphavantage.co/support/#api-key
- \`GEMINI_API_KEY\`: Get from https://aistudio.google.com/app/apikey

#### Database
- \`DATABASE_URL\`: MySQL/TiDB connection string (e.g., \`mysql://user:password@host:port/database\`)

#### Authentication
- \`JWT_SECRET\`: Random string for session signing
- \`OAUTH_SERVER_URL\`: OAuth server URL (if using Manus OAuth)
- \`VITE_OAUTH_PORTAL_URL\`: OAuth portal URL
- \`VITE_APP_ID\`: OAuth application ID

#### Application Settings
- \`VITE_APP_TITLE\`: Application title (default: "Stock Analysis & Portfolio Advisor")
- \`VITE_APP_LOGO\`: Logo path (default: "/logo.svg")

### 4. Set Up Database

\`\`\`bash
pnpm db:push
\`\`\`

This will create all necessary tables in your database.

### 5. Run Development Server

\`\`\`bash
pnpm dev
\`\`\`

The application will be available at http://localhost:3000

## Docker Deployment

### Using Docker Compose (Recommended)

1. Create a \`.env\` file with your environment variables:

\`\`\`env
DATABASE_URL=mysql://user:password@host:port/database
ALPHA_VANTAGE_API_KEY=your_key_here
GEMINI_API_KEY=your_key_here
JWT_SECRET=your_secret_here
# ... other variables
\`\`\`

2. Build and run:

\`\`\`bash
docker-compose up -d
\`\`\`

The application will be available at http://localhost:3000

### Using Docker Only

\`\`\`bash
# Build the image
docker build -t stock-advisor .

# Run the container
docker run -p 3000:3000 \\
  -e DATABASE_URL=your_database_url \\
  -e ALPHA_VANTAGE_API_KEY=your_key \\
  -e GEMINI_API_KEY=your_key \\
  -e JWT_SECRET=your_secret \\
  stock-advisor
\`\`\`

## Deploying on Manus.im

This application is designed to work seamlessly on the Manus.im platform:

1. Create a new project on Manus.im
2. Upload your code or connect your Git repository
3. Configure the required environment variables in the Manus dashboard
4. Deploy!

All environment variables (database, API keys, OAuth) are automatically configured when deployed on Manus.

## Usage Guide

### Analyzing Stocks

1. Navigate to the "Analyze Stocks" page
2. Search for a stock by symbol or company name
3. Select a stock from the search results
4. Adjust your investment parameters:
   - **Investment Horizon**: How long you plan to hold the stock
   - **Analysis Preference**: Balance between fundamental and technical analysis
5. Fill in your profile information (age, employment status, sector)
6. Click "Analyze Stock" to get AI-powered recommendations
7. Review the objective analysis and personalized advice
8. Add the stock to your portfolio for tracking

### Managing Your Portfolio

1. Navigate to the "My Portfolio" page
2. View all your tracked stocks with real-time data
3. Monitor performance metrics (1M, 6M, 1Y, YTD returns)
4. Remove stocks you no longer want to track
5. Click "Refresh" to update all stock data

## API Rate Limits

- **Alpha Vantage Free Tier**: 25 requests per day, 5 requests per minute
- **Gemini API Free Tier**: 60 requests per minute

The application implements caching to minimize API calls:
- Stock price data is cached for 5 minutes
- Consider upgrading to paid tiers for production use with multiple users

## Project Structure

\`\`\`
stock-advisor/
├── client/                 # Frontend React application
│   ├── src/
│   │   ├── pages/         # Page components
│   │   ├── components/    # Reusable UI components
│   │   └── lib/           # tRPC client setup
├── server/                # Backend Express application
│   ├── routers.ts         # tRPC API routes
│   ├── db.ts              # Database queries
│   ├── stockDataService.ts    # Alpha Vantage integration
│   └── aiAnalysisService.ts   # Gemini AI integration
├── drizzle/               # Database schema and migrations
│   └── schema.ts          # Database table definitions
├── Dockerfile             # Docker configuration
├── docker-compose.yml     # Docker Compose configuration
└── package.json           # Dependencies and scripts
\`\`\`

## Development

### Available Scripts

- \`pnpm dev\`: Start development server
- \`pnpm build\`: Build for production
- \`pnpm start\`: Start production server
- \`pnpm db:push\`: Push database schema changes
- \`pnpm lint\`: Run linter
- \`pnpm format\`: Format code with Prettier

### Adding New Features

1. Update database schema in \`drizzle/schema.ts\`
2. Run \`pnpm db:push\` to apply changes
3. Add database queries in \`server/db.ts\`
4. Create tRPC procedures in \`server/routers.ts\`
5. Build UI components in \`client/src/pages/\`

## Troubleshooting

### API Rate Limit Errors

If you encounter rate limit errors:
- Wait for the rate limit window to reset
- Consider upgrading to paid API tiers
- Implement longer caching durations

### Database Connection Issues

- Verify your \`DATABASE_URL\` is correct
- Ensure your database server is running
- Check firewall rules allow connections

### Stock Data Not Loading

- Verify your Alpha Vantage API key is valid
- Check if you've exceeded rate limits
- Ensure the stock symbol is correct

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the MIT License.

## Support

For issues and questions:
- Open an issue on GitHub
- Contact support at https://help.manus.im (for Manus platform issues)

## Acknowledgments

- Stock data provided by [Alpha Vantage](https://www.alphavantage.co/)
- AI analysis powered by [Google Gemini](https://ai.google.dev/)
- UI components from [shadcn/ui](https://ui.shadcn.com/)
