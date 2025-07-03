FROM node:18-alpine

RUN npm i -g @shopify/dev-mcp @latitude-data/supergateway

ENV PORT=8802

CMD /bin/sh -c 'npx -y @shopify/dev-mcp@latest | npx -y @latitude-data/supergateway --stdio --singleSession --port $PORT'

EXPOSE 8802
