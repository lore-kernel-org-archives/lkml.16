Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2A1547CC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692682; cv=none; b=AJwIANL2sXllpLaQEP73ITD4jVj7Qn9lpHlSnZ9/3Hpld0aFDIHRj9w6352Jk7l6zca8MecMxmLAPxqjFlLk7K3QAKhZKo1P/fpw2oEeMeQSGC5H4MFI2aLNvpiIwYg7MDNjsSpEJ2x5I2b7U5S7lz3kteiu/sRmS9nCHfrk8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692682; c=relaxed/simple;
	bh=FwB48C92tnVCEdIyHZlamtIixxVon3uYizSE7TbXBRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta57nTBJi+hPTvAFPys18X+oQubsH8xm/ARqRmrK7/fr6dmQ7wGba8Z5RuLIwJkTlhrDX1N38A8toVmkKK8+Zdmii3jwG82vNuZXt1FLNSZKuZExsMfwNiXmcR649nSLNTXykF6fEd20HGdNPaXBeJBu6ajENF2BMZ5Upb2lRyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UaJ1SaFp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UaJ1SaFp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so1026594a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692678; x=1750297478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=UaJ1SaFp/vwlrqIMqaZYWeHnvhJmdzCuHTgu+R9vPuH54gj6TtYWBvOZgRWZW+Ju4G
         4RUi0UQk1WUhDLgQEOM1kzgSyT/C98Achso9c3YnIS2FrTKklEJLm2oSr5UTGQIxhLQG
         Ymous/9w8SQoivlyHZnA49qvrj+hWrUWsXx0WtTyfia8CtNNjA4o8qobuArElEuzzQCe
         ZVM+lgfvpxGFcyDiwH4ZhIM4/2pZm8H6vXm6q/7B8bOKMaKWWiimIkEpXvO5TAeYrwI9
         QNcJcj+Mc9SLeMmsoZOlPDQNDjyu0iMGn5yk9YQVC1Fb1uKz0zlJKctzJbNbSAXpFFH2
         fFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692678; x=1750297478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=tlub2Q6aPobDBBeuk8pFl02udtF6TKIcQaQqJAwBH5dG8zF6KBFQ9gBgwhsieLJvYZ
         P0IefbiCqln3H5uN7QIz8xydo+AazcICzOMf70QL9wF9bYw0V/uzKzj3mXnc1tbxRuXt
         YEsIf/If2baMTSKL3x7nWSZu2xiWQqbOUMoRmBpDPN3tQBnYB0ZJRFo0gTDBV+w4AgBx
         sx9T8wVzkSDS89etrZJXtWPD75ohaWRmNR8Dinl/Lofxwq306Eobv0czUqBDeHjmnOBQ
         GV3KwBChyQ2o78yWv7raJjFBS9a6s7ATkg6gikjQMMfSR9hDdoWGOSMbv8cJM/O8Rcq6
         ZTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Fp6mfilFYP8Lk7VU4e/RY7hufVUO+ItvKqQWdw4Jn6FfSEhvsr9HeInAVH444mKumdj3aZqvQG1WimY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAumTBGzTgOkUzwK2kt/j2wRiZDi5a8lXQRXaiwcHVA6J6fuQT
	AwilPi3QBygjYTyzlFAu207b9GjgWz9fJJ5ftImKO+yP6IhHpd9Up6JvFwgAIROAz63eN/NP9JU
	K7SnfaQKVZLN++KW+4aUVlK3beXq1IbcXjenIzwbBtw==
X-Gm-Gg: ASbGnctiPe2dgOJVQxU9BfmvdSPGjQsrHt1A8qGpEafEPHJEZYR080K94hevvtQNnYo
	Ie8lmtUexyqZvVLl4YvJ+HoShZb6pHsjZVi9MIU3agxsCJKLQXrmxNYE8mn8frxttZzTGF22tJt
	AOWln8giDySnTtc7phdxZhgKEiqrgy3j1HjSWgMzk+DoL+fn+s3DLiGLo=
X-Google-Smtp-Source: AGHT+IF6ozO6AyxwG4za9A7i83BSzRL3SEEnwk5MfwoXwPW6m7AZDLNJEhC2j3KTRCG2+36HHH9N7IUrHjCnjqIf3Hs=
X-Received: by 2002:a17:907:7fa9:b0:ade:3a7a:26cb with SMTP id
 a640c23a62f3a-adea9a5a8f2mr111569866b.58.1749692677584; Wed, 11 Jun 2025
 18:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud>
In-Reply-To: <20250611-kabob-unmindful-3b1e9728e77d@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:44:25 +0800
X-Gm-Features: AX0GCFsy-sakH0jotNRCx536oNAS4R_g03uEq1Dp3TLhuOr7_lBJgrQdKtIkepA
Message-ID: <CAH1PCMYBPOerGKhMGUi_4AD-abF9wce2PgFMSfzi056FJvRJgQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Conor Dooley <conor@kernel.org>, duje.mihanovic@skole.hr
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, elder@riscstar.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:27=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> > Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> > controller in the Marvell MMP DMA device tree bindings. This enables:
> >
> > - Support for SpacemiT PDMA controller configuration
> > - New optional properties for platform-specific integration:
> >   * clocks: Clock controller for the DMA
> >   * resets: Reset controller for the DMA
> >
> > Also, add explicit #dma-cells property definition to avoid
> > "make dtbs_check W=3D3" warnings about unevaluated properties.
> >
> > The #dma-cells property is defined as 2 cells to maintain compatibility
> > with existing ARM device trees. The first cell specifies the DMA reques=
t
> > line number, while the second cell is currently unused by the driver bu=
t
> > required for backward compatibility with PXA device tree files.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml=
 b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > index d447d5207be0..e117a81414bd 100644
> > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - marvell,pdma-1.0
> >        - marvell,adma-1.0
> >        - marvell,pxa910-squ
> > +      - spacemit,pdma-1.0
>
> You need a soc-specific compatible here.
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -32,6 +33,21 @@ properties:
> >        A phandle to the SRAM pool
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  clocks:
> > +    description: Clock for the controller
> > +    maxItems: 1
> > +
> > +  resets:
> > +    description: Reset controller for the DMA controller
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    const: 2
> > +    description:
> > +      The first cell contains the DMA request number for the periphera=
l
> > +      device. The second cell is currently unused but must be present =
for
> > +      backward compatibility.
>
> These properties are only valid for your new device, right?
> If so, please restrict them to only the spacemit platform.
>

For clocks and resets, yes that's correct, only for spacemit k1. I'll add
conditional constraints to restrict them to the spacemit platform.

Regarding #dma-cells, it's used by other platforms too. You are right that
it requires clarification. I should have been more careful in my initial
analysis.

After reviewing the in-tree device trees and driver code, here's what I fou=
nd:

For PDMA controllers:
Both "marvell,pdma-1.0" and the spacemit pdma use #dma-cells =3D <2>;
Handled by drivers/dma/mmp_pdma.c with _xlate() callback

For ADMA/audio controllers:
"marvell,adma-1.0" uses #dma-cells =3D <1>

"marvell,pxa910-squ" is not found in any in-tree device trees, but based
on the original TXT binding [1], both adma and pxa910-squ are "Marvell
Two Channel DMA Controller used specifically for audio", and the shared
driver code (drivers/dma/mmp_tdma.c) also shows it should use
#dma-cells =3D <1>.

So, I'll add conditional constraints in the allOf section.
For "marvell,pdma-1.0" and spacemit pdma, #dma-cells must be 2;
For "marvell,adma-1.0" and "marvell,pxa910-squ", #dma-cells must be 1.
Also, as said, I will restrict clocks and resets to spacemit only.

Thank you again for catching this. Let me know what you think.

Link: https://lore.kernel.org/all/20240131-pxa-dma-yaml-v2-2-9611d0af0edc@s=
kole.hr/
[1]

-Guodong


> > +
> >    '#dma-channels':
> >      deprecated: true
> >
> > @@ -52,6 +68,7 @@ allOf:
> >            contains:
> >              enum:
> >                - marvell,pdma-1.0
> > +              - spacemit,pdma-1.0
> >      then:
> >        properties:
> >          asram: false
> > --
> > 2.43.0
> >
