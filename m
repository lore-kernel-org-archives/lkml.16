Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5727A91F;
	Wed, 14 May 2025 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228273; cv=none; b=JDhK9QUQ6qpVSlng4bBca+THnJL0DHYKMWwFiY6eiJDjJu6FfmdV3wgPTQ8/2Jt/cgNPvRGYHPiw53SJMrewd7ovMw/p8cX+wotlP334fktxKCUDumLxYuYDnVxAGAS1/y1HWdjnS1bvZc6dBUnjkdkAp4IBdtHGVOwPPtOfBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228273; c=relaxed/simple;
	bh=Mch9zsCTZ++9Xv+WL31mykbtqROtgLIoRLVQlMeLD5Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JRsM5dThaKmJvn4k2XizzhcQbnRO58os/a9l4zDZVYnl3AoR0o384WpKOyGX4VdwacdngdcG1M4pSJW9DdyUXCPeyvmjnG5JDwHPCE+Y3F6GvjXaCRB+ybb/fB78ekzZuCas2uuUnXMj0pxc3hUSzVgMqOrDGas1IQZD+1JDyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRzly4qL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRzly4qL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325D3C4CEED;
	Wed, 14 May 2025 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228272;
	bh=Mch9zsCTZ++9Xv+WL31mykbtqROtgLIoRLVQlMeLD5Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GRzly4qLCx1tfyhCjxc4up1k0KPUIbRuXLk/NtEj+b52QZe4iBWJdSMSDaKWne57f
	 gxnhMmOjMb2CXMnHVyNvFdwQHtxwIt+8kUuBfoP/yJ7UfMrT2h/ObiGqByu8ZwGs4u
	 zmPyv1/z/7+rj8gNLYCnMh0nGaU/FEUuhKmRCZAevh4CKy7JkuD9EIJ7XiwWJCXHhf
	 qhl62L65ervTDgGYQ9k2NUrrNdr4uZcp/wAIHsc30W/9vixiBRSirmGRfmIdg1WZqX
	 D0puIWD3XNEyzKiLDnXt2iv2g1AEatvFhytB7Qt5eqzjqIirsNcNgfxbYMNwj1bC41
	 x0KlQJySqSrOA==
Date: Wed, 14 May 2025 08:11:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, quentin.schulz@cherry.de, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
Message-Id: <174722778701.1826414.17251063329059512671.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Add two board-families from Theobroma-Systems


On Wed, 14 May 2025 14:09:00 +0200, Heiko Stuebner wrote:
> Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
> found with a variety of display options.
> 
> As new boards should not use the deprecated snps,reset-* properties
> in the gmac node, I also added a core mdio-node for the gmac and
> converted the Theobroma Ringneck board over.
> 
> Testing with the new node both before and after converting Ringneck
> showed the board finding its network both when booting locally and
> from the tftp/nfs.
> 
> changes in v3:
> - more sorting
> - more Reviewed-bys
> - pull-down for dsp-rst
> - pp1516 accel pinctrl group
> 
> changes in v2:
> - add received Acks/Reviews
> - drop "rockchip" prefix from system-power-controller (Diederik)
> - split out prototype-pins to prototype variant
> - address Quentin's review comments
>   - ethernet0 alias for Cobra
>   - a number more pinctrl entries for gpios
>   - drop unused slp pinctrl entries
>   - additional comments
>   - use gpio-constants for pmic int
>   - ordering (nodes + properties)
>   - clarify vccio_sd more
>   - interrupt line for pp1516 accelerometer
> 
> Heiko Stuebner (6):
>   arm64: dts: rockchip: add basic mdio node to px30
>   arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
>   dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
>     Systems
>   arm64: dts: rockchip: add px30-cobra base dtsi and board variants
>   dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
>     Systems
>   arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |  18 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   6 +
>  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
>  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 ++++++++++++++++
>  .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
>  .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
>  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 602 ++++++++++++++++++
>  .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
>  arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
>  12 files changed, 1485 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> 
> --
> 2.47.2
> 
> 
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
 Base: tags/v6.15-rc1-23-g0d0947766d87 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250514120906.2412588-1-heiko@sntech.de:

Error: arch/arm64/boot/dts/rockchip/px30-cobra.dtsi:424.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/rockchip] Error 2
make[2]: Target 'arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: rockchip/px30-cobra-ltk500hd1829.dtb] Error 2
Error: arch/arm64/boot/dts/rockchip/px30-cobra.dtsi:424.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/rockchip] Error 2
make[2]: Target 'arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: rockchip/px30-cobra-ltk050h3148w.dtb] Error 2
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dtb: panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
Error: arch/arm64/boot/dts/rockchip/px30-cobra.dtsi:424.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/rockchip] Error 2
make[2]: Target 'arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: rockchip/px30-cobra-ltk050h3146w.dtb] Error 2
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: panel@0 (leadtek,ltk050h3146w-a2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
Error: arch/arm64/boot/dts/rockchip/px30-cobra.dtsi:424.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/rockchip] Error 2
make[2]: Target 'arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: rockchip/px30-cobra-ltk050h3146w-a2.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'rockchip/rk3399-ficus.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-odroid-m2.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-r88.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rockpro64.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-gru-scarlet-dumo.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-pinetab2-v2.0.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-coolpi-cm5-genbook.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-geekbox.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-odroid-go3.dtb' not remade because of errors.
make: Target 'rockchip/rk3528-radxa-e20c.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-gru-scarlet-inx.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-gru-bob.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-orangepi-5b.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-h96-max-v58.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-soquartz-cm4.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-bigtreetech-pi2.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-armsom-w3.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-orangepi-3b-v2.1.dtb' not remade because of errors.
make: Target 'rockchip/rk3318-a95x-z2.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-orangepi-r1-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3576-roc-pc.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-orangepi-5-ultra.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-pi-4a-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-anbernic-rg351v.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-rock64.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-jaguar.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-edgeble-neu6b-io.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-ok3588-c.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-pi-4b.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-powkiddy-rgb10max3.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-khadas-edge-v.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-radxa-e25.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-gameforce-ace.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-4se.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-bpi-r2-pro.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-orangepi-5.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-tiger-haikou.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-nanopi-r2s.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-photonicat.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-hugsun-x99.dtb' not remade because of errors.
make: Target 'rockchip/rk3582-radxa-e52c.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg-arc-s.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-4c-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rockpro64-v2.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-px5-evb.dtb' not remade because of errors.
make: Target 'rockchip/rk3308-rock-s0.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-puma-haikou.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-qnap-ts433.dtb' not remade because of errors.
make: Target 'rockchip/px30-engicam-px30-core-ctouch2.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-coolpi-4b.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-toybrick-x0.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-pi-4c.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-khadas-edge.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-pinebook-pro.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-nanopi-r5c.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-khadas-edge2.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopi-m4.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-odroid-go2-v11.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopi-r4s.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-lion-haikou.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-friendlyelec-cm3588-nas.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-lckfb-tspi.dtb' not remade because of errors.
make: Target 'rockchip/px30-cobra-ltk500hd1829.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-sapphire.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-fastrhino-r68s.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-edgeble-neu6a-io.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg353ps.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-rock-5a.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-fastrhino-r66s.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-rock-5-itx.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-kobol-helios64.dtb' not remade because of errors.
make: Target 'rockchip/rk3576-armsom-sige5.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-leez-p710.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-wolfvision-pf5.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-gru-kevin.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-nanopi-r5s.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-evb1-v10.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg353vs.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-rock-3b.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-powkiddy-rgb30.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-powkiddy-x55.dtb' not remade because of errors.
make: Target 'rockchip/px30-pp1516-ltk050h3148w.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-anbernic-rg351m.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopi-m4b.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock960.dtb' not remade because of errors.
make: Target 'rockchip/px30-cobra-ltk050h3148w.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-orangepi.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-rock-5b.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-soquartz-model-a.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-nanopi-r2c.dtb' not remade because of errors.
make: Target 'rockchip/px30-ringneck-haikou.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-sapphire-excavator.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-roc-pc-mezzanine.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-odroid-m1.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-evb1-v10.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-roc-pc-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-powkiddy-rgb20sx.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-gru-scarlet-kd.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-roc-pc.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-evb-act8846.dtb' not remade because of errors.
make: Target 'rockchip/rk3308-bpi-p2-pro.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-quartzpro64.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-turing-rk1.dtb' not remade because of errors.
make: Target 'rockchip/px30-engicam-px30-core-edimm2.2.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-radxa-cm3-io.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-radxa-zero-3e.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-roc-pc.dtb' not remade because of errors.
make: Target 'rockchip/px30-cobra-ltk050h3146w.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-roc-pc.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-nanopi-r2c-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-mnt-reform2.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-nanopc-t6-lts.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-odroid-m1s.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-armsom-sige7.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-rock-pi-e.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-mecsbc.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-nanopi-r6c.dtb' not remade because of errors.
make: Target 'rockchip/rk3399pro-rock-pi-n10.dtb' not remade because of errors.
make: Target 'rockchip/px30-firefly-jd4-core-mb.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-radxa-zero-3w.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-firefly.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-orangepi-5-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-pinephone-pro.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-evb.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-quartz64-b.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-roc-cc.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-nanopc-t6.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-eaidk-610.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-orangepi-5-max.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-nanopi-r6s.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-odroid-go2.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-pi-4a.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-rock-5c.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg353v.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-firefly-itx-3588j.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-orangepi-r1-plus-lts.dtb' not remade because of errors.
make: Target 'rockchip/rk3576-evb1-v10.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-orangepi-3b-v1.1.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-lubancat-2.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-box-demo.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-powkiddy-rk2023.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-rock-3c.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-bigtreetech-cb2-manta.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-evb1-v10.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-rock-pi-4b-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3308-roc-cc.dtb' not remade because of errors.
make: Target 'rockchip/rk3326-gameforce-chi.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-a1.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-pinenote-v1.1.dtb' not remade because of errors.
make: Target 'rockchip/px30-pp1516-ltk050h3146w-a2.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg503.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-soquartz-blade.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-pinenote-v1.2.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-nanopi-r3s.dtb' not remade because of errors.
make: Target 'rockchip/rk3308-evb.dtb' not remade because of errors.
make: Target 'rockchip/px30-evb.dtb' not remade because of errors.
make: Target 'rockchip/rk3588-coolpi-cm5-evb.dtb' not remade because of errors.
make: Target 'rockchip/rk3588s-indiedroid-nova.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-lubancat-1.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopi-r4s-enterprise.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopi-neo4.dtb' not remade because of errors.
make: Target 'rockchip/px30-engicam-px30-core-ctouch2-of10.dtb' not remade because of errors.
make: Target 'rockchip/rk3328-nanopi-r2s-plus.dtb' not remade because of errors.
make: Target 'rockchip/rk3308-rock-pi-s.dtb' not remade because of errors.
make: Target 'rockchip/rk3568-rock-3a.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-orion-r68-meta.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg353p.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-quartz64-a.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-roc-pc.dtb' not remade because of errors.
make: Target 'rockchip/rk3576-rock-4d.dtb' not remade because of errors.
make: Target 'rockchip/px30-cobra-ltk050h3146w-a2.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-evb.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-anbernic-rg-arc-d.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-nanopc-t4.dtb' not remade because of errors.
make: Target 'rockchip/rk3399-khadas-edge-captain.dtb' not remade because of errors.
make: Target 'rockchip/rk3566-pinetab2-v0.1.dtb' not remade because of errors.
make: Target 'rockchip/rk3368-lba3368.dtb' not remade because of errors.





