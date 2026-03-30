# Step 1: Use an official lightweight Python image
FROM python:3.11-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements file and install dependencies
# We do this before copying the rest of the code to take advantage of Docker's cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the application code into the container
COPY app.py .

# Step 5: Expose the port the app runs on
EXPOSE 5000

# Step 6: Define the command to run the app
CMD ["python", "app.py"]