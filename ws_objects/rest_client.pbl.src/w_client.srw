$PBExportHeader$w_client.srw
forward
global type w_client from window
end type
type st_1 from statictext within w_client
end type
type st_text from statictext within w_client
end type
type st_code from statictext within w_client
end type
type cb_1 from commandbutton within w_client
end type
type ddlb_protocol from dropdownlistbox within w_client
end type
type ddlb_url from dropdownlistbox within w_client
end type
type ddlb_method from dropdownlistbox within w_client
end type
type tab_1 from tab within w_client
end type
type tabpage_1 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type sle_secret from singlelineedit within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type sle_id from singlelineedit within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type lb_1 from listbox within tabpage_1
end type
type dw_headers from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_5 cb_5
sle_secret sle_secret
st_5 st_5
sle_id sle_id
st_4 st_4
st_3 st_3
st_2 st_2
cb_4 cb_4
cb_2 cb_2
lb_1 lb_1
dw_headers dw_headers
end type
type tabpage_2 from userobject within tab_1
end type
type mle_code from multilineedit within tabpage_2
end type
type cb_urldecode from commandbutton within tabpage_2
end type
type cb_urlencode from commandbutton within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type mle_data from multilineedit within tabpage_2
end type
type mle_postdata from multilineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
mle_code mle_code
cb_urldecode cb_urldecode
cb_urlencode cb_urlencode
st_6 st_6
mle_data mle_data
mle_postdata mle_postdata
end type
type tabpage_3 from userobject within tab_1
end type
type mle_requestheaders from multilineedit within tabpage_3
end type
type tabpage_3 from userobject within tab_1
mle_requestheaders mle_requestheaders
end type
type tabpage_4 from userobject within tab_1
end type
type mle_responseheaders from multilineedit within tabpage_4
end type
type tabpage_4 from userobject within tab_1
mle_responseheaders mle_responseheaders
end type
type tabpage_5 from userobject within tab_1
end type
type mle_responsebody from multilineedit within tabpage_5
end type
type tabpage_5 from userobject within tab_1
mle_responsebody mle_responsebody
end type
type tabpage_6 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_6
end type
type dw_history from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_3 cb_3
dw_history dw_history
end type
type tabpage_7 from userobject within tab_1
end type
type cb_6 from commandbutton within tabpage_7
end type
type dw_timesheet from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
cb_6 cb_6
dw_timesheet dw_timesheet
end type
type tab_1 from tab within w_client
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
end forward

global type w_client from window
integer width = 4183
integer height = 1920
boolean titlebar = true
string title = "RESTFul WEB API Client"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Window_icon_2!"
boolean center = true
st_1 st_1
st_text st_text
st_code st_code
cb_1 cb_1
ddlb_protocol ddlb_protocol
ddlb_url ddlb_url
ddlb_method ddlb_method
tab_1 tab_1
end type
global w_client w_client

on w_client.create
this.st_1=create st_1
this.st_text=create st_text
this.st_code=create st_code
this.cb_1=create cb_1
this.ddlb_protocol=create ddlb_protocol
this.ddlb_url=create ddlb_url
this.ddlb_method=create ddlb_method
this.tab_1=create tab_1
this.Control[]={this.st_1,&
this.st_text,&
this.st_code,&
this.cb_1,&
this.ddlb_protocol,&
this.ddlb_url,&
this.ddlb_method,&
this.tab_1}
end on

on w_client.destroy
destroy(this.st_1)
destroy(this.st_text)
destroy(this.st_code)
destroy(this.cb_1)
destroy(this.ddlb_protocol)
destroy(this.ddlb_url)
destroy(this.ddlb_method)
destroy(this.tab_1)
end on

event open;ddlb_method.selectitem( 1)
//ddlb_url.selectitem( 1)
ddlb_protocol.selectitem( 1)

Jsonpackage 	ljs_page, ljs_page2
String 		ls_Json, ls_Error
ljs_page = Create Jsonpackage
ljs_page2 = Create Jsonpackage

ls_Error = ljs_page.loadfile( "history.json" )
If ls_Error = "" Then
	ls_Json = ljs_page.GetValue( "history")
	Tab_1.tabpage_6.dw_history.ImportJson(ls_Json)
End If

ls_Error = ljs_page2.loadfile( "timesheet.json" )
If ls_Error = "" Then
	ls_Json = ljs_page2.GetValue( "timesheet")
	Tab_1.tabpage_7.dw_TimeSheet.ImportJson(ls_Json)
End If

Destroy ljs_page
Destroy ljs_page2

If Tab_1.tabpage_6.dw_history.RowCount () > 0 Then
	Tab_1.tabpage_6.dw_history.Event DoubleClicked( 0,0,Tab_1.tabpage_6.dw_history.RowCount (),Tab_1.tabpage_6.dw_history.Object.url )
End If
end event

event closequery;//save history
Jsonpackage 	ljs_page
string ls_json, ls_Error
If Tab_1.tabpage_6.dw_history.RowCount() > 0 Then
	ljs_page = Create Jsonpackage
	ls_json = Tab_1.tabpage_6.dw_history.ExportJson( )
	ljs_page.Setvalue( "history", ls_json)
	ljs_page.savetofile( "history.json")
	Destroy ljs_page
End If

If Tab_1.tabpage_7.dw_TimeSheet.RowCount() > 0 Then
	ljs_page = Create Jsonpackage
	ls_json = Tab_1.tabpage_7.dw_TimeSheet.ExportJson( )
	ljs_page.Setvalue( "timesheet", ls_json)
	ljs_page.savetofile( "timesheet.json")
	Destroy ljs_page
End If

end event

type st_1 from statictext within w_client
integer x = 2615
integer y = 168
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Status Code:"
boolean focusrectangle = false
end type

type st_text from statictext within w_client
integer x = 3182
integer y = 168
integer width = 795
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_code from statictext within w_client
integer x = 2971
integer y = 168
integer width = 206
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_client
integer x = 3881
integer y = 28
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Send"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Name, ls_Value, ls_PostData, ls_Json
Long 			ll_rtn, ll_Code, ll_I, ll_Row, ll_Find

lhc_Client = Create HttpClient
st_code.Text = ""
st_Text.Text = ""
tab_1.tabpage_3.mle_RequestHeaders.text = ""
tab_1.tabpage_4.mle_ResponseHeaders.text = ""
tab_1.tabpage_5.mle_ResponseBody.Text = ""

lhc_Client.TimeOut = 60

Choose Case ddlb_Protocol.Text
	Case "default"
		lhc_Client.secureprotocol = 0
	Case 'SSL2.0'
		lhc_Client.secureprotocol = 1
	Case 'SSL3.0'
		lhc_Client.secureprotocol = 2
	Case 'TSL1.0'
		lhc_Client.secureprotocol = 3
	Case 'TSL1.1'
		lhc_Client.secureprotocol = 4
	Case 'TSL1.2'
		lhc_Client.secureprotocol = 5
	Case Else
		lhc_Client.secureprotocol = 0
End Choose

//Set Headers
For ll_I = 1 To tab_1.Tabpage_1.dw_Headers.RowCount()
	ls_Name = tab_1.Tabpage_1.dw_Headers.GetItemString ( ll_I, 'name' )
	ls_Value = tab_1.Tabpage_1.dw_Headers.GetItemString ( ll_I, 'value' )
	If Len ( ls_Name ) > 0 And Len ( ls_Value ) > 0 Then
		lhc_Client.SetRequestHeader ( ls_Name,ls_Value )
	End If
Next
If tab_1.Tabpage_1.dw_Headers.RowCount() > 0 Then
	ls_Json = tab_1.Tabpage_1.dw_Headers.exportjson( )
End If
If IsNull ( ls_Json ) Then ls_Json = ""
	
ls_Url = Trim ( ddlb_Url.Text )
ls_Method = Trim ( ddlb_Method.Text )
Choose Case ls_Method
	Case 'GET','HEAD','DELETE'
		ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
		If ls_Json = "" Then
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "'",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		Else
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "' and header = '" +ls_Json + "'",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		End If
	Case 'POST','PUT', 'PATCH'
		ls_PostData = Tab_1.Tabpage_2.Mle_postdata.Text;
		If IsNull ( ls_PostData ) Then ls_PostData = ""
		ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url, ls_PostData )
		If ls_Json = "" Then
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "' and postdata = '" + ls_PostData + "' ",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		Else
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "' and postdata = '" + ls_PostData + "' and header = '" +ls_Json + "'",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		End If
	Case else
		ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
		If ls_Json = "" Then
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "'",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		Else
			ll_Find = Tab_1.tabpage_6.dw_history.Find( "method = '" + ls_Method + "' and url='" + ls_Url + "' and header = '" +ls_Json + "'",1, Tab_1.tabpage_6.dw_history.rowcount( ) )
		End If
End Choose

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.GetRequestheaders( )
	tab_1.tabpage_3.mle_RequestHeaders.text = ls_Respose
	ls_Respose = lhc_Client.Getresponseheaders( )
	tab_1.tabpage_4.mle_ResponseHeaders.text = ls_Respose
	ll_rtn = lhc_Client.GetResponsebody( ls_Body,EncodingUTF8!)
	If Len ( ls_body ) > 0 Then
		tab_1.tabpage_5.mle_ResponseBody.Text = ls_Body
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	tab_1.selecttab( 5)
	
	//History
	If ll_Find > 0 Then
		ll_Row = ll_Find
	Else
		ll_Row = Tab_1.tabpage_6.dw_history.InsertRow( 0 )
	End If
	
	Tab_1.tabpage_6.dw_history.SetItem ( ll_Row, "method", ls_Method )
	Tab_1.tabpage_6.dw_history.SetItem ( ll_Row, "url", ls_Url )
	
	If Len ( ls_PostData ) > 0 Then
		Tab_1.tabpage_6.dw_history.SetItem ( ll_Row, "postdata", ls_PostData )
	End If
	
	If tab_1.Tabpage_1.dw_Headers.RowCount() > 0 Then
		ls_Json = tab_1.Tabpage_1.dw_Headers.exportjson( )
		Tab_1.tabpage_6.dw_history.SetItem ( ll_Row, "header", ls_Json )
	End If
	
	
	
Else
	tab_1.tabpage_5.mle_ResponseBody.Text = "Return:" + String ( ll_rtn )
End If

If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )

end event

type ddlb_protocol from dropdownlistbox within w_client
integer x = 3570
integer y = 36
integer width = 302
integer height = 476
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"default","SSL2.0","SSL3.0","TSL1.0","TSL1.1","TSL1.2"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_url from dropdownlistbox within w_client
integer x = 425
integer y = 36
integer width = 3136
integer height = 476
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean allowedit = true
string item[] = {"http://192.0.2.195"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_method from dropdownlistbox within w_client
integer x = 32
integer y = 36
integer width = 379
integer height = 692
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"GET","POST","PUT","PATCH","DELETE","OPTIONS","HEAD"}
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_client
integer x = 27
integer y = 156
integer width = 4082
integer height = 1620
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "Headers"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_5 cb_5
sle_secret sle_secret
st_5 st_5
sle_id sle_id
st_4 st_4
st_3 st_3
st_2 st_2
cb_4 cb_4
cb_2 cb_2
lb_1 lb_1
dw_headers dw_headers
end type

on tabpage_1.create
this.cb_5=create cb_5
this.sle_secret=create sle_secret
this.st_5=create st_5
this.sle_id=create sle_id
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_2=create cb_2
this.lb_1=create lb_1
this.dw_headers=create dw_headers
this.Control[]={this.cb_5,&
this.sle_secret,&
this.st_5,&
this.sle_id,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cb_4,&
this.cb_2,&
this.lb_1,&
this.dw_headers}
end on

on tabpage_1.destroy
destroy(this.cb_5)
destroy(this.sle_secret)
destroy(this.st_5)
destroy(this.sle_id)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.lb_1)
destroy(this.dw_headers)
end on

type cb_5 from commandbutton within tabpage_1
integer x = 2651
integer y = 756
integer width = 494
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Authorization"
end type

event clicked;//Authorization
CoderObject lco_Code
String 	ls_ClientID, ls_Sercet, ls_Auth
Blob 		lblb_data
Long 		ll_Find, ll_Row

//Authorization
//Authorization: Basic MzY3YzQxNjNkZGMxNDI3ZDk2NjU1Y2QyMjBjNjcxNGI6NDA3OWY4NzQ5OTM5NDQ2Y2JjODFmZDBjMjc3MDkxODc=
//lhc_Client.SetRequestHeader( "Authorization", "Basic " + ls_Auth )
ls_ClientID = sle_id.Text
ls_Sercet = sle_secret.Text

If Len ( ls_ClientID ) > 0 And Len ( ls_Sercet ) > 0 Then

	lco_Code = Create CoderObject
	lblb_data = Blob ( ls_ClientID + ":" + ls_Sercet, EncodingUTF8! )
	ls_Auth = lco_Code.Base64Encode( lblb_data )
	
	ll_Find = dw_Headers.Find ( "name='Authorization'", 1, dw_Headers.RowCount() )
	If ll_Find > 0 Then
		ll_Row = ll_Find
	Else
		ll_Row = dw_Headers.InsertRow(0)
	End If
	dw_Headers.SetItem ( ll_Row, "name", "Authorization" )
	dw_Headers.SetItem ( ll_Row, "value", "Basic " + ls_Auth )
	
	Destroy lco_Code
	
End If
end event

type sle_secret from singlelineedit within tabpage_1
integer x = 2958
integer y = 644
integer width = 1070
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_5 from statictext within tabpage_1
integer x = 2679
integer y = 660
integer width = 274
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_id from singlelineedit within tabpage_1
integer x = 2953
integer y = 532
integer width = 1070
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within tabpage_1
integer x = 2651
integer y = 548
integer width = 302
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "User Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_1
integer x = 2478
integer y = 440
integer width = 535
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Basic Authentication:"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_1
integer x = 2478
integer y = 16
integer width = 649
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "DoubleClicke item:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_1
integer x = 347
integer y = 1396
integer width = 338
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert Row"
end type

event clicked;dw_Headers.InsertRow ( 0 )

end event

type cb_2 from commandbutton within tabpage_1
integer x = 5
integer y = 1396
integer width = 338
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete Row"
end type

event clicked;If dw_Headers.GetRow() > 0 Then
	dw_Headers.DeleteRow( dw_Headers.GetRow() )
End If
end event

type lb_1 from listbox within tabpage_1
integer x = 2615
integer y = 92
integer width = 1399
integer height = 328
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Content-Type:application/x-www-form-urlencoded","Content-Type:application/json","Accept:text/html","Accept-Encoding:gzip, deflate, sdch"}
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;String 	ls_Text, ls_name, ls_value
Long 		ll_Pos, ll_find, ll_Row

ls_Text = lb_1.Item[index]

ll_Pos = Pos(ls_text,":")
If ll_Pos > 0 Then
	ls_name = Left( ls_Text, ll_Pos -1 )
	ls_value = Mid( ls_Text, ll_Pos + 1 )
	ll_Find = dw_Headers.Find ( "name='" + ls_Name + "'", 1, dw_Headers.RowCount() )
	If ll_Find > 0 Then
		ll_Row = ll_Find
	Else
		ll_Row = dw_Headers.InsertRow(0)
	End If
	dw_Headers.SetItem ( ll_Row, "name", ls_Name )
	dw_Headers.SetItem ( ll_Row, "value", ls_value )
End If

end event

type dw_headers from datawindow within tabpage_1
integer x = 5
integer y = 12
integer width = 2455
integer height = 1376
integer taborder = 40
string title = "none"
string dataobject = "d_headers"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "PostData"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_code mle_code
cb_urldecode cb_urldecode
cb_urlencode cb_urlencode
st_6 st_6
mle_data mle_data
mle_postdata mle_postdata
end type

on tabpage_2.create
this.mle_code=create mle_code
this.cb_urldecode=create cb_urldecode
this.cb_urlencode=create cb_urlencode
this.st_6=create st_6
this.mle_data=create mle_data
this.mle_postdata=create mle_postdata
this.Control[]={this.mle_code,&
this.cb_urldecode,&
this.cb_urlencode,&
this.st_6,&
this.mle_data,&
this.mle_postdata}
end on

on tabpage_2.destroy
destroy(this.mle_code)
destroy(this.cb_urldecode)
destroy(this.cb_urlencode)
destroy(this.st_6)
destroy(this.mle_data)
destroy(this.mle_postdata)
end on

type mle_code from multilineedit within tabpage_2
integer x = 2555
integer y = 864
integer width = 1477
integer height = 628
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_urldecode from commandbutton within tabpage_2
integer x = 3323
integer y = 748
integer width = 370
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UrlDecode"
end type

event clicked;CoderObject lco_Code

If Not Len ( mle_code.Text )  > 0 Then Return

lco_Code = Create CoderObject

mle_data.Text = String ( lco_Code.UrlDecode( mle_code.Text), EncodingUTF8!)

Destroy lco_Code
end event

type cb_urlencode from commandbutton within tabpage_2
integer x = 2674
integer y = 748
integer width = 370
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UrlEncode"
end type

event clicked;CoderObject lco_Code

If Not Len ( mle_data.Text )  > 0 Then Return

lco_Code = Create CoderObject

mle_code.Text = lco_Code.UrlEncode( Blob(mle_data.Text,EncodingUTF8!))

Destroy lco_Code
end event

type st_6 from statictext within tabpage_2
integer x = 2501
integer y = 40
integer width = 544
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "URL Encode/Decode:"
boolean focusrectangle = false
end type

type mle_data from multilineedit within tabpage_2
integer x = 2555
integer y = 112
integer width = 1477
integer height = 628
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_postdata from multilineedit within tabpage_2
integer x = 5
integer y = 12
integer width = 2473
integer height = 1480
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "Request Headers"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_requestheaders mle_requestheaders
end type

on tabpage_3.create
this.mle_requestheaders=create mle_requestheaders
this.Control[]={this.mle_requestheaders}
end on

on tabpage_3.destroy
destroy(this.mle_requestheaders)
end on

type mle_requestheaders from multilineedit within tabpage_3
integer x = 5
integer y = 12
integer width = 4027
integer height = 1480
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "Response Headers"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_responseheaders mle_responseheaders
end type

on tabpage_4.create
this.mle_responseheaders=create mle_responseheaders
this.Control[]={this.mle_responseheaders}
end on

on tabpage_4.destroy
destroy(this.mle_responseheaders)
end on

type mle_responseheaders from multilineedit within tabpage_4
integer x = 5
integer y = 12
integer width = 4027
integer height = 1480
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "Response Body"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_responsebody mle_responsebody
end type

on tabpage_5.create
this.mle_responsebody=create mle_responsebody
this.Control[]={this.mle_responsebody}
end on

on tabpage_5.destroy
destroy(this.mle_responsebody)
end on

type mle_responsebody from multilineedit within tabpage_5
integer x = 5
integer y = 12
integer width = 4027
integer height = 1480
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "History"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_3 cb_3
dw_history dw_history
end type

on tabpage_6.create
this.cb_3=create cb_3
this.dw_history=create dw_history
this.Control[]={this.cb_3,&
this.dw_history}
end on

on tabpage_6.destroy
destroy(this.cb_3)
destroy(this.dw_history)
end on

type cb_3 from commandbutton within tabpage_6
integer x = 5
integer y = 1396
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete Row"
end type

event clicked;If dw_history.GetRow () > 0 then
	dw_history.DeleteRow ( dw_history.Getrow())
End If
end event

type dw_history from datawindow within tabpage_6
integer x = 5
integer y = 12
integer width = 4027
integer height = 1376
integer taborder = 40
string dataobject = "d_history"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//DoubleClicked( 0,0,row,dwo )
If Not row > 0 Then Return
string 	ls_Method, ls_Url, ls_Header, ls_PostData

ls_Method = GetItemString ( Row, "method" )
ls_Url = GetItemString ( Row, "url" )
ls_Header = GetItemString ( Row, "header" )
ls_PostData = GetItemString ( Row, "postdata" )

ddlb_method.Text = ls_Method
ddlb_Url.Text = ls_Url

Tab_1.Tabpage_1.dw_Headers.Reset()
If Len ( ls_Header ) > 0 then
	Tab_1.Tabpage_1.dw_Headers.ImportJson( ls_Header )
end If

Tab_1.Tabpage_2.mle_postdata.Text = ""
If Len ( ls_PostData ) > 0 then
	Tab_1.Tabpage_2.mle_postdata.Text = ls_PostData
end If
end event

type tabpage_7 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 4046
integer height = 1500
long backcolor = 67108864
string text = "TimeSheet"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_6 cb_6
dw_timesheet dw_timesheet
end type

on tabpage_7.create
this.cb_6=create cb_6
this.dw_timesheet=create dw_timesheet
this.Control[]={this.cb_6,&
this.dw_timesheet}
end on

on tabpage_7.destroy
destroy(this.cb_6)
destroy(this.dw_timesheet)
end on

type cb_6 from commandbutton within tabpage_7
integer x = 5
integer y = 1396
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Time"
end type

event clicked;Long 		ll_Row

ll_Row = dw_TimeSheet.InsertRow (0)
dw_TimeSheet.SetItem ( ll_Row, 'd_date', today() )
dw_TimeSheet.SetItem ( ll_Row, 'd_time', now() )
end event

type dw_timesheet from datawindow within tabpage_7
integer x = 5
integer y = 12
integer width = 4027
integer height = 1376
integer taborder = 50
string dataobject = "d_timesheet"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;////DoubleClicked( 0,0,row,dwo )
//If Not row > 0 Then Return
//string 	ls_Method, ls_Url, ls_Header, ls_PostData
//
//ls_Method = GetItemString ( Row, "method" )
//ls_Url = GetItemString ( Row, "url" )
//ls_Header = GetItemString ( Row, "header" )
//ls_PostData = GetItemString ( Row, "postdata" )
//
//ddlb_method.Text = ls_Method
//ddlb_Url.Text = ls_Url
//
//Tab_1.Tabpage_1.dw_Headers.Reset()
//If Len ( ls_Header ) > 0 then
//	Tab_1.Tabpage_1.dw_Headers.ImportJson( ls_Header )
//end If
//
//Tab_1.Tabpage_2.mle_postdata.Text = ""
//If Len ( ls_PostData ) > 0 then
//	Tab_1.Tabpage_2.mle_postdata.Text = ls_PostData
//end If
end event

