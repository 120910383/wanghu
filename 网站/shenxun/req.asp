<!--#include file="../inc/config.asp"-->
<%
  dim post_key,md5password,cardid,userID,userIP,errorcallback,agentclient,callbackplug,varchar,code,codearr,J
%>
<!--#include file="vnetsettings.asp"-->
<!--#include file="vnetchar.asp"-->
<%
post_key=custom&receive_url&agentID&agentPWD '��˳��Ҫ�ģ����ݶ���ҪΪ�ա�
'LCase�����ǽ��ַ�ת��ΪСд; Ucase�����ǽ��ַ�ת��Ϊ��д
'ȫ����Ѷ֧������ȫ����Ѷ�绰֧���ӿڶ�MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д
md5password=Ucase(trim(md6(post_key)))  '��MD5 32λ Ȼ����ת��д  

cardid=request.Form("cardid")  '15λ����
userID=request.Form("userID")  '�û���
userIP=request.Form("userIP")  '�û�IP��ַ


'response.Write post_key
'response.End()
'�˴���֤�û����Ƿ����  �����SQL ��� sql="select count(*) as dds from users where userid='"&userid&"'" 

if (trim(request.Form("vcode"))=Session("GetCode")) and cardid<>"" and userID<>""    then

	CxGame.DbConn("QPGameUserDB")
	set rs=conn.execute("select * from AccountsInfo where Accounts='"& userID &"'")
	
	if not rs.eof then
		CxGame.DbConn("CxGameTreasureDb")
		set rs=conn.execute("select * from yinghua where agentself='"& custom &"'")
		if rs.eof then
		   set rs=conn.execute("insert into yinghua (username,agentself) values ('"& userid &"','"& custom &"')")
		end if
	else
		response.Write("<script language='javascript'>alert('û�д��û���');location.href='../paybuy.asp';</script>")
		response.End()
	end if
%>
<HTML>
	<HEAD>
		<title>ӯ��Ѷ����ֵ�ӿ�2001�汾</title>
		
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body,td,th {
	color: red;
	font-size: 12px;
}
-->
</style></HEAD>

	 <!--Ϊ��ֹ�ͻ��Լ��ص�JAVASTRIPT �ű� �������ֶ��ύ ���������Զ��ύ��-->
	<body onLoad="document.forms[0].submit();">
	
	
	
���ڳ�ֵ��.....................�벻Ҫˢ�º͹ر��������

		<form name=form1 action='<%=serverurl%>' method=post ><!--ӯ��Ѷ��������ҳ��-->
	<input type=hidden name=agentID  value='<%=agentID%>' >   <!--����������̵Ĵ����̴���ID -->
<input name= userID type=hidden  value='<%=userID%>' ><!--��ֵ�ʺ�-->

<input name=cardid type=hidden  value='<%=cardid%>' > <!--��ֵ15λ���ֿ���-->
  <!--��ֵ���� -->
	<input type=hidden name= version  value='<%=agentversion%>'> <!--֧������汾�ţ�2001 -->
	<input type=hidden name= agentself  value='<%=custom%>' >   <!--�û��Լ�����18���ַ����� -->
	
		<input type=hidden name= agentcallback  value='<%=receive_url%>' > <!--�û��Լ�����ҳ��URL ָ�ͻ������URL ��"http://"��ʼ -->
		
			<input type=hidden name=errorcallback  value='<%=errorcallback%>' > <!--�û���ֵ���󷵻ص�ַ ��"http://"��ʼ -->
			
				<input type=hidden name= md5password value='<%=md5password%>' >   
				
	<input type=hidden name= userIP value='<%=userIP%>' >
	
		<input type=hidden name=callbackplug value='<%=callbackplug%>' > <!--��̨��ַ�Ͳ�����ַ -->
	
   <input name="vnetpay" type=hidden id="Submit" value="��ֵ">
		</form>
	
	
	</body>
</HTML>
<%

else

response.Write("�������д����֤�����.�뷵�غ�����.")
response.write("<a href="&agentclient& ">" & "���س�ֵҳ��" & "</a>")

%>

<%end if %>