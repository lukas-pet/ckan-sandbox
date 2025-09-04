FROM mcr.microsoft.com/devcontainers/python:1-3.12-bookworm

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install CKAN dependencies and PostgreSQL
RUN apt update && \
    apt install -y --no-install-recommends \
        python3-dev \
        libpq-dev \
        python3-pip \
        python3-venv \
        git-core \
        redis-server \
        libmagic1 \
        postgresql \
        curl \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip && pip install uv

# Copy workspace files and set ownership to vscode user
COPY --chown=vscode:vscode . /workspaces/ckan-sandbox

# Switch to root to set up PostgreSQL
USER root

RUN mkdir -p /var/lib/ckan && chown vscode:vscode /var/lib/ckan

# Initialize PostgreSQL and create CKAN user and database
# RUN service postgresql start && \
#     su postgres -c "createuser -S -D -R -P ckan_default" && \
#     su postgres -c "createdb -O ckan_default ckan_default -E utf-8"

# Switch back to vscode user for development
USER vscode

EXPOSE 5000

WORKDIR /workspaces/ckan