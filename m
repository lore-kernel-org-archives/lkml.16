Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF7224FA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020389; cv=none; b=WJ8T05PIx5bxk1tcn9TEuiHu3PG1ieip1oiVqt0A9Sj0eOMl5wZzQ4PgSDQNDciuaVMRU/SLoNLasOuA91p5h5JbYVrHL5m5f2xxvsHnrphq0YEs37JC5B1Zu86cEpSK3fEGHjW1uzGRKCeWHnuM2hbfV0bP+d7BWlsf8gm0ScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020389; c=relaxed/simple;
	bh=D070RVSUHFNEMM5cLTiK/qBVP9kEGUZlf1QwY555bQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyv3FvjgT2eBo/O2MBhC9bWWinirv+m0V3j8ltNzyp0sq2lQ78RjeCGWEol1/mckGtVrmxCHYl56BiKWdFoo88ATl6/ocwZXpEsLRRNgQbZHIirmCTAI+jdI0KoO3u+ojER6JkDHnBkxAXyU1pHg5gUiiZFt0kS30nkHxsxpxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fnaPPUQ+; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fnaPPUQ+"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6dd991a0e6so3190528276.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020386; x=1747625186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfWxCu+80YGp3dsRc7TGJltXL61pho9Cm2NBMxTsy1k=;
        b=fnaPPUQ+gHrmtmTqBSiDz3vxifXDoxx49JcVek8rFnAoXa7kHEfKTQuTwwEABfya17
         kDWw2b2XOzNYkTkpxiaYSlhGIs50l+NEFr4W0jn5mN6qgXOqsLzz4Vpj33ivsJtTAGcU
         P2w4kChZUbUdaBg0ZV3fqmlsZmlxRnIWDbaIjMbFYMoFzQdazyhsTkkfPXc67Mlnenbk
         C0wjGfmxEEK0/JKmeLG/lLZwc4wgHGRcNj8RelH1dC37CpzGHtOOgjXU51BguGBIDn31
         Zq5uphmBKT3szJQeck2XSDa59cJwHbsfUorEtYhEzCn2FH+9aSWu1VL/4i4VSoF8+E3F
         G5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020386; x=1747625186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfWxCu+80YGp3dsRc7TGJltXL61pho9Cm2NBMxTsy1k=;
        b=scRTLFCdRF5vH5+xBR/NFQDc4LFPuqGeh6ETBv1fKs8CJm6stYuzYs26anoklAsSFw
         SxXcb7ZzASKxGojPq4mtRaIPk9Q3HR231ocCJkdKaiAOZosJzsTrWTTsg9Ap/bqgl6Y3
         2kaSPRWJVIGGkKBEhR+9/mDaSqLRtbYlynjvd8wFaM1m5vi5trRSCLTFs9K+OHVC/EqL
         e7+OBFIg/jXvi9chzrc/RAD46RQUUSXVeTIJq5EoqeFVg3xGfYk9LKG3HY7CsblDdjog
         VNtjZNq43q6OKmlwcs6Jp9RfdElhjkGQp13GGt7c0C7IlOdT87WdbDt6VidmWlNqhiyd
         LgjA==
X-Forwarded-Encrypted: i=1; AJvYcCWCEklhEdE5vTyYNSpkQTRmUztFqmZfbCUXVXRcOvAl/avBPssQrfR/4X49cLu3KtPA//MaMDhYrt74fQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIOGPIKiEnc2iVfIYtjCVcMfgGf1h55TXjt5ngCz2LRYoJapP
	BVfBwQOGJ4YfrzfmYsEQdYdRxgSW6WEa0mw93rAbCa5TmI0xKM5Wr7SzmANyLOfoivIIb7TBXgn
	w7hXMZlGUjo8ocY8CSSEVg9GhdCOfz7wWLpGbLQ==
X-Gm-Gg: ASbGncuUQzhfjROC23B9/VN0Wx2CRJbInpxS5QmpwS6wQ7BB7EvR7auB3skSd8c8zwo
	oQn/Xf72lFwuWJFdrlw+zUqBwm7Yc9MMfTBhi8hZt9Tey4Z9/rEnaIOckJLEjSiXnkRH5LC1xeT
	u6h2HMU49XOKeuG+iEXH5nMEXirNK3FhUnAbd/KQWYwv4fGw==
X-Google-Smtp-Source: AGHT+IGtkZqxlKO6AHhnqXbF+6aNJ8LJBGHymo3UJ2OpmmMYxoV5MTDsPcHCXmednPAxGy4zAQJR2dZ8KKJ5Sp2Djss=
X-Received: by 2002:a05:6902:2783:b0:e79:5e92:4e2d with SMTP id
 3f1490d57ef6-e795e925048mr7437734276.36.1747020386031; Sun, 11 May 2025
 20:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <20250509-subtract-caramel-08d47ed3281c@spud>
In-Reply-To: <20250509-subtract-caramel-08d47ed3281c@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:26:15 +0800
X-Gm-Features: AX0GCFsOAs79WJzXlZ70CouAkS-8u5dlCMjR_uUuCS_CkqRYe51AGaRcgARazwU
Message-ID: <CAKddAkCqKcnWh1VZ1wN3FyvQb_t+Gt2PeejZfA2RYhTU5A-QeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:57=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, May 09, 2025 at 08:40:28AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> > > SiFive Domain Management controller includes the following components
> > > - SiFive Tile Management Controller
> > > - SiFive Cluster Management Controller
> > > - SiFive Core Complex Management Controller
> > >
> > > These controllers control the clock and power domain of the
> > > corresponding domain.
> > >
> > > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > ---
> > >  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++=
++
> >
> > Where is a patch with the driver (user of the binding)?
> >
> > >  1 file changed, 89 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/sifive,tm=
c.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml =
b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > > new file mode 100644
> > > index 000000000000..7ed4f290b94b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SiFive Domain Management Controller
> > > +
> > > +maintainers:
> > > +  - Cyan Yang <cyan.yang@sifive.com>
> > > +  - Nick Hu <nick.hu@sifive.com>
> > > +  - Samuel Holland <samuel.holland@sifive.com>
> > > +
> > > +description: |
> > > +  This is the device tree binding for the following SiFive Domain Ma=
nagement Controllers.
> >
> > Explain the hardware, not that "binding is a binding for ...".
> >
> > Also, wrap according to Linux coding style.
> >
> >
> > > +  - Tile Management Controller
> > > +      - TMC0
> > > +      - TMC1
> > > +      - TMC2
> > > +      - TMC3
> > > +  - Subsystem Management Controller
> > > +      - SMC0
> > > +      - SMC1
> > > +      - SMC2
> > > +      - SMC3
> > > +  - Cluster Management Controller
> > > +      - CMC2
> > > +      - CMC3
> > > +  SiFive Domain Management Controllers support the SiFive Quiet Inte=
rface
> > > +  Protocol (SQIP) starting from the Version 1. The control method is
> > > +  different from the Version 0, making them incompatible.
> > > +
> > > +allOf:
> > > +  - $ref: power-domain.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - {}
> > > +          - pattern: "^sifive,[ts]mc0$"
> > > +      - items:
> > > +          - {}
> > > +          - pattern: "^sifive,[ts]mc3$"
> > > +          - pattern: "^sifive,[ts]mc2$"
> > > +          - pattern: "^sifive,[ts]mc1$"
> > > +      - items:
> > > +          - {}
> > > +          - pattern: "^sifive,[ts]mc2$"
> > > +          - pattern: "^sifive,[ts]mc1$"
> > > +      - items:
> > > +          - {}
> > > +          - pattern: "^sifive,[ts]mc1$"
> > > +      - items:
> > > +          - {}
> > > +          - const: sifive,cmc3
> > > +          - const: sifive,cmc2
> > > +      - items:
> > > +          - {}
> > > +          - const: sifive,cmc2
> >
> > All of this is just unexpected. Why any compatible should come with
> > these?
>
> It's also not quite correct either, right? Or may not be correct at
> least. It permits "xxx", "tmc2", "smc1" and "xxx", "smc2", "tmc1"
> which mean that the smc and tmc must be identical in terms of
> programming model.
>
You are right, I hadn't considered that case. I'll address it in the
next version.

> > You need to use SoC specific compatibles.
>
> I think there's some slack to provide here, sifive are upstreaming it in
> advance of there being customers (or customers ready to upstream) and thi=
s
> format allows us to accept bindings/drivers and the customer will have
> to add a soc-specific compatible in order to actually use these in a
> dts. I think it's better to accept something along these lines than
> stall out until a customer decides to upstream their user. That said, I
> would expect this to come (as you mentioned above) with the driver.
>
Thanks for the understanding =3D)
I'm hoping the driver can be submitted at a later stage.
The driver that handles the MMIO is implemented in OpenSBI and depends
on some prerequisite patches [1], so it will follow afterward.

Links:
- [1] https://lore.kernel.org/opensbi/CAKddAkD00gLgpzOCXY9mXaebr2qZcU9mkUGO=
Z4278w0bmiLuBQ@mail.gmail.com/T/#t

> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  sifive,feature-level:
> > > +    description: |
> > > +      Supported power features. This property is absent if the full =
set of features
> > > +      is supported
> >
> > Compatible defines this. Drop.
> >
> >
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    enum: ["nopg", "ceasepg", "runonlypg"]
> > > +
> > > +  "#power-domain-cells":
> > > +    const: 0
> > > +
> > > +if:
> > > +  not:
> > > +    properties:
> > > +      compatible:
> > > +        contains:
> > > +          pattern: "^sifive,[tsc]mc3$"
> > > +then:
> > > +  properties:
> > > +    sifive,feature-level: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> >
> > Missing example.
>
> You can't actually make an example that passes validation when the
> soc-specific compatibles are not added, so this would require adding
> some.
I can add a comment here to note that the example should be included
once a SoC-specific compatible string is available.

Best Regards,
Nick
