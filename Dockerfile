# Stage 1: Use the latest "extended" Hugo version to build the site
FROM klakegg/hugo:latest-ext AS build

# Set the working directory
WORKDIR /src

# Copy the entire site content into the container
COPY . /src

# Build the site using Hugo
RUN hugo

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /src/public /usr/share/nginx/html
# COPY entrypoint.sh entrypoint.sh
# RUN chmod +x entrypoint.sh