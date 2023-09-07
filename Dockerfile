FROM golang:1.16-alpine AS builder
COPY ./main.go /app/main.go
WORKDIR /app
RUN go build main.go

FROM scratch
COPY --from=builder /app/main /main
CMD ["./main"]