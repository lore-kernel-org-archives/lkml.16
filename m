Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2A2BF012;
	Fri, 27 Jun 2025 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025195; cv=none; b=cJZp1UIssBm1jtamJBG8TF2k9MJI+40EqBHa8g41xdRrlhICd8ZFJ+S8Q+Z+EQ/kOFS8xLDZlAZZ9th4RkbbL11/bybSIgcFR0mKcoHNQzt2aV9czoAzGwZD/q1ptxgCUxeDh+XbDeD3XoUtq3sKJPZyAAu7Oib7bfjqvsSoxhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025195; c=relaxed/simple;
	bh=WDJRIiBgDgF7nDs2mDyrrymo6t/hxdkYyNXPPcQgJdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScPrwqDDDz9rtKXGs4dgK6gK5Z0uRQIZctmDaevWn/ouImoteNe1OuF4KYZszZpg9fwMOGh9MkUDnZphPYft/Qyp2OMTZwiPiN1bNdvfL5GkzWvgr+kJB91OStV1kfV1dzIVaA7nfIBp4ZLv/WjKIautzI8F5IesnUvmUd0efh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HfwYnDCM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HfwYnDCM"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 64AE920E95;
	Fri, 27 Jun 2025 13:53:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBsMN3Dr0E-0; Fri, 27 Jun 2025 13:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751025184; bh=WDJRIiBgDgF7nDs2mDyrrymo6t/hxdkYyNXPPcQgJdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HfwYnDCM1zsRY9Rm5LKXfpBahJetXii9aCQ3SpmgsNOt52jkgYBgpW9KMr2a3Pl91
	 Ft5M0wynRpI3oKb0kFohouxh6gsAf5MRN8Wh9aLaSGRcMSwtygLK5OkmWZbTCHiGyr
	 Ndhxb0DK3mzSaAquh3+JPYbNeA0Ofhrst6C4Y8dpjf+Ns0NIR9OjHUUwYdtTAKaae2
	 5BCe2y0DayXrjs7eeA/GdfzxNlyrk9Vsg4yjN6RxHcRHkSuWj4TaFAMP1yNO0NOgey
	 JMHrPAkVZjLhdqbCZnBhELF6YNAJU1MUVAyk7/qd5R9OTrQpT75gt57FF0hInGF4UE
	 LAGD4/R4lDHNA==
Date: Fri, 27 Jun 2025 11:52:41 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: loongson2: Add Loongson
 2K0300 compatible
Message-ID: <aF6FtaNB6XgkvUX7@pie>
References: <20250617162426.12629-1-ziyao@disroot.org>
 <20250617162426.12629-2-ziyao@disroot.org>
 <20250627-gay-sepia-reindeer-2fde2a@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-gay-sepia-reindeer-2fde2a@krzk-bin>

On Fri, Jun 27, 2025 at 10:03:53AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 17, 2025 at 04:24:19PM +0000, Yao Zi wrote:
> > Document the clock controller shipped in Loongson 2K0300 SoC, which
> > generates various clock signals for SoC peripherals.
> > 
> > Differing from previous generations of SoCs, 2K0300 requires a 120MHz
> > external clock input, and a separate dt-binding header is used for
> > cleanness.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/clock/loongson,ls2k-clk.yaml     | 26 ++++++---
> >  MAINTAINERS                                   |  1 +
> >  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
> >  3 files changed, 75 insertions(+), 6 deletions(-)
> >  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> > index 4f79cdb417ab..3e0a894cfb2f 100644
> > --- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> > +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> > @@ -16,6 +16,7 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - loongson,ls2k0300-clk
> >        - loongson,ls2k0500-clk
> >        - loongson,ls2k-clk  # This is for Loongson-2K1000
> >        - loongson,ls2k2000-clk
> > @@ -24,19 +25,32 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > -    items:
> > -      - description: 100m ref
> > +    maxItems: 1
> >  
> > -  clock-names:
> > -    items:
> > -      - const: ref_100m
> > +  clock-names: true
> 
> No. How does this implement my comment?

I'm sorry that I forgot about the suggestion of dropping clock-names for
the new compatible.

Is it acceptable to remove the description of clocks property, keep
clock-names property as-is, and use an allOf block to disallow
clocks-names for the new 2K0300 compatible? Thanks for your explanation.

> It makes no sense, why 100m even appeared here. I already objected last
> time!
> 
> 
> >  
> >    '#clock-cells':
> >      const: 1
> >      description:
> >        The clock consumer should specify the desired clock by having the clock
> >        ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
> > -      for the full list of Loongson-2 SoC clock IDs.
> > +      and include/dt-bindings/clock/loongson,ls2k0300-clk.h for the full list of
> > +      Loongson-2 SoC clock IDs.
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: loongson,ls2k0300-clk
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          const: ref_120m
> 
> NAK, stop doing this pattern. You already got comment on this.

Oops, I missed the comment about dropping the frequency (or the full
clock-names property) from clock-names when writing v2, and I've decided
to drop the clock-names property completely for the 2K0300 compatible.

Sorry again for my mistake.

> Best regards,
> Krzysztof
> 
> 

Best regards,
Yao Zi
