<%

'���´���Ϊ��������
dim agentID,agentPWD,receive_url,custom,agentreq,serverurl,agentversion

agentID="10785"           ' ��վ���˱�� 5λ�� ���Ϊ�Լ��ļ��˱�š�

agentPWD="510129198402020034"   '984616516893646869 ��վ�������� 18λ �����Ϊ�Լ��ļ������롣
custom=getDateStr      '�Լ������ֶ�,ֻ�����ֺ���ĸ.����Ϊ18�ַ�����. �Լ��Ķ������� �����Է���req.asp ���棬����ǰ��Ҫһ�¡����м����ط��õ��˶����������ɴ���

'�ͻ���������յķ���ҳ���ַ �뻻���Լ���վ�ķ���ҳ�� ��:http://�������/����ļ���callbackclient.asp
receive_url="http://www.dc173.com/shenxun/callbackclient.asp"  

''����ʱ���ص�ַ ��:http://�������/����ļ���/error.asp
errorcallback="http://www.dc173.com/shenxun/error.asp"  


'�û�ע���ַ ����д�û������㷽վ���û�ID���Ϳ��ŵ�ҳ��.��:http://�������/����ļ���/client.asp" 
agentclient="http://www.dc173.com/shenxun/ipsinput.asp"

 '�̻��Լ��������ַ  ��:http://�������/����ļ���/req.asp
agentreq="http://www.dc173.com/shenxun/req.asp" 


'���������������յ� �� ������ַ(�����ͽ�����ͬһ��ҳ��) ��:http://�������/����ļ���/callbackplug.asp
callbackplug="http://www.dc173.com/shenxun/callbackplug.asp" 

'ӯ��Ѷ�����񷽽��յ�ַ �벻Ҫ����޸�.
serverurl="http://s.vnetone.com/netserver.aspx"  

'ӯ��Ѷ���ӿڰ汾 ���ڰ汾��2001
agentversion="2001"

Function getDateStr() 
'	randomize
'    ranNum=int(600*rnd)+100
    'getDateStr=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
	dim dateStr1,dateStr2,strTemp 
	dateStr1=split(cstr(formatdatetime(now(),2)),"-") 
	dateStr2=split(cstr(right(formatdatetime(now(),3),8)),":") 

	for each StrTemp in dateStr1 
	if len(StrTemp)<2 then 
	getDateStr=getDateStr & "0" & strTemp 
	else 
	getDateStr=getDateStr & strTemp 
	end if 
	next 

	for each StrTemp in dateStr2 
	if len(StrTemp)<2 then 
	getDateStr=getDateStr & "0" & strTemp 
	else 
	getDateStr=getDateStr & strTemp 
	end if
	next
	End function 
%>