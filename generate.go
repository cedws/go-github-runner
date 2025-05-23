package api

//go:generate go tool oapi-codegen -config ./config.yaml -package api -o api/client.gen.go schemas/api.github.com.yaml

//go:generate go tool oapi-codegen -config ./config.yaml -package vss -o actions/vss/client.gen.go schemas/pipelines.actions.githubusercontent.com.yaml

//go:generate go tool oapi-codegen -config ./config.yaml -package results -o actions/results/client.gen.go schemas/results-receiver.actions.githubusercontent.com.yaml

//go:generate go tool oapi-codegen -config ./config.yaml -package run -o actions/run/client.gen.go schemas/run-actions.actions.githubusercontent.com.yaml
