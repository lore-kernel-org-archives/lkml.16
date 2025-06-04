Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6676290D84;
	Wed,  4 Jun 2025 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045493; cv=none; b=MVB+niiQ9ptbersvEQ9qpKdFqhdyIuHAHhBsKPDFw8oohuLRgz+gXqOIsHxVUhavmGyDjFE309xMJRetoOMxDv0IW1EQxoB18eKbonl8Fszrl6ndys8dIPAFXedIyZxnKejNan5j4Vpa93Tr9VTys0VZJKgXW0UTuQ+Ba2DOEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045493; c=relaxed/simple;
	bh=+Zk0xNYskcCR1qYwRSmGjdTDUX7luU28zANHvoQ3zVI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sOH93LRu1qyFGKOUXbOM26+GwRigvmpkov+/cO7Bm+KR3o572W55oM38lKSk8AWqsxmPvyQms/vHrLO283OGEEiEzUUs1uyUSgo2rk5g6rGYfkmzZsgv9JRcrqFRShkQuAXiQfF4WpDL7MnuUKyTMqMpTOQoc1fBv6qXQymv8f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYcbiahQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYcbiahQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282EC4CEE4;
	Wed,  4 Jun 2025 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045493;
	bh=+Zk0xNYskcCR1qYwRSmGjdTDUX7luU28zANHvoQ3zVI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LYcbiahQIs1FeCD9VN0h5PbP6sZsBiigR/aMmkahcyhaHbtLxC/mUeNZ7djLmn709
	 HYDo+6HpNe6lUZug18UDndeylBhdAg2CXOom9Wg+dW59loiW9SAbtcZcoPWM6xVajT
	 F1pxL8nffMjuUW6KQugYN4abn+/iqgwxkRRB+3zrIrrw2hyppv0CNZHQd2p1GQrdE0
	 p0n4x4+NsSlKvNtiGsuVA/zRUuwDNq7AzYngQOnpGQ6lcjulxp0RKHgxIFWHRmAUae
	 2e2UdLbVxHCoKGBkyNKEBP0IrLy35TYFSKpRWyTSd8RPIXhmEpf6ATvFcSu6cL/6kB
	 cTdXfo9usJzVQ==
Date: Wed, 04 Jun 2025 08:58:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 devicetree@vger.kernel.org
To: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <20250604025054.981087-2-donalds@nvidia.com>
References: <20250604025054.981087-2-donalds@nvidia.com>
Message-Id: <174904540089.3869659.869773222407725254.robh@kernel.org>
Subject: Re: [PATCH v2 0/1] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200


On Tue, 03 Jun 2025 19:50:54 -0700, Donald Shannon wrote:
> Changes in v2:
> - Changed phy-mode to rgmii-id based on Andrew Lunn's feedback
> - Fixed typo from gb200nvl to gb200 in Makefile
> 
> Donald Shannon (1):
>   ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform
>     BMC
> 
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1172 +++++++++++++++++
>  2 files changed, 1173 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts
> 
> --
> 2.43.0
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250604025054.981087-2-donalds@nvidia.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e6e0000/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@200 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@280 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@300 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@71 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@72 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@73 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@70 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@75 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@76 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@77 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@380 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@480 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@500 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@780 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@77 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c@800 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: i2c-mux@77 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']





