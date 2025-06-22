PROTOC   = protoc
PROTOS   = $(wildcard proto/*.proto)
OUT_DIR  = gen/proto

.PHONY: proto
proto:
	mkdir -p $(OUT_DIR)
	$(PROTOC) \
	  -I . -I proto \
	  --go_out=$(OUT_DIR) \
	  --go-grpc_out=$(OUT_DIR) \
	  --grpc-gateway_out=$(OUT_DIR) \
	  --grpc-gateway_opt=paths=source_relative \
	  --go_opt=paths=source_relative \
	  --go-grpc_opt=paths=source_relative \
	  $(PROTOS)

.PHONY: clean
clean:
	rm -rf $(OUT_DIR)/*.pb.go $(OUT_DIR)/*_grpc.pb.go $(OUT_DIR)/*_gw.pb.go

.PHONY: all
all: clean proto 