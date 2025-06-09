Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDB224AF7;
	Mon,  9 Jun 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481276; cv=none; b=BfuQR8FuUXwCAmpK8dEbsRco+jJJJe30/QolX84/zIy26CTZKfLzaFJk7OSm2VYT/SeGrlqqITl5M1M43zlE0S5W2+wGB1J/d1mcOsqY0yTmQ9WBdsIReT+eLyZgNj/YqnnoY3lgDLNnh2cR8aL/WjDDg9/sheYaLPskn0B6oZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481276; c=relaxed/simple;
	bh=c3I1WqrC2X6JXYBDt3lNkCQiH8RtfeiJfdwPFjMBydM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ihYxl7mAYUvgiZj4FqCgLyeIIqdZOjlL1bQgrCLXNpZZKYbmYJ5K9JAAaIBsYSezc9TWQtBWLrNeBE6LbDQRBvIKFWkJ/nC2f1KWgm6mAIB/WJ7XjpTOQWNSg/Q3qSc2kR0DacZ3KnS++h1RcjR/Hzdh1A/RoSbQltO6dYXWi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1UeKD5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1UeKD5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4926EC4CEEB;
	Mon,  9 Jun 2025 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481275;
	bh=c3I1WqrC2X6JXYBDt3lNkCQiH8RtfeiJfdwPFjMBydM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B1UeKD5f2qgZnRtBM7uUg1CIIJe0fJDbLLKHJthtFwxoWSKlIVE05iBPcexMl6pjw
	 hyfWn2VC42wKTrpRP9RmubnwBghnj/nCyyhwJi/9Gob5Ieu8l8tAXtG4Xx0SD27zYV
	 n3zsK2E/xSNE1CwpMyaIAzFnBjquZgcR7yQxZbGViPTwdCPlVyxoT087lwx7I8lngM
	 vrIBCE4E4XcRlMhzcMEfhBBjqeX35HvV8cOrZ3PicxY2HmGITs1XIkQ8+4tkZ1X5GS
	 1c5PH/WN1n13PG3Fza2EmU+GRGsvRiqTVwSzgcQ7LlFCTuwVLSSZAT5L/+Slrc+dtQ
	 /Uw5PWzgGFKyw==
Date: Mon, 09 Jun 2025 10:01:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Marek Vasut <marex@denx.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Eric Biggers <ebiggers@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
 Matteo Lisi <matteo.lisi@engicam.com>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Primoz Fiser <primoz.fiser@norik.com>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Markus Niebel <Markus.Niebel@tq-group.com>, 
 linux-amarula@amarulasolutions.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Message-Id: <174948105106.2282643.172324663412189128.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] Support Engicam MicroGEA boards


On Mon, 09 Jun 2025 12:15:33 +0200, Dario Binacchi wrote:
> The series adds support for Engicam MicroGEA boards:
> 
> - BMM
> - RMM
> - GTW
> 
> based on MicroGEA-MX6UL SoM.
> 
> Changes in v2:
> - Change local-mac-address to 00 00 00 00 00 00. The actual value will
>   be set by the bootloader. The previous one was assigned to Freescale
>   Semiconductor.
> - Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
> - Drop an extra blank line from the DTS file.
> 
> Dario Binacchi (10):
>   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
>   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
>   ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
>   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
>   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
>   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
>   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
>   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   9 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
>  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
>  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
>  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
>  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
>  arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
>  7 files changed, 944 insertions(+), 21 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> 
> --
> 2.43.0
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> branch: imx6ull-engicam-microgea
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
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250609101637.2322809-1-dario.binacchi@amarulasolutions.com:

arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#





