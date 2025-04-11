Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA5910A1E;
	Fri, 11 Apr 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384554; cv=none; b=PV9c3X1AdOVFvJP2AIyvPYzoY/b9AxNNlwxbfjpTDV1s0Lk10j1JrZ1s3xhsmqKmm9k8Euw9XLbuItFm8WKrJTdxLTvn6LcmFbqnuZKkBWy4w4vKulGHFhOo0clXh67OdpEt1ZbFiX0qOV91DKwE02KmL/zv3bR1ew0nayXTBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384554; c=relaxed/simple;
	bh=pOzo9gl+06nuScpgNkLpBddBRrPwWPW2vetdG6X3tV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx+3Mp3chn7/5EslFdp2ivNBu011veFqLD53Q+mkNwNUsZjd1I+5oExKpHYMAx41uPxlofZOrtv0g06tdik1uc5gTlayTifdCxe68NFlXQYIRQIWgThOjYYVQUQbKhWf4xsOFiRn/5R0Dyc1e2+NgN12NsZzhYFvoxflLjtLGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPkeaLo/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPkeaLo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE72C4CEE2;
	Fri, 11 Apr 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384553;
	bh=pOzo9gl+06nuScpgNkLpBddBRrPwWPW2vetdG6X3tV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPkeaLo/fccnmntzxFzQxJPer3+02uVBRTbhfJZxbJ47QdMCHTrSSaNHTr8R81bQv
	 kVcjpHF7Xi3kbIvlrKPW/vQGTYIdJWZclGrZZ+y6i+SCn2MkIUHGz7OeF4ANC/TUF6
	 GZHFQpUuX9SGy3fM9JuYrnOQElwBrW7BDTQSwo2lf7/sc4hgE1Imzw//RIxWVRMBB4
	 s8nFdf/w7gUXqQew8Whqy8aPvCT6BgTh2TgXigzhPOoi34xRHDG3/WBIWP5lNoNMp4
	 SVMp9eFY1tWgDbC0/u1UF55oxt8Gv/x+fGc3XZHBLOaVNACEPL/4PN/tMunRKKBQpv
	 835IQe/VTqg/A==
Date: Fri, 11 Apr 2025 10:15:52 -0500
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250411151552.GA3258510-robh@kernel.org>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
 <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
 <Z_U6fUGbOV2SdO_C@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_U6fUGbOV2SdO_C@pengutronix.de>

On Tue, Apr 08, 2025 at 05:02:21PM +0200, Sascha Hauer wrote:
> On Tue, Apr 08, 2025 at 04:27:23PM +0200, Krzysztof Kozlowski wrote:
> > On 08/04/2025 14:00, Sascha Hauer wrote:
> > > +
> > 
> > A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> > prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> > 
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,cdce6214
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: priref
> > > +      - const: secref
> > 
> > So one input is optional?
> 
> The chip has two clock inputs and to be operational it needs at least
> one clock, could be priref or secref or both.
> 
> Is there a proper way to express this situation?

If I understand correctly that only 'secref' is possible then you want:

items:
  - enum: [ priref, secref ]
  - const: secref

(By default, entries have to be unique, so that eliminates 'secref' in 
both)

> 
> 
> > > +  "^clk@[2-9]$":
> > > +    type: object
> > > +    description: |
> > > +      optional child node that can be used to specify output pin parameters.  The reg
> > > +      properties match the CDCE6214_CLK_* defines.
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description:
> > > +          clock output identifier.
> > > +        minimum: 2
> > > +        maximum: 9
> > > +
> > > +      ti,lphcsl:
> > > +        type: boolean
> > > +        description: |
> > > +          If true enable LP-HCSL output mode for this clock
> > > +
> > > +      ti,lvds:
> > > +        type: boolean
> > > +        description: |
> > > +          If true enable LVDS output mode for this clock
> > > +
> > > +      ti,cmosp:
> > > +        type: boolean
> > > +        description: |
> > > +          If true enable CMOSP output for this clock
> > > +
> > > +      ti,cmosn:
> > > +        type: boolean
> > > +        description: |
> > > +          If true enable CMOSN output for this clock
> > 
> > Looks the same here. Anyway having these as subnodes is too much. You
> > have fixed number of clocks, so you need one or two array properties in
> > top-level.
> 
> There are several properties I haven't yet modeled, like
> 
> - 1.8V / 2.5V output
> - sync_delay
> - LVDS common-mode trim increment/decrement
> - differential buffer BIAS trim
> - slew rate
> - BIAS current setting for XTAL mode
> - load capacity for XTAL mode
> 
> I don't know which of them will ever be supported, but I thought having a
> node per pin would add a natural place to add these properties. Do you
> still think arrays would be more appropriate?

Assuming they are connected to something in DT (if not, why care), you 
could add a flags cell so the consumer side can define what they need.

> 
> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - "#clock-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/ti,cdce6214.h>
> > 
> > This file does not exist. Something is odd in this example.
> 
> It is added in the driver patch. Should it come with the binding patch
> instead?

Yes.

Rob
