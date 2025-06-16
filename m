Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339928DEE0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068186; cv=none; b=lfu0YXptJY/e29JrKzvy4Xq6TPFuPyrPeeyHMO0xSViHhNeCCBioTq16n6nWpRpVy3SH4DNFg38mk3IvcdZWE/kdXefs39v639hnXE+1DIRgjA+XCf8xgwUjyC+RtuJAJLPRM/adobIO0Mf2Y5ECi9ZjB7Ho3P5kZajZqDPazgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068186; c=relaxed/simple;
	bh=lLM6PNG7dKx15HVc5tCO8LXy6xfPDli0bR1Pop3fY/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnBapLSVdpC+GkoquQThlk0wgQ4kh3X+Oa5xIrPLG4qn1y94TreBICrf3AyefmehyYtMyHbmMYVct72U2pKcn5U00OzjKbrW/azPChLJcp5/Ng1JdSqbWEwLuXz8ItBZ85gdtVGG8LN2fUsZniMrQb1FVaY2as4qZRSQf2E40CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uR6g5-0002xJ-5k; Mon, 16 Jun 2025 12:02:57 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uR6g4-003mkZ-1v;
	Mon, 16 Jun 2025 12:02:56 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uR6g4-00H0zN-1X;
	Mon, 16 Jun 2025 12:02:56 +0200
Date: Mon, 16 Jun 2025 12:02:56 +0200
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
Message-ID: <aE_r0MB9rVdJeYkG@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
 <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
 <3ba53493700561923c4ea9ab53a1a272@kernel.org>
 <aBsUObKHmJkBFN04@pengutronix.de>
 <1f072e2e02bb6a66d10c50177e5c69a6@kernel.org>
 <aBxbr8CyKmdZQobS@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxbr8CyKmdZQobS@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Thu, May 08, 2025 at 09:22:23AM +0200, Sascha Hauer wrote:
> On Wed, May 07, 2025 at 01:11:31PM -0700, Stephen Boyd wrote:
> > Quoting Sascha Hauer (2025-05-07 01:05:13)
> > > On Mon, May 05, 2025 at 10:50:49AM -0700, Stephen Boyd wrote:
> > > > Quoting Sascha Hauer (2025-04-30 02:01:35)
> > > > > diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..d4a3a3df9ceb9
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > > > @@ -0,0 +1,155 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +
> > > > > +patternProperties:
> > > > > +  '^clk@[0-1]$':
> > > > > +    type: object
> > > > > +    description:
> > > > > +      optional child node that can be used to specify input pin parameters. The reg
> > > > > +      properties match the CDCE6214_CLK_* defines.
> > > > 
> > > > Presumably the EEPROM is typically used to configure all this stuff? Do
> > > > you actually need to program this from the kernel, or are you
> > > > implementing all this for development purposes?
> > > 
> > > The EEPROM could be used to configure this. I don't know if the final
> > > product will have the EEPROM programmed, but even if it is, should we
> > > make this mandatory?
> > 
> > No I'm not asking about making the property/node required. I'm wondering
> > if you're actually using these bindings. If they're not used then I
> > worry we're putting a bunch of configuration in here that we'll never
> > use.
> 
> At the moment we are using the device tree binding. I asked our customer if
> they plan to use it in production as well.

Answer from customer: We have no plans using the EEPROM

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
