
FROM python:3.9-alpine

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/py/bin:$PATH"

# Set ARG for development mode
ARG DEV=false

# Copy requirements files into the container
COPY requirements.txt /tmp/requirements.txt
COPY requirements.dev.txt /tmp/requirements.dev.txt

# Create a virtual environment and install dependencies
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then /py/bin/pip install -r /tmp/requirements.dev.txt; fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser --disabled-password --no-create-home django-user

# Copy project files into the container
WORKDIR /app
COPY . /app

# Change ownership of the directory
RUN chown -R django-user:django-user /app

# Run as non-root user
USER django-user

# Default command
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.wsgi:application"]
