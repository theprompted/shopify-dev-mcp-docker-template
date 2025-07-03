FROM node:18-alpine

# Install Dev-MCP and Supergateway globally
RUN npm i -g @shopify/dev-mcp @latitude-data/supergateway

# Render passes the port number via $PORT
ENV PORT=8802

# Use supergateway with --stdio flag containing the entire command
CMD sh -c 'npx -y @latitude-data/supergateway --stdio "npx -y @shopify/dev-mcp@latest" --port $PORT'

EXPOSE 8802
