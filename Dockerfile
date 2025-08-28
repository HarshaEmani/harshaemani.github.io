# Stage 1: Use the latest "extended" Hugo version to build the site
FROM klakegg/hugo:latest-ext AS build

# Set the working directory
WORKDIR /src

# Copy the entire site content into the container
COPY . /src

# Build the site using Hugo
RUN hugo

# Stage 2: Serve the static files from the 'public' directory with Nginx
FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html