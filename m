Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DD35979
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688957; cv=none; b=OEvFIxO2XLEGwavrysq1tqcOJ1t6APHl1GnEzvdLZa7rd+QzPOFMKqo8IbDuanowhP4J38vLoAU2LGXmIgCNjEIt1OIHfj8xtE5yeqFcmz5ZQffkQ4wBorg7c2hUv2Qa5JkbQaxNFrTy5OZglMiIkWdXfJEXHxsglsDVLDvSypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688957; c=relaxed/simple;
	bh=QGS1M/YT3mDdy/1Xp33jgSPbNLnApMgn9s4eyyzTfes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfxQX6gx25wgP2JHZdyaLXCbwsRh9gCGZuh+GLomdBvWWW2vRyp50yMyZXGLCgMx1WY3nEcr4PD1nx+rqDVNcOwC8OuwizHBsFDduKvUv1m54oJJ8V+GL3qgeAGWyxjqZ9YclVZPuL8ylBxqiwmOFePK1y1hpCKR8PnKBKYVCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uCvaK-00056O-C2; Thu, 08 May 2025 09:22:24 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uCvaK-001ghe-00;
	Thu, 08 May 2025 09:22:24 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uCvaJ-00ALKC-2r;
	Thu, 08 May 2025 09:22:23 +0200
Date: Thu, 8 May 2025 09:22:23 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <aBxbr8CyKmdZQobS@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
 <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
 <3ba53493700561923c4ea9ab53a1a272@kernel.org>
 <aBsUObKHmJkBFN04@pengutronix.de>
 <1f072e2e02bb6a66d10c50177e5c69a6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f072e2e02bb6a66d10c50177e5c69a6@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Wed, May 07, 2025 at 01:11:31PM -0700, Stephen Boyd wrote:
> Quoting Sascha Hauer (2025-05-07 01:05:13)
> > On Mon, May 05, 2025 at 10:50:49AM -0700, Stephen Boyd wrote:
> > > Quoting Sascha Hauer (2025-04-30 02:01:35)
> > > > diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > > new file mode 100644
> > > > index 0000000000000..d4a3a3df9ceb9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > > @@ -0,0 +1,155 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +
> > > > +patternProperties:
> > > > +  '^clk@[0-1]$':
> > > > +    type: object
> > > > +    description:
> > > > +      optional child node that can be used to specify input pin parameters. The reg
> > > > +      properties match the CDCE6214_CLK_* defines.
> > > 
> > > Presumably the EEPROM is typically used to configure all this stuff? Do
> > > you actually need to program this from the kernel, or are you
> > > implementing all this for development purposes?
> > 
> > The EEPROM could be used to configure this. I don't know if the final
> > product will have the EEPROM programmed, but even if it is, should we
> > make this mandatory?
> 
> No I'm not asking about making the property/node required. I'm wondering
> if you're actually using these bindings. If they're not used then I
> worry we're putting a bunch of configuration in here that we'll never
> use.

At the moment we are using the device tree binding. I asked our customer if
they plan to use it in production as well.

> 
> > 
> > Speaking of the EEPROM I think we should make sure that the pin
> > configuration in the device tree is optional so that we do not overwrite
> > settings from the EEPROM if it contains valid values.
> 
> Ok. Aren't the pinctrl settings already optional?

Yes, they are, but when the pin setup is missing I haven't explicitly taken
care to not overwrite any settings made by the EEPROM. Likely the driver
just does it right. Without pin setup the registers are just not
touched.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
