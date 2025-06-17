Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E642EAD16;
	Tue, 17 Jun 2025 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170074; cv=none; b=ctFUFF39lEgYXaCmm/vmckqBD/Fg4hy0b2MSN84GYw7RH6tpkNkQLmsxlD5XcOgN4TPMva0a6EmkdcLdfkNupHeY9pbQSUBTB6+8Zv26O4AkzfZBaqDH2S4jMC5e6lvFhxNYMjS7W623fnmaD4uGBecdgSNZJA7v4O7j2L9MEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170074; c=relaxed/simple;
	bh=YNDuQ57cE+yduWX4US+oUYZ9fyMenjbkoEoZLqgvLus=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hc/eYM/zX9vvUEtPumtNismo/oUtdsVIfNQb6egkY+YWCPohCN3BSXTh3yZBgc+zUo0kvuiOzC7x3RxPTVkx2yWjKkmQLQnj8bo2QJljcrGStVc7Pm4+z3efLQNF5XdiZwlC66qk0FaLpL9YGQelFWZ8gIcFImzeL4hY6yUMQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRcoL9ye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRcoL9ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1346C4CEE7;
	Tue, 17 Jun 2025 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170074;
	bh=YNDuQ57cE+yduWX4US+oUYZ9fyMenjbkoEoZLqgvLus=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QRcoL9yeJ96ky13EWdUI/zFtt/54M0CuZj3LdBVf1Kcr1cJF3fhlVdXWjqg2uY43q
	 +oC3YTnYNV9l0HK2bQ1S67XSQOjPLx9HPctaE91U3MG9p8IATT3Y4d57T1OC5f38yr
	 zU++uOdGP03IP9Hfd0r4Nx8xs7dC9Bk8tguUEorUuNPzv8ecgTLzXULDVfEqdWixEg
	 IL9nPrPOgtmCIrmCEB25Uub4WQ7tMACsefonZLzwNJe6eBQpmleuBpDIRzfoxX61fO
	 YOgZ5OMJl6KN3PJipRYt5jWLGIZdCR9pOq7ev7jmoFetvq14Cyo1bQtIxHv5qEp5p/
	 d3/1YjTCNHHvg==
Date: Tue, 17 Jun 2025 09:21:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, claudiu.beznea@tuxon.dev, 
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, 
 linux-arm-kernel@lists.infradead.org
To: Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250617104703.45395-1-mihai.sain@microchip.com>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
Message-Id: <175016979802.2093569.17706303505979511319.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add cache configuration for Microchip SAMA7D and
 SAMA7G MPUs


On Tue, 17 Jun 2025 13:47:01 +0300, Mihai Sain wrote:
> This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> The cache configuration is described in datasheet chapter 15.2.
> 
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
>   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> 
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
>  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> 
> base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
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
 Base: using specified base-commit 9afe652958c3ee88f24df1e4a97f298afce89407

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250617104703.45395-1-mihai.sain@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): d-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): i-cache-size: False schema does not allow 32768
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e0800000 (atmel,sama5d2-tcb): clocks: [[2, 2, 91], [2, 2, 92], [2, 2, 93], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#





