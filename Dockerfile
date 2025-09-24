
FROM alpine:latest

RUN apk add --no-cache bash cowsay fortune netcat-openbsd

WORKDIR /app

COPY wisecow.sh .

RUN chmod+ wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]
