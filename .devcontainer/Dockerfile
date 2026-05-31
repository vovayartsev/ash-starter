# Phoenix + Python (for mcp-supervisord & serena via uvx) dev environment.
FROM hexpm/elixir:1.17.3-erlang-27.1.2-debian-bookworm-20241016

ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/home/vscode/.local/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        inotify-tools \
        libstdc++6 \
        locales \
        openssh-client \
        postgresql-client \
        python3 \
        python3-venv \
        python3-pip \
        pipx \
        sudo \
        unzip \
        xz-utils \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen \
    && echo 'vscode ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vscode

# Hex + Rebar (system-wide)
RUN mix local.hex --force && mix local.rebar --force

# Phoenix archive
RUN mix archive.install --force hex phx_new

# Node (for esbuild/Phoenix assets) — keep optional but cheap to include
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*
