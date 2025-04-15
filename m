Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3F2185A8;
	Tue, 15 Apr 2025 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737104; cv=none; b=SGZ5n0TX+hwQMamjWhIN+uvLbaZ6NOeLveI/wb2ohUb3LZsHQz600SLuTN1GDpBxr1dUsdd0Xg7zqbcG2W/bLMcI6w7D82ZHee8+DcoNtk9/in6yFK3xy7z0knqunewxGIxBuKQuRkdY/bQm136ayyKX7Yh7h0OJBFzr2Vw8JE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737104; c=relaxed/simple;
	bh=4+BEleAxCA1h8yglvPaLoYfzczV5ax1MbrOkRurw+MY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qvno/5A6UoQ5Crzhwuv0CFtCseV1HytwtzmGnIhaohzeUOYRK0ERF7n6eSCFngy/ckwx1PK3jgdUfTLMSVevf+yb+t9a6y/eGO/fFjRCSHUil1uGeFiR2HH7RZBDw84QSrbEcxV8bWfx1oo0r4FZSCBe9CArPj/gz3BZ49pXxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0jU74qy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0jU74qy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2027C4CEEB;
	Tue, 15 Apr 2025 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744737104;
	bh=4+BEleAxCA1h8yglvPaLoYfzczV5ax1MbrOkRurw+MY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k0jU74qy0xMb3SOYEjXWLSZQ5D7TqJ9mMdJIgma3+21RPrdjfat0wcauC8QmKJZVC
	 jhY2DQrLJAmM5Y0wRjYBD6Ccu9S3Sbj/f7GJWvk2zRas0Mpqdl9chgkrSJ8UosQxEj
	 269qFRwPTvKYwrWNF9Fen0Ez/IQhxL4tX2tKfvcsV6QNHAMyZUL3YtxT3ZFDsbsY02
	 coPDCT3X+DFEHzcyXhpjeE+JXE8oG6fphdrz40PjYg+TwLMvmruFlJTx4aUNY5nRhy
	 +gsOVT4WakyfRADOdbFTs7kGlTACXJkfBq7nwnjaUIyI6uwhBlrAiPZ0gKdfKVM6Ix
	 w+/Q4V7utNo6Q==
Date: Tue, 15 Apr 2025 12:11:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
Message-Id: <174473699503.763716.6096044459854517599.robh@kernel.org>
Subject: Re: [PATCH v5 0/8] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display


On Tue, 15 Apr 2025 08:54:23 +0200, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Changes in v5:
> - Merge the makefile patch into the two dtso patches
> - Fix references to the root node in the dtso patches
> - Enable the USB bus going to the adapter board in the mainboard dts
> - Fix some formatting issues in the mainboard dts
> - Fix some formatting issues in the COM dts
> - Change a clock as suggested in the COM dts
> - Fix the maintainers entries, remove devicetree list and imx list
> - Rebase on latest linux-next
> - Link to v4: https://lore.kernel.org/r/20250402-initial_display-v4-0-9f898838a864@gocontroll.com
> 
> Changes in v4:
> - Add imx mailing list to ka-ro tx8p maintainer entry
> - Fix several small indentation and ordering issues in devicetrees
> - Change the two display adapter boards to overlays
> - Add the missing patch for the Makefile to actually be able to build
>   the new devicetrees
> - Link to v3: https://lore.kernel.org/r/20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com
> 
> Changes in v3:
> - Set regulator-boot-on and always-on on LDO5 of the pmic, after 20 ish
>   seconds it auto disabled this LDO causing weird behaviour like
>   ethernet droping out, wifi not working anymore. This LDO can control
>   the IO voltage level of certain pins, just let it keep the u-boot
>   value.
> - Fix the comment style in imx8mp-pinfunc.h
> - Rebase on newest next tag
> - Link to v2: https://lore.kernel.org/r/20250226-initial_display-v2-0-23fafa130817@gocontroll.com
> 
> Changes in v2:
> - Dropped the trivial-devices patch
> - Added a patch with bindings for the gocontroll,moduline-module-slot
> - Added a patch to spidev.c to enable the spidev driver for the module
>   slot
> - Added a missing usb-c connector in the av101hdt-a10 variant dts
> - Switched to the new bindings for the module slots in the base dts
> - Fixed some commit typos
> - Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com
> 
> ---
> Maud Spierings (8):
>       dt-bindings: arm: fsl: Add GOcontroll Moduline Display
>       arm64: dts: imx8mp: Add pinctrl config definitions
>       MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
>       MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
>       arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
>       arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
>       arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
>       arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  MAINTAINERS                                        |  12 +
>  arch/arm64/boot/dts/freescale/Makefile             |   8 +
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
>  ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  94 ++++
>  ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
>  .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 ++++++++++++++++++++
>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
>  8 files changed, 1360 insertions(+)
> ---
> base-commit: fb44e19e78df2950877a9f7b4f24b58db790d293
> change-id: 20250224-initial_display-fa82218e06e5
> 
> Best regards,
> --
> Maud Spierings <maudspierings@gocontroll.com>
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
 Base: base-commit fb44e19e78df2950877a9f7b4f24b58db790d293 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250415 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250415-initial_display-v5-0-f309f8d71499@gocontroll.com:

arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

