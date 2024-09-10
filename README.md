# Moyu (摸鱼)
**A comprehensive cross-platform moyu tool.**  
*Current version: v1.0.8*

## How to use
- **For Linux:** connect to internet and execute the below command in Terminal:
```
bash <(curl -fsSL https://raw.githubusercontent.com/chenh19/moyu/main/linux_moyu.sh)
```
<p align="center">
  <img src="https://raw.githubusercontent.com/chenh19/moyu/main/images/linux_moyu.png" width=85%>
</p>

- **For MacOS:** connect to internet and execute the below command in Terminal:
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/chenh19/moyu/main/mac_moyu.sh)"
```
<p align="center">
  <img src="https://raw.githubusercontent.com/chenh19/moyu/main/images/mac_moyu.png" width=85%>
</p>

- **For Windows:** connect to internet and execute the below command in Command Prompt:
```
curl -fsSL https://raw.githubusercontent.com/chenh19/moyu/main/win_moyu.bat -o %HOMEPATH%\win_moyu.bat && %HOMEPATH%\win_moyu.bat && del /f %HOMEPATH%\win_moyu.bat
```
(Or, you may directly download the latest [```win_moyu.bat```](https://github.com/chenh19/moyu/releases) and double click to run, especially if you use PowerShell)
<p align="center">
  <img src="https://raw.githubusercontent.com/chenh19/moyu/main/images/win_moyu.png" width=85%>
</p>

### Note:
- You will be asked to specify a raw script on GitHub to moyu, such as: ```https://raw.githubusercontent.com/chenh19/BRStudio/master/BRStudio.R``` or ```https://gitee.com/chenh19/BRStudio/raw/master/BRStudio.R``` if you don't have access to GitHub
- You will also be asked to specify a time duration to moyu (minutes), such as: ```15```  
- If you would like to stop moyu immediately, simply press ```Ctrl+C```

### Known issues:
- Moyu currently does not work in PowerShell with the one-line ```curl``` command on Windows, likely because PowerShell uses ```$env:HOMEPATH``` instead of [```%HOMEPATH%```](https://github.com/chenh19/moyu/blob/c085db1541002ba3abe921518f30b826635a9d5c/win_moyu.bat#L14) (```$env:HOMEPATH``` does not contain ```C:\```, either)
- Moyu currently downloads but does not echo on CentOS 7 (thanks for reporting by Irene), likely because the bash on old Linux is not compatible with [```line 28```](https://github.com/chenh19/moyu/blob/b8cc644f170d18c04f3692b476e40b9c87414176/linux_moyu.sh#L28) (both ```line 27``` and ```line 29``` work)
