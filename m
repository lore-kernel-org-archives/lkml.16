Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8124E00D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020043; cv=none; b=SSydQHX26QrAoDKrK6NqCbL+RwPlyWM/omE1F0NnLgSIP++QiQOAGH8S54xYi++bLyjnGgHe0b1yvAweCz5pf0LXd72YZOizY32eUL2qYfAVAoxy5yePslkKu5dQlz6Doij7hXtPcdrFPDz7NO97d6BuRucJHOp1KgMh3d1awQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020043; c=relaxed/simple;
	bh=tbvR4aBhUaKwM5oLD63Lampf2s9TElNh2da76gV3eQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBgLOKaSt6pvncQzAtLt3WDMffcgEqL6MesUf+VDXNN6RT4eKxe90ROr1UcCdiFgZseayVHmqwBkghz8DrT3b7hTn5YlKOyZBWnd5tK/CxN1WZ/n6tcOYeIkoS1suewKsqIHQRDj8DCwmJ3MMEjalUT7dKsPlK3BPamY3In17BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LIecAhT7; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LIecAhT7"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7297c3ce7aso3108031276.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020041; x=1747624841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxudKsz+3J/IdOT+mPaoe2sibZSJTjud5OBgAuDoCFw=;
        b=LIecAhT7LpnGb61a6h4g5pwkFucZJ4GfD2P4dEYINfYfGhx3SX8zmBf3tIs1u/rMRk
         2YPVD/BfDQ14SmxscVwvT9HJxLwrbapBcg/5Bgqgl/y0QjxRg4XwaLxK0QbnWb7Q5M3k
         WJf8CrQQMjuLn8IhG1rc0zLLZ+T0NnExD11NnQm6fqeKFjSUIdr0PNeAE5hfaZeR7KEs
         FPBXG+SIueLNcVT082ML589fHlgqHgwUN+E0mOP8oqGvQeNG4HmQZmVMMdhWlZh/q42U
         owe/WC8UiEVc227+8EIdGvuWdeW53vdOTRIE/KlhvTMYB13t4O6uHM8QYBS3pJvOPe/j
         KtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020041; x=1747624841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxudKsz+3J/IdOT+mPaoe2sibZSJTjud5OBgAuDoCFw=;
        b=t91fCIdM/X00tE24JzUwqNNtGTISDCdniIpI2xfHcbXYcKQsiYvygw9S0zxwEh3TEs
         jFC2Ou9JQTSQ7oPJey9/v1Y/8zky1OdQYuBBoj2EumH3uWSwhT+nEhFBdX3I9wDBuGeB
         +Q6PTqtCvkVp0nwgohkyP49KEzu3TPgFe6mp0f4MRb4HUU1TzQtoure1CnNqaXWthe+t
         0fEdFf9T5jpCCjhF/8eWIYc2WhzqKMLE9VVrMKd7w3GiXmee2/KWMEv7U27rA4WnBL2g
         haqWwD+GJ7LncSgpxF7Yg5nkPRJAGoa1YDKBFXLPilJORIEVJ9Bu/hCYYA0pWgBWYVls
         7Fhg==
X-Forwarded-Encrypted: i=1; AJvYcCVfclG+Q7jrAvbn83BUmA+OSuCJBJgS7Mb9XtARmvmtAF9PLsVyUur6ev7RNG1BOS0MtTvrffUXu58TFxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tGMRR67MnvKWwRpVHk8wlJ2mctr31lWTsSSBnXSilUv4Bo4l
	ga9nM2XCdkulP9K1xOq49ytT/dkEJVw9qswjJsTE2XsVuKUdXAX0+Wia+5qkYlXnpvHt/A+yZdn
	XXxmdPbp4FeOWZiYomarbS7R9D3dfpn5V4LoOJA==
X-Gm-Gg: ASbGncsCXvDkGp55PTqnxMfNfbis36njeBX6C1feXzP3L01DCslK3IHkPrs6i0vW3hY
	NKZydpg5zFFq9qGB4VzbPJ9lYp4hAYOlJsspDa+xwtlNX7q9ikk5QLXNOyNuLQ02A9jIp0EOnEa
	v0xf2lQWQPpudnu/78FGcefXe2MXvrOMf/UaQ=
X-Google-Smtp-Source: AGHT+IE0xIYfUGZo/YgGsrSlwxUw7mp79GUZ45r3jCggNaOdaPZ7cYhKUcVZkI4NriZh+pfJqDPPxMYLuK5RKH/XqQk=
X-Received: by 2002:a05:6902:220f:b0:e78:f9ba:c33b with SMTP id
 3f1490d57ef6-e78fdc4cfeemr15242192276.6.1747020040729; Sun, 11 May 2025
 20:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
In-Reply-To: <20250509-small-graceful-limpet-d0ea41@kuoka>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:20:28 +0800
X-Gm-Features: AX0GCFsS2gEyScQIGoz4ks6S0LXYdUW88ZbHxUZwrMH2V3H8XC4xlgJod-2gaA0
Message-ID: <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cyan Yang <cyan.yang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> > SiFive Domain Management controller includes the following components
> > - SiFive Tile Management Controller
> > - SiFive Cluster Management Controller
> > - SiFive Core Complex Management Controller
> >
> > These controllers control the clock and power domain of the
> > corresponding domain.
> >
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++
>
> Where is a patch with the driver (user of the binding)?
>
We are hoping the driver can be submitted at a later stage.
The driver that handles the MMIO is implemented in OpenSBI and depends
on some prerequisite patches [1], so it will follow afterward.

Links:
- [1] https://lore.kernel.org/opensbi/CAKddAkD00gLgpzOCXY9mXaebr2qZcU9mkUGO=
Z4278w0bmiLuBQ@mail.gmail.com/T/#t

> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/=
Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > new file mode 100644
> > index 000000000000..7ed4f290b94b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive Domain Management Controller
> > +
> > +maintainers:
> > +  - Cyan Yang <cyan.yang@sifive.com>
> > +  - Nick Hu <nick.hu@sifive.com>
> > +  - Samuel Holland <samuel.holland@sifive.com>
> > +
> > +description: |
> > +  This is the device tree binding for the following SiFive Domain Mana=
gement Controllers.
>
> Explain the hardware, not that "binding is a binding for ...".
>
> Also, wrap according to Linux coding style.
>
Thanks for the advice. I'll address it in the next version =3D)

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  sifive,feature-level:
> > +    description: |
> > +      Supported power features. This property is absent if the full se=
t of features
> > +      is supported
>
> Compatible defines this. Drop.
>
The property depends on how the IP is hooked up to the rest of the SoC.
Having this property simplifies the SW and allows us to use a single
fallback compatible string, so we prefer to keep it.

Best Regards,
Nick
