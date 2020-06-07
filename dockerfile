FROM gcc:latest as build

WORKDIR .

ADD . /app

COPY . .

COPY --from=build /app/fllamp .

RUN apt-get make build-essential

RUN make

ENTRYPOINT ["./exec"]