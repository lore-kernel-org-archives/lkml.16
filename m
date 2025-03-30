Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63400BE67;
	Sun, 30 Mar 2025 00:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743294425; cv=none; b=TxG4otbOv1PvI5NW3VfZxKoI8eKcoXNZE5NHStATYyDn3U9MYLcj8HL1EnCMtZNqrFxuPToGaBjv+Gi46g/qgc6KIL1bBEjN9tamfiLZPMBY0JgGEIg8/wlEEzJNoSOeZiHucmvlVZbAElNo8hcWiTGPobH/baRyyw3SS8GQfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743294425; c=relaxed/simple;
	bh=aiiKdFDmCS0U9MUvBKmwJ6wtLAwgtVEXAZWbVJ4delE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gFwv/teIznrJ4S9ZbMlf7U08ifmcWC0YcFuvSbJWzSV5RVMR8X1xGOtz7BpCm1jyd6+4Y6qw3God/nYBjXal6M//uzh/usJS355w8Mznd1riqizaPEYG0/ajMVdQPQJbDrkAYAk/lXOfvgsjDzeUlfEQ4kD6Az9n7bkOLz7CYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdWoEnL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdWoEnL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01651C4CEEA;
	Sun, 30 Mar 2025 00:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743294425;
	bh=aiiKdFDmCS0U9MUvBKmwJ6wtLAwgtVEXAZWbVJ4delE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YdWoEnL7t3+G1eeikHnkF20YlYkfES7CxO/Bpxz0+RX6+FLucVZqHc97etVGahclJ
	 eJ+W+Jp+4QdjpGCfWCZdXf3yUeZqhZIGppdp0x7S3eqKVs+NASYHeoSgfOjLDY3FmK
	 5F3AYTFi3pF5aBRlHUUcJI+Qlbaf9f8+HPa+XRIqaj7RPJPt13+oRoDeaBPplp09WI
	 Dg4FsXV/9d0Euzy4vKTH+xz2hiKWu2g1zVKGSYYQwszyk5OrmkWFwlsYIjiC2whRbY
	 NBYRMGWh+cIWrmkGZ306mabVDmnSlu0mSHOrfxh4tOVLYGNtdH36Zo9wCP9wFIJ/If
	 YQCFHairp9IOg==
Date: Sat, 29 Mar 2025 19:27:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 linux-kernel@vger.kernel.org, Teresa Remmet <t.remmet@phytec.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, upstream@lists.phytec.de, 
 Yashwanth Varakala <y.varakala@phytec.de>, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jan Remmet <j.remmet@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
Message-Id: <174329418273.2439899.17086234453417036380.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC


On Fri, 28 Mar 2025 14:04:36 +0100, Yannic Moog wrote:
> The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
> and the phyCORE i.MX 8M Plus FPSC SoM.
> This series adds its binding and device trees.
> In addition add an overlay for an LVDS display that may optionally be
> connected to the Libra board.
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
>  .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 291 ++++++++
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
>  5 files changed, 1141 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de:

arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#





