; ============================================================
; OpenClaw Windows 中文版 - 极简安装包
; 版本: 2026.3.3
; ============================================================

#define MyAppName "OpenClaw 中文版"
#define MyAppVersion "2026.3.3"

[Setup]
AppId={{OPENCLAW-CN-2026-03-03}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={autopf}\OpenClaw
OutputBaseFilename=OpenClaw-CN-2026.3.3
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Files]
Source: "scripts\configure-apikey.bat"; DestDir: "{app}\scripts"
Source: "scripts\start-gateway.bat"; DestDir: "{app}\scripts"
Source: "configs\models\*.json"; DestDir: "{app}\configs\models"

[Icons]
Name: "{group}\启动 OpenClaw Gateway"; Filename: "{app}\scripts\start-gateway.bat"
Name: "{autodesktop}\OpenClaw Gateway"; Filename: "{app}\scripts\start-gateway.bat"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "创建桌面快捷方式"; Flags: checked

[Run]
Filename: "{app}\scripts\configure-apikey.bat"; Description: "立即配置 API Key"; Flags: postinstall nowait
