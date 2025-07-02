FROM node:18-alpine

RUN npm i -g @shopify/dev-mcp @latitude-data/supergateway

ENV PORT=8802

CMD npx -y @shopify/dev-mcp@latest \
    | npx -y @latitude-data/supergateway --singleSession --port $PORT

EXPOSE 8802
