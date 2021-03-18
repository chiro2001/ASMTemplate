# ASMTemplate

一键运行ASM文件。

## 使用说明

安装以下VsCode插件：

1. Code Runner
2. ASM Comment Aligner

使用时，打开一个ASM文件，然后按下`Ctrl+Alt+N`或者在运行中选定`build当前文件`，可以编译运行当前文件。

`debug当前文件`可以对程序进行调试，`start当前环境`可以复制文件到`build\DISK_C\asm`文件夹下进行进一步操作。

注意每次`build`都会清空`build\DISK_C\asm`下的文件。
