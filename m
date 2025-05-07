Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492331F4717;
	Wed,  7 May 2025 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648694; cv=none; b=aBXOvM31o2NFnl63ej1SHy3dVXftACRgDOLTIEz7H28/vVd8gvkTvL5W+MjU+HSLe1MPotG8IklToNZpKOl3Ocg3wosLlcRi2pqSo2I7fv5BfWzL38soDcr4SPCHoMdVZgV4hIm0lfo2nDaJZJp8cVcFLwi6DtMaGrlwDt3uEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648694; c=relaxed/simple;
	bh=dRUPX2OztOkoXfZEAoSaluzY/nsg/DPcarCBCvd+vuo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DNUm4fFazVa9vTTb5fw+fd1/Zpv4WOL0neQJ4W5o4eKfQb3i4i0VCpqTMbpx95wE0cJ24tZ6/eYsUIC8zImzmry3Utp3tCJCoRDXMYfZmRU1TNFE+Wf0X12ROMFx1oa8CAYmVmZoN7NT2UTlUoCgvWmfAGotP5S5GslM0iTO/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Cl7rlg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Cl7rlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8062CC4CEE2;
	Wed,  7 May 2025 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746648693;
	bh=dRUPX2OztOkoXfZEAoSaluzY/nsg/DPcarCBCvd+vuo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C8Cl7rlg/hTY9nA6492WqFVo0BuwVKvigm17dnmzDjnNrxi0EuCTTPATVs07v34gg
	 EyrVb0SLWFsy8CaWYNdAYr5QKjohzmTmPSm4pWdB6AoPQ0k4mQ5q/+DAm7Lm+Wmc4D
	 UbN/5qovee7q+lPH4/faZKRdjmLIGH+Ktbm79EyL91b2EzTowlPhPZ2kbXryUWHffB
	 WV3mPx+DQccvxdrFrotKBdU0xUOGALb3tbYVBT/3jxMK5YTuiGRq/kl9XkdAR/Z+7U
	 KxEUVj2cvImqkPEH5WLHBZ65c2aEOUyOUKRKl+G2zm5oiMj+5HJiHsDhFx6gN6etWT
	 LLst5tX8w2HbQ==
Message-ID: <1f072e2e02bb6a66d10c50177e5c69a6@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aBsUObKHmJkBFN04@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de> <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de> <3ba53493700561923c4ea9ab53a1a272@kernel.org> <aBsUObKHmJkBFN04@pengutronix.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add TI CDCE6214 binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 07 May 2025 13:11:31 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Sascha Hauer (2025-05-07 01:05:13)
> On Mon, May 05, 2025 at 10:50:49AM -0700, Stephen Boyd wrote:
> > Quoting Sascha Hauer (2025-04-30 02:01:35)
> > > diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml=
 b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > new file mode 100644
> > > index 0000000000000..d4a3a3df9ceb9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > > @@ -0,0 +1,155 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +
> > > +patternProperties:
> > > +  '^clk@[0-1]$':
> > > +    type: object
> > > +    description:
> > > +      optional child node that can be used to specify input pin para=
meters. The reg
> > > +      properties match the CDCE6214_CLK_* defines.
> >=20
> > Presumably the EEPROM is typically used to configure all this stuff? Do
> > you actually need to program this from the kernel, or are you
> > implementing all this for development purposes?
>=20
> The EEPROM could be used to configure this. I don't know if the final
> product will have the EEPROM programmed, but even if it is, should we
> make this mandatory?

No I'm not asking about making the property/node required. I'm wondering
if you're actually using these bindings. If they're not used then I
worry we're putting a bunch of configuration in here that we'll never
use.

>=20
> Speaking of the EEPROM I think we should make sure that the pin
> configuration in the device tree is optional so that we do not overwrite
> settings from the EEPROM if it contains valid values.

Ok. Aren't the pinctrl settings already optional?
