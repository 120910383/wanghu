<!--#include file="vnetchar.asp"-->
<%
spid="10785"  'sp���� �����̻��Լ���SP����5λ
sppwd="510129198402020034" 'spУ����Կ18λ �����̻��Լ���   
spreq="http://www.dc173.com/xjb/vpay8.asp" '�����̻������ַ
sprec="http://www.dc173.com/xjb/receive.asp" '�����̻����յ�ַ
spversion="vpay1001"   '�˽ӿڵİ汾���� �˰汾��"vpay1001"
money= request.Form("money")  '�Ӳ�����ֵԪ 1-999 ������ֵ ��ҪдС���㡣
spname=Server.UrlEncode("���������Ϸ")   '�Ӳ�����վ������ ��UrlEncode����
userid=Server.UrlEncode(request.Form("userid"))        '�Ӳ����û�ID ��UrlEncode����
userid_d=request.Form("userid")
spcustom= Server.UrlEncode("���������Ϸ")     '�ͻ��Զ���30�ַ��� ��UrlEncode���� 
urlcode ="GB2312" '����  gbk  gb2312   utf-8  unicode   big5(ע�ⲻ��һ������ͼ����ֽ���д) 
userip=request.ServerVariables("REMOTE_HOST")  '�ͻ�֧��ip��ַ 
servadd="http://s2.vnetone.com/Default.aspx" '�������ύ��ַ

'����һ��ʱ���������
Randomize
Codeabc= mid(cStr(1e+6+Int(999999 * Rnd)),2)
dim dddd
dddd=cStr(now())
dddd=replace(dddd,"-","")
dddd=replace(dddd,":","")
dddd=replace(dddd," ","")
dddd=dddd&codeabc

orderId=codeabc   '�ͻ����� �����ƹ���ͻ��Ķ���  30λ��30λ���� ��ĸ������ ���ܺ��ֶ��� ���ȣ�30�ַ����ڣ�ֻ�������֡���ĸ��������ĸ����ϡ������ú��ֶ�����
post_key=orderId&spreq&sprec&spid&sppwd&spversion&money 
'��վ��������+ �����ַ+ ���յ�ַ + 5λspid+ 18λSP����+֧���İ汾��+֧�����
'LCase�����ǽ��ַ�ת��ΪСд; Ucase�����ǽ��ַ�ת��Ϊ��д
'ȫ����Ѷ֧������ȫ����Ѷ�绰֧���ӿڶ�MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д
md5password=Ucase(trim(md5(post_key)))  '��MD532 Ȼ��ת��д

'�˴��������ݿ� �����̻�����+�û���+��ֵ�Ȳ������ݿ⣩
'response.Write orderId


if userid_d="" then
response.Write("<script language='javascript'>alert('����������û���!');history.go(-1);</script>")
response.End()
end if	
	SqlConnectionString="DRIVER={SQL Server};SERVER=.;UID=sa;PWD=dcgame_123;DATABASE=QPGameUserDB;"
	Set Conn= Server.CreateObject("ADODB.Connection")
	Conn.Open SqlConnectionString

    set rs=conn.execute("select top 1 * from AccountsInfo where accounts='"& userid_d &"'")
	if rs.eof then
	response.Write("<script language='javascript'>alert('�Բ���û�д��û�,������ȷ��!');history.go(-1);</script>")
	response.End()
	else
	useriid=rs("userid")
	end if




'CardNo,CardPass,CardTypeID,BatchNo,Nullity,CreateDate,UseDate,UserID,Accounts
    set rs=conn.execute("select * from GameCardNoInfo where CardNo='"& orderId &"'")
	if rs.eof then
    set rs=conn.execute("insert into GameCardNoInfo (CardNo,CardPass,CardTypeID,BatchNo,Nullity,CreateDate,UserID,Accounts) values ('"& orderId &"','"& md5password &"',0,0,'"& false &"','"& date() &"','"& useriid &"','"& userid_d &"')")
    end if 
'sql="insert into GameCardNoInfo (CardNo,CardPass,CardTypeID,BatchNo,Nullity,CreateDate,UserID,Accounts) values ('"& orderId &"','"& md5password &"',0,0,'"& false &"','"& date() &"','"& useriid &"','"& userid_d &"')"
'response.Write sql
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
<!--
.STYLE1 {
	color: red;
	font-size: 12px;
}
-->
</style>
</head>	
		
		
	
	<body onLoad="document.forms[0].submit();">
	<span class="STYLE1">����������.....................�벻Ҫˢ�º͹ر��������	</span>
	<form name=form1 action='<%=servadd %>' method=post ><!--ӯ��Ѷ��������ҳ��POST�ύ-->
	 
	  <p>
	    <input name='spid'       type=hidden    value='<%=spid%>' >   
	    <!--spID 5λ-->
         <input name='spname'    type=hidden  value='<%=spname%>' >   
	    <!--sp��վ �ͻ���վ��-->
         <input name='spoid'      type=hidden   value='<%=orderId%>' >
	    <!--sp����   Ψһ�����룬���Ȳ�����30�ַ�-->
         <input name='spreq'     type=hidden   value='<%=spreq%>' >   
	    <!--��վ�����ַ-->
         <input name='sprec'     type=hidden  value='<%=sprec%>' > 
	    <!--��վ���յ�ַ ��ֱ����ASP/php/jsp��β ��Ҫ������ �ҷ�����˵�ַ���ϣ�����=XXX �ȸ�ʽ   �ͻ�վ����GET URL���� -->
         <input name='userid'    type=hidden  value='<%=useriid%>' > 
	    <!--�ͻ�ID-->
         <input name='userip'    type=hidden   value='<%=userip%>' > 
	    <!--�ͻ������IP-->
         <input name='spmd5'     type=hidden  value='<%=md5password%>' > 
	    <!--MD5-->
        <input name='spcustom'  type=hidden  value='<%=spcustom%>' >   
	    <!--�û��Լ�����30���ַ����� -->
         <input name='spversion'  type=hidden  value='<%=spversion%>' >  <!--֧���汾���� -->
   
         <input name='money'  type=hidden  value='<%=money%>' >        <!--�û�������վ�Լ������������ֵ��1,2,3,4.....-->   
	 <input name='urlcode'  type=hidden  value='<%=urlcode%>' > 
   
    </form>	
		

</body>
			

</html>