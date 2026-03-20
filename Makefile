PROTOC = protoc
PROTO_DIR = proto
OUT_DIR = .

all:
	$(PROTOC) --go_out=$(OUT_DIR) --go-grpc_out=$(OUT_DIR) $(PROTO_DIR)/*.proto
