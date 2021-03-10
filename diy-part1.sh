#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

rm -rf package/lean/luci-theme-argon

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus	
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash	
git clone https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr	
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall	
git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass	
svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns	
svn co https://github.com/garypang13/openwrt-packages/trunk/tcping	
svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb	
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}	
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

src-git infinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git


cd openwrt
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=@TARGET_armvirt_64/g' package/lean/luci-app-cpufreq/Makefile
cat package/lean/luci-app-cpufreq/Makefile
sed -i 's/entry({"admin", "services", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 900).dependent=false/entry({"admin", "system", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 9).dependent=false/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
cat package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
