<!--#include file="../Inc/Config.asp" -->
<!--#include file="../Inc/md5VB.asp" -->
<%
  CxGame.IsCheckLogin()
%>
<%
  dim username,password,C_idno,lianxi,email,C_id,D_content,GetPassWord
  username=replace(trim(request.Form("username")),"'","")
  password=replace(trim(request.Form("password")),"'","")
  C_idno=replace(trim(request.Form("C_idno")),"'","")
  lianxi=replace(trim(request.Form("lianxi")),"'","")
  email=replace(trim(request.Form("email")),"'","")
  C_id=replace(trim(request.Form("C_id")),"'","")
  D_content=replace(trim(request.Form("D_content")),"'","")
  
  if C_id="" or isnumeric(C_id)=false then
     response.Write("<script language='javascript'>alert('�Ƿ�����');history.go(-1);</script>")
	 response.End()
  end if
  if username="" or password="" or C_idno="" or lianxi="" or email="" then
     response.Write("<script language='javascript'>alert('����д����');history.go(-1);</script>")
	 response.End()
  end if
  
  CxGame.DbConn("QPGameUserDB")
  Set md5= New MD5obj
  GetPassWord=md5.calcMD5(password)
		   set rs=conn.execute("select * from AccountsInfo where UserID="&Session("UserID")&" and  InsurePass='"& GetPassWord &"'")
		   if rs.eof then
		      response.Write("<script language='javascript'>alert('�����������');history.go(-1);</script>")
	          response.End()
		   end if
		   
  CxGame.DbConn("News")
  
  set rs=conn.execute("insert into Duihuan (userid,username,C_idno,lianxi,email,C_id,D_content,thetime,Y_huan) values ('"& session("userid") &"','"& username &"','"& C_idno &"','"& lianxi &"','"& email &"','"& C_id &"','"& D_content &"','"& date() &"','0')")
  response.Write("<script language='javascript'>alert('�ύ�ɹ�����ȴ���ϵ��');location.href='ExChange.asp';</script>")
%>