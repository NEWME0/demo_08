FROM python:3.9

# Create work directory
WORKDIR /usr/app

# Copy requirements
COPY ./requirements.txt /usr/app/requirements.txt

# Install requirements
RUN pip install --no-cache-dir --upgrade -r /usr/app/requirements.txt

# Copy application source code
COPY ./src /usr/app/

# Run application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
