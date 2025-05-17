Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F6201033;
	Sat, 17 May 2025 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747487911; cv=none; b=rW5mbKmjFol6RP2N8EPeC78n8dbCdMikdVXT6KhvrjT8r/qAEoWE36XJTaExxm8kmrdAorRN7aXZRnlHRQn5okpMAudXU7ptMjeAcF28gKUhbJ0A30pUkGbM/B1KZDnvLkMRzOUwqKnAbwiUGOD2m09WwFVk8wiyN5KjWdfQ6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747487911; c=relaxed/simple;
	bh=NbZtW3nJkC0Cc1S1g/4r3o+UYSK2RiqZsQ/Gi9W9yfA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OaYWrtJJb86UXKN5ALeg6IGsnrKSnkOVLf4eyiXPtUqAFrKayP8Qfv8qCGMMiJnlnParoJ22pe4zY8JwfItTjw4WsF5inW8ez3DUoJ+46V24cm0WnOoUNv7lZKP3r7s4UzB5d2LnvUMpromBuXZiZbHnSRelIhwCX93uAeqoGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYrzaIag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYrzaIag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555EDC4CEF7;
	Sat, 17 May 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487910;
	bh=NbZtW3nJkC0Cc1S1g/4r3o+UYSK2RiqZsQ/Gi9W9yfA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qYrzaIagwi12Nya6M52n1XYjxyVUpmlzyHQJR+o+UCSIP5bNibR5/uEDktwIa886a
	 NWn5qc8cUNXK3BCl/agNqEgiYOIkqXfJy6G3kj1pxatIpsx7HePWPY2gckyEOr58Rm
	 cfXHBZOqylQ5HcJkY17LgokCP3Z6tARlWEzPKhs51GMrLwLZcomYt2pGQofSebL1xa
	 JZq+urAsdwXgCgvrzfcmnmiNdErg++NVCFYqZYRLFL0RsfgIx36W3qaGtPoni0gFc4
	 ZrLOABwy1CEOZHYWvKaBWnof3j1EmIEXgX6FbWfxRgEkls3Yxtj9Sri52IittKcq5Z
	 KI8NwH/J+IWPQ==
Date: Sat, 17 May 2025 08:18:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Stefan Agner <stefan@agner.ch>
To: Haibo Chen <haibo.chen@nxp.com>
In-Reply-To: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
References: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
Message-Id: <174748777048.930520.16549852892199093776.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio
 controllers


On Fri, 16 May 2025 18:58:49 +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi     | 4 ++++
>  arch/arm/boot/dts/nxp/vf/vfxxx.dtsi        | 5 +++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
>  arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
>  arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
>  6 files changed, 28 insertions(+)
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
 Base: using specified base-commit 484803582c77061b470ac64a634f25f89715be3f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com:

arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40ae0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40af0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40b00000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40b10000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40ae0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40af0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40b00000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40b10000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#





