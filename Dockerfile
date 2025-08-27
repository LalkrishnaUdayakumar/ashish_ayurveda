# ----------------------------
# Stage 1: Build Flutter Web
# ----------------------------
FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app

# Copy pubspec files first to leverage caching
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the app
COPY . .

# Build the Flutter web app
RUN flutter build web --release

# ----------------------------
# Stage 2: Serve with Nginx
# ----------------------------
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy Flutter build from previous stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
