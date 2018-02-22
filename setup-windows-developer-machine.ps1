Param
(
    [Switch]
    $prepareOS,

    [Switch]
    $tools,

    [Switch]
    $data,

    [Switch]
    $frameworks,

    [Switch]
    $ide,

    [Parameter(Mandatory=$False)]
    $developerBaseDirectory = "c:\dev"
)

if($prepareOS) {
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6
    Set-ExecutionPolicy unrestricted

    # Enable console prompting for powershell
    Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds" -Name "ConsolePrompting" -Value $True

    # Download chocolatey
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

    Enable-WindowsOptionalFeature -FeatureName NetFx4-AdvSrvs -Online -NoRestart
    Enable-WindowsOptionalFeature -FeatureName NetFx4Extended-ASPNET45 -Online -NoRestart

    # Enable hyper-v
    Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online -NoRestart
    Enable-WindowsOptionalFeature -FeatureName Containers -Online -NoRestart

    Write-Information ""
    Write-Information "Operating system components installed, please restart your computer."
    Exit
}

if($tools) {
    choco install -y --allowemptychecksum ilspy 
    choco install -y p4merge
    choco install -y git.install
    choco install -y cmdermini
    choco install -y curl
    choco install -y 7zip
    choco install -y putty
    choco install -y docker-for-windows
    choco install -y nuget.commandline
    choco install -y fiddler4
    choco install -y wireshark 
    choco install -y linqpad
    choco install -y awssdk-tools
    choco install -y luke.portable
    # choco install -y openssl.light
    # choco install -y skype
    # choco install -y vlc
    # choco install -y thunderbird
    # choco install -y firefox
    # choco install -y vivaldi
    # choco install -y rssowl
    # choco install -y youtube-dl
}

if ($ide) {
    choco install -y visualstudiocode
    choco install -y vim 
    choco install -y notepadplusplus
    choco install -y pycharm-community
}

if ($frameworks) {
    choco install -y dotnet4.7
    choco install -y dotnetcore-sdk
    choco install -y nodejs.install
    choco install -y golang
    choco install -y jdk8
    choco install -y python
    choco install -y ruby
    choco install -y ruby2.devkit
    choco install -y haskell-stack
}

if ($data) {
    choco install sql-server-express
    # choco install -y mysql
    # choco install -y mysql.workbench 
}
