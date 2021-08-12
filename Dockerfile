FROM arm64v8/python:3.8-buster

COPY . /build
RUN cd /build && ls .git/ && pip install . && rm -rf /build

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
