<!--#include file="../inc/conn.asp"-->
<!--#include file="md5.asp"-->

<%dim admin,password,verifycode
admin=replace(trim(request("admin")),"'","")
password=md5(replace(trim(request("password")),"'",""))
verifycode=replace(trim(request("verifycode")),"'","")
if admin="" or password="" then
response.Write "<script LANGUAGE='javascript'>alert('���Ĺ���ID����������');history.go(-1);</script>"
response.end
end if
if cstr(request.Cookies("getcode"))<>cstr(trim(request("verifycode"))) then
response.Write "<script LANGUAGE='javascript'>alert('��������ȷ����֤�룡');history.go(-1);</script>"
response.end
end if

set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from admin where admin='"&admin&"' and password='"&password&"' " ,conn,1,1
if not(rs.bof and rs.eof) then
if password=rs("password") then
response.Cookies("admin99aw")=trim(rs("admin"))
response.Cookies("flag")=rs("classname")
session("user")=rs("classcode")
'session.Timeout=20
rs.Close
set rs=nothing
response.Redirect "login.asp"
else
response.write "<script LANGUAGE='javascript'>alert('�Բ��𣬵�½ʧ�ܣ�');history.go(-1);</script>"
end if
else
response.write "<script LANGUAGE='javascript'>alert('�Բ��𣬵�½ʧ�ܣ�');history.go(-1);</script>"
end if
%>