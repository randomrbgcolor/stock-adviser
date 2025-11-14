# Stock Advisor Project TODO

## Phase 1: Database Schema & Backend Setup
- [x] Design database schema for portfolio tracking
- [x] Create stock analysis table
- [x] Create portfolio table with user relationships
- [x] Create stock holdings table
- [x] Add API secrets to environment (Alpha Vantage, Gemini)
- [x] Install required npm packages (axios, date-fns, etc.)

## Phase 2: Stock Data Integration
- [x] Implement Alpha Vantage API integration for stock data
- [x] Create stock symbol search/autocomplete endpoint
- [x] Implement historical price data fetching
- [x] Calculate 1M, 6M, 1Y, YTD returns programmatically
- [x] Create data caching mechanism to avoid rate limits

## Phase 3: AI Analysis Integration
- [x] Integrate Gemini API for stock analysis
- [x] Create prompt template for fundamental vs technical analysis
- [x] Implement personalized recommendation logic based on user profile
- [x] Generate buy/sell/hold recommendations
- [x] Create analysis result storage

## Phase 4: Stock Analysis Page
- [x] Create dynamic stock symbol search with autocomplete
- [x] Build investment horizon slider input
- [x] Build fundamental vs technical preference slider
- [x] Add user profile inputs (age, employment status, sector)
- [x] Display AI-generated analysis and recommendations
- [x] Add "Add to Portfolio" button functionality
- [x] Show loading states during analysis

## Phase 5: Portfolio Management Page
- [x] Create portfolio dashboard layout
- [x] Display all stocks in user's portfolio
- [x] Show current stock prices
- [x] Display 1M, 6M, 1Y, YTD returns for each stock
- [x] Show buy/sell recommendations
- [x] Implement remove from portfolio functionality
- [x] Add portfolio summary metrics

## Phase 6: Docker & Deployment
- [x] Create Dockerfile for self-hosting
- [x] Add docker-compose.yml if needed
- [x] Document environment variables
- [x] Create deployment instructions
- [ ] Test Docker build and run

## Phase 7: Testing & Polish
- [ ] Test stock search functionality
- [ ] Test AI analysis generation
- [ ] Test portfolio persistence across refreshes
- [ ] Test all return calculations
- [x] Add error handling and user feedback
- [x] Optimize performance and loading states
- [x] Create user documentation

## Bug Fixes
- [x] Fix profile query returning undefined
- [x] Fix AI analysis generation failure (updated model to gemini-1.5-flash)
- [x] Add proper error handling for Gemini API
- [x] Add proper error handling for Alpha Vantage API
- [x] Debug and fix AI analysis generation error (updated to gemini-2.5-flash)
- [x] Test stock search functionality (working correctly)
- [x] Add retry logic with exponential backoff for Gemini API
- [x] Add fallback to multiple Gemini models (2.5-flash, 2.0-flash, flash-latest)
- [x] Improve error handling for API overload scenarios
- [ ] Test AI analysis generation (pending Gemini API availability)
- [ ] Test portfolio add/remove functionality

## New Features - Phase 2
- [x] Add OpenAI API key to environment
- [x] Integrate OpenAI as backup AI provider (fallback after Gemini)
- [x] Create analysis history table in database (added provider field)
- [x] Add analysis history queries to database
- [x] Create analysis history API endpoint
- [ ] Display past analyses on stock analysis page
- [ ] Track analysis accuracy over time
- [x] Build stock comparison page
- [x] Allow side-by-side comparison of multiple stocks (up to 5 stocks)
- [ ] Create email alert system for portfolio updates (deferred - requires SMTP setup)
- [ ] Implement daily/weekly portfolio summary emails (deferred - requires SMTP setup)
- [ ] Add user notification preferences (deferred - requires SMTP setup)

## Critical Bug
- [x] Fix stock search returning "no stocks found" for all queries (fixed by using trpc.useUtils().fetch())

## Production Issues
- [x] Fix stock search not working on published site (added better error logging and validation)
- [x] Verify environment variables are properly set in production
- [x] Check API keys are accessible in production environment

## New Feature Request
- [x] Implement autocomplete dropdown for stock search (show results as you type with 500ms debounce)

## Critical Bug - Stock Search Not Working
- [ ] Debug why stock search always returns "no stocks found"
- [ ] Test Alpha Vantage API connection
- [ ] Verify API response format
- [ ] Fix search result parsing
