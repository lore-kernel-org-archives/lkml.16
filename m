Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B71F1532;
	Thu, 30 Jan 2025 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738280286; cv=none; b=sHnd/4U/AzWhL0rWBdkBQn65buNpRpOQ2mGBNe+Xya6F/Hi2O0dE0XUdX5RXHxobCduwZisiyVJGAC8gZpHs8PblJ3Z/NegjdOGKpflxnr0hNx7loEhneVAh/ghob7YTNK/RVTOX4iz8SQtC0E2K5SZfXi3fbPE/0fbtvLZX9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738280286; c=relaxed/simple;
	bh=cNlalbXYNDV6xKsFrZhu/iStGEI1hyTXWGl4GqKOsWI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lFuTdG8mp62N4NjkUb9Zby8sO+Fmvum9lPKH96F2q3pATLtwgHJHwiEctumXmp1wUYtruGJP3njcgL23n4hgNuTOjhMKSA10LfBpggNAxvajQf9YoppqJhn/Inlzn2sPT98dn92+BjfKa46adYAVg6PJut/wwg/Txv6yYEXsgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WacLaxVE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WacLaxVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F95AC4CED2;
	Thu, 30 Jan 2025 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280285;
	bh=cNlalbXYNDV6xKsFrZhu/iStGEI1hyTXWGl4GqKOsWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WacLaxVE833mJZhmeypQviKRFTg6/aODhz6V64rgVa8z+464/P0ddo13+Qra8ZshZ
	 39LsqlChbxg2tzlFiLEufCj8HEZq0RIR+gok4DFYH1WseQ2jEX1Zd6MnmMDfXIUAnE
	 XHIi9n2vGxCF+z8NY7SBk+bppTfGLkM7RVT7JurCGZvnngWoYEpZCzQy4LDQzSGMmM
	 e4x/g45PVLxBvmJF2KygNq/lLPl3bPprVzg3oVr+jEwoI8c4VlZp0v9J1SRNp9EWUb
	 Hll9jy0IKHwWEH7PLaaR3CKhc8v/j3z2HebF2p3o0a/9YAy7bnC/gSYwv5YTWTJ/ma
	 XdLGxuycQhmJg==
Date: Thu, 30 Jan 2025 17:38:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
Message-Id: <173828013202.1872493.8212881147597194221.robh@kernel.org>
Subject: Re: [PATCH 0/4] Make i.MX8M Nano OCOTP work as accessing
 controller


On Thu, 30 Jan 2025 14:00:57 +0100, Alexander Stein wrote:
> Hi,
> 
> inspired by [1] this adds the accessing controller feature to i.MX8M Nano.
> The OCOTP eFuse has bits which can disable particular peripherals, such as
> GPU, MIPI-DSI oder USB.
> 
> In OCOTP driver, the nodes under "/" will be iterated, and checked
> if property "#access-controllers" exsits. If not allow access, detach
> the node.
> 
> I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
> Without this patchset the default DT completly freezes the SoC if GPU
> is accessed.
> Using this patchset the GPU is disabled without any DT modification from
> bootloader:
> > imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed
> 
> Adding the other i.MX8M SoCs is straight forward.
> 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com/
> 
> Alexander Stein (4):
>   dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller
>     definitions
>   nvmem: imx-ocotp: Sort header alphabetically
>   nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
>   arm64: dts: imx8mn: Add access-controller references
> 
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi    |   8 ++
>  drivers/nvmem/Kconfig                        |   3 +
>  drivers/nvmem/imx-ocotp.c                    | 107 ++++++++++++++++++-
>  include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h |  16 +++
>  4 files changed, 132 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250130130101.1040824-1-alexander.stein@ew.tq-group.com:

arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: dsi@32e10000: access-controllers: [[19, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#





