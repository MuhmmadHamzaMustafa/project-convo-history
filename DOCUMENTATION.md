# Project Conversation System

## Features Implemented
- User authentication (Devise)
- Project CRUD with status management
- Comment system with polymorphic associations
- Activity tracking (PublicActivity gem)
- Role-based permissions (CanCanCan)
- Paginated conversation history
- Bootstrap UI

## Tech Stack
- Ruby 3.0.1
- Rails 7
- MySQL
- Devise (Auth)
- PublicActivity (Tracking)
- CanCanCan (Permissions)
- Bootstrap 5 (Styling)
- Kaminari (Pagination)

## Setup
```bash
git clone git@github.com:[username]/project-convo-history.git
bundle install
rails db:create db:migrate db:seed