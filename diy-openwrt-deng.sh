#!/bin/bash

git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/deng/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/deng/luci-theme-argon
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/deng/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/deng/netspeedtest
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/deng/passwall
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall package/deng/luci-app-passwall
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/deng/aliyundrive-webdav
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/deng/luci-app-alist
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/deng/luci-app-adguardhome
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/deng/luci-app-pushbot
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/deng/luci-app-ddns-go
svn export https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus package/deng/luci-app-wolplus
svn export https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/deng/luci-app-diskman
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/deng/luci-app-netdata
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/deng/luci-app-poweroff
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-qbittorrent package/deng/luci-app-qbittorrent
svn export https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent-static package/deng/qBittorrent-static
svn export https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent package/deng/qBittorrent
svn export https://github.com/coolsnowwolf/packages/trunk/libs/qtbase package/deng/qtbase
svn export https://github.com/coolsnowwolf/packages/trunk/libs/qttools package/deng/qttools
svn export https://github.com/coolsnowwolf/packages/trunk/libs/rblibtorrent package/deng/rblibtorrent
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-vsftpd package/deng/luci-app-vsftpd
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/vsftpd-alt package/deng/vsftpd-alt
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush.git package/deng/luci-app-wechatpush
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-gowebdav package/deng/luci-app-gowebdav
svn export https://github.com/immortalwrt/packages/trunk/net/gowebdav package/deng/gowebdav


# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.1）
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-qbittorrent/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-vsftpd/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-diskman/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-gowebdav/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/deng/gowebdav/Makefile

NAME=$"package/deng/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
curl 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key
