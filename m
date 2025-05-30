Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F5120E6E3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594733; cv=none; b=PzEPxWnxVbYzpNIxZfBcDIuYMFn3mNLBnuUrfXuuFfXXIts/3+dFKF7LVbCm4+mFOnWZskv4hv/5qG5cAkFwnKQJM2wM2Cbdb3sDGZsyfd0qo7B10Ev1g5z1Zz6+6bJ4gJm0uU8AcN6fICXNunXP+QgO1HQuYmQNw9ng2lcziiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594733; c=relaxed/simple;
	bh=JhBOgQKJ+gaH4GCJNHE7uDE6a7wv2txMpliHbTgHazs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWI/sIDto31oq135F//LvcoeJVVJUx/JCVLhiY2UB3oQ+gsipgee2UvTz9ydKUQRVkxO+PM52COpfG3Dc5c223ShgZrR2xo4Wb6RcW2x6sjLbTln0GA+e0hwSgJULAHUK1i19iRnqi73niqfGCMy8TW//tgGiZzJhvBdWIIFP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMb-0006SK-Jl; Fri, 30 May 2025 10:45:17 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMa-000wrU-2X;
	Fri, 30 May 2025 10:45:16 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMa-000ooT-26;
	Fri, 30 May 2025 10:45:16 +0200
Date: Fri, 30 May 2025 10:45:16 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Message-ID: <20250530084516.ee2kre7kmdd6uikv@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-3-a5edb105a600@pengutronix.de>
 <119eba0a-2c81-4232-8b20-acc0a0eea969@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <119eba0a-2c81-4232-8b20-acc0a0eea969@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-05-29, Krzysztof Kozlowski wrote:
> On 29/05/2025 00:08, Marco Felsch wrote:
> > +maintainers:
> > +  - Marco Felsch <kernel@pengutronix.de>
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/input/input.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: touchnetix,ax54a
> > +
> > +  reg:
> > +    enum: [ 0x66, 0x67 ]
> 
> Isn't this the same address? You just added the write bit.

No the i2c addresses are always the 7-bit i2c-addresses without the R/W
bit.

> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  panel: true
> 
> So that was the reason of dropping tag?
> https://lore.kernel.org/lkml/821ce1d4-bc15-4764-bbe0-315c57e8536e@linaro.org/
> 
> Anyway, drop the property. Redundant.

Why is this redundant? The touchscreen.yaml defines it but I need to
request it? At least I understood it that way and all other users of
this property do it same way. Same is true for all the touchscreen-*
properties definied in touchscreen.yaml.

Regards,
  Marco
