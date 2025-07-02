# ---- Base image ----
FROM node:18-alpine

# ---- Install the two packages globally ----
RUN npm i -g @shopify/dev-mcp @latitude-data/supergateway

# ---- Render will inject its own $PORT; default to 8802 for local runs ----
ENV PORT=8802

# ---- Start Dev-MCP and bridge it to SSE via Supergateway ----
# Wrap the pipeline in a shell so the | and flags are parsed correctly.
CMD ["sh", "-c", "npx -y @shopify/dev-mcp@latest | npx -y @latitude-data/supergateway --stdio --singleSession --port $PORT"]

# ---- Expose the port (helps local `docker run -p 8802:8802` testing) ----
EXPOSE 8802
