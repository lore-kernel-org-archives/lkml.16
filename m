Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6623C8A0;
	Wed,  2 Apr 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601649; cv=none; b=dGQtDOa3dPl/wYLvncGF/UjRiGmRPp3Ov4iw7WGVS6OWDFFZF5UMLu0Z6j9iMoulRCrOlrdpoGkKKydKGuKRuW4NJG4HdCX51nrycSm+0TZK3sNaz5SQsDDSsq3LJzH21awXISfafpu7ZC+bLZPsYGSeim7iKVf064xOBh4myLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601649; c=relaxed/simple;
	bh=mqlsTKVrn+AgGvdUDfL4V1yyT+cMX8N7L5XXQmEr3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gREnRzrHeasxBx0yCuw5dFN7Q/AEpMmQCE1cF0sacdvCZuV0Bd9tSA1yYjJGIUEgIZjewq29VbuLV10KAfF8v5jMQKRRLCkDMybGlm/mYaBcNuX6oao88old7llfyvJ8o2Qhnf7qQLcFZZYHf+j1GFlduRoDRsDP9/vx1BV0W2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/o5JVCQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/o5JVCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F0C4CEDD;
	Wed,  2 Apr 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743601648;
	bh=mqlsTKVrn+AgGvdUDfL4V1yyT+cMX8N7L5XXQmEr3Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/o5JVCQG+s/zpSNBsc2udu6u3eF1njWqXvag/0VmwJLHFrNy9dtkIAELz8/OXM3t
	 8EoMZk22fAUMhMiwnmZ5UVKvOYFAoSKAbcLkHDf3PA2zQNlwQkQcRrJO+lETPEzTkp
	 ipGfjXqV1nLY/xqXrvpDZeJ1KEZrcG2P9Dkg6HDj+Ty7Jl+C1xjrqbVNUNl91JZrud
	 KpRC+Fi+0xUXFl2+wgyc2KJkPpdspeGYbUAeciYUZrE4GkyuooaZsDk8oSqzbEIycw
	 yhf/iY9lSk5iST5iWWdKaapkJ1XUp+dmSyosSxt693xE7kXNaycLxsxvr1g77h/THd
	 LY9628QXysVCw==
Date: Wed, 2 Apr 2025 08:47:25 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <20250402134725.GA145044-robh@kernel.org>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
 <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>
 <20250401222015.GA4071342-robh@kernel.org>
 <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>

On Wed, Apr 02, 2025 at 10:45:08AM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2025 00:20, Rob Herring wrote:
> >> +      clocks = <&rcc CK_BUS_OSPIIOM>,
> >> +               <&scmi_clk CK_SCMI_OSPI1>,
> >> +               <&scmi_clk CK_SCMI_OSPI2>;
> >> +      clock-names = "omm", "ospi1", "ospi2";
> >> +      resets = <&rcc OSPIIOM_R>,
> >> +               <&scmi_reset RST_SCMI_OSPI1>,
> >> +               <&scmi_reset RST_SCMI_OSPI2>;
> >> +      reset-names = "omm", "ospi1", "ospi2";
> >> +      access-controllers = <&rifsc 111>;
> >> +      power-domains = <&CLUSTER_PD>;
> >> +      #address-cells = <2>;
> >> +      #size-cells = <1>;
> >> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
> >> +      st,omm-req2ack-ns = <0>;
> >> +      st,omm-mux = <0>;
> >> +      st,omm-cssel-ovr = <0>;
> >> +
> >> +      spi@0 {
> >> +        compatible = "st,stm32mp25-ospi";
> >> +        reg = <0 0 0x400>;
> >> +        memory-region = <&mm_ospi1>;
> >> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> >> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
> >> +               <&hpdma 2 0x42 0x00003112 0x0>;
> >> +        dma-names = "tx", "rx";
> >> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
> >> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
> > 
> > Looks like you are duplicating properties in the parent and child nodes. 
> > Maybe that accurately models the h/w, but if it is just so the drivers 
> > can get the resources from "the driver's node", you can always just look 
> > in the child nodes for the resources (as probably you want to drop the 
> > per instance resources from the parent).
> 
> 
> The current solution was actually my suggestion because if a parent
> device has to toggle child's reset, it means it actually is the consumer
> of that reset one way or another. IOW, it is one of its resources.
> 
> This also might matter for some of the implementations because we might
> need to setup device links or do some probe-ordering (in the future)
> between parent and the reset provider.
> 
> Without reset resource in the parent, I could imagine probe order:
> 1. parent (pokes into the child for reset)
> 2. reset and clock providers
> 3. child
> which would defer between 1 and 2.
> 
> With parent having the resource it would be re-ordered into:
> 1. reset and clock providers
> 2. parent
> 3. child

Okay, fair enough.

Rob
