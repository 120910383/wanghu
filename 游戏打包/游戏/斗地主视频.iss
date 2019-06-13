[Setup]
AppName=����6.6����
AppVerName=��������Ƶ
;����ѡ��װ·��
;��װ·����ע����ȡ
DisableDirPage        = yes
DefaultDirName={reg:HKCU\Software\WHQPGame\Plaza,Path}
OutputBaseFilename=LandVD
Compression=zip
WizardImageFile=embedded\WizardImage.bmp
WizardSmallImageFile=embedded\WizardSmallImage.bmp

[Files]
Source: "{app}\LandVD.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{app}\LandVD\Locker.bmp"; DestDir: "{app}\LandVD"; Flags: ignoreversion
Source: "{app}\LandVD\TableFrame.DAT"; DestDir: "{app}\LandVD"; Flags: ignoreversion
Source: "{app}\LandVD\TableNormal.bmp"; DestDir: "{app}\LandVD"; Flags: ignoreversion
Source: "{app}\LandVD\TablePlaying.bmp"; DestDir: "{app}\LandVD"; Flags: ignoreversion
Source: "{app}\LandVD\UserReady.bmp"; DestDir: "{app}\LandVD"; Flags: ignoreversion

[Run]
Filename: "{app}\GamePlaza.exe"; Description: "{cm:LaunchProgram,��������Ƶ}";

[CustomMessages]
default.NameAndVersion=%1 �汾 %2
default.AdditionalIcons=���ӿ�ݷ�ʽ:
default.CreateDesktopIcon=���������ݷ�ʽ(&D)
default.CreateQuickLaunchIcon=����������������ݷ�ʽ(&Q)
default.ProgramOnTheWeb=%1 ��վ
default.UninstallProgram=ж�� %1
default.LaunchProgram=���� %1
default.AssocFileExtension=�� %2 �ļ���չ���� %1 ��������(&A)
default.AssocingFileExtension=���ڽ� %2 �ļ���չ���� %1 ��������...

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "default"; MessagesFile: "embedded\default.isl"; 

[Code]
//����һ��Windows API ����
function MessageBox(hWnd: Integer; lpText, lpCaption: String; uType: Cardinal): Integer;
external 'MessageBoxA@user32.dll stdcall';

//��װ��ɺ�
//������Ϸ�б�
procedure CurStepChanged(CurStep: TSetupStep);
var
  hWnd: HWND;

begin
    if CurStep=ssDone   then
      begin
        hWnd := FindWindowByClassName('WHQPGamePlaza');

        if hWnd <> 0 then
          begin
              PostMessage(hWnd, 1124, 502, 0);
              //MessageBox(0, 'PostMessage(hWnd, 1124, 5, 0);', 'MessageBox', MB_OK);
          end
     end
end;

//------------------------------------------------
//                   the end
//-------------------------------------------------
