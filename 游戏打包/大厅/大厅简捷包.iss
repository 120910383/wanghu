; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
AppName=������Ϸ����
AppVerName=������Ϸ����
DefaultDirName={pf}\foxqp
DefaultGroupName=������Ϸ����
OutputBaseFilename=GamePlaza
Compression=zip
WizardImageFile=embedded\WizardImage.bmp
WizardSmallImageFile=embedded\WizardSmallImage.bmp

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\fox66\��ʾ���\��Ϸ����\{app}\gameplaza.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\fox66\��ʾ���\��Ϸ����\{app}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��


[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\Drivers32"; ValueName: "msacm.eqa"; ValueType: String; ValueData: "audio.acm"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKCU; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\Drivers32"; ValueName: "vidc.MVE4"; ValueType: String; ValueData: "video.dll"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\Drivers32"; ValueName: "msacm.eqa"; ValueType: String; ValueData: "audio.acm"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\Drivers32"; ValueName: "vidc.MVE4"; ValueType: String; ValueData: "video.dll"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKCU; Subkey: "Software\WHQPGame\Plaza"; ValueName: "Path"; ValueType: String; ValueData: "{app}"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKCU; Subkey: "Software\WHQPGame\GamePlaza\OptionLogon"; ValueName: "LogonServer"; ValueType: String; ValueData: "218.26.89.169"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKCU; Subkey: "Software\WHQPGame\GamePlaza\LogonServer"; ValueName: "ServerAddr"; ValueType: String; ValueData: "218.26.89.169"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue
Root: HKCU; Subkey: "Software\WHQPGame\GamePlaza\LogonServer\��ͨ�û�"; ValueName: "ServerAddr"; ValueType: String; ValueData: "0d3f291b6b5bd6f8ebda0d3b291f6b45d6e7ebdc0d3f29076b5dd6faeb42"; Flags: createvalueifdoesntexist uninsdeletevalue deletevalue

[Icons]
Name: "{group}\������Ϸ����"; Filename: "{app}\gameplaza.exe"
Name: "{commondesktop}\������Ϸ����"; Filename: "{app}\gameplaza.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\������Ϸ����"; Filename: "{app}\gameplaza.exe"; Tasks: quicklaunchicon
Name: "{group}\{cm:UninstallProgram,��Ƶ����}"; Filename: "{uninstallexe}";


[Run]
Filename: "{app}\gameplaza.exe"; Description: "{cm:LaunchProgram,������Ϸ����}"; Flags: nowait postinstall skipifsilent

