Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9252E9730;
	Wed, 18 Jun 2025 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253988; cv=none; b=IV56CGoUXPw8RTyFml6eILOc/q9vsKzqhbHhFeoDSk+uwuKV+/KQ6qgoV0/ovKX0k2w6H1DRLWO8qoGbU9pxhJr0PLFK+Y0dSCFs9koz8DRGsMuKzY1WYm7Z01mA5D2HigDzdXpXHFH5kN8zeJy3Pe2ACEPSwAN1T9to4F5Adgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253988; c=relaxed/simple;
	bh=vGA6YD3WHkjhX9wh1WJgtfN49JDWFNbiMmPPsBJHMkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyReayWpY3+TrBirgIt4YYyQYpQRXzlcVoqWAvN+mndxi9TPwX92rXk92S1WZ57g3jyyVv/dVOIkpzketKwM/hbiWXplRVYLdJ1W6mKZOodEp4ygit+bkZG7HnVMpfRUDnCbWbyW575clLkGknXzPDBQiJJb152Ed+o5yuqqi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0V/Bfh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0V/Bfh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEC5C4CEE7;
	Wed, 18 Jun 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750253984;
	bh=vGA6YD3WHkjhX9wh1WJgtfN49JDWFNbiMmPPsBJHMkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0V/Bfh+MmwncspD7LiPiZTApp7b0D8oI9XvxIfia7mKuj5cDz0ONRwb8pCPivdN2
	 eGjhJ7EcWG6QUZfVaqQe1l90HlAwl8qSeTrCPykpr+cgxGixTOMDDwmjenSAVartou
	 2UHPsZKafNgJzgb4y78N/YQ/QDYgAKvm3CX/+SMRIUwQmBPF2w9FoVKVyneNB2Wcpb
	 fBK9mDzI97rf3Qou/jLF01+f7qzh89w8Tlg5f/FD+368J/b54tZ6l8Bo+8V2VkXw3d
	 XH9EWzyajwWXDlHJSCastvIKMwuj3PbyNmBAXkNMPvrwu14eBBBMYKWedp1v/U8yft
	 TJfKWiC8y4NAw==
Date: Wed, 18 Jun 2025 08:39:43 -0500
From: Rob Herring <robh@kernel.org>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D and
 SAMA7G MPUs
Message-ID: <20250618133943.GA1769667-robh@kernel.org>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
 <175025355214.1756305.9442014210793499196.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175025355214.1756305.9442014210793499196.robh@kernel.org>

On Wed, Jun 18, 2025 at 08:36:25AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 18 Jun 2025 13:39:12 +0300, Mihai Sain wrote:
> > This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> > The cache configuration is described in datasheet chapter 15.2.
> > 
> > Changelog:
> > 
> > v1 -> v2:
> > - Remove the cache-unified property from l1-cache node
> > 
> > Mihai Sain (2):
> >   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
> >   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> > 
> >  arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
> >  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
> >  2 files changed, 32 insertions(+)
> > 
> > 
> > base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> > --
> > 2.50.0
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 52da431bf03b5506203bca27fe14a97895c80faf
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250618103914.2712-1-mihai.sain@microchip.com:
> 
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#

You are doing caches wrong as the schema is telling you.

The L1 caches are described in the CPU nodes, not a separate node. This 
is detailed in the DT Spec as well.

Rob
