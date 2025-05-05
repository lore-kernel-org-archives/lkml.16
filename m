Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FD25CC63;
	Mon,  5 May 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456249; cv=none; b=Il+mpm5upTYt+whfvfNCLzi+pebOQXfqbeurmEV/ejO0GieylNfTFzHPzT9vyCEg0VoFaoICIoMMts9P/XSGghMjr5mBcRBZ83mmZd6mqgchdyZQVlMwlgDviXWCSlBb69SN6krbhgxRtuk7ff7DGTkiUYeWI/Y++AambiyJY50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456249; c=relaxed/simple;
	bh=UzAMomFyuhI5xvI4clydLab7kwq4ZLQzU3pP+AbldBQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eDlzWQJCucxhpx/UBnEqlQSL/j7gqDwE3Q65dYSraNkOHLhLiQIfBjpnSoRY6GR+V6T7xJQiFOra8si/YJf6c1WFZlc2N6quozMAcnof25F1iTsUEFDDFg7B1/qNCOhAZwY1kagY6fUIYNNrPjShTdCFvQNFjID0/3zcO9oFZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSu8Mt8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSu8Mt8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE95C4CEE4;
	Mon,  5 May 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456248;
	bh=UzAMomFyuhI5xvI4clydLab7kwq4ZLQzU3pP+AbldBQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cSu8Mt8por9ww8yacAcqvoxu8hG0uHsJGl//PCcFDGVwml06a5bylHtsq5TgsLu1j
	 7rEPWAoSPRrht30xbBwv5+l2tQT/C8cT5rHfdY9lAl+7sdVmmz/9agz/eIq3JpPZKa
	 H6FWHzmLpm8+OgL8JnRVmKbuIbzsmWMQp1YaFO5k/YwY0cpkVDcEKvYFBIY4di53NY
	 eb/28aR4TYZNww+iDHcMdn12KdLpI0tL2P2mdvmyH0QvjoHdvcuaGAdB53kUXw/WHH
	 zUyqAybpkSUNklLbNfbFT4BFbf3eQ0Y5/mcZAQpd4Mt8DICY37OL64C0+cUCoV37Jo
	 +ggtVD89jEgew==
Date: Mon, 05 May 2025 09:44:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 detlev.casanova@collabora.com, nicolas.frattaroli@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 heiko@sntech.de, linux-kernel@vger.kernel.org
To: John Clark <inindev@gmail.com>
In-Reply-To: <20250504102447.153551-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
Message-Id: <174645594199.1246544.16804266826655176867.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add Luckfox Omni3576 Carrier Board support for
 RK3576


On Sun, 04 May 2025 06:24:44 -0400, John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576 Carrier Board
> with Core3576 Module, based on the Rockchip RK3576 SoC, enabling essential
> functionality for booting Linux and basic connectivity. v1 was posted at:
> https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
> 
> Tested features (on Linux 6.15-rc4):
>  - UART: Serial console operational
>  - SD card: Mounts and reads/writes successfully
>  - PCIe: NVMe SSD detected, mounted, and fully functional
>  - Ethernet 0: Functional with RGMII PHY
>  - USB 2.0: Host ports
>  - RTC: Timekeeping and wake-up tested
>  - LED: Heartbeat trigger works
>  - eMMC: Enabled, not populated on tested board
> 
> The series includes the following patches:
>  1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
>  2. dt-bindings: arm: rockchip: Add luckfox,omni3576 binding
>  3. arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> 
> The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.
> 
> I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
> welcome feedback or collaboration to align with mainline driver development.
> 
> Changes in v2:
>  - Enabled HDMI node per feedback from Heiko and Nicolas; untested due to
>    upstream driver issues
>  - Enabled Ethernet 1 node per Heiko's DT philosophy; untested due to
>    suspected PHY driver or configuration issues
>  - Clarified eMMC remains enabled but unpopulated on tested board, per Heiko
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
> John Clark (3):
>   dt-bindings: vendor-prefixes: Add luckfox prefix
>   dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
>   arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-luckfox-omni3576.dts  | 779 ++++++++++++++++++
>  4 files changed, 787 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> 
> --
> 2.39.5
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
 Base: tags/v6.15-rc1-32-g2acfe31a8ce5 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250504102447.153551-1-inindev@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: vop@27d00000 (rockchip,rk3576-vop): 'vop-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
	'rockchip,rk3568-pcie' was expected
	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): 'msi-map' is a required property
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a200000 (rockchip,rk3576-pcie): Unevaluated properties are not allowed ('compatible', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/pcie@2a200000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
	'rockchip,rk3568-pcie' was expected
	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: pmic@23 (rockchip,rk806): Unevaluated properties are not allowed ('pwrkey' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: hdmiphy@2b000000 (rockchip,rk3576-hdptx-phy): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#





