#!/bin/bash

# 拉取软件包

git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/deng/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/deng/luci-theme-argon
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/deng/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/deng/netspeedtest
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/deng/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/deng/luci-app-passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/deng/passwall-packages
git clone --depth 1 https://github.com/sbwml/luci-app-openlist package/deng/luci-app-openlist
# git clone --depth 1 https://github.com/sbwml/luci-app-qbittorrent package/deng/luci-app-qbittorrent
# git clone --depth 1 https://github.com/QiuSimons/openwrt-mos package/deng/luci-app-mosdns
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/deng/luci-app-adguardhome
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/deng/luci-app-pushbot
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/deng/luci-app-ddns-go
# git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/deng/luci-app-netdata
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/deng/luci-app-poweroff
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush.git package/deng/luci-app-wechatpush
# git clone --depth 1 https://github.com/lisaac/luci-app-dockerman package/deng/luci-app-dockerman
# git clone --depth 1 https://github.com/vernesong/OpenClash package/deng/luci-app-openclash
# git clone --depth=1 https://github.com/fw876/helloworld.git package/deng/helloworld
git clone --depth=1 https://github.com/brvphoenix/wrtbwmon package/deng/wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon package/deng/luci-app-wrtbwmon

# git clone --depth 1 https://github.com/kenzok8/small-package deng-tmp1 && mv deng-tmp1/wrtbwmon package/deng/wrtbwmon && mv deng-tmp1/dnsforwarder package/deng/dnsforwarder && mv deng-tmp1/luci-app-bypass package/deng/luci-app-bypass
# git clone --depth 1 https://github.com/messense/aliyundrive-webdav deng-tmp2 && mv deng-tmp2/openwrt package/deng/aliyundrive-webdav
git clone --depth 1 https://github.com/sundaqiang/openwrt-packages deng-tmp3 && mv deng-tmp3/luci-app-wolplus package/deng/luci-app-wolplus
# git clone --depth 1 https://github.com/coolsnowwolf/lede deng-tmp4 && mv deng-tmp4/package/lean/vsftpd-alt package/deng/vsftpd-alt
# git clone --depth 1 https://github.com/coolsnowwolf/luci deng-tmp5 && mv deng-tmp5/applications/luci-app-vsftpd package/deng/luci-app-vsftpd
#&& mv deng-tmp5/applications/luci-app-diskman package/deng/luci-app-diskman && mv deng-tmp5/applications/luci-app-qbittorrent package/deng/luci-app-qbittorrent 
# git clone --depth 1 https://github.com/coolsnowwolf/packages deng-tmp6 && mv deng-tmp6/libs/rblibtorrent package/deng/rblibtorrent && mv deng-tmp6/libs/qttools package/deng/qttools && mv deng-tmp6/libs/qtbase package/deng/qtbase && mv deng-tmp6/net/qBittorrent package/deng/qBittorrent && mv deng-tmp6/net/qBittorrent-static package/deng/qBittorrent-static
# git clone --depth 1 https://github.com/immortalwrt/luci deng-tmp7 && mv deng-tmp7/applications/luci-app-dufs package/deng/luci-app-dufs && mv deng-tmp7/applications/luci-app-cpufreq package/deng/luci-app-cpufreq
# git clone --depth 1 https://github.com/immortalwrt/immortalwrt deng-tmp0 && mv deng-tmp0/package/emortal/autocore package/deng/autocore && mv deng-tmp0/package/emortal/cpufreq package/deng/cpufreq
#&& mv deng-tmp7/applications/luci-app-openvpn-server package/deng/luci-app-openvpn-server
# git clone --depth 1 https://github.com/immortalwrt/packages deng-tmp8 && mv deng-tmp8/net/dufs package/deng/dufs
#&& mv deng-tmp8/net/openvpn package/deng/openvpn && mv deng-tmp8/net/openvpn-easy-rsa package/deng/openvpn-easy-rsa
# git clone --depth 1 https://github.com/coolsnowwolf/lede deng-tmp9 && mv deng-tmp9/package/lean/shortcut-fe package/deng/shortcut-fe
# git clone --depth 1 https://github.com/coolsnowwolf/luci deng-tmp10 && mv deng-tmp10/applications/luci-app-turboacc package/deng/luci-app-turboacc
git clone --depth 1 https://github.com/lisaac/luci-app-diskman package/deng/luci-app-diskman
git clone --depth 1 https://github.com/asvow/luci-app-tailscale package/deng/luci-app-tailscale

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Set DISTRIB_REVISION
#sed -i "s/OpenWrt/Deng Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/default-settings/files/zzz-default-settings

# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.1）
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template

sed -i 's#mount -t cifs#mount.cifs#g' feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs

sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile

# 删除重复包

rm -rf package/feeds/packages/naiveproxy
rm -rf feeds/packages/net/naiveproxy
# rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}

# 其他调整
NAME=$"package/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
curl 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key


#sed -i 's#<%+cbi/tabmenu%>##g' package/small-packages/luci-app-nginx-manager/luasrc/view/nginx-manager/index.htm

# 为alist插件更换最新的golang版本
#rm -rf feeds/packages/lang/golang
#svn export https://github.com/sbwml/packages_lang_golang/trunk feeds/packages/lang/golang

# mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/geodata

#修复rust编译错误
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
awk '
/^define Host\/Compile/ {
    print "define Host/Patch"
    print "\t$(if $(HOST_QUILT),rm -rf $(HOST_BUILD_DIR)/patches; mkdir -p $(HOST_BUILD_DIR)/patches)"
    print "\t$(if $(HOST_QUILT),$(call PatchDir/Quilt,$(HOST_BUILD_DIR),$(HOST_PATCH_DIR),))"
    print "\t$(if $(HOST_QUILT),touch $(HOST_BUILD_DIR)/.quilt_used)"
    print "\t$(if $(HOST_QUILT),,$(if $(wildcard $(HOST_PATCH_DIR)/*.patch), \\"
    print "\t\t$(foreach p,$(sort $(wildcard $(HOST_PATCH_DIR)/*.patch)), \\"
    print "\t\t\techo \"Applying patch $(notdir $p)\" ; \\"
    print "\t\t\t$(PATCH) -f -p1 -d $(HOST_BUILD_DIR) < $p || \\"
    print "\t\t\t{ echo \"Patch failed! Please fix: $(notdir $p)!\" ; exit 1 ; } ; \\"
    print "\t\t) \\"
    print "\t))"
    print "endef"
    print ""   # 插入一个空行
}
{ print }
' feeds/packages/lang/rust/Makefile > tmpfile && mv tmpfile feeds/packages/lang/rust/Makefile

rm -rf feeds/packages/libs/libdouble-conversion
