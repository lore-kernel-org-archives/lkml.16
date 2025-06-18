Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29C2E7F20;
	Wed, 18 Jun 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253788; cv=none; b=njG+R0TVFPOVBBHsK9a1Sgxlb0rIjuV+6QpvDsnOVAO/x5EDDfd97vtQDJDqMcIHA0bd2In4fFtB2iMRynU783fF8sAAabfd3/xdDpyZKwJbBS2Z7S3vquA8ngANBeWCDAzSTclATEooQ+fWHg0HrrOwrMSwNM3M8W4O8yLTLpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253788; c=relaxed/simple;
	bh=xshy0rpJ6W5iYQQc9c0rwAuf1vDblFR4z0sFAMnuujc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=b+kOyHSARxoRAgSr9GhjfQpY+Jg4nooE44m8yr9QUftua7Eedbr+ouPbjjsyFMUkAc63zkNPLrbTyMuv4FWjwAquXyawETCDe53v23kEVFaWJj9VaY8IhgfCYU28dXgp8gddDZ/uxV+zsKWienFEP1OJHLMkXBEbH6/4bpbxPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O16Bsr4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O16Bsr4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0115C4CEE7;
	Wed, 18 Jun 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750253788;
	bh=xshy0rpJ6W5iYQQc9c0rwAuf1vDblFR4z0sFAMnuujc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O16Bsr4uXdPa70J8t1ZcSIO5rXL8LfJj0muu1rZLN2sNa+J8wYbBEtZzouC46+G38
	 tmH0XfH4w6kPuhiT6ZrXX9WhMZMGc4ARc6DIvCoglJz7eMFf228mK2i2K9XiFxOo11
	 Sf8mm/I/6dKsyKZ74bcMXhce9VPXmha08+tlUvuNvSwQRqM4fS1UayFa+w9Yb8Ukeh
	 dwBVmXBSud3+fZiCicxNySw8zA61KPxwkJWSxebVCINOyqA9h37AUwOFOrzVAiJNPw
	 y19/ZU96AdvD+zJbIqSYcLL04Fb+vVncjUj4XFGz+/Z+OfAGbzikS+9EXQWKtheN4X
	 nNwsAtGIx4kOg==
Date: Wed, 18 Jun 2025 08:36:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, 
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
To: Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250618103914.2712-1-mihai.sain@microchip.com>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
Message-Id: <175025355214.1756305.9442014210793499196.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D
 and SAMA7G MPUs


On Wed, 18 Jun 2025 13:39:12 +0300, Mihai Sain wrote:
> This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> The cache configuration is described in datasheet chapter 15.2.
> 
> Changelog:
> 
> v1 -> v2:
> - Remove the cache-unified property from l1-cache node
> 
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
>   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> 
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> 
> base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> --
> 2.50.0
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
 Base: using specified base-commit 52da431bf03b5506203bca27fe14a97895c80faf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250618103914.2712-1-mihai.sain@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#





