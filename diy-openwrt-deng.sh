#!/bin/bash

rm -rf feeds/luci/applications/luci-app-dockerman

git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/deng/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/deng/luci-theme-argon
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/deng/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/deng/netspeedtest
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/deng/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/deng/luci-app-passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/deng/passwall-packages
git archive --remote=https://github.com/messense/aliyundrive-webdav.git HEAD:openwrt tar -x -C package/deng/aliyundrive-webdav
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/deng/luci-app-alist
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/deng/luci-app-adguardhome
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/deng/luci-app-pushbot
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/deng/luci-app-ddns-go
git archive --remote=https://github.com/sundaqiang/openwrt-packages.git HEAD:luci-app-wolplus tar -x -C package/deng/luci-app-wolplus
git archive --remote=https://github.com/coolsnowwolf/luci.git HEAD:applications/luci-app-diskman tar -x -C package/deng/luci-app-diskman
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/deng/luci-app-netdata
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/deng/luci-app-poweroff
git archive --remote=https://github.com/coolsnowwolf/luci.git HEAD:applications/luci-app-qbittorrent tar -x -C package/deng/luci-app-qbittorrent
git archive --remote=https://github.com/coolsnowwolf/packages.git HEAD:net/qBittorrent-static tar -x -C package/deng/qBittorrent-static
git archive --remote=https://github.com/coolsnowwolf/packages.git HEAD:net/qBittorrent tar -x -C package/deng/qBittorrent
git archive --remote=https://github.com/coolsnowwolf/packages.git HEAD:libs/qtbase tar -x -C package/deng/qtbase
git archive --remote=https://github.com/coolsnowwolf/packages.git HEAD:libs/qttools tar -x -C package/deng/qttools
git archive --remote=https://github.com/coolsnowwolf/packages.git HEAD:libs/rblibtorrent tar -x -C package/deng/rblibtorrent
git archive --remote=https://github.com/coolsnowwolf/luci.git HEAD:applications/luci-app-vsftpd tar -x -C package/deng/luci-app-vsftpd
git archive --remote=https://github.com/coolsnowwolf/lede.git HEAD:package/lean/vsftpd-alt tar -x -C package/deng/vsftpd-alt
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush.git package/deng/luci-app-wechatpush
git archive --remote=https://github.com/immortalwrt/luci.git HEAD:applications/luci-app-gowebdav tar -x -C package/deng/luci-app-gowebdav
git archive --remote=https://github.com/immortalwrt/packages.git HEAD:net/gowebdav tar -x -C package/deng/gowebdav
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman package/deng/luci-app-dockerman
git clone --depth 1 https://github.com/vernesong/OpenClash package/deng/luci-app-openclash
git archive --remote=https://github.com/kenzok8/small-package.git HEAD:wrtbwmon tar -x -C package/deng/wrtbwmon
git archive --remote=https://github.com/kenzok8/small-package.git HEAD:dnsforwarder tar -x -C package/deng/dnsforwarder
git archive --remote=https://github.com/coolsnowwolf/lede.git HEAD:package/lean/autocore tar -x -C package/deng/autocore
# git archive --remote=https://github.com/coolsnowwolf/lede.git HEAD:package/lean/shortcut-fe tar -x -C package/deng/shortcut-fe
git archive --remote=https://github.com/coolsnowwolf/luci.git HEAD:applications/luci-app-cpufreq tar -x -C package/deng/luci-app-cpufreq
# git archive --remote=https://github.com/coolsnowwolf/luci.git HEAD:applications/luci-app-turboacc tar -x -C package/deng/luci-app-turboacc


# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.1）
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-qbittorrent/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-vsftpd/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-diskman/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-gowebdav/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/deng/gowebdav/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-cpufreq/Makefile
# sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-turboacc/Makefile

NAME=$"package/deng/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
curl 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key
