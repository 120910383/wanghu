<!--#include file="../inc/config.asp"-->
<%dim varchar,code,codearr,J%>
<!--#include file="md6.asp" -->
<%
  dim merchantAcctId,key,version,language,signType,payType,bankId,orderId,orderTime,orderAmount,dealId,bankDealId,dealTime,payAmount,fee,ext1,ext2,payResult,errCode,signMsg,youxibi,payAmount1,merchantSignMsgVal,merchantSignMsg,v_result
%>
<%
'*
'* @Description: ��Ǯ�����֧�����ؽӿڷ���
'* @Copyright (c) �Ϻ���Ǯ��Ϣ�������޹�˾
'* @version 2.0
'*

'��ȡ����������˻���
merchantAcctId=trim(request("merchantAcctId"))

'���������������Կ
''���ִ�Сд
key="ZEYAX39WBIMRQ578"

'��ȡ���ذ汾.�̶�ֵ
''��Ǯ����ݰ汾�������ö�Ӧ�Ľӿڴ������
''������汾�Ź̶�Ϊv2.0
version=trim(request("version"))

'��ȡ��������.�̶�ѡ��ֵ��
''ֻ��ѡ��1��2��3
''1�������ģ�2����Ӣ��
''Ĭ��ֵΪ1
language=trim(request("language"))

'ǩ������.�̶�ֵ
''1����MD5ǩ��
''��ǰ�汾�̶�Ϊ1
signType=trim(request("signType"))

'��ȡ֧����ʽ
''ֵΪ��10��11��12��13��14
''00�����֧��������֧��ҳ����ʾ��Ǯ֧�ֵĸ���֧����ʽ���Ƽ�ʹ�ã�10�����п�֧��������֧��ҳ��ֻ��ʾ���п�֧����.11���绰����֧��������֧��ҳ��ֻ��ʾ�绰֧����.12����Ǯ�˻�֧��������֧��ҳ��ֻ��ʾ��Ǯ�˻�֧����.13������֧��������֧��ҳ��ֻ��ʾ����֧����ʽ��.14��B2B֧��������֧��ҳ��ֻ��ʾB2B֧��������Ҫ���Ǯ���뿪ͨ����ʹ�ã�
payType=trim(request("payType"))

'��ȡ���д���
''�μ����д����б�
bankId=trim(request("bankId"))

'��ȡ�̻�������
orderId=trim(request("orderId"))

'��ȡ�����ύʱ��
''��ȡ�̻��ύ����ʱ��ʱ��.14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磺20080101010101
orderTime=trim(request("orderTime"))

'��ȡԭʼ�������
''�����ύ����Ǯʱ�Ľ���λΪ�֡�
''�ȷ�2 ������0.02Ԫ
orderAmount=trim(request("orderAmount"))

'��ȡ��Ǯ���׺�
''��ȡ�ý����ڿ�Ǯ�Ľ��׺�
dealId=trim(request("dealId"))

'��ȡ���н��׺�
''���ʹ�����п�֧��ʱ�������еĽ��׺š��粻��ͨ������֧������Ϊ��
bankDealId=trim(request("bankDealId"))

'��ȡ�ڿ�Ǯ����ʱ��
''14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磻20080101010101
dealTime=trim(request("dealTime"))

'��ȡʵ��֧�����
''��λΪ��
''�ȷ� 2 ������0.02Ԫ
payAmount=trim(request("payAmount"))

'��ȡ����������
''��λΪ��
''�ȷ� 2 ������0.02Ԫ
fee=trim(request("fee"))

'��ȡ��չ�ֶ�1
ext1=trim(request("ext1"))

'��ȡ��չ�ֶ�2
ext2=trim(request("ext2"))

'��ȡ������
''10���� �ɹ�11���� ʧ��
payResult=trim(request("payResult"))

'��ȡ�������
''��ϸ���ĵ���������б�
errCode=trim(request("errCode"))

'��ȡ����ǩ����
signMsg=trim(request("signMsg"))



'���ɼ��ܴ������뱣������˳��
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"merchantAcctId",merchantAcctId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"version",version)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"language",language)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"signType",signType)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payType",payType)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"bankId",bankId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderId",orderId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderTime",orderTime)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderAmount",orderAmount)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"dealId",dealId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"bankDealId",bankDealId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"dealTime",dealTime)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payAmount",payAmount)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"fee",fee)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"ext1",ext1)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"ext2",ext2)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payResult",payResult)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"errCode",errCode)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"key",key)
    merchantSignMsg= md6(merchantSignMsgVal)


'��ʼ���������ַ


'�̼ҽ������ݴ�������ת���̼���ʾ֧�������ҳ��
''���Ƚ���ǩ���ַ�����֤


If UCase(signMsg)=UCase(merchantSignMsg) then

	''���Ž���֧������ж�
	Select Case payResult
	
		  case "10"
			
			'*  
			' �̻���վ�߼������ȷ����¶���֧��״̬Ϊ�ɹ�
			' �ر�ע�⣺ֻ��UCase(signMsg)=UCase(merchantSignMsgVal)����payResult=10���ű�ʾ֧���ɹ���ͬʱ������������ύ����ǰ�Ķ��������жԱ�У�顣
			'*
			
			'�������Ǯ�����������ṩ��Ҫ�ض���ĵ�ַ��
            v_result="�ɹ�"


            payAmount=clng(payAmount)
			youxibi=payAmount*100
			payAmount1=youxibi/10
			
			  CxGame.DbConn("QPGameUserDB")
			  dim gender,C_idno,c_address,c_email,c_pic,sql,UserID,SpreaderID
			  set rs=conn.execute("select top 1 UserID,SpreaderID from AccountsInfo where Accounts='"& ext1 &"'")
			  if not rs.eof then
				 UserID=rs(0)
				 SpreaderID=clng(rs(1))
			  end if
			  rs.close
			  
			  if ext2="��ɫ��Ա��" then
			  CxGame.DbConn("QPGameUserDB")
				  set rs=conn.execute("update AccountsInfo set MemberOrder=1 where UserID="&UserID)
				  response.Write("<script language='javascript'>alert('��ֵ�ɹ���');location.href='../index.asp';</script>")
			  else
				  CxGame.DbConn("CxGameTreasureDb")
				  set rs=conn.execute("select * from PostLog where PostCode='"& orderId &"'")
				  if rs.eof then
					  set rs=conn.execute("insert into PostLog (UserID,PostCode,Price,PostDate) values ("& UserID &","& orderId &","& payAmount &","& date() &")")
					  CxGame.DbConn("QPTreasureDB")
					  set rs=conn.execute("update GameScoreInfo set score=score+"& youxibi &" where userid="&UserID)
					  
					  if SpreaderID > 0 then
						 set rs=conn.execute("update set GameScoreInfo score=score+"& payAmount1 &" where userid="&SpreaderID)
					  end if					  
				  end if
			  end if
			  response.Write("<script language='javascript'>alert('��ֵ�ɹ���');location.href='../index.asp';</script>")
		 Case else

			v_result="ʧ��"

	End select

else

	v_result="ǩ������"

End if

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


'���±������Ǯ�����������ṩ��Ҫ�ض���ĵ�ַ

%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>��Ǯ֧�����</title>
		<meta http-equiv="content-type" content="text/html; charset=gb2312" >
	</head>
	
<BODY>
	
	<div align="center">
		<table width="259" border="0" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC" >
			<tr bgcolor="#FFFFFF">
				<td width="80">֧����ʽ:</td>
				<td >��Ǯ[99bill]</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td >�������:</td>
				<td ><%=orderId %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>�������:</td>
				<td><%=(orderAmount)&"��" %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>֧�����:</td>
				<td><%=v_result %></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
	  </table>
	</div>

</BODY>
</HTML>