<%
	Dim flashack_Post,flashack_Get,flashack_In,flashack_Inf,flashack_Xh,flashack_db,flashack_dbstr 
	flashack_In = "'��;��and��exec��insert��select��delete��update��count��*��%��chr��mid��master��truncate��char��declare" 
	flashack_Inf = split(flashack_In,"��") 
	
	
	If Request.QueryString<>"" Then 
	For Each flashack_Get In Request.QueryString 
	For flashack_Xh=0 To Ubound(flashack_Inf) 
	If Instr(LCase(Request.QueryString(flashack_Get)),flashack_Inf(flashack_Xh))<>0 Then 
	Response.Write "<Script Language=JavaScript>alert('flashack��ע��ϵͳ��ʾ���\n\n�벻Ҫ�ڲ����а����Ƿ��ַ�����ע��,QQ:200160��\n\nHTTP://www.dc173.com');</Script>" 
	Response.Write "�Ƿ�������flashack�Ѿ������������¼�¼��<br>" 
	Response.Write "����IP��"&Request.ServerVariables("REMOTE_ADDR")&"<br>" 
	Response.Write "����ʱ�䣺"&Now&"<br>" 
	Response.Write "����ҳ�棺"&Request.ServerVariables("URL")&"<br>" 
	Response.Write "�ύ��ʽ��GET<br>" 
	Response.Write "�ύ������"&flashack_Get&"<br>" 
	Response.Write "�ύ���ݣ�"&Request.QueryString(flashack_Get)
	Response.End 
	End If 
	Next 
	Next 
	End If 
%>




















<%
SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=1111;PWD=11111;DATABASE=QPGameUserDB;"
Set Conn= Server.CreateObject("ADODB.Connection")
Conn.Open SqlConnectionString
%>  