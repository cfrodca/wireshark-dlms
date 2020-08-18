@if "%vcinstalldir%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

@setlocal
@set wireshark_source_dir=..\wireshark
@set wireshark_build_dir=..\wsbuild64
@set wireshark_run_dir=%wireshark_build_dir%\run\RelWithDebInfo
@set gtk2_dir=..\wireshark-win64-libs\vcpkg-export-20190318-win64ws\installed\x64-windows
@set libgcrypt_dir=..\wireshark-win64-libs\libgcrypt-1.8.3-win64ws

cl.exe /nologo /O2 /I%wireshark_source_dir% /I%wireshark_build_dir% /I%gtk2_dir%\include /I%gtk2_dir%\include\glib /I%libgcrypt_dir%\include /LD dlms.c %wireshark_run_dir%\wireshark.lib %gtk2_dir%\lib\glib-2.0.lib %libgcrypt_dir%\bin\libgcrypt-20.lib
copy dlms.dll %wireshark_run_dir%\plugins\3.3\epan\dlms.dll
