# Use an official Python runtime as a parent image
FROM python:3.9-slim

# RUN pip install torch==2.4.0 \
#     torchvision==0.19.0 \
#  #   --index-url https://download.pytorch.org/whl/cpu \
#     && rm -rf /root/.cache/pip

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Copy pyproject.toml and uv.lock
COPY pyproject.toml uv.lock ./

# Create a virtual environment and install dependencies
RUN uv venv && \
    . .venv/bin/activate && \
    uv pip install -e . && \
    uv pip install --upgrade pip

# RUN uv venv && \
#     . .venv/bin/activate && \
#     uv pip install . && \
#     # uv pip install torch==2.4.0 \
#     # torchvision==0.19.0 \
#     # # --index-url https://download.pytorch.org/whl/cpu \
#     # lightning && \
#     rm -rf /root/.cache/pip
    

# Copy the rest of the application code
COPY src ./src

# Declare volumes
# VOLUME ["/app/samples", "/app/predictions", "/app/data"]

ENTRYPOINT ["/bin/bash", "-c", "source .venv/bin/activate && exec $0 $@"]

CMD ["python", "src/train.py"]