FROM python:3.7-slim as base

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Create and switch to a new user
RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser
ENV PATH $PATH:/home/appuser/.local/bin

# Install application into container
COPY . .

RUN pip3 install -r ./requirements.txt

# Run the application
ENTRYPOINT ["python3"]
CMD ["app.py"]
