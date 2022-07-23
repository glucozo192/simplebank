postgres:
	docker run --name postgretuan -p 4432:5432 -e POSTGRES_USER=glucozo192 -e POSTGRES_PASSWORD=6677028a -d postgres

createdb:
	docker exec -it postgretuan createdb --username=glucozo192 --owner=glucozo192 simple_bank

dropdb:
	docker exec -it postgretuan dropdb --username=glucozo192 simple_bank 

migrateup:
	migrate -path db/migration -database "postgresql://glucozo192:6677028a@localhost:4432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://glucozo192:6677028a@localhost:4432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate
test:
	go test -v -cover ./...

proto:
	rm -f pb/*.go
	protoc --proto_path=proto  --go_out=pb --go_opt=paths=source_relative \
    --go-grpc_out=pb --go-grpc_opt=paths=source_relative \
    proto/*.proto


.PHONY: postgres createdb dropdb migrateup migratedown sqlc proto

