FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN apk add --no-cache curl unzip

ARG GITHUB_RELEASE_URL="https://github.com/rb-x/penflow/releases/download/1.0.0/penflow-free-1.0.0.zip"

RUN curl -L -o release.zip "$GITHUB_RELEASE_URL" \
    && unzip release.zip -d /tmp/release \
    && mv /tmp/release/dist/* /usr/share/nginx/html/ \
    && rm -rf /tmp/release release.zip \
    && apk del curl unzip

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

