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
<!--#include file="../inc/conn.asp"-->
<%
  dim id
  id=replace(trim(request.QueryString("id")),"'","")
  if id="" or isnumeric(id)=false then
	  response.Write("<script language='javascript'>alert('�Ƿ�����');history.go(-1);</script>")
	  response.End()
  end if
  
  set rs=conn.execute("delete from Duihuan where id="&id)
  response.Redirect("People.asp")
%>