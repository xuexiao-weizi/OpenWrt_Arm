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


git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus	
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash	
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr	
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall	
git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass	
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping	
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}	
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}


#添加smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/smartdns package/smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns package/luci-app-smartdns




cd openwrt
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=@TARGET_armvirt_64/g' package/lean/luci-app-cpufreq/Makefile
cat package/lean/luci-app-cpufreq/Makefile
#sed -i 's/entry({"admin", "services", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 900).dependent=false/entry({"admin", "system", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 9).dependent=false/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
sed -i 's/entry({"admin", "services", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 900).dependent = false/entry({"admin", "system", "cpufreq"}, cbi("cpufreq"), _("CPU Freq"), 9).dependent = false/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
cat package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua
