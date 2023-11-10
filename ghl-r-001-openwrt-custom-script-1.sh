#!/bin/bash
# Copyright (c) 2022-2023 Curious <https://www.curious.host>
#
# 本软件为自由软件，采用 MIT 许可授权。
# 更多信息请参见 /LICENSE。
# 
# https://github.com/Curious-r/OpenWrtBuildWorkflows
# 描述： 自动检查 OpenWrt 源代码更新并构建它。无需额外密钥。
#-------------------------------------------------------------------------------------------------------
#
#
# 该脚本将在源代码更新前运行，此时您要做的事情应写在这里。
# 该脚本的一个常见功能是修改克隆的 OpenWrt 源代码。
#
# 例如，您可以编辑 feeds.conf.default，以导入您需要的软件包。
# 接下来是一些编辑示例。
# # 清除 feeds.conf.default，然后逐一添加所需的 feed 源：
#cat /dev/null > a.txt
#echo 'src-git packages https://git.openwrt.org/feed/packages.git;openwrt-22.03' >> feeds.conf.default
#echo 'src-git luci https://git.openwrt.org/project/luci.git;openwrt-22.03' >> feeds.conf.default
#echo 'src-git routing https://git.openwrt.org/feed/routing.git;openwrt-22.03' >> feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git;openwrt-22.03' >> feeds.conf.default
# # 将 feed 源替换为您想要的内容：
#sed '/feeds-name/'d feeds.conf.default
#echo 'method feed-name path/URL' >> feeds.conf.default
# # 取消对馈源的注释：
#sed -i 's/^#\(.* feed-name\)/\1/' feeds.conf.default
# 用 src-git 替换 src-git，以减少克隆深度：
#sed -i 's/src-git/src-git/g' feeds.conf.default
#
# 你也可以通过打补丁的方式修改源代码。
# 下面是打补丁的模板：
#touch example.patch
#cat>example.patch<<EOF
# 补丁内容
#EOF
#git apply example.patch


echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small.git # passwall 基本依赖' >> feeds.conf.default
echo 'src-git wrtbwmon https://github.com/pyrovski/wrtbwmon' >> feeds.conf.default 
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go/
