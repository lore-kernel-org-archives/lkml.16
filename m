Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683E2D0ABF;
	Wed, 30 Apr 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046597; cv=none; b=mlO5HPaUKnKcCEDsJkWOR/SB/+shWkPS6z689lG10WHoIy6Rl4RkLVKq70booB3Gl6JMmf5N8wYRB2N+f8nFgEG9ovlWflYi7N7Z353uIDy4eIqSvQuyt8noIhtnzP46aMagrmITmDBpXJ73VzAli7XkgX8e16sJsbyzDOWHULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046597; c=relaxed/simple;
	bh=CNFQzBWHud68EqtwfCS0lqVaovyNeZ1bIh+mHiCp5Wk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UHmVB3PYz3VL0y7bzBE6lus0lftMn/4eI7f2lTvioYbaZhXO4HLRgyx7mxXTSRlHi3NNAsEnOK/vmZM790ys/CK6zOF2cgFalu5+ncIMY3aXmpy0Z6RhN1F+dqfVV7cB1BIb7W+mHO2booGkvKAnnEimHsXyGQShWPvqoLyYU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzvUg+LP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzvUg+LP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192B2C4CEE7;
	Wed, 30 Apr 2025 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746046597;
	bh=CNFQzBWHud68EqtwfCS0lqVaovyNeZ1bIh+mHiCp5Wk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GzvUg+LP7Yc5dkGuRgqSnc1qQyDhipGHfgFamgs68QhRFQ0d6OUlR4pTvQarTDpWL
	 cRTT+7d7yAx4qAdtY+Tg334E6WGqE1Qejom1WTQf+n0KES6r6WRABfqet41mMdhqEI
	 WLDh2h+KmCksDFtap6Ln7XRcxKXrfrSl5l2SIV0ca8rYnGehc4JaTS8HB+5TgHR6Zc
	 F7LGINCm9rqPy999uHDVkbT0LbIgcLGjkdHqrJRqhRu44/vcwJvclF8ZBsIy5eF4Vm
	 p0DVbhwFrBzGpfnIpnKF/Rs5MnZmldqhEgbEzaDOi3JZvCS2IkDzQwW6+tmGPcpVoG
	 CH+Pw+HUusPrg==
Date: Wed, 30 Apr 2025 15:56:35 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
 linux-rockchip@lists.infradead.org, Jimmy Hon <honyuenkwun@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250430074848.539-1-kernel@airkyi.com>
References: <20250430074848.539-1-kernel@airkyi.com>
Message-Id: <174604649749.180857.9703877984884077664.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for rk3399 industry evaluation
 board


On Wed, 30 Apr 2025 15:48:46 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399
> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 
> Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250427094211.246-1-kernel@airkyi.com/
> - Remove gmac
> - Add rk809 PMIC
> - Add CPU supply
> - Fix io-domain for sdmmc
> - Enable vopl
> 
> Chaoyi Chen (2):
>   dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
>   arm64: dts: rockchip: Add rk3399-evb-ind board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 466 ++++++++++++++++++
>  3 files changed, 472 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> 
> --
> 2.49.0
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250430074848.539-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic@20 (rockchip,rk809): 'pmic-reset-func' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4525@1c (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4526@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel1-gpio: {'rockchip,pins': [[1, 17, 0, 169]], 'phandle': 117} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel2-gpio: {'rockchip,pins': [[1, 14, 0, 169]], 'phandle': 118} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#





