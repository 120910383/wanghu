<!--#include file="../inc/conn.asp"-->
<%if request.Cookies("admin99aw")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='admin_login.asp';</script>"
response.End
else
if request.Cookies("flag")<>"��������Ա" then
response.Write "<p align=center><font color=red>��û�д���Ŀ����Ȩ�ޣ�</font></p>"
response.End
end if
end if
%>
<!--#include file="md5.asp"-->
<%dim action,admin,adminid
action=request.QueryString("action")
id=request.QueryString("id")
admin=trim(request("admin"))
select case action
'//�޸�����
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from admin where id="&id,conn,1,3
rs("admin")=admin
if trim(request("password"))<>"" then
rs("password")=md5(trim(request("password")))
end if
rs("classname")=request("flag")
rs.Update
rs.Close
set rs=nothing
response.Write "<script language=javascript>alert('�޸ĳɹ���');history.go(-1);</script>"
response.End
'//���������
case "add"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from admin where admin='"& trim(request("admin2")) &"'",conn,1,3
if not rs.eof then
response.Write("<script language='javascript'>alert('���д��û�,�����!');history.go(-1);</script>")
response.End()
end if
rs.addnew
rs("admin")=trim(request("admin2"))
rs("password")=md5(trim(request("password2")))
rs("classname")=request("flag2")
rs.update
rs.close
set rs=nothing
response.Write "<script language=javascript>alert('��ӳɹ���');location.href='manageadmin.asp';</script>"
response.End
'//ɾ������
case "del"
conn.execute ("delete from admin where id="&request.QueryString("id"))
response.Redirect "manageadmin.asp"
end select
%>