package api

//go:generate go tool oapi-codegen -generate types,client -package api -o api/client.gen.go schemas/api.github.com.yaml

//go:generate go tool oapi-codegen -generate types,client -package pipelines -o actions/pipelines/client.gen.go schemas/pipelines.actions.githubusercontent.com.yaml

//go:generate go tool oapi-codegen -generate types,client -package results -o actions/results/client.gen.go schemas/results-receiver.actions.githubusercontent.com.yaml
