#!/bin/bash

rm -rf feeds/luci/applications/luci-app-dockerman

git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/deng/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/deng/luci-theme-argon
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/deng/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/deng/netspeedtest
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/deng/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/deng/luci-app-passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/deng/passwall-packages
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/deng/luci-app-alist
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/deng/luci-app-adguardhome
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/deng/luci-app-pushbot
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/deng/luci-app-ddns-go
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/deng/luci-app-netdata
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/deng/luci-app-poweroff
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush.git package/deng/luci-app-wechatpush
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman package/deng/luci-app-dockerman
git clone --depth 1 https://github.com/vernesong/OpenClash package/deng/luci-app-openclash
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

git clone --depth 1 https://github.com/kenzok8/small-package deng-tmp1 && mv deng-tmp1/wrtbwmon package/deng/wrtbwmon && mv deng-tmp1/dnsforwarder package/deng/dnsforwarder
git clone --depth 1 https://github.com/messense/aliyundrive-webdav deng-tmp2 && mv deng-tmp2/openwrt package/deng/aliyundrive-webdav
git clone --depth 1 https://github.com/sundaqiang/openwrt-packages deng-tmp3 && mv deng-tmp3/luci-app-wolplus package/deng/luci-app-wolplus
git clone --depth 1 https://github.com/coolsnowwolf/lede deng-tmp4 && mv deng-tmp4/package/lean/autocore package/deng/autocore && mv deng-tmp4/package/lean/vsftpd-alt package/deng/vsftpd-alt
git clone --depth 1 https://github.com/coolsnowwolf/luci deng-tmp5 && mv deng-tmp5/applications/luci-app-qbittorrent package/deng/luci-app-qbittorrent && mv deng-tmp5/applications/luci-app-vsftpd package/deng/luci-app-vsftpd && mv deng-tmp5/applications/luci-app-cpufreq package/deng/luci-app-cpufreq && mv deng-tmp5/applications/luci-app-diskman package/deng/luci-app-diskman
git clone --depth 1 https://github.com/coolsnowwolf/packages deng-tmp6 && mv deng-tmp6/libs/rblibtorrent package/deng/rblibtorrent && mv deng-tmp6/libs/qttools package/deng/qttools && mv deng-tmp6/libs/qtbase package/deng/qtbase && mv deng-tmp6/net/qBittorrent package/deng/qBittorrent && mv deng-tmp6/net/qBittorrent-static package/deng/qBittorrent-static
git clone --depth 1 https://github.com/immortalwrt/luci deng-tmp7 && mv deng-tmp7/applications/luci-app-dufs package/deng/luci-app-dufs
git clone --depth 1 https://github.com/immortalwrt/packages deng-tmp8 && mv deng-tmp8/net/dufs package/deng/dufs
# git clone --depth 1 https://github.com/coolsnowwolf/lede deng-tmp9 && mv deng-tmp9/package/lean/shortcut-fe package/deng/shortcut-fe
# git clone --depth 1 https://github.com/coolsnowwolf/luci deng-tmp10 && mv deng-tmp10/applications/luci-app-turboacc package/deng/luci-app-turboacc


# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.1）
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-qbittorrent/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-vsftpd/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-diskman/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-dufs/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/deng/dufs/Makefile
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
