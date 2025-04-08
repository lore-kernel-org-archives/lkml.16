Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A722A80F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124559; cv=none; b=efUUofOt5oDYLd7G4OcrmI+yU/rHwjQRxZipKa+VlFMYFi2C2FynjNGDaOC/K10C5SqrIQj7OjYwyS5NAy86nCk2ImI13TKYONVRGI0WcdhghNmDEBM165TC3BPZINIeqW8/Lz68Z8R4a3L9Ts7jgm0MYpPcf/5RRmIaDqYkQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124559; c=relaxed/simple;
	bh=HAeZ3Bog+4YMf9IhhAyXeuG17F+LI3itmc8xpJJVdHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYVwwkctpCNDspnybb3C7atUahMRPR4zbMge+h45JpeY7udnAkUiVZyZQsN1nxyKG4f68ac3T3yds0X4JlyQ7WFEBTJuVDZsmC9JLA1elBNFcD37it+Was2P4E6CDRG1o2JqoY7I0Xbor5q5oIcGzuVhkpkatgxT8coYr4oH80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1u2ASz-00062H-Mm; Tue, 08 Apr 2025 17:02:21 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u2ASz-003wys-1A;
	Tue, 08 Apr 2025 17:02:21 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u2ASz-006bVt-0n;
	Tue, 08 Apr 2025 17:02:21 +0200
Date: Tue, 8 Apr 2025 17:02:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <Z_U6fUGbOV2SdO_C@pengutronix.de>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
 <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Tue, Apr 08, 2025 at 04:27:23PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2025 14:00, Sascha Hauer wrote:
> > +
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,cdce6214
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: priref
> > +      - const: secref
> 
> So one input is optional?

The chip has two clock inputs and to be operational it needs at least
one clock, could be priref or secref or both.

Is there a proper way to express this situation?


> > +  "^clk@[2-9]$":
> > +    type: object
> > +    description: |
> > +      optional child node that can be used to specify output pin parameters.  The reg
> > +      properties match the CDCE6214_CLK_* defines.
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          clock output identifier.
> > +        minimum: 2
> > +        maximum: 9
> > +
> > +      ti,lphcsl:
> > +        type: boolean
> > +        description: |
> > +          If true enable LP-HCSL output mode for this clock
> > +
> > +      ti,lvds:
> > +        type: boolean
> > +        description: |
> > +          If true enable LVDS output mode for this clock
> > +
> > +      ti,cmosp:
> > +        type: boolean
> > +        description: |
> > +          If true enable CMOSP output for this clock
> > +
> > +      ti,cmosn:
> > +        type: boolean
> > +        description: |
> > +          If true enable CMOSN output for this clock
> 
> Looks the same here. Anyway having these as subnodes is too much. You
> have fixed number of clocks, so you need one or two array properties in
> top-level.

There are several properties I haven't yet modeled, like

- 1.8V / 2.5V output
- sync_delay
- LVDS common-mode trim increment/decrement
- differential buffer BIAS trim
- slew rate
- BIAS current setting for XTAL mode
- load capacity for XTAL mode

I don't know which of them will ever be supported, but I thought having a
node per pin would add a natural place to add these properties. Do you
still think arrays would be more appropriate?

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/ti,cdce6214.h>
> 
> This file does not exist. Something is odd in this example.

It is added in the driver patch. Should it come with the binding patch
instead?

> 
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        clock-generator@67 {
> > +            compatible = "ti,cdce6214";
> > +            reg = <0x67>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            #clock-cells = <1>;
> > +            clocks = <&clock_ref25m>;
> > +            clock-names = "priref";
> > +
> > +            clk@CDCE6214_CLK_SECREF {
> 
> That's not a valid unit address. Use simple numbers, see DT spec and DTS
> coding style.

CDCE6214_CLK_SECREF is a macro added in dt-bindings/clock/ti,cdce6214.h
and it expands to a simple number (1 in this case). While I haven't
found any examples of someone using macros for the unit address / reg
property I thought I'd give it a try as it nicely shows how it is used.

I can switch to plain numbers if you prefer that though.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
