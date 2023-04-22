# Fetch ruby image from docker hub registry
FROM ruby:3.2.2

# Install the needed dependencies for certain gems
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set up the work directory
WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Run setup
RUN rails db:migrate
RUN rails assets:precompile

# Copy all the files in project
COPY . .

# Run the server
CMD rails s -p 3000 -b '0.0.0.0'