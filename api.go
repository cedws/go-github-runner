package api

//go:generate go tool oapi-codegen -generate types,client -package api -o client.gen.go schemas/api.github.com.yaml

//go:generate go tool oapi-codegen -generate types,client -package pipelines -o pipelines/client.gen.go schemas/pipelines.actions.githubusercontent.com
