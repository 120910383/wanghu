<!--#include file="vnetchar.asp"-->
<%
Response.Buffer = True  '��ɾ��
%>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="243">
<%
'����sp����,sp18λ��Կ
spid="10785"  'sp���� �����̻��Լ���SP����5λ
sppwd="510129198402020034" 'spУ����Կ18λ �����̻��Լ��� 
'���ܷ�����url get����
rtmd5=Request("v1")    'V�ҷ�����MD5 
trka=Request("v2")     'V�Һ���15λ
rtmi=Request("v3")     'V������6λ ������Ϊ�� ��V��û�����룩
rtmz=Request("v4")     '��ֵ 1-999 ������ֵ
rtlx=Request("v5")     '��������1��2��3 ��  1:��ʽ�� 2�����Կ� 3 ��������
rtoid=Request("v6")    '��ӯһ��ͨ�������˶��� 10λ  
rtcoid=Request("v7")   '�̻��Լ����� 
rtuserid=Request("v8") '�̻����û�ID 
'rtuserid=trim(server.URLEncode(rtuserid))
rtcustom=Request("v9") '�̻��Լ��������� 
rtflag=Request("v10")  '����״̬. 1Ϊ�������ͻ��� 2Ϊ�������ͻ���

rtmzrtmz=clng(rtmz)*5000





'//'���� ��1�η��ʴ�ҳ�� ��ӯ��Ѷ�����������ô�ҳ��1�� �������ж϶�����������������ֵ��'״̬����Ϣ��
'//'���������û��ʹ��״̬�����һ�¾�MD5У�飬У��ͨ�� �㷢�͡�Response.AddHeader "Data-Received","ok_vpay8"  ��
'//'��ӯ��Ѷ�������������������յ����ͷ ���жϣ� ���Ѿ����û��ӵ���)��Ȼ��Ͱѱ�ҳ��ת�����
'//����ʱת�������ݺ͵�һ�η�����ֱ�ӵ��õ�һ�� �˴���ֻ��Ҫ���ݶ��������û���ʾ��ֵ�ɹ��Ϳ����ˡ�
'//�����û�з���ͷ�������жϣ��Ҿͻ���û���ʾ��������Ϣ���������Լ������Ҳ�����ҷ��������Զ�
'//�������������ݵ�MD5�͵�һ���͵Ĳ�һ��������ġ�$_GET['v10']��'����״̬. 1Ϊ�������ͻ��� 2Ϊ�������ͻ�����
'// ���üӵ��һ��Ҫ�Ѷ��� ״̬�ı䡣����ע�ⰲȫ����  
' //���ڶ�����ȫ���� ���в�����绰��0755-82126136 ������ 

'//��ҳ�治Ҫʹ��SEESION(ӯ)  �������ݿ������Ķ���



get_key=trka&rtmi&rtoid&spid&sppwd&rtcoid&rtflag&rtmz


'��+��+��ӯһ��ͨ�������˶���+ 5λspid+ 18λSP����+�̻�����+rtflag��������1��2 +������ֵ
'LCase�����ǽ��ַ�ת��ΪСд; Ucase�����ǽ��ַ�ת��Ϊ��д
'ȫ����Ѷ֧������ȫ����Ѷ�绰֧���ӿڶ�MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д
md5password=Ucase(trim(md5(get_key)))  '��MD5 32 Ȼ��ת��д
'response.write("md5password:"+md5password)


'����1  :����A��B
'A����,ӯ��Ѷ����������һ��̽���̻�������״̬.�����ö�����ֵ 
'B����,���ö����������ʹ���� �ͰѸö����ĳ�ֵ��¼���û���ӡ.


if(rtflag="1") then
if (md5password=rtmd5) then
'��1��	//////////////////////////////////////

    SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=sa;PWD=dcgame_123;DATABASE=QPGameUserDB;"
	Set Conn= Server.CreateObject("ADODB.Connection")
	Conn.Open SqlConnectionString
   
    set rs=conn.execute("select * from GameCardNoInfo where CardNo='"&rtcoid&"'")
    if not rs.eof then
    'response.Write rs("Nullity")
if (rs("Nullity")=true) then 'A����    
'�˴��������õĶ�����ʾ�û���ֵ��Ϣ.
'������ʾ�û���ֵ����Ϣ�����ֵ����Ԫ������ʲô����ȡ�
Response.write("��ֵ�ɹ���"+"<br>")
Response.write("��ӯһ��ͨ��������Ϊ��"+rtoid+"<br>")
Response.write("��վ��������Ϊ��"+rtcoid+"<br>")
Response.write("�����γ�ֵ��"+rtmz+"ԪV��"+"<br>")
Response.AddHeader "Data-Received","ok_vpay8"   '�˾䲻��ɾ��Ҳ�����޸ģ���Ϊ̽��ɹ�֮��
end if 

'��2�� //////////////////////////////////////
'У���̻���������״̬ 
if (rs("Nullity")=false) then    'b����      
'���û�������Ӧ�ķ���
'�ӷ���֮��begin ������Լ������ݿ�
    
	set rs=conn.execute("update GameCardNoInfo set Nullity='"& true &"',UseDate='"& date() &"' where CardNo='"& rtcoid &"'")
	
    SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=sa;PWD=dcgame_123;DATABASE=QPTreasureDB;"
	Set Conn= Server.CreateObject("ADODB.Connection")
	Conn.Open SqlConnectionString 
	set rss=conn.execute("update GameScoreInfo set score = score + "&rtmzrtmz&" where userid="& rtuserid &"")	
    
Response.write("~~���ݿ�ӷ��� ��ֵ�ɹ���"+"<br>")
Response.write("~~���ݿ�ӷ��� ��ӯһ��ͨ��������Ϊ��"+rtoid+"<br>")
Response.write("~~���ݿ�ӷ��� ��վ��������Ϊ��"+rtcoid+"<br>")
Response.write("~~���ݿ�ӷ��� �����γ�ֵ��"+rtmz+"ԪV��"+"<br>")
'�ӷ������end   ���޸Ķ���״̬Ϊʹ���ˡ�

'�޸Ķ���Ϊʹ��״̬.
Response.AddHeader "Data-Received","ok_vpay8"   '�˾䲻��ɾ��Ҳ�����޸ģ���Ϊ̽��ɹ�֮��
end if 
	


end if 
end if 
end if

'��3�� //////////////////////////////////////

'����2  :����A����
'A�����������������������жϻ�ӵ�ʧ��,����5�����ڿ�ʼ���û���������.����200�� 24��Сʱ
if(rtflag="2") then
if (md5password=rtmd5) then


    SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=sa;PWD=dcgame_123;DATABASE=QPGameUserDB;"
	Set Conn= Server.CreateObject("ADODB.Connection")
	Conn.Open SqlConnectionString
	'sql="select * from GameCardNoInfo where CardNo='"&rtcoid&"'"
	'response.Write sql
   
    set rs=conn.execute("select * from GameCardNoInfo where CardNo='"&rtcoid&"'")
    if not rs.eof then
'response.Write rs("Nullity")
if (rs("Nullity")=true) then    'Ϊ�˰�ȫҪ����У�鶩�������Ƿ��Ѿ�ʹ��  
Response.write("��ֵ�ɹ���"+"<br>")
Response.write("һ��ͨ��������Ϊ��"+rtoid+"<br>")
Response.write("��վ��������Ϊ��"+rtcoid+"<br>")
Response.write("�����γ�ֵ��"+rtmz+"ԪV��"+"<br>")
Response.AddHeader "Data-Received","ok_vpay8"	' ���ʹ˾䡣�ҾͲ�����ö������������ˡ�
end  if


if (rs("Nullity")=false) then    'Ϊ�˰�ȫҪ����У�鶩�������Ƿ��Ѿ�ʹ��
'���û�������Ӧ�ķ���
'�ӷ���֮��begin ������Լ������ݿ�


    set rs=conn.execute("update GameCardNoInfo set Nullity='"& true &"',UseDate='"& date() &"' where CardNo='"& rtcoid &"'") 
	
    SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=sa;PWD=dcgame_123;DATABASE=QPTreasureDB;"
	Set Conn= Server.CreateObject("ADODB.Connection")
	Conn.Open SqlConnectionString 
	set rss=conn.execute("update GameScoreInfo set score = score + "&rtmzrtmz&" where userid="& rtuserid &"")

Response.write("�����������û��ӵ�  ��ֵ�ɹ���"+"<br>")
Response.write("����һ��ͨ��������Ϊ��"+rtoid+"<br>")
Response.write("������վ��������Ϊ��"+rtcoid+"<br>")
Response.write("���������γ�ֵ��"+rtmz+"ԪV��"+"<br>")
'�ӷ������end   ���޸Ķ���״̬Ϊʹ���ˡ�
Response.AddHeader "Data-Received","ok_vpay8"	'�˾䲻��ɾ��Ҳ�����޸ģ���Ϊ̽��ɹ�֮�á�
end if


end if 
end if 

end if
			
%>
��<a href="vpay8.asp" target="_self">������ֵ��</a>��&nbsp;&nbsp; ��<a href="../index.asp" target="_self">������ҳ</a>��</td>
</tr>
</table>

</body>
</HTML>