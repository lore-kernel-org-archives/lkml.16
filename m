Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A482989A8;
	Thu, 15 May 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312421; cv=none; b=PIln5NhYHUNECg2jbSEZ+VT547XZMyvoqScIVdniEhXKZuRhC2F3mNcHka2EzssORlXuthFZGE9oZvLbYl9TQg4bfX2QVKU70hZSQe22ELnAh4x89is19dzOAtkHa9BGTspgQTwbQ1Dw7rwu7pohDXY5fuGJsR9HKvn4RxsGAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312421; c=relaxed/simple;
	bh=NZbDm6oKwxvb56qxwgfd2yxt9f0BrfJ12RFFjIbb7RY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uK7Q50s9csj9P2ksxpVGPMwCc4aVwiXjBjS5ToPUc3tn61X1BzbVsxOWFrp5/fPkKT9/U8VYGH9ocXrKAfe/nHCVfHUQt7VVXaajYADf/CwP/cq+waDNTu5sBHk4n2ySYGRzxtbPtESGseT75CuLZFGNZqzE81fwxcIu2/E3gxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKyllz0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKyllz0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C5DC4CEF0;
	Thu, 15 May 2025 12:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747312420;
	bh=NZbDm6oKwxvb56qxwgfd2yxt9f0BrfJ12RFFjIbb7RY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cKyllz0kah8+nLH/VTLW2tMROQ/8gf8qM7t1LKNAeba1mDP+kv6HPIGw0zifZRqwn
	 50EhB0xUpWbgVT/6x8nytWZUIQ4EdLYBHeRxrYRHqkR6GXBVnYVswy/sOgFLtOEVLf
	 PyWxKX25yP5W4WXnybxYHp/1YfAS3Z8Ldf+hiDY5AhVollbekCSc0YHfht8d+0qas5
	 11xuZJqW0o0SSoc5mKYy3gbrq0w7N/mBxOjFTPrT4eI0U52tmZ1r641cEkiZ16Uehe
	 n9T6Yxbsw8kr2R7JiVsuyYyslI81/G9zEJNb4rtXhDexUpaIBqV4ULB9+7eZNBACvI
	 NGSmGGOOeNqSw==
Date: Thu, 15 May 2025 07:33:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org
To: Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250514173856.3677454-1-joseph.kogut@gmail.com>
References: <20250514173856.3677454-1-joseph.kogut@gmail.com>
Message-Id: <174731113340.409185.748543902950099048.robh@kernel.org>
Subject: Re: [RFC PATCH 1/1] arm64: dts: rockchip: add Radxa CM5 and IO
 board


On Wed, 14 May 2025 10:38:56 -0700, Joseph Kogut wrote:
> Add initial support for the Radxa CM5 and the accompanying IO board,
> including ethernet, USB 2.0/3.0, PCIe 2.0, HDMI output, UART2 console,
> SD/eMMC, PMIC.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
> ---
> This is my first attempt at submitting a new device tree upstream.
> Feedback is welcome on DT conventions, naming, or anything I may have
> missed.
> 
> This is largely reversed from the Radxa kernel sources as a reference.
> 
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 448 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-radxa-cm5.dtsi  | 151 ++++++
>  3 files changed, 600 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc5-760-g9934ab180511 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250514173856.3677454-1-joseph.kogut@gmail.com:

arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: / (radxa,cm5-io): compatible: 'oneOf' conditional failed, one must be fixed:
	['radxa,cm5-io', 'radxa,cm5', 'rockchip,rk3588s'] is too long
	['radxa,cm5-io', 'radxa,cm5', 'rockchip,rk3588s'] is too short
	'vamrs,ficus' was expected
	'vamrs,rock960' was expected
	'amarula,vyasa-rk3288' was expected
	'radxa,cm5-io' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
	'radxa,cm5-io' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
	'ariaboard,photonicat' was expected
	'armsom,sige5' was expected
	'armsom,sige7' was expected
	'radxa,cm5-io' is not one of ['armsom,w3']
	'asus,rk3288-tinker' was expected
	'asus,rk3288-tinker-s' was expected
	'azw,beelink-a1' was expected
	'bigtreetech,cb2-manta' was expected
	'bigtreetech,pi2' was expected
	'mundoreader,bq-curie2' was expected
	'mundoreader,bq-edison2qc' was expected
	'chipspark,popmetal-rk3288' was expected
	'chipspark,rayeager-px2' was expected
	'radxa,cm5-io' is not one of ['coolpi,pi-cm5-evb']
	'radxa,cm5-io' is not one of ['coolpi,pi-cm5-genbook']
	'coolpi,pi-4b' was expected
	'edgeble,neural-compute-module-2-io' was expected
	'edgeble,neural-compute-module-6a-io' was expected
	'elgin,rv1108-r1' was expected
	'embedfire,lubancat-1' was expected
	'embedfire,lubancat-2' was expected
	'engicam,px30-core-ctouch2' was expected
	'engicam,px30-core-ctouch2-of10' was expected
	'engicam,px30-core-edimm2.2' was expected
	'radxa,cm5-io' is not one of ['mntre,reform2-rcore']
	'radxa,cm5-io' is not one of ['firefly,itx-3588j']
	'firefly,px30-jd4-core-mb' was expected
	'radxa,cm5-io' is not one of ['firefly,firefly-rk3288', 'firefly,firefly-rk3288-beta']
	'firefly,firefly-rk3288-reload' was expected
	'firefly,firefly-rk3399' was expected
	'firefly,roc-rk3308-cc' was expected
	'firefly,roc-rk3328-cc' was expected
	'firefly,roc-rk3328-pc' was expected
	'radxa,cm5-io' is not one of ['firefly,roc-rk3399-pc', 'firefly,roc-rk3399-pc-mezzanine']
	'radxa,cm5-io' is not one of ['firefly,roc-rk3399-pc-plus']
	'firefly,roc-rk3576-pc' was expected
	'firefly,rk3566-roc-pc' was expected
	'firefly,rk3568-roc-pc' was expected
	'radxa,cm5-io' is not one of ['forlinx,ok3588-c']
	'radxa,cm5-io' is not one of ['friendlyarm,nanopi-r2c', 'friendlyarm,nanopi-r2c-plus', 'friendlyarm,nanopi-r2s', 'friendlyarm,nanopi-r2s-plus']
	'friendlyarm,nanopi-r3s' was expected
	'radxa,cm5-io' is not one of ['friendlyarm,nanopc-t4', 'friendlyarm,nanopi-m4', 'friendlyarm,nanopi-m4b', 'friendlyarm,nanopi-neo4', 'friendlyarm,nanopi-r4s', 'friendlyarm,nanopi-r4s-enterprise']
	'radxa,cm5-io' is not one of ['friendlyarm,nanopi-r5c', 'friendlyarm,nanopi-r5s']
	'radxa,cm5-io' is not one of ['friendlyarm,nanopi-r6c', 'friendlyarm,nanopi-r6s']
	'radxa,cm5-io' is not one of ['friendlyarm,nanopc-t6', 'friendlyarm,nanopc-t6-lts']
	'radxa,cm5-io' is not one of ['friendlyarm,cm3588-nas']
	'gameforce,ace' was expected
	'gameforce,chi' was expected
	'geekbuying,geekbox' was expected
	'geniatech,xpi-3128' was expected
	'google,bob-rev13' was expected
	'google,veyron-brain-rev0' was expected
	'google,veyron-fievel-rev8' was expected
	'google,gru-rev15' was expected
	'google,veyron-jaq-rev5' was expected
	'google,veyron-jerry-rev15' was expected
	'google,kevin-rev15' was expected
	'google,veyron-mickey-rev8' was expected
	'google,veyron-mighty-rev5' was expected
	'google,veyron-minnie-rev4' was expected
	'google,veyron-pinky-rev2' was expected
	'google,scarlet-rev15-sku0' was expected
	'google,scarlet-rev15-sku7' was expected
	'google,scarlet-rev15-sku2' was expected
	'google,veyron-speedy-rev9' was expected
	'google,veyron-tiger-rev8' was expected
	'haochuangyi,h96-max-v58' was expected
	'haoyu,marsboard-rk3066' was expected
	'hardkernel,rk3326-odroid-go2' was expected
	'hardkernel,rk3326-odroid-go2-v11' was expected
	'hardkernel,rk3326-odroid-go3' was expected
	'hardkernel,odroid-m1' was expected
	'hardkernel,odroid-m1s' was expected
	'hardkernel,odroid-m2' was expected
	'hugsun,x99' was expected
	'indiedroid,nova' was expected
	'radxa,cm5-io' is not one of ['khadas,edge', 'khadas,edge-captain', 'khadas,edge-v']
	'khadas,edge2' was expected
	'kobol,helios64' was expected
	'mecer,xms6' was expected
	'leez,p710' was expected
	'lckfb,tspi-rk3566' was expected
	'radxa,cm5-io' is not one of ['lunzn,fastrhino-r66s', 'lunzn,fastrhino-r68s']
	'mqmaker,miqi' was expected
	'neardi,lba3368' was expected
	'netxeon,r89' was expected
	'openailab,eaidk-610' was expected
	'xunlong,rk3399-orangepi' was expected
	'phytec,rk3288-pcm-947' was expected
	'pine64,pinebook-pro' was expected
	'radxa,cm5-io' is not one of ['pine64,pinenote-v1.1', 'pine64,pinenote-v1.2']
	'pine64,pinephone-pro' was expected
	'radxa,cm5-io' is not one of ['pine64,pinetab2-v0.1', 'pine64,pinetab2-v2.0']
	'pine64,rock64' was expected
	'radxa,cm5-io' is not one of ['pine64,rockpro64-v2.1', 'pine64,rockpro64-v2.0']
	'radxa,cm5-io' is not one of ['pine64,quartz64-a', 'pine64,quartz64-b']
	'pine64,quartzpro64' was expected
	'radxa,cm5-io' is not one of ['pine64,soquartz-blade', 'pine64,soquartz-cm4io', 'pine64,soquartz-model-a']
	'radxa,cm5-io' is not one of ['powkiddy,rgb10max3', 'powkiddy,rgb20sx', 'powkiddy,rgb30', 'powkiddy,rk2023', 'powkiddy,x55']
	'prt,mecsbc' was expected
	'qnap,ts433' was expected
	'radxa,cm5-io' is not one of ['radxa,cm3-io']
	'radxa,cm5-io' is not one of ['radxa,e25']
	'radxa,e20c' was expected
	'radxa,e52c' was expected
	'radxa,rock' was expected
	'radxa,cm5-io' is not one of ['radxa,rockpi4a', 'radxa,rockpi4a-plus', 'radxa,rockpi4b', 'radxa,rockpi4b-plus', 'radxa,rockpi4c']
	'radxa,rock-4c-plus' was expected
	'radxa,rock-4d' was expected
	'radxa,rock-4se' was expected
	'radxa,rockpi-e' was expected
	'radxa,rockpi-n8' was expected
	'radxa,rockpi-n10' was expected
	'radxa,rockpis' was expected
	'radxa,rock2-square' was expected
	'radxa,rock3a' was expected
	'radxa,rock-3b' was expected
	'radxa,rock-3c' was expected
	'radxa,rock-5-itx' was expected
	'radxa,rock-5a' was expected
	'radxa,rock-5b' was expected
	'radxa,rock-5c' was expected
	'radxa,rock-s0' was expected
	'radxa,cm5-io' is not one of ['radxa,zero-3e', 'radxa,zero-3w']
	'relfor,saib' was expected
	'rikomagic,mk808' was expected
	'rockchip,rk3036-kylin' was expected
	'rockchip,px3-evb' was expected
	'rockchip,px30-evb' was expected
	'rockchip,px5-evb' was expected
	'rockchip,r88' was expected
	'rockchip,rk3036-evb' was expected
	'rockchip,rk3128-evb' was expected
	'rockchip,rk3228-evb' was expected
	'rockchip,rk3229-evb' was expected
	'radxa,cm5-io' is not one of ['rockchip,rk3288-evb-act8846', 'rockchip,rk3288-evb-rk808']
	'rockchip,rk3308-evb' was expected
	'rockchip,rk3328-evb' was expected
	'rockchip,rk3368-evb-act8846' was expected
	'rockchip,rk3399-evb' was expected
	'rockchip,rk3399-sapphire' was expected
	'rockchip,rk3399-sapphire-excavator' was expected
	'rockchip,rk3566-box-demo' was expected
	'rockchip,rk3568-evb1-v10' was expected
	'rockchip,rk3576-evb1-v10' was expected
	'rockchip,rk3588-evb1-v10' was expected
	'rockchip,rk3588s-evb1-v10' was expected
	'rockchip,rv1108-evb' was expected
	'rockchip,rk3588-toybrick-x0' was expected
	'sinovoip,rk3308-bpi-p2pro' was expected
	'sinovoip,rk3568-bpi-r2pro' was expected
	'itead,sonoff-ihost' was expected
	'tsd,px30-ringneck-haikou' was expected
	'tsd,rk3368-lion-haikou' was expected
	'tsd,rk3399-puma-haikou' was expected
	'tsd,rk3588-jaguar' was expected
	'tsd,rk3588-tiger-haikou' was expected
	'tronsmart,orion-r68-meta' was expected
	'turing,rk1' was expected
	'wolfvision,rk3568-pf5' was expected
	'radxa,cm5-io' is not one of ['xunlong,orangepi-3b-v1.1', 'xunlong,orangepi-3b-v2.1']
	'radxa,cm5-io' is not one of ['xunlong,orangepi-5-max', 'xunlong,orangepi-5-plus', 'xunlong,orangepi-5-ultra']
	'radxa,cm5-io' is not one of ['xunlong,orangepi-r1-plus', 'xunlong,orangepi-r1-plus-lts']
	'radxa,cm5-io' is not one of ['xunlong,orangepi-5', 'xunlong,orangepi-5b']
	'zkmagic,a95x-z2' was expected
	'rockchip,rk3399' was expected
	'rockchip,rk3288' was expected
	'rockchip,rk3326' was expected
	'rockchip,rk3566' was expected
	'rockchip,rk3568' was expected
	'rockchip,rk3576' was expected
	'rockchip,rk3588' was expected
	'armsom,lm7' was expected
	'rockchip,rk3328' was expected
	'bigtreetech,cb2' was expected
	'rockchip,rk3066a' was expected
	'rockchip,rk3188' was expected
	'coolpi,pi-cm5' was expected
	'rockchip,rk3588s' was expected
	'edgeble,neural-compute-module-2' was expected
	'radxa,cm5' is not one of ['edgeble,neural-compute-module-6a', 'edgeble,neural-compute-module-6b']
	'rockchip,rv1108' was expected
	'engicam,px30-core' was expected
	'firefly,icore-3588q' was expected
	'firefly,core-3588j' was expected
	'firefly,px30-jd4-core' was expected
	'rockchip,rk3308' was expected
	'forlinx,fet3588-c' was expected
	'friendlyarm,cm3588' was expected
	'rockchip,rk3368' was expected
	'rockchip,rk3128' was expected
	'google,bob-rev12' was expected
	'google,veyron-brain' was expected
	'google,veyron-fievel-rev7' was expected
	'google,gru-rev14' was expected
	'google,veyron-jaq-rev4' was expected
	'google,veyron-jerry-rev14' was expected
	'google,kevin-rev14' was expected
	'google,veyron-mickey-rev7' was expected
	'google,veyron-mighty-rev4' was expected
	'google,veyron-minnie-rev3' was expected
	'google,veyron-pinky' was expected
	'google,scarlet-rev15' was expected
	'google,scarlet-rev15-sku4' was expected
	'google,veyron-speedy-rev8' was expected
	'google,veyron-tiger-rev7' was expected
	'rockchip,rk3229' was expected
	'phytec,rk3288-phycore-som' was expected
	'pine64,pinenote' was expected
	'pine64,pinetab2' was expected
	'pine64,rockpro64' was expected
	'pine64,soquartz' was expected
	'radxa,cm3' was expected
	'radxa,cm3i' was expected
	'rockchip,rk3528' was expected
	'rockchip,rk3582' was expected
	'radxa,rockpi4' was expected
	'vamrs,rk3288-vmarc-som' was expected
	'vamrs,rk3399pro-vmarc-som' was expected
	'rockchip,rv1109' was expected
	'rockchip,rk3036' was expected
	'rockchip,px3' was expected
	'rockchip,px30' was expected
	'rockchip,px5' was expected
	'rockchip,rk3228' was expected
	'radxa,cm5' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
	'tsd,rk3588-tiger' was expected
	'xunlong,orangepi-3b' was expected
	'rockchip,rk3318' was expected
	'rockchip,rv1126' was expected
	'google,bob-rev11' was expected
	'google,veyron' was expected
	'google,veyron-fievel-rev6' was expected
	'google,gru-rev13' was expected
	'google,veyron-jaq-rev3' was expected
	'google,veyron-jerry-rev13' was expected
	'google,kevin-rev13' was expected
	'google,veyron-mickey-rev6' was expected
	'google,veyron-mighty-rev3' was expected
	'google,veyron-minnie-rev2' was expected
	'google,scarlet-rev14-sku0' was expected
	'google,scarlet-rev14-sku7' was expected
	'google,scarlet-rev15-sku6' was expected
	'google,veyron-speedy-rev7' was expected
	'google,veyron-tiger-rev6' was expected
	'rockchip,rk3399pro' was expected
	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: /: failed to match any schema with compatible: ['radxa,cm5-io', 'radxa,cm5', 'rockchip,rk3588s']
arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: /: failed to match any schema with compatible: ['radxa,cm5-io', 'radxa,cm5', 'rockchip,rk3588s']
arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: syscon@fd5d0000 (rockchip,rk3588-usb2phy-grf): usb2phy@0:otg-port: 'rockchip,typec-vbus-det' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: usb2phy@0 (rockchip,rk3588-usb2phy): otg-port: 'rockchip,typec-vbus-det' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: leds (gpio-leds): 'pinctrl-0' is a dependency of 'pinctrl-names'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#





