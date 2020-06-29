# 先创建一个tmp临时目录，安装包都会下到里面
# tr '\n' ' ' 多行转一行
# | sh 将输出进行执行
rm -rf extensions;
mkdir extensions;
cd extensions
code --list-extensions --show-versions | gsed -r 's/(.*?)\.(.*?)@(.*)/https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery\/publishers\/\1\/vsextensions\/\2\/\3\/vspackage -o \1.\2-\3.vsix && /' | tr '\n' ' ' | gsed -r 's/(.*)/curl \1/' | sh