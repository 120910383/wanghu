<!--#include file="../Inc/Config.asp" -->
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

<%
  dim id,userid,C_money,C_vip,MemberOrder,C_id
  C_money=clng(replace(trim(request.QueryString("C_money")),"'",""))
  C_vip=clng(replace(trim(request.QueryString("C_vip")),"'",""))
  userid=replace(trim(request.QueryString("userid")),"'","")
  id=replace(trim(request.QueryString("id")),"'","")
  C_id=replace(trim(request.QueryString("C_id")),"'","")
  if id="" or isnumeric(id)=false then
	  response.Write("<script language='javascript'>alert('�Ƿ�����');history.go(-1);</script>")
	  response.End()
  end if
  if userid="" or isnumeric(userid)=false then
	  response.Write("<script language='javascript'>alert('�Ƿ�����');history.go(-1);</script>")
	  response.End()
  end if
  if C_id="" or isnumeric(C_id)=false then
	  response.Write("<script language='javascript'>alert('�Ƿ�����');history.go(-1);</script>")
	  response.End()
  end if
  
  CxGame.DbConn("News")
  set rs=conn.execute("select * from Jiangpin where C_id="&C_id)
  if rs.eof then
     response.Write("<script language='javascript'>alert('�޴˽�Ʒ��');history.go(-1);</script>")
	 response.End()
  else
     if clng(rs("C_cun")) < 1 then
	 response.Write("<script language='javascript'>alert('�˽�Ʒ�Ѿ��һ��꣡');history.go(-1);</script>")
	 response.End()
	 end if
  end if
  set rs=conn.execute("update Duihuan set Y_huan=1 where id="&id)
  set rs=conn.execute("update Jiangpin set C_cun=C_cun - 1 where C_id="&C_id)
  
  CxGame.DbConn("QPGameUserDB")
  set rs=conn.execute("select * from AccountsInfo where UserID="& userid &"")
  if not rs.eof then
	 MemberOrder=clng(rs("MemberOrder"))		  
  end if
   
  CxGame.DbConn(RLWebDBPrefix&"TreasureDb")
  
  if MemberOrder< 1 then
     set rs=conn.execute("update GameScoreInfo set bnak=bnak-"& C_money &" where UserID="& userid &"")
  else
     set rs=conn.execute("update GameScoreInfo set bnak=bnak-"& C_vip &" where UserID="& userid &"")
  end if
  
  response.Redirect("People.asp")
%>
