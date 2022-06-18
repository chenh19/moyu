# Moyu (摸鱼)
**A comprehensive cross-platform moyu tool.**  
*Current version: v1.0.0*

## How to use
- **For Linux:** connect to internet and execute the below command in Terminal:
```
bash <(wget -qO- https://raw.githubusercontent.com/chenh19/moyu/main/linux_moyu.sh)
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
(Or, you may also directly download the ```win_moyu.bat``` file in the [latest relase](https://github.com/chenh19/moyu/releases/) and double click to run)
<p align="center">
  <img src="https://raw.githubusercontent.com/chenh19/moyu/main/images/win_moyu.png" width=85%>
</p>

### Note:
- You will be asked to specify a raw script on GitHub to moyu, such as: ```https://raw.githubusercontent.com/chenh19/BRStudio/master/BRStudio.R```
- You will also be asked to specify a time duration to moyu (minutes), such as: ```15```  
- If you would like to stop moyu immediately, simply press ```Ctrl+C```
