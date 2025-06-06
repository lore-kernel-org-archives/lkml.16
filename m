Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE231288C93;
	Fri,  6 Jun 2025 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215682; cv=none; b=VHpeAWLm5KDcAu5CuFsADYQGWX2g9CbuqUxRZT5IyvG7z549JyAcB0LAO5slSFPaNPTxW04a1fIu0c0bVrM6XzTXaYjvBvoRcT5YKC30lD5WSSHA5EJQ7eMhvqU+lrgxmcaR6fQ0BxnPUTF2mm3kuK9+4J4/Z9I7XATb5Mh3aOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215682; c=relaxed/simple;
	bh=skZemrol5BSMlsi755QNgC4Z7zGGLts5DGe9/yeSbEQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=U8GQvSXEJPuj9toWX8cAGPJOWxIJwvhDy7QCx1oeM/bP85geWgxi5yj03VQvEQVxOL/3sileOl5YVa/hMOpDSLv47+xV4V3F36LAiniSwSrJrwAjWq+Cq/knENUpbg8ABmuS606w1a2hrgbw+TtBreTJn5yRLaSA+eeDEX7ku3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngHWsDE9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngHWsDE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253D3C4CEED;
	Fri,  6 Jun 2025 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749215682;
	bh=skZemrol5BSMlsi755QNgC4Z7zGGLts5DGe9/yeSbEQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ngHWsDE9PaxzLFKKz3qcppmM5qPl2L+jEB/vDrH7i08LK4/60OmaMlr7yPqQeYd5g
	 H2me/D6I3xsdEkrE1nwqEZcSowgVnk3RggGX3ELOxBFnq+9M/bAidqNSOJXg3mwdhp
	 Pbm6dRr5tBmgUo21bLgR6HlaE0qDK27sQNECitvKu9tia/lb4/l17q9sJIVhMlQXBj
	 I6fwAIsX8W/Y6kT4p8DVI+sunEHvh1Y1uBFMguGtCB4/xcx/N66meg1qxhDqUiuDiQ
	 0qYFp/xLKRf9bVfvCqUTheXY6IWZrC5zOQ6fd906PlahlZQq6k1Ysor/JILbuMeG5O
	 p6BQHcucZBWWQ==
Date: Fri, 06 Jun 2025 08:14:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>
To: Fred Chen <fredchen.openbmc@gmail.com>
In-Reply-To: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
References: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
Message-Id: <174921562446.1204173.9232925902067845583.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] Add Meta(Facebook) Santabarbara BMC(AST2600)


On Fri, 06 Jun 2025 18:27:52 +0800, Fred Chen wrote:
> Summary:
> Add linux device tree entry related to Meta(Facebook) Santabarbara
> specific devices connected to BMC(AST2600) SoC.
> 
> Fred Chen (2):
>   dt-bindings: arm: aspeed: add Meta Santabarbara board
>   ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed-bmc-facebook-santabarbara.dts      | 978 ++++++++++++++++++
>  3 files changed, 980 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250606102802.1821638-1-fredchen.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e6e0000/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: gpio@1e780000 (aspeed,ast2600-gpio): 'pinctrl-0' is a dependency of 'pinctrl-names'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e780000/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e790000/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb@1e790000/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#





