# Actions-OpenWrt
Actions云编译，一键生成OpenWrt固件

定时任务编译X86架构OpenWrt固件
- 默认ip：10.10.10.1
- 默认密码：password

不定期手动运行编译其他AP路由器固件，无多余插件，个人自用组建无缝漫游（无缝漫游需要开源无线驱动，当前k2p配置文件已改）
- 默认ip：192.168.1.1
- 默认密码：password

由于Luci界面编辑配置不可靠，建议直接 vim /etc/config/wireless 编辑无线配置文件，内容参照以下配置。其中 type、path、device 参数每台路由器不同，保持原硬件生成的参数即可。其他 channel、band、ssid、key 等参数依据实际进行微调，kvr相关参数不建议更改！

```
config wifi-device 'radio0'
        option type 'mac80211'
        option path '1e140000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0'
        option channel '9'
        option band '2g'
        option htmode 'HT20'
        option disabled '0'
        option country 'US'
        option cell_density '0'

config wifi-iface 'default_radio0'
        option device 'radio0'
        option network 'lan'
        option mode 'ap'
        option ssid 'PDCN'
        option key '密码'
        option ieee80211r '1'
        option reassociation_deadline '20000'
        option ft_over_ds '0'
        option ft_psk_generate_local '1'
        option ieee80211k '1'
        option encryption 'psk2+ccmp'
        option mobility_domain '1111'
        option ieee80211v '1'
        option time_advertisement '0'
        option bss_transition '1'

config wifi-device 'radio1'
        option type 'mac80211'
        option path '1e140000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0+1'
        option band '5g'
        option htmode 'VHT80'
        option disabled '0'
        option country 'US'
        option cell_density '0'
        option channel '60'

config wifi-iface 'default_radio1'
        option device 'radio1'
        option network 'lan'
        option mode 'ap'
        option ssid 'PDCN_5G'
        option key '密码'
        option ieee80211r '1'
        option reassociation_deadline '20000'
        option ft_over_ds '0'
        option ft_psk_generate_local '1'
        option ieee80211k '1'
        option encryption 'psk2+ccmp'
        option mobility_domain '1111'
        option ieee80211v '1'
        option time_advertisement '0'
        option bss_transition '1'
```

## 感谢
- [OpenWrt 官方源码仓库](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt源码仓库](https://github.com/coolsnowwolf/lede)
- [immortalwrt's OpenWrt源码仓库](https://github.com/immortalwrt/immortalwrt)
- [ImmortalWRT集成满血NSS驱动IPQ系列设备OpenWrt源码仓库](https://github.com/VIKINGYFY/immortalwrt)
- [kenzok8 软件包集合仓库](https://github.com/kenzok8/small-package)
- [p3terx 云编译教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
- 所有OpenWrt源码贡献者、插件开发者


## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
