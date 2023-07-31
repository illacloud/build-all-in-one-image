illa-builder Architecture Diagram
---------------------------------

# Description

This document describes the components and architecture of the illa-builder docker image.



# Architecture Diagram

![img](./assets/images/illa-builder-self-host-arch.svg)



# Parts

## Envoy

The entry of all requests, the configuration file is in [Envoy Config](../config/envoy/illa-unit-ingress.yaml)

## Nginx

Static file web server for illa-builder, the configuration file is in [Nginx Config](../config/nginx/illa-builder-frontend.conf)

## illa-builder

Static files for illa-builder front-end.

## builder-backend

Holds all APP, Resource and Action APIs. 

## builder-backend-ws

WebScoket server for editor, all components modify method are served by this unit. 

For WebSocket message detail, please see [illa-builder-backend WebSocket Message Documents](https://github.com/illacloud/illa-builder-backend-websocket-docs).

## illa-supervisor-backend

the supervisor unit holds all logon and user info APIs.

## illa-supervisor-backend-internal

The supervisor internal unit holds ABAC and raw info APIs.

## Postgres

Storage all data in it.

The postgres init scripts is in [Postgres Init](../scripts/postgres-init.sh)

## Redis

For cache user session.

## Minio

For object storage, like user avatar etc.
