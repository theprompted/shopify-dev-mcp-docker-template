FROM node:18-alpine

# Install Dev-MCP and Supergateway globally
RUN npm i -g @shopify/dev-mcp @latitude-data/supergateway

# Render passes the port number via $PORT
ENV PORT=8802

# Use proper shell command with correct argument grouping
CMD sh -c 'npx -y @shopify/dev-mcp@latest | npx -y @latitude-data/supergateway -- --stdio --singleSession --port $PORT'

EXPOSE 8802
