PROTOC   = protoc
PROTOS   = $(wildcard proto/*.proto)
OUT_DIR  = pkg/proto

.PHONY: generate
generate:
	$(PROTOC) \
	  --go_out=$(OUT_DIR) \
	  --go-grpc_out=$(OUT_DIR) \
	  --go_opt=paths=source_relative \
	  --go-grpc_opt=paths=source_relative \
	  $(PROTOS)

.PHONY: clean
clean:
	rm -rf $(OUT_DIR)/*.pb.go
	rm -rf $(OUT_DIR)/*_grpc.pb.go

.PHONY: all
all: clean generate 