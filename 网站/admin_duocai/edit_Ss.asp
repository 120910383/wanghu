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
<%
  C_id=replace(trim(request.Form("C_id")),"'","")
  C_name=replace(trim(request.Form("C_name")),"'","")
  C_pic=replace(trim(request.Form("bookpic")),"'","")
  C_type=replace(trim(request.Form("C_type")),"'","")
  C_content=replace(trim(request.Form("bookcontent")),"'","")
  C_money=replace(trim(request.Form("C_money")),"'","")
  C_vip=replace(trim(request.Form("C_vip")),"'","")
  C_cun=replace(trim(request.Form("C_cun")),"'","")
  
  if C_name="" then 
	  response.Write("<script language='javascript'>alert('����д����');window.close();</script>")
	  response.End()
  end if
%>
<!--#include file="../inc/conn.asp"-->
<%
  sql="update Jiangpin set C_name='"& C_name &"',C_pic='"& C_pic &"',C_type='"& C_type &"',C_content='"& C_content &"',C_time='"& date() &"',C_money='"& C_money &"',C_vip='"& C_vip &"',C_cun='"& C_cun &"' where C_id="&C_id
  conn.execute(sql)
  response.Write("<script language='javascript'>window.parent.opener.location=window.parent.opener.location;alert('���³ɹ���');window.close();</script>")
%>