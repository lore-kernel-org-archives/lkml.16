Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F72741C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643283; cv=none; b=UdPg2/aCm/a104b4Zel71xVghoo9WJXpa0XOW7LJpAbbsleW81IB0mwKUwmZR+LbLP3jU4apl6ttwTN8N56sAajFzA/BoGA9sdLB2Ex/dBhEBSLCrQ4kYbWFwadPRAwy1jNjeoExcd/kB6vVBo0DmSvwwDGGf3dHJ7C0IqRd7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643283; c=relaxed/simple;
	bh=ZROa7ba+Tkf2H7KfI4XoW3zq+YrkEbgkkYJjDRSy650=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKhH8Pi9ackTSoVhQHJFj4oTzhM5F5WA6vKZ+92BqVSgXyyyCL3kymvkzYFrz8Ksd/tNHRE1IKCx9NpD8NG8DKPclS0liTfO70UZpZMIOtUX9MSaUzVllyDRvQqklX8mUfW5ZVXvUB7CwJgB1xvcKYT2/NwH+ipOEO/RgSUVHbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1u4LPV-0003gu-7u; Mon, 14 Apr 2025 17:07:45 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u4LPU-000Gw5-2v;
	Mon, 14 Apr 2025 17:07:44 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u4LPU-000L3u-2Y;
	Mon, 14 Apr 2025 17:07:44 +0200
Date: Mon, 14 Apr 2025 17:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <Z_0kwPIE7Kyphdi1@pengutronix.de>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
 <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
 <Z_U6fUGbOV2SdO_C@pengutronix.de>
 <20250411151552.GA3258510-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411151552.GA3258510-robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Fri, Apr 11, 2025 at 10:15:52AM -0500, Rob Herring wrote:
> On Tue, Apr 08, 2025 at 05:02:21PM +0200, Sascha Hauer wrote:
> > On Tue, Apr 08, 2025 at 04:27:23PM +0200, Krzysztof Kozlowski wrote:
> > > On 08/04/2025 14:00, Sascha Hauer wrote:
> > > > +
> > > 
> > > A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> > > prefix is already stating that these are bindings.
> > > See also:
> > > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > > 
> > > 
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - ti,cdce6214
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    items:
> > > > +      - const: priref
> > > > +      - const: secref
> > > 
> > > So one input is optional?
> > 
> > The chip has two clock inputs and to be operational it needs at least
> > one clock, could be priref or secref or both.
> > 
> > Is there a proper way to express this situation?
> 
> If I understand correctly that only 'secref' is possible then you want:
> 
> items:
>   - enum: [ priref, secref ]
>   - const: secref
> 
> (By default, entries have to be unique, so that eliminates 'secref' in 
> both)

Valid combinations shall be:

- only secref
- only priref
- priref and secref.

Background is: The CDCE6214 has a mux on these inputs, so you can select
one of both in software. In our case only one input is actually used,
but which one it is depends on the board designer. There are likely
usecases in which both inputs are connected to different clocks so you
want to decide during runtime depending on usecase.

> > > Looks the same here. Anyway having these as subnodes is too much. You
> > > have fixed number of clocks, so you need one or two array properties in
> > > top-level.
> > 
> > There are several properties I haven't yet modeled, like
> > 
> > - 1.8V / 2.5V output
> > - sync_delay
> > - LVDS common-mode trim increment/decrement
> > - differential buffer BIAS trim
> > - slew rate
> > - BIAS current setting for XTAL mode
> > - load capacity for XTAL mode
> > 
> > I don't know which of them will ever be supported, but I thought having a
> > node per pin would add a natural place to add these properties. Do you
> > still think arrays would be more appropriate?
> 
> Assuming they are connected to something in DT (if not, why care), you 
> could add a flags cell so the consumer side can define what they need.

Let's see if I got that right. Do you mean something like:

	cdce6214: clock-generator@67 {
		compatible = "ti,cdce6214";
		#clock-cells = <2>;
		...
	};

	some-consumer {
		clocks = <&cdce6214 4 CDCE6214_SLEW_RATE_MAX | CDCE6214_BIAS(14)>;
	};

That would work for the outputs. What about the inputs?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
