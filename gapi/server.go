package gapi

import (
	db "github.com/glucozo192/simplebank/db/sqlc"
	"github.com/glucozo192/simplebank/pb"
	"github.com/glucozo192/simplebank/util"
)

// Server serves gRPC requests for our banking service.
type Server struct {
	pb.UnimplementedSimpleBankServer
	config util.Config
	store  db.Store
}

// NewServer creates a new gRPC server.
func NewServer(config util.Config, store db.Store) (*Server, error) {
	server := &Server{
		config: config,
		store:  store,
		// tokenMaker: tokenMaker,
	}

	return server, nil
}
