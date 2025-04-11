Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F16C215771
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387443; cv=none; b=TTXLV1aR34I2AZRe9uDW8pj/Fy0HWTF4EXAZ6DiTDqh/Bbqep+4cNFEkzkIQ0/X93AohMkrKnQCuHGpdRSHHHds1+Qeu72o/0QAIj33bZyfujOlmrPV5yOEwV7s+bj7bBAlDj2O2BPlFT9wrpXq34jUcNCannnYaIzJzIHdX5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387443; c=relaxed/simple;
	bh=/IB7pxPh4D63PdU9ybhC5RL3CnukcCoPGslr+QEUg2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5xnfJLQMIP3QqU7XjhZOkBSlaPew9nJ3F4HBh3YwtN+JxLdx0Ps1ySR0IZAE+UvzKr/7y4HN5bSMP3v+g/U+J/ZwKWYN035bZbBWPlzRqGjlPpNvswyrEK5RYmsFrlF8jaJZI1MXqbbnFbDlARb8qFsSpWRan5SKr3GX2AvN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=kqTqv1D8; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="kqTqv1D8"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5B49C240028
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744387433; bh=/IB7pxPh4D63PdU9ybhC5RL3CnukcCoPGslr+QEUg2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=kqTqv1D8zFFSRbrZiNbM71X6kzxa1MZaXqyCQue/2vuDQML4MrL5WsW1C5MeB5pWi
	 iLD0JxcIvHZJvIXGo1VPVr3giKGGOuq6sVvhNCJRqm1L933FvouNadCzsuGHF1f7FX
	 4vEQn9feGDlZymPTKmHfNvbs00bT2qFGH7XcflHW3UEr+CuyNUnk6z0a4Oq2pIUuSe
	 JmiQJfpydStVQQQvlDJkCxps0NiuknLZsFKPOScjaujX0QU6t98Po7wD3X/QnoD+KA
	 oetj7EoEzyVpcbV9aXl6GgEAtmWytfzrta69u2vy5mBNmbH0EsYTGtpqZD7cmgWkbx
	 n/NweZ9jMV4ZQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZZ1h73mr2z6twf;
	Fri, 11 Apr 2025 18:03:51 +0200 (CEST)
Date: Fri, 11 Apr 2025 16:03:50 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Conor Dooley <conor@kernel.org>
Cc: j.ne@posteo.net, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert fsl,mpic-msi
 to YAML
Message-ID: <Z_k9ZoNqWAiVb6Uz@probook>
References: <20250403-msipic-yaml-v1-1-f4248475714f@posteo.net>
 <20250404-exuberant-unvarying-b8ee5ab10b00@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250404-exuberant-unvarying-b8ee5ab10b00@spud>

On Fri, Apr 04, 2025 at 06:06:39PM +0100, Conor Dooley wrote:
> On Thu, Apr 03, 2025 at 07:38:00PM +0200, J. Neusch=C3=A4fer via B4 Relay=
 wrote:
> > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> >=20
> > As part of a larger effort to bring various PowerPC-related bindings
> > into the YAML world, this patch converts msi-pic.txt to YAML and moves
> > it into the bindings/interrupt-controller/ directory. The conversion may
> > necessarily be a bit hard to read because the binding is quite verbose.
> >=20
> > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > ---
> >  .../interrupt-controller/fsl,mpic-msi.yaml         | 141 +++++++++++++=
++++++++
> >  .../devicetree/bindings/powerpc/fsl/msi-pic.txt    | 111 -------------=
---
> >  2 files changed, 141 insertions(+), 111 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl=
,mpic-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl=
,mpic-msi.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..99a98864bd10c5e5b67112c=
0149fe123b51ca26f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,mpic-m=
si.yaml
> > @@ -0,0 +1,141 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/fsl,mpic-msi.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale MSI interrupt controller
> > +
> > +description:
>=20
> I think you want some sort of chomping operator here to preserve
> formatting.

Sounds good, will do.

>=20
> > +  The Freescale hypervisor and msi-address-64
> > +  -------------------------------------------
> > +
> > +  Normally, PCI devices have access to all of CCSR via an ATMU mapping=
=2E  The
> > +  Freescale MSI driver calculates the address of MSIIR (in the MSI reg=
ister
> > +  block) and sets that address as the MSI message address.
[...]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - fsl,mpic-msi
> > +          - fsl,mpic-msi-v4.3
> > +          - fsl,ipic-msi
> > +          - fsl,vmpic-msi
> > +          - fsl,vmpic-msi-v4.3
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8572-msi
> > +              - fsl,mpc8610-msi
> > +              - fsl,mpc8641-msi
> > +          - const: fsl,mpic-msi
> > +    description:
>=20
> > +      compatible list, may contain one or two entries The first is
> > +      "fsl,CHIP-msi", where CHIP is the processor(mpc8610, mpc8572, et=
c.) and
> > +      the second is "fsl,mpic-msi" or "fsl,ipic-msi" or "fsl,mpic-msi-=
v4.3"
> > +      depending on the parent type and version.=20
>=20
> I think this just dupes the compatible list and should be dropped.

Sounds good.

>=20
> > If mpic version is 4.3, the
> > +      number of MSI registers is increased to 16, MSIIR1 is provided t=
o access
> > +      these 16 registers, and compatible "fsl,mpic-msi-v4.3" should be=
 used.
>=20
> This part is kinda stating the obvious I /think/ but might not be for
> odd reason?

For part of it (using fsl,mpic-msi-v4.3 for version 4.3) yes, but the
other part, the relation between the version and the register (MSIIR vs.
MSIIR1) and number of shared interrupts (8 vs. 16) is only obvious for
readers that have read the hardware reference manuals in detail.

Since it's a difference that essentially depends on the value of
"compatible", I'll rewrite it as an "if/then/else" block in the schema.

>=20
> > +      The first entry is optional; the second entry is required.
>=20
> I think this part is confusing and should be dropped.

I'll drop it, since it's also redundant with the "oneOf: ..." list for
the compatible property.

>=20
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Address and length of the shared message interrupt
> > +          register set
>=20
> > +      - description: Address of aliased MSIIR or MSIIR1 register for p=
latforms
> > +          that have such an alias. If using MSIIR1, the second region =
must be
> > +          added because different MSI group has different MSIIR1 offse=
t.
>=20
> This part is based on platform, so should it not have an if/then/else
> below restricting it to the correct platforms?

Good point, I'll do that.

>=20
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 16
> > +    description:
> > +      Each one of the interrupts here is one entry per 32 MSIs, and ro=
uted to
> > +      the host interrupt controller. The interrupts should be set as e=
dge
> > +      sensitive. If msi-available-ranges is present, only the interrup=
ts that
> > +      correspond to available ranges shall be present.
> > +
> > +  msi-available-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    items:
> > +      items:
> > +        - description: First MSI interrupt in this range
> > +        - description: Number of MSI interrupts in this range
> > +    description:
>=20
> > +      Use <start count> style section to define which MSI interrupt ca=
n be used
> > +      in the 256 msi interrupts.
>=20
> I think this dupes information in the items list in a more confusing
> manner.

I'll trim it down.

>=20
> > This property is optional, without this, all
> > +      the MSI interrupts can be used.  Each available range must begin=
 and end
> > +      on a multiple of 32 (i.e.  no splitting an individual MSI regist=
er or the
> > +      associated PIC interrupt).
>=20
> > MPIC v4.3 does not support this property
> > +      because the 32 interrupts of an individual register are not cont=
inuous
> > +      when using MSIIR1.
>=20
> Sounds like another if/then/else should restrict this too.

I'll move it under if/else.


> Rest seems fine :)
>=20
> Cheers,
> Conor.


Thank you for your review!

J. Neusch=C3=A4fer
