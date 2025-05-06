Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DF82868A5;
	Tue,  6 May 2025 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555836; cv=none; b=dw31Bft8YgvLhit7BpFkT2P1N0JVwiaQ2gzrjDQc3vTLt5YKE+J348u8Bn+Axl2cZtJXCksMqMAGLigGdtTZYJcqmC8rV+ZAZt7HmKFa4XMSDWhHNvoQ5oSLbMtM0g5h/1fGL+IHtujxPGfOiZ4va8sEQq3ZNrgjYSZaIjr2Ysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555836; c=relaxed/simple;
	bh=O7yshzV7ZmJF0pt/p2C4mkBTE5rpLNK0CSOvJGcgwFU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aqRZN/UJG05eJeEtbsH21AWki4NETRC8qXlKrzZkjIPRspAtRB32/N5l3giJD7AhTORhapfiKsZ6bY1PJdrmSZQEl+xjXC0zKIHWjJT5LhRwbaPZYMI+56wSRU05NS4jM28LTrjmzAUH1l/8KFf7pHynrjGqMK7wcL37gvMVNEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFFHoken; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFFHoken"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50702C4CEE4;
	Tue,  6 May 2025 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555835;
	bh=O7yshzV7ZmJF0pt/p2C4mkBTE5rpLNK0CSOvJGcgwFU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rFFHokenCiTgPO/0Ter9/lREgZWg6qzlfqbwKkqkPlaNNgeYzJUwkwrCm08QWVmPV
	 8uPCl2rdVhfSh+761+yWx5FdABmIAotgxrcByaxJWLaLmSThnfJiek7Z+dWqyKAgsB
	 5MYdZQyrNqpBM/6OlbobWDyNhoXiVEppRXkMhBrktEkgm2ul0AkYHT6aGrQgt/ByB1
	 YcLTjWw4V8ri2uxKij3xO6GInHL02Ka/I6RLT0OkRTl1+SmOMQLragucS8bvfN8E9p
	 tBxnoBMLYNVDabtQGGwzBH4p5OGfDf2V0TYXjQgYWoKKbjQIhzsAm6pSawBwpXM8nC
	 ZccOhvBNT3LHQ==
Date: Tue, 06 May 2025 13:23:54 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jimmy Hon <honyuenkwun@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>, 
 Andrew Lunn <andrew@lunn.ch>, Kever Yang <kever.yang@rock-chips.com>, 
 linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
Message-Id: <174655575211.2171051.17738454556851250078.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for rk3399 industry evaluation
 board


On Tue, 06 May 2025 11:43:45 +0800, Chaoyi Chen wrote:
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
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250430074848.539-1-kernel@airkyi.com/
> - Add i2s
> - Add tsadc
> - Fix devicetree coding style
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
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 496 ++++++++++++++++++
>  3 files changed, 502 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506034347.57-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@1c (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']





