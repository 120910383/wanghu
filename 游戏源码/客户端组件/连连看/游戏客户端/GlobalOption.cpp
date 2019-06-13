#include "StdAfx.h"
#include "GlobalOption.h"

//////////////////////////////////////////////////////////////////////////
//�궨��

#define REG_GLOBAL_OPTIONS			TEXT("GlobalOption")				//ȫ������

//////////////////////////////////////////////////////////////////////////

CGlobalOption						g_GlobalOption;						//ȫ������

//////////////////////////////////////////////////////////////////////////

//���캯��
CGlobalOption::CGlobalOption()
{
	//��Ϣ����
	m_bShowInOutMessage=true;

	//��ɫ����
	m_crChatTX=RGB(0,0,0);
	m_crMsgName=RGB(0,0,200);
	m_crMsgNormal=RGB(0,0,0);
	m_crMsgSysHead=RGB(200,0,0);
	m_crMsgSysString=RGB(0,0,200);

	//�������
	ZeroMemory(&m_ChatExpViewImage,sizeof(m_ChatExpViewImage));
	ZeroMemory(&m_GameFrameImage,sizeof(m_GameFrameImage));
	return;
}

//��������
CGlobalOption::~CGlobalOption()
{
}

//������Դ
bool CGlobalOption::LoadGameFrameRes()
{
	//�������
	if (m_GameFrameResourceModule.CreateInstance()==false) return false;

	//������Դ
	IPlatformResource * pIPlatformResource=m_GameFrameResourceModule.GetInterface();
	ISkinResource * pISkinResource=(ISkinResource *)pIPlatformResource->GetSkinResource(IID_ISkinResource,VER_ISkinResource);

	//������Դ
	pIPlatformResource->GetChatExpViewImage(&m_ChatExpViewImage);
	pIPlatformResource->GetGameFrameImage(&m_GameFrameImage);
	if (CSkinResourceManager::LoadSkinResource(pISkinResource)==false) return false;

	return true;
}

//��������
void CGlobalOption::LoadOptionParameter()
{
	//��������
	CWinApp * pApp=AfxGetApp();

	//��Ϣ����
	m_bShowInOutMessage=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("ShowInOutMessage"),m_bShowInOutMessage)?true:false;

	//��ɫ����
	m_crChatTX=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("ChatTX"),m_crChatTX);
	m_crMsgName=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgName"),m_crMsgName);
	m_crMsgNormal=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgNormal"),m_crMsgNormal);
	m_crMsgSysHead=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgSysHead"),m_crMsgSysHead);
	m_crMsgSysString=pApp->GetProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgSysString"),m_crMsgSysString);

	return;
}

//��������
void CGlobalOption::SaveOptionParameter()
{
	//��������
	CWinApp * pApp=AfxGetApp();

	//��Ϣ����
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("ShowInOutMessage"),m_bShowInOutMessage);

	//��ɫ����
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("ChatTX"),m_crChatTX);
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgName"),m_crMsgName);
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgNormal"),m_crMsgNormal);
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgSysHead"),m_crMsgSysHead);
	pApp->WriteProfileInt(REG_GLOBAL_OPTIONS,TEXT("MsgSysString"),m_crMsgSysString);

	return;
}

//////////////////////////////////////////////////////////////////////////
