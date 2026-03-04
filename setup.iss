; ============================================================
; OpenClaw Windows 中文版 - 全自动一键安装包
; 版本: 2026.3.3
; ============================================================

#define MyAppName "OpenClaw 中文版"
#define MyAppVersion "2026.3.3"
#define MyAppPublisher "OpenClaw Community"
#define MyAppURL "https://openclaw.ai"
#define NodeVersion "22.14.0"

[Setup]
AppId={{OPENCLAW-CN-2026-03-03-A1B2C3D4}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\OpenClaw
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=OpenClaw-CN-2026.3.3
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Files]
Source: "deps\nodejs\*"; DestDir: "{app}\nodejs"; Flags: ignoreversion recursesubdirs
Source: "configs\*"; DestDir: "{app}\configs"; Flags: ignoreversion recursesubdirs
Source: "scripts\*.bat"; DestDir: "{app}\scripts"; Flags: ignoreversion

[Icons]
Name: "{group}\启动 OpenClaw Gateway"; Filename: "{app}\scripts\start-gateway.bat"
Name: "{group}\配置 API Key"; Filename: "{app}\scripts\configure-apikey.bat"
Name: "{autodesktop}\OpenClaw Gateway"; Filename: "{app}\scripts\start-gateway.bat"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "创建桌面快捷方式"; Flags: checked

[Run]
Filename: "{app}\scripts\configure-apikey.bat"; Description: "立即配置 API Key（推荐）"; Flags: postinstall nowait
