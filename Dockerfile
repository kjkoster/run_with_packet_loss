FROM python:slim

RUN apt-get update && \
    apt-get install -y iproute2

RUN pip install flask

WORKDIR /app

COPY app.py /app/
COPY index.html /app/static/

COPY run_with_packet_loss.sh /app/run_with_packet_loss.sh
CMD ["/app/run_with_packet_loss.sh"]
