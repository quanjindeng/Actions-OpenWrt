#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Set DISTRIB_REVISION
#sed -i "s/OpenWrt/Deng Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/default-settings/files/zzz-default-settings

# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.1）
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template



# 删除重复包

rm -rf package/feeds/luci/applications/luci-app-ddns
rm -rf feeds/luci/applications/luci-app-ddns
rm -rf package/feeds/packages/ddns-scripts
rm -rf feeds/packages/net/ddns-scripts
rm -rf package/feeds/luci/applications/luci-app-upnp
rm -rf feeds/luci/applications/luci-app-upnp
rm -rf package/feeds/packages/miniupnpd
rm -rf feeds/packages/net/miniupnpd


# 拉取软件包

git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome package/deng/luci-app-adguardhome
git clone --depth 1 https://github.com/AdguardTeam/AdGuardHome package/deng/adguardhome
# git clone --depth 1 https://github.com/sbwml/openwrt-alist package/deng/alist
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/deng/tmp && mv package/deng/tmp/* package/deng
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/deng/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon package/deng/luci-theme-argon
svn export https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest/trunk/applications/luci-app-cloudflarespeedtest package/deng/luci-app-cloudflarespeedtest
svn export https://github.com/immortalwrt-collections/openwrt-cdnspeedtest/trunk/cdnspeedtest package/deng/cdnspeedtest
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ddns package/deng/luci-app-ddns
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/deng/ddns-scripts_aliyun
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/deng/ddns-scripts_dnspod
svn export https://github.com/coolsnowwolf/packages/trunk/net/ddns-scripts package/deng/ddns-scripts
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-diskman package/deng/luci-app-diskman
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-fileassistant package/deng/luci-app-fileassistant
git clone --depth 1 https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav package/deng/luci-app-go-aliyundrive-webdav
git clone --depth 1 https://github.com/jerrykuku/go-aliyundrive-webdav package/deng/go-aliyundrive-webdav
git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata package/deng/luci-app-netdata
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-openvpn-server package/deng/luci-app-openvpn-server
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/deng/passwall
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall package/deng/luci-app-passwall
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/deng/luci-app-poweroff
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/deng/luci-app-pushbot
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-qbittorrent package/deng/luci-app-qbittorrent
svn export https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent-static package/deng/qBittorrent-static
svn export https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent package/deng/qBittorrent
svn export https://github.com/coolsnowwolf/packages/trunk/libs/qtbase package/deng/qtbase
svn export https://github.com/coolsnowwolf/packages/trunk/libs/qttools package/deng/qttools
svn export https://github.com/coolsnowwolf/packages/trunk/libs/rblibtorrent package/deng/rblibtorrent
git clone --depth 1 https://github.com/tty228/luci-app-serverchan package/deng/luci-app-serverchan
git clone --depth 1 https://github.com/ZeaKyX/luci-app-speedtest-web package/deng/luci-app-speedtest-web
git clone --depth 1 https://github.com/ZeaKyX/speedtest-web package/deng/speedtest-web
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-vsftpd package/deng/luci-app-vsftpd
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/vsftpd-alt package/deng/vsftpd-alt
svn export https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus package/deng/luci-app-wolplus
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/deng/luci-app-unblockneteasemusic
svn export https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd package/deng/miniupnpd
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-upnp package/deng/luci-app-upnp


# Add Fullcone NAT

rm -rf package/network/utils/nftables
rm -rf package/libs/libnftnl
rm -rf package/network/config/firewall4

svn export https://github.com/wongsyrone/lede-1/trunk/package/network/utils/nftables package/network/utils/nftables
svn export https://github.com/wongsyrone/lede-1/trunk/package/libs/libnftnl package/libs/libnftnl
svn export https://github.com/wongsyrone/lede-1/trunk/package/network/config/firewall4 package/network/config/firewall4

svn export https://github.com/wongsyrone/lede-1/trunk/package/external/nft-fullcone package/deng/nft-fullcone
svn export https://github.com/wongsyrone/lede-1/trunk/package/external/sfe package/deng/sfe


# 其他调整

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-openvpn-server/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-qbittorrent/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-vsftpd/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-diskman/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-ddns/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-upnp/Makefile

NAME=$"package/deng/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
curl 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key



# 临时调整
sed -ri 's#9625784cf2e4fd9842f1d407681ce4878b5b0dcddbcd31c6135114a30c71e6a8#5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72#' ./feeds/packages/utils/jq/Makefile
