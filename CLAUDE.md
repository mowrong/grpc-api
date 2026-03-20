# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

Generate Go code from proto files:
```
make
```
This runs `protoc --go_out=. --go-grpc_out=. hello/*.proto` from the project root.

Install protoc plugins if needed:
```
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

## Architecture

This is a gRPC service definition project. The workflow is: edit `.proto` files → run `make` → commit generated Go code.

- `proto/hello.proto` — source of truth; defines the `Greeter` service with a single `SayHello` RPC
- `golang/hello/` — generated output (`hello.pb.go` for messages, `hello_grpc.pb.go` for service interfaces); do not edit manually
- `go_package` in the proto is `./golang/hello;hello`, so generated files land in `golang/hello/`

To implement a server, embed `hello.UnimplementedGreeterServer`, implement `SayHello`, then register with `hello.RegisterGreeterServer(grpcServer, impl)`.
