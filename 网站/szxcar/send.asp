<!--#include file="md5.asp"-->
<%
dim payerName,productName,orderAmount,bgUrl
payerName=server.URLEncode(replace(trim(request.Form("username1")),"'",""))
productName=server.URLEncode(replace(trim(request.Form("car")),"'",""))
productName1=replace(trim(request.Form("car")),"'","")
orderAmount=clng(replace(trim(request.Form("money")),"'",""))
orderAmount1=orderAmount*0.01
bgUrl="http://www.dc173.com/szxcar/receive.asp"
'*
'* @Description: ��Ǯ������֧�����ؽӿڷ���
'* @Copyright (c) �Ϻ���Ǯ��Ϣ�������޹�˾
'* @version 2.0
'*


'�����������˻���
''�����Ǯ��ϵ��ȡ
merchantAcctId="1000781683604"

'���������������Կ
''���ִ�Сд
key="XNXHGS3S4938F6X8"


'�ַ���.�̶�ѡ��ֵ����Ϊ�ա�
''ֻ��ѡ��1��2��3.
''1����UTF-8; 2����GBK; 3����gb2312
''Ĭ��ֵΪ1
inputCharset="3"

'����֧�������ҳ���ַ.��[bgUrl]����ͬʱΪ�ա������Ǿ��Ե�ַ��
''���[bgUrl]Ϊ�գ���Ǯ��֧�����Post��[pageUrl]��Ӧ�ĵ�ַ��
''���[bgUrl]��Ϊ�գ�����[bgUrl]ҳ��ָ����<redirecturl>��ַ��Ϊ�գ���ת��<redirecturl>��Ӧ�ĵ�ַ
pageUrl=bgUrl
'����������֧������ĺ�̨��ַ.��[pageUrl]����ͬʱΪ�ա������Ǿ��Ե�ַ��
''��Ǯͨ�����������ӵķ�ʽ�����׽�����͵�[bgUrl]��Ӧ��ҳ���ַ�����̻�������ɺ������<result>���Ϊ1��ҳ���ת��<redirecturl>��Ӧ�ĵ�ַ��
''�����Ǯδ���յ�<redirecturl>��Ӧ�ĵ�ַ����Ǯ����֧�����post��[pageUrl]��Ӧ��ҳ�档
bgUrl=""


'���ذ汾.�̶�ֵ
''��Ǯ����ݰ汾�������ö�Ӧ�Ľӿڴ������
''������汾�Ź̶�Ϊv2.0
version="v2.0"

'��������.�̶�ѡ��ֵ��
''ֻ��ѡ��1��2��3
''1�������ģ�2����Ӣ��
''Ĭ��ֵΪ1
language="1"

'ǩ������.�̶�ֵ
''1����MD5ǩ��
''��ǰ�汾�̶�Ϊ1
signType="1"	

   
'֧��������
''��Ϊ���Ļ�Ӣ���ַ�
payerName=payerName

'֧������ϵ��ʽ����.�̶�ѡ��ֵ
''ֻ��ѡ��1��2
''1����Email��2�����ֻ���
payerContactType="1"	

'֧������ϵ��ʽ
''ֻ��ѡ��Email���ֻ���
payerContact=""

'�̻�������
''����ĸ�����֡���[-][_]���
orderId=getDateStr()

'�������
''�Է�Ϊ��λ����������������
''�ȷ�2������0.02Ԫ
orderAmount=orderAmount

'֧����ʽ.�̶�ѡ��ֵ
''ֻ��ѡ��00
''00������֧�������п��Ϳ�Ǯ�ʻ�֧��
payType="44"

'�����п����
''�����̻������������п���ֱ������ʱ��д
cardNumber=""

'�����п�����
''�����̻������������п���ֱ������ʱ��д
cardPwd=""

'ȫ��֧����־
''ֻ��ѡ������ 0 �� 1
''0�������С�ڶ������ʱ����֧�����Ϊʧ�ܣ�1�������С�ڶ�������Ƿ���֧�����Ϊ�ɹ���ͬʱ��������ʵ��֧����Ϊ�����п������.����̻����������п���ֱ��ʱ���������̶�ֵΪ1
fullAmountFlag="0"

'�����ύʱ��
''14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磻20080101010101
orderTime=getDateStr()

'��Ʒ����
''��Ϊ���Ļ�Ӣ���ַ�
productName=productName

'��Ʒ����
''��Ϊ�գ��ǿ�ʱ����Ϊ����
productNum="1"

'��Ʒ����
''��Ϊ�ַ���������
productId=""

'��Ʒ����
productDesc=""
	
'��չ�ֶ�1
''��֧��������ԭ�����ظ��̻�
ext1=payerName

'��չ�ֶ�2
''��֧��������ԭ�����ظ��̻�
ext2=""


   
'���ɼ���ǩ����
''����ذ�������˳��͹�����ɼ��ܴ���
	signMsgVal=appendParam(signMsgVal,"inputCharset",inputCharset)
	signMsgVal=appendParam(signMsgVal,"bgUrl",bgUrl)
	signMsgVal=appendParam(signMsgVal,"pageUrl",pageUrl)
	signMsgVal=appendParam(signMsgVal,"version",version)
	signMsgVal=appendParam(signMsgVal,"language",language)
	signMsgVal=appendParam(signMsgVal,"signType",signType)
	signMsgVal=appendParam(signMsgVal,"merchantAcctId",merchantAcctId)
	signMsgVal=appendParam(signMsgVal,"payerName",payerName)
	signMsgVal=appendParam(signMsgVal,"payerContactType",payerContactType)
	signMsgVal=appendParam(signMsgVal,"payerContact",payerContact)
	signMsgVal=appendParam(signMsgVal,"orderId",orderId)
	signMsgVal=appendParam(signMsgVal,"orderAmount",orderAmount)
    signMsgVal=appendParam(signMsgVal,"payType",payType)
	signMsgVal=appendParam(signMsgVal,"cardNumber",cardNumber)
	signMsgVal=appendParam(signMsgVal,"cardPwd",cardPwd)
	signMsgVal=appendParam(signMsgVal,"fullAmountFlag",fullAmountFlag)
	signMsgVal=appendParam(signMsgVal,"orderTime",orderTime)
	signMsgVal=appendParam(signMsgVal,"productName",productName)
	signMsgVal=appendParam(signMsgVal,"productNum",productNum)
	signMsgVal=appendParam(signMsgVal,"productId",productId)
	signMsgVal=appendParam(signMsgVal,"productDesc",productDesc)
	signMsgVal=appendParam(signMsgVal,"ext1",ext1)
	signMsgVal=appendParam(signMsgVal,"ext2",ext2)
	signMsgVal=appendParam(signMsgVal,"key",key)
signMsg= Ucase(md5(signMsgVal))
	
	'���ܺ�����������ֵ��Ϊ�յĲ�������ַ���
	Function appendParam(returnStr,paramId,paramValue)

		If returnStr <> "" Then
			If paramValue <> "" then
				returnStr=returnStr&"&"&paramId&"="&paramValue
			End if
		Else 
			If paramValue <> "" then
				returnStr=paramId&"="&paramValue
			End if
		End if
		
		appendParam=ReturnStr

	End Function
	'���ܺ�����������ֵ��Ϊ�յĲ�������ַ���������

	'���ܺ�������ȡ14λ������
	Function getDateStr() 

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
	'���ܺ�������ȡ14λ�����ڡ�����
	
%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>ʹ�ÿ�Ǯ֧��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" >
	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style></head>
	
<body oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false" onmouseup="document.selection.empty()">
	<div align="center">
		<table width="259" border="0" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC" >
			<tr bgcolor="#FFFFFF">
				<td width="80" height="24">֧����ʽ:</td>
				<td height="24" >��Ǯ[99bill]</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="24" >�������:</td>
				<td height="24" ><%=orderId %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="24">�������:</td>
				<td height="24"><%=orderAmount1%>Ԫ</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="24">֧����:</td>
				<td height="24"><%=payerName %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="24">��Ʒ����:</td>
				<td height="24"><%=productName1 %></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
	  </table>
	</div>

	<div align="center" style="font-size=12px;font-weight: bold;color=red;">
		<form name="kqPay" method="post" action="https://www.99bill.com/szxgateway/recvMerchantInfoAction.htm">
            <input type="hidden" name="inputCharset" value="<%=inputCharset %>">
			<input type="hidden" name="bgUrl" value="<%=bgUrl %>">
			<input type="hidden" name="pageUrl" value="<%=pageUrl %>">
			<input type="hidden" name="version" value="<%=version %>">
			<input type="hidden" name="language" value="<%=language %>">
			<input type="hidden" name="signType" value="<%=signType %>">			
			<input type="hidden" name="merchantAcctId" value="<%=merchantAcctId %>">
			<input type="hidden" name="payerName" value="<%=payerName %>">
			<input type="hidden" name="payerContactType" value="<%=payerContactType %>">
			<input type="hidden" name="payerContact" value="<%=payerContact %>">
			<input type="hidden" name="orderId" value="<%=orderId %>">
			<input type="hidden" name="orderAmount" value="<%=orderAmount %>">
            <input type="hidden" name="payType" value="<%=payType %>">
			<input type="hidden" name="cardNumber" value="<%=cardNumber %>">
			<input type="hidden" name="cardPwd" value="<%=cardPwd %>">
			<input type="hidden" name="fullAmountFlag" value="<%=fullAmountFlag %>">
			<input type="hidden" name="orderTime" value="<%=orderTime %>">
			<input type="hidden" name="productName" value="<%=productName %>">
			<input type="hidden" name="productNum" value="<%=productNum %>">
			<input type="hidden" name="productId" value="<%=productId %>">
			<input type="hidden" name="productDesc" value="<%=productDesc %>">
			<input type="hidden" name="ext1" value="<%=ext1 %>">
			<input type="hidden" name="ext2" value="<%=ext2 %>">	
			<input type="hidden" name="signMsg" value="<%=signMsg %>">	
			<input type="submit" name="submit" value="�ύ����Ǯ">
			
		</form>		
	</div>
	
</BODY>
</HTML>
  50