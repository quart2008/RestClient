$PBExportHeader$rest_client.sra
$PBExportComments$Generated Application Object
forward
global type rest_client from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type rest_client from application
string appname = "rest_client"
end type
global rest_client rest_client

on rest_client.create
appname="rest_client"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on rest_client.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open ( w_Client )
end event

