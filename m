Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C931C69D;
	Wed, 25 Jun 2025 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812772; cv=none; b=ebLWaRFRuA1pDfKDSEH2WuYZdwD8cnpbrCvHxwV00U06A23daRxMNLcs6yNHA6QjxUePT47gRcoqlcs5vVBhHZxz69lF9MO83bAOV9FxuEFRY0St1ahB9oNC+8/pIJwtOuYb4CvopECw9qe/Kp8iDGHzKwZIU6vUXdGNNy1X7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812772; c=relaxed/simple;
	bh=Yaa6J9Xo1LF9vDjaSziuMWuGSbbNeCc3vVAAA+tc3/0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wn2aPjko7w9kOCZHLhCv4gviiO0N/kHYzD1DKZQPOC1m85l+zbLS/hClPUjmxiA/1icq4GmGtdu1m9gf65xxyEWG1KKlVXRaEb2+hMRqjhcyHKG2gvUYmLroA3SWeoeEWOaTnOZ21cyGjgKoGCfnqjPje5cXlOa7eDtx2ilHOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Z7my6fe6; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Z7my6fe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750812769;
	bh=Yaa6J9Xo1LF9vDjaSziuMWuGSbbNeCc3vVAAA+tc3/0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z7my6fe67uUQHlcdoxvWTGQAabGIEH/Ebhj5XfmNgFAQec/LSMJnoBHLecNYaze+m
	 KqGzJF/Srmn0zlt3pZuX64mf1tgoHmkm5Q1Kqc6ggBIRAB9CbXuuDzpkkwSEIwYxs9
	 RTcmj2fkkvUpRjqTVHLiby0Bel4iSB/TaHCwaomPbf+isg1Dj16rsQA5nwC0xPJ0dn
	 WEQx6V9oF3R8QMUaYvzXpxE+5a1suknbONPG6tOck94CQYx9rZXn3XPckhP/pd/Yjo
	 OPIZdQHF8l3dFbB7CibzD9nFfVTwPVq3EAKdHXjYeen6+/RZ1ww+trwu8FGZFy9olZ
	 /uO3iV7YPfASQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 41C20640A1;
	Wed, 25 Jun 2025 08:52:48 +0800 (AWST)
Message-ID: <9c748fef6be89c3bb1fe833108b2191faa25ab33.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 25 Jun 2025 10:22:47 +0930
In-Reply-To: <TYZPR06MB656893C53B13B2D288BCDEA1F17BA@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
	 <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
	 <0ba565ac9444503be954161a8d79fa0476bd78a0.camel@codeconstruct.com.au>
	 <TYZPR06MB656893C53B13B2D288BCDEA1F17BA@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-25 at 00:34 +0000, Jammy Huang wrote:
> >=20
> > On Mon, 2025-06-23 at 10:44 +0800, Jammy Huang wrote:
> > > Introduce the mailbox module for AST27XX series SoC, which is
> > > responsible for interchanging messages between asymmetric processors.
> > >=20
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > > =C2=A0.../mailbox/aspeed,ast2700-mailbox.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 57
> > > +++++++++++++++++++
> > > =C2=A01 file changed, 57 insertions(+)
> > > =C2=A0create mode 100644
> > > Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.ya=
m
> > > l
> > > b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.ya=
m
> > > l
> > > new file mode 100644
> > > index 000000000000..9c5d7028e116
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbo=
x
> > > +++ .yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ASPEED AST2700 mailbox controller
> > > +
> > > +maintainers:
> > > +=C2=A0 - Jammy Huang <jammy_huang@aspeedtech.com>
> > > +
> > > +description:
> > > +=C2=A0 ASPEED AST2700 has multiple processors that need to communica=
te
> > > +with each
> > > +=C2=A0 other. The mailbox controller provides a way for these proces=
sors
> > > +to send
> > > +=C2=A0 messages to each other. It is a hardware-based inter-processo=
r
> > > +communication
> > > +=C2=A0 mechanism that allows processors to send and receive messages
> > > +through
> > > +=C2=A0 dedicated channels.
> > > +=C2=A0 The mailbox's tx/rx are independent, meaning that one process=
or can
> > > +send a
> > > +=C2=A0 message while another processor is receiving a message simult=
aneously.
> > > +=C2=A0 There are 4 channels available for both tx and rx operations.=
 Each
> > > +channel
> > > +=C2=A0 has a FIFO buffer that can hold messages of a fixed size (32 =
bytes
> > > +in this
> > > +=C2=A0 case).
> > > +=C2=A0 The mailbox controller also supports interrupt generation, al=
lowing
> > > +=C2=A0 processors to notify each other when a message is available o=
r when
> > > +an event
> > > +=C2=A0 occurs.
> > > +
> > > +properties:
> > > +=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> > > +
> > > +=C2=A0 reg:
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > +=C2=A0 interrupts:
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > +=C2=A0 "#mbox-cells":
> > > +=C2=A0=C2=A0=C2=A0 const: 1
> > > +
> > > +required:
> > > +=C2=A0 - compatible
> > > +=C2=A0 - reg
> > > +=C2=A0 - interrupts
> > > +=C2=A0 - "#mbox-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +=C2=A0 - |
> > > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gi=
c.h>
> > > +
> > > +=C2=A0=C2=A0=C2=A0 mailbox@12c1c200 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,as=
t2700-mailbox";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x12c1c200 0x200=
>;
> >=20
> > I realise this is just an example, but with respect to the datasheet, s=
houldn't
> > this be sized as 0x100?
> >=20
> I use 0x200 here because I want to include tx/rx together in one mailbox =
controller
> instance.
> Ex. 0x12c1c200 is a IPC whose TX is NS-CA35 and RX is SSP.
> 0x12c1c300 is a IPC whose TX is SSP and RX is NS-CA35.

What do you think of instead requiring two reg items? One for the TX
block and another for RX. I feel that aligns better with the way the
blocks are desribed in the datasheet, even if TX and RX happen to be
contiguous for a given remote side in the current design.

Andrew
