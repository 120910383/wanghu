<%
    if request.Cookies("admin99aw")="" then
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
  dim S_id
  S_id=replace(trim(request("S_id")),"'","")
  if S_id="" then
	  response.Write("<script language='javascript'>alert('��ѡ����Ҫɾ������Ϣ');history.go(-1);</script>")
	  response.End()
  end if
%>
<%
  sql="delete from Jiangpin where C_id in ("& S_id &")"
  conn.execute(sql)
  response.Redirect("Product.asp")
%>