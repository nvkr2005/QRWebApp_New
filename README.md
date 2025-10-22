# Wienerschnitzel Restaurant System

Complete restaurant management system with customer ordering and admin dashboard.

## Quick Setup & Run

### Development Mode
```bash
# Install all dependencies (client + server)
npm install

# Run both client and server in development mode
npm run dev
```

### Production Mode
```bash
# Build and run production version
npm run prod
```

## Manual Commands

### Development
```bash
# Install dependencies
npm install

# Run development servers
npm run dev
# - Server: http://localhost:3000
# - Client: http://localhost:4200
```

### Production (Single Server)
```bash
# Build both applications
npm run build

# Start single Node.js server (serves both API and Angular app)
npm start
# - Everything: http://localhost:3000
```

## Project Structure

```
├── client/          # Angular 19 Frontend
│   ├── src/app/customer/     # Customer ordering app
│   ├── src/app/dashboard/    # Admin dashboard
│   └── ...
├── server/          # Node.js TypeScript API
│   ├── src/controllers/      # API controllers
│   ├── src/database/         # Database setup
│   ├── src/routes/          # API routes
│   └── ...
└── package.json     # Root package manager
```

## Features

### Customer App (`http://localhost:3000/customer`)
- Mobile-first ordering interface
- Menu browsing with categories
- Item customization
- Shopping cart management
- Order placement with customer details

### Admin Dashboard (`http://localhost:3000/dashboard`)
- Real-time order management (Kanban board)
- Menu item management with image upload
- Category management
- Add-on management
- Order history with date filtering
- WebSocket real-time updates

## Database Setup

1. Install MySQL
2. Run the database script:
```sql
-- Execute database.sql to create tables and seed data
```

## Technology Stack

- **Frontend**: Angular 19, TypeScript, SCSS
- **Backend**: Node.js, Express, TypeScript
- **Database**: MySQL
- **Real-time**: Socket.IO WebSocket
- **File Upload**: Multer
- **Architecture**: REST API, Component-based UI

## -- test