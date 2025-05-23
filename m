Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7122A4C2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747998700; cv=none; b=rhK+aPvCW8OYhplBOZWEG8MnrhHTkLDe1prNtwvMj3FIup/ux8vUuRQM4liVmBS9Yd3YUjN2v/GqU2HNespJlM3EemGOhBrOVG6/oDv2UkzjwIYAdu8u/0xlOsaxeWwPmYC3c2XqF0ZHL0HB3fDEpyBDALBPth/XQg9Usnv3z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747998700; c=relaxed/simple;
	bh=q4FL8KKjQQJN0U0NoEUGRoU4Z3BCiVEiPjPeQldDjiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V967/ENjRGv8tGlPvABTMg85Ldvr97J5zX1/lKIcj4eWsXNZ+RPpjgM9hkKlfkeyg5zZjs2ekWTOZJzm+VfThD1UAJCcqIGgfuCvKELldGnlzxokqQPveaVQEx550QF8u5IE0h4g4rZGOuSgkSr5geGyWk65CB6hsa2p9eNYp9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=AJEVxlkj; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="AJEVxlkj"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso29465665ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1747998697; x=1748603497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4WC61RiFkUHVQjkxgX1BdafAxF8AO9xUQHu1X/p/I8=;
        b=AJEVxlkjnr/EhS7wqHR8SpuMWpdAiWUZ2cSTXsXDgNw/LY4da/fL3uhzfpYDcWVJy6
         FuGUa+C6YBeDBNarZwxLdHNtnda+GYbAWbH6tW0OeKELn0guAtjlTLetLnpwrQtjGDd4
         Z3sdgAnsYwTUJKu6j6XQAQ2PYZPKgcf07xy8SuS0snaSozLiThq415k47y0rQOBFA9qL
         9kNnlDuEsEfxc2z1BTUA/Nw6Zz6URWbX7ZOSd7jzvP+4Kkg4dz+GDEBfiilQBE89iCHT
         njpRqxdVm1bpxRwrhY3B4IgZzjbmhbUVNUBG1ypz3qrQinOp8Eg2hBrgp5SW93aM7JZS
         +WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747998697; x=1748603497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4WC61RiFkUHVQjkxgX1BdafAxF8AO9xUQHu1X/p/I8=;
        b=vHZ5SrLFBdUZ17rwDtUrnUFmE0bMX8EV2jgfwPIXvTWxCUODsJVmi2yLXPmUhYc1Fo
         rxNetJXArAuY3pwylKGxrruELj8FKhs/fsMCkL+SQ3GZJeYiwKqQc0NoifC+57Od0A1c
         l+XWMmq2Dc1XnzIUtRMWydnlfFMq6xl10O+vPatlBvIn6xbizMb64odc0yPrKdNCr/fw
         b/um+A+jlYzjdVjoo8QSQSbmrxKkggzlWYbOZbStzsY8y7KFvwbfl4Whh/Mai3HYJn1d
         d+5WFoLQ+lItxKT3g2PoDaBk9SDgZl2kwMxtVuZkUWkRMmehZVty13qHZ2xk1bCJf+pI
         QVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXmx67q3Q2I/3UPjMqkdZhp0M++qH6XmVLvV/s9XCt4QnXQxVoqGiBxPqLIkhHFPOQSGkJOiQN3VLl97A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbf+oBGdRC+sMlJpWYkCsVzSgCNTc1LqqnWXANHiAJ1VkE70N
	/jtg0W+jTBE0p/+zQuXXYGIdh/DOqhOtT1JT0GJkOB1caSmd0NnyGm45901SytRlqV7jcxX2xWP
	m9/EfU8T0718VWLeNJZCHiBRaakdWm0b1fdy/DAsZGQ==
X-Gm-Gg: ASbGncu+pzmR5JnVqgFqQ/VNgKD7Wqj1NZuPQxLS2RxAx14t1VHpElU4c+uLYned0k9
	1LdpskDGCdhQn9f3duhU4IMiq14XqQRfcK7UKKNZi5FOoHNrYi0wO5NWJCcPuPD8sOQZpsCMzZe
	/f09TUiheut9EyQthk1SBzmHgD1ljVnQJ31VpH15LrIwipLLywytnLL5TpNbVoV0WAOA==
X-Google-Smtp-Source: AGHT+IFRNZi7miN9KtJnFvnUc4Zy/s6cGHuPblLIqkAt0lFI6V+NU3+HwApQoOry4bUApfroElgEDbBR1r2MaDtDQzE=
X-Received: by 2002:a92:ca0d:0:b0:3d8:1ea5:26d1 with SMTP id
 e9e14a558f8ab-3dc932db875mr29989355ab.18.1747998695075; Fri, 23 May 2025
 04:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com> <ab6bfdd7-13af-4abd-94e1-25fb3d0edb1c@kernel.org>
In-Reply-To: <ab6bfdd7-13af-4abd-94e1-25fb3d0edb1c@kernel.org>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Fri, 23 May 2025 13:11:24 +0200
X-Gm-Features: AX0GCFsbE7ylggvJ-1DAkpSiD9h8OYkmNPdxG5wpCpBuy3Q0w-pEjfIGUIf7K7I
Message-ID: <CAN=L63rNgrO1T8t2qfCUxphr_TDA3gSpR2LL=e6oFwore7SV2g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gnss: add u-blox,neo-9m compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 7:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/05/2025 18:18, Alejandro Enrique via B4 Relay wrote:
> > From: Alejandro Enrique <alejandroe1@geotab.com>
> >
> > Add compatible for u-blox NEO-9M GPS module.
> >
> > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > ---
> > This series just add the compatible string for u-blox NEO-9M module,
> > using neo-m8 as fallback. I have tested the driver with such a module
> > and it is working fine.
> > ---
> > Changes in v2:
> > - Modify the binding to allow falling back to neo-m8
> > - Remove compatible string from u-blox driver
> > - Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3=
ca@geotab.com
> > ---
> >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 25 +++++++=
++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml =
b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..215f8931ca08c1b0954fc2f=
70eabe3ec8d89edea 100644
> > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > @@ -18,10 +18,16 @@ description: >
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - u-blox,neo-6m
> > -      - u-blox,neo-8
> > -      - u-blox,neo-m8
> > +    oneOf:
> > +      - items:
>
> Drop items here, just enum directly.
>
> > +          - enum:
> > +              - u-blox,neo-6m
> > +              - u-blox,neo-8
> > +              - u-blox,neo-m8
> > +
>
> Drop blank line.
>
> > +      - items:
> > +          - const: u-blox,neo-m9
> > +          - const: u-blox,neo-m8
> >
> >    reg:
> >      description: >
> > @@ -63,3 +69,14 @@ examples:
> >              reset-gpios =3D <&gpio 1 GPIO_ACTIVE_LOW>;
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    serial {
> > +        gnss {
> > +            compatible =3D "u-blox,neo-m9", "u-blox,neo-m8";
>
> No need for new example, it's the same as previous.
>
>
> Best regards,
> Krzysztof
Thanks. I will apply the changes.
