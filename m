Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90061335BA;
	Sat,  5 Apr 2025 19:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882936; cv=none; b=n7A9zZIwVIWg1ZMYvZ8BydVccijgJWHGFwQ5H7LRSxHCTvJnyWPwv6MhkG++cfz+ywDywpYAab/cLbb9ZUY3MmzjTDi+WEwWjmU4Rnv+6AdjIsyZFXjHZTIsQFYfME55M0ZW5qzmgb1X/5TpaXbx8+ct25A+7+XGKYINT5SpwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882936; c=relaxed/simple;
	bh=mA62SvgnY0e1J30LBflKoeGcr5R1xE9ehUM6YaHUWRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSIo5M7P0z/ZewuMuUE5Y9sGjQGnWnV0BRAGZ+P5av9oEXCVS+KLqdSr1TUg23kKdc0j3FMgxoWdC4QTFcM0576dbfi7/gL9hjIkEiKcOrxc4DAk88fhRVsC1g5PLeBeTZBkk6+fGsIGKLwZHKPFNKYvobfpJaCvfb+Mawsj3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=2FAF61Fy; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="2FAF61Fy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VIlpE3NxkylOLZaGankjQvG+NCkJiZ7fNj2FI1yhm0Y=; b=2FAF61FyTtP9ub/wAHnTdE20Xz
	MFLUxx9b73VUxOAJ/MkepZz9slP+ifXJ7fsq/3tYTdQF4W8iLUuKq/zkOxi7zpASUu20L+rBXWFon
	h6OYn8ttxDe3ChVRKVju3mpJQVQ3n/QdI8GSmvd+XyditedcWSBP4c40o7fk6nJLtI7sPGWuuHHW2
	eqwHrm1odRr9Xr0qyBWXwU6FMpsXEo4aHp52tW3C+3KapFR3HmnphZGP56iGECUlNwrxC0xCqCHm8
	DqEK9ka/w1ALOpB1RwB5rB2u+ufFkC6BN2qIRh+TtR1LjnOJfi/CAjZPKZ7Nyc0sL2LiIBU33R9GU
	H4ZARX4g==;
Date: Sat, 5 Apr 2025 21:55:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <20250405215529.7f3f3253@akair>
In-Reply-To: <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
	<20250404014500.2789830-2-sbellary@baylibre.com>
	<20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 4 Apr 2025 12:44:39 +0200
schrieb Krzysztof Kozlowski <krzk@kernel.org>:

> On Thu, Apr 03, 2025 at 06:44:57PM GMT, Sukrut Bellary wrote:
> > +properties:
> > +  reg:
> > +    maxItems: 1  
> 
> How reg is part of this? Every clock has reg, doesn't it? Otherwise how
> do you control it? Drop.
> 
> > +
> > +  ti,autoidle-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      bit shift of the autoidle enable bit for the clock
> > +    maximum: 31
> > +    default: 0
> > +
> > +  ti,invert-autoidle-bit:
> > +    type: boolean
> > +    description:
> > +      autoidle is enabled by setting the bit to 0  
> 
> required:
>   - ti,autoidle-shift
>   - ti,invert-autoidle-bit - although this makes no sense, so probably
> old binding was not correct here
> 

well, the more informal definition in the txt file can be read as: if
the clock supports autoidle, then ti,autoidle-shift is required. But
that does not
translate to the formal definition in the yaml file.
So we have nothing required here.

I am a bit wondering whether we should just drop the autoidle.txt. The
only thing worth there is the description.

Regards,
Andreas
