Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E452500C5;
	Thu,  3 Apr 2025 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690937; cv=none; b=YAPXG9haAk2YMF4NiR3Upybca/29jKalLKDTvA3VMUrNMoPgh/JjtBV5BI2qV2J8sZNT1K5numLSBA2Z7q+n81t1X/D3wcB/mzFlHB6sWRjt5iJ8Iqm0zM6d8sEXLer70nuysIVzN25ix/bxBDhzlWQv7OIG/++2haz2uaQBg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690937; c=relaxed/simple;
	bh=UYZcrSoIukyNWFqG5RqeZgTW5DKkSSPFrREL7EXhL7A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PxR/pDpnShujqOuRyGxolgrSN0SGJxKVs1IoQthKCh1Q7KzMYnev1xVRxzI1LSgTb6Dd0M0uRlK+fMHJqZgcy4mLKXUEw0nrYcjGApoGKcxnRGKp9tUNvTW7AqOw43nMW4wU7LBhIApsRwo/L/F4/I/daAlc5WCFSHz/WVGxE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f25Mxn7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f25Mxn7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37D8C4CEEB;
	Thu,  3 Apr 2025 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690937;
	bh=UYZcrSoIukyNWFqG5RqeZgTW5DKkSSPFrREL7EXhL7A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f25Mxn7sTE5uXYsLGJO6y9vJRVcdxdMTTjs995bdwPmwAWxtZUhuWmAtVPyYG4GsD
	 xdzO74ybVodnmOEuOn91FigvsAw5u8Ohe1C8ldk+ZOvgQTt3qm07mc+u2ASB/fcHiS
	 Kwb0Ty4JcDtqx6arTnkBZu2kJtTO4s331wYU0O+nJa9XRd0zu6mpHgXHK/9BwxRMKj
	 RcEDf+XsiRwZKawYl1zyC5CEDuSm89kB750I3vspRA+T319KMGlrHnR/1d/Fzxe0qF
	 WP1HB05/+4XrPEnwuhoMtyYBI8dKPBRtqRy52tg1EAWBjaoc78RZNlphdnYyqUhvNJ
	 ci20RAzxULz9Q==
Date: Thu, 03 Apr 2025 09:35:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Yashwanth Varakala <y.varakala@phytec.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Fabio Estevam <festevam@gmail.com>, Jan Remmet <j.remmet@phytec.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@lists.phytec.de, 
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Benjamin Hahn <b.hahn@phytec.de>, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Teresa Remmet <t.remmet@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
Message-Id: <174369066563.2789714.13229546252082031365.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC


On Thu, 03 Apr 2025 13:29:26 +0200, Yannic Moog wrote:
> The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
> and the phyCORE i.MX 8M Plus FPSC SoM.
> This series adds its binding and device trees.
> In addition add an overlay for an LVDS display that may optionally be
> connected to the Libra board.
> 
> ---
> Changes in v2:
> - reorder device tree nodes of SoM and board device trees according to https://github.com/lznuaa/dt-format
> - fix typo in reg: regulator-12v0 -> regulator-vdd-12v0
> - add to binding commit description the difference between phycore-som and phycore-fpsc
> - Link to v1: https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de
> 
> ---
> Yannic Moog (3):
>       dt-bindings: add imx8mp-libra-rdk-fpsc
>       arm64: dts: add imx8mp-libra-rdk-fpsc board
>       arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
>  .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
>  5 files changed, 1140 insertions(+)
> ---
> base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
> change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
> 
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
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
 Base: using specified base-commit 90453dc4dee29b96b9162895f45776bc25526e07

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de:

arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#





