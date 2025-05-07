openapi: 3.0.0
info:
  title: pipelines.actions.githubusercontent.com
  version: 1.0.0
servers:
  - url: https://pipelinesghubeus7.actions.githubusercontent.com
    description: GitHub Pipelines API
paths:
  /{tenantId}/_apis/connectionData:
    get:
      summary: GET connection data
      parameters:
        - name: tenantId
          in: path
          required: true
          schema:
            type: string
          description: The tenant ID
        - name: connectOptions
          in: query
          required: false
          schema:
            type: number
        - name: lastChangeId
          in: query
          required: false
          schema:
            type: string
        - name: lastChangeId64
          in: query
          required: false
          schema:
            type: string
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  instanceId:
                    type: string
                  deploymentId:
                    type: string
                  deploymentType:
                    type: string
                  locationServiceData:
                    type: object
                    properties:
                      serviceOwner:
                        type: string
                      accessMappings:
                        type: array
                        items:
                          type: object
                          properties:
                            displayName:
                              type: string
                            moniker:
                              type: string
                            accessPoint:
                              type: string
                            serviceOwner:
                              type: string
                      defaultAccessMappingMoniker:
                        type: string
                      lastChangeId:
                        type: number
                      lastChangeId64:
                        type: number
                      serviceDefinitions:
                        type: array
                        items:
                          type: object
                          properties:
                            serviceType:
                              type: string
                            identifier:
                              type: string
                            displayName:
                              type: string
                            relativeToSetting:
                              type: string
                            description:
                              type: string
                            serviceOwner:
                              type: string
                            locationMappings:
                              type: array
                              items: {}
                            toolId:
                              type: string
                            parentServiceType:
                              type: string
                            parentIdentifier:
                              type: string
                            properties:
                              type: object
                              properties: {}
  /{tenantId}/_apis/distributedtask/pools:
    get:
      summary: GET pools
      parameters:
        - name: tenantId
          in: path
          required: true
          schema:
            type: string
          description: The tenant ID
        - name: poolType
          in: query
          required: false
          schema:
            type: string
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  count:
                    type: number
                  value:
                    type: array
                    items:
                      type: object
                      properties:
                        createdOn:
                          type: string
                        autoSize:
                          type: boolean
                        targetSize:
                          type: object
                          nullable: true
                        agentCloudId:
                          type: object
                          nullable: true
                        id:
                          type: number
                        scope:
                          type: string
                        name:
                          type: string
                        isHosted:
                          type: boolean
                        isInternal:
                          type: boolean
                        size:
                          type: number
        "401":
          description: Unauthorized
          content:
            application/json:
              schema:
                type: object
                properties:
                  $id:
                    type: string
                  innerException:
                    type: object
                    nullable: true
                  message:
                    type: string
                  typeName:
                    type: string
                  typeKey:
                    type: string
                  errorCode:
                    type: number
                  eventId:
                    type: number
  /{tenantId}/_apis/distributedtask/pools/{id}/agents:
    get:
      summary: GET agents by pool ID
      parameters:
        - name: tenantId
          in: path
          required: true
          schema:
            type: string
          description: The tenant ID
        - name: id
          in: path
          required: true
          schema:
            type: string
          description: The pool ID
        - name: agentName
          in: query
          required: false
          schema:
            type: string
        - name: includeCapabilities
          in: query
          required: false
          schema:
            type: string
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  count:
                    type: number
                  value:
                    type: array
                    items: {}
    post:
      summary: POST agents by pool ID
      parameters:
        - name: tenantId
          in: path
          required: true
          schema:
            type: string
          description: The tenant ID
        - name: id
          in: path
          required: true
          schema:
            type: string
          description: The pool ID
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                labels:
                  type: array
                  items:
                    type: object
                    properties:
                      id:
                        type: number
                      name:
                        type: string
                      type:
                        type: string
                maxParallelism:
                  type: number
                createdOn:
                  type: string
                authorization:
                  type: object
                  properties:
                    publicKey:
                      type: object
                      properties:
                        exponent:
                          type: string
                        modulus:
                          type: string
                id:
                  type: number
                name:
                  type: string
                version:
                  type: string
                osDescription:
                  type: string
                ephemeral:
                  type: boolean
                disableUpdate:
                  type: boolean
                status:
                  type: number
                provisioningState:
                  type: string
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  properties:
                    type: object
                    properties:
                      ServerUrl:
                        type: object
                        properties:
                          $type:
                            type: string
                          $value:
                            type: string
                      RequireFipsCryptography:
                        type: object
                        properties:
                          $type:
                            type: string
                          $value:
                            type: boolean
                  labels:
                    type: array
                    items:
                      type: object
                      properties:
                        type:
                          type: string
                        id:
                          type: number
                        name:
                          type: string
                  maxParallelism:
                    type: number
                  currentParallelism:
                    type: number
                  createdOn:
                    type: string
                  authorization:
                    type: object
                    properties:
                      authorizationUrl:
                        type: string
                      clientId:
                        type: string
                      publicKey:
                        type: object
                        properties:
                          exponent:
                            type: string
                          modulus:
                            type: string
                  queueName:
                    type: string
                  id:
                    type: number
                  runnerGroupId:
                    type: number
                  name:
                    type: string
                  runnerGroupName:
                    type: object
                    nullable: true
                  version:
                    type: string
                  osDescription:
                    type: string
                  enabled:
                    type: boolean
                  ephemeral:
                    type: boolean
                  status:
                    type: string
                  isVirtual:
                    type: boolean
                  isElastic:
                    type: boolean
                  disableUpdate:
                    type: boolean
                  owningTenant:
                    type: object
                    nullable: true
                  provisioningState:
                    type: string
  /{tenantId}/_apis/distributedtask/pools/{id}/sessions:
    post:
      summary: POST sessions by pool ID
      parameters:
        - name: tenantId
          in: path
          required: true
          schema:
            type: string
          description: The tenant ID
        - name: id
          in: path
          required: true
          schema:
            type: string
          description: The pool ID
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                sessionId:
                  type: string
                ownerName:
                  type: string
                agent:
                  type: object
                  properties:
                    id:
                      type: number
                    name:
                      type: string
                    version:
                      type: string
                    osDescription:
                      type: string
                    ephemeral:
                      type: object
                      nullable: true
                    status:
                      type: number
                    provisioningState:
                      type: object
                      nullable: true
                useFipsEncryption:
                  type: boolean
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  sessionId:
                    type: string
                  encryptionKey:
                    type: object
                    properties:
                      encrypted:
                        type: boolean
                      value:
                        type: string
                  ownerName:
                    type: string
                  agent:
                    type: object
                    properties:
                      id:
                        type: number
                      runnerGroupId:
                        type: object
                        nullable: true
                      name:
                        type: string
                      runnerGroupName:
                        type: object
                        nullable: true
                      version:
                        type: string
                      osDescription:
                        type: string
                      ephemeral:
                        type: object
                        nullable: true
                      status:
                        type: number
                      isVirtual:
                        type: boolean
                      owningTenant:
                        type: object
                        nullable: true
                      provisioningState:
                        type: object
                        nullable: true
                  useFipsEncryption:
                    type: boolean
