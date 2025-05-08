Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5052253EE;
	Thu,  8 May 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708067; cv=none; b=imCvbe3sXv0XQm5XG2YUN6scy5FjxrdN6AQDUSj7hGFjgAnDMF1Qgz6Nte5N5WZgiZlHJzV1vMXIe5oq35Dpn2LpbrD7rMgXSqMHQ/ckBL6X6zGH4HqtuMfQJ40yBgz8r2Dz6rKagJkthKLaVKqF719hy3YLm2bltDfytuztWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708067; c=relaxed/simple;
	bh=LnQ4GKwkWAJRQ8vnWaq7ZRz7NNg7H7W0xynyLZNM6to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBepXBhWOv3Nu0CSTOcPtdbnryWrDVL5SWBaNVNSoHZIT+Kk47SO03WdW4lgmEKo8NnpD/FIM1JtDFaryuXMh6XrM/zvIVKuAx4NWRGs6IlFMuL75OTSPOFmu4FBfcVASqOoVcUhwhh3M6Li3mZjU3oHXgom7pTXwgaRgAu3za0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09AA4342FA1;
	Thu, 08 May 2025 12:41:04 +0000 (UTC)
Date: Thu, 8 May 2025 12:40:59 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250508124059-GYA506797@gentoo>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
 <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>

Hi Alex,

On 07:17 Thu 08 May     , Alex Elder wrote:
> On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
> > On 08/05/2025 00:35, Yixun Lan wrote:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - spacemit,k1-syscon-apbc
> >>> +              - spacemit,k1-syscon-apmu
> >>> +              - spacemit,k1-syscon-mpmu
> >>> +    then:
> >>> +      required:
> >>> +        - clocks
> >>> +        - clock-names
> >>> +        - "#clock-cells"
> >>>   
> >>>   additionalProperties: false
> >>>   
> >>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> >>> index 35968ae982466..f5965dda3b905 100644
> >>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> >>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> >> would it be better to move all reset definition to its dedicated dir?
> >> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
> > 
> > Please kindly trim the replies from unnecessary context. It makes it
> > much easier to find new content.
> > 
> > 
> > I don't get why such comments are appearing so late - at v6. There was
> > nothing from you about this in v1, v2 and v3, which finally got reviewed.
> 
> Stephen Boyd said "please rework this to use the auxiliary driver
> framework" on version 5 of the series; it was otherwise "done" at
> that point.
> 
> Doing this meant there was a much clearer separation of the clock
> definitions from the reset definitions.  And Yixun's suggestion
> came from viewing things in that context.
> 
> Given the rework, I considered sending this as v1 of a new series
> but did not.
> 
> > I just feel people wait for maintainers to review and only after they
> > will add their 2 cents of nitpicks or even some more important things
> > potentially invalidating the review. Lesson for me: do not review
> > people's work before it reaches v10, right?
> 
> That's not what happened here--or at least, it's not as simple
> as that.  Your quick review was very much appreciated.
> 
> Yixun:  Krzysztof was satisfied with things the way they're
> defined here.  Do you feel strongly I should make your suggested
> change?  Or are you OK with me just keeping things defined this
> way for the next version?  I'd like this question resolved before
> I send the next version.
> 

I was fine with squashing all definitions in one file for old version,
but now, a new reset driver is introduced, I think it is deemed an
independent header file? all newly added macros are related to reset.

-- 
Yixun Lan (dlan)
