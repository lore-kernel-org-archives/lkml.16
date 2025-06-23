Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165B4C74
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750650375; cv=none; b=tpa0mCz188lvrEOe9dbhffUk7tvX8ALfY2aq8Y2b2ZZAom2rU9x0BvjSTtr0IPbo6PU3Kw7J5GhdlGNy9fNWPwunTtqFuRlJ7437IR4oZs8ecihp0ETa4EC0APxWpqqiRufLuARuum7XFGIe0xby9ygnwkXHngNJO7kkeJAX+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750650375; c=relaxed/simple;
	bh=ulYSEjpBN4splYt8fIcoHLxT6OWXfZLBf4RXhizV6pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICK0UXeHKoeJsu4r5huYSNEaUa+N025mo7a4Q06QqE9uS8UJmyDRYoYiTOPJt4vyIHVZKbl3xpmuGMbD/LQOhpumTUd/fDkLhHtguq1HDLnJoeyQY9+8wzsyq4Et0f5KIH6MReFus0qLOIvXkOuxfBbwQe7NFynRe9wOlqardMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pmbsGm+5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pmbsGm+5"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so5243621e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750650370; x=1751255170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=pmbsGm+5EDKCMB0NOkVIKYZ90Moz/WeMWBRFQ8epbUTMutcCmczOlynsB0LAtursOT
         ZDsOUSwJfFNpGX6g9tOP52P5onv2jKDLiGUJGMz7NMbJvl/ZbwxAcUMTGJRWVBaA6QmL
         tFNFa/XjEAzLprvpgTFHcvct6sJwJMNJfHciEJYzD3FDlosx+/JO5EFZKTHDNYvzpuhN
         gkePAtcZZlFbem9Czuc21COJcLOTPKhocTmCSyWYS27GC2e9HOWMUqSzv6jZCIk53DCo
         RcVqvxNwq+TU0RrUFMy3+Bc/sK+GrUXGiHqOU7CgJ6CQlpB+vY2eGa2yumGGxq0qoYCD
         ztlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750650370; x=1751255170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=gBapfOXoLlUaARNcRKTWQcIOlFis6BS3eIe8WPVwEuVfJ9ZcrnMaSt0lUjbE5mXO6d
         IHrMllukW3QrlQrxWeoTj5NIb0cGGtoL0okdRotWD7e+9PDGY2myRgG2XWS+M8hDbGTE
         whq8G0xuAg2A5hcWmfvUBo+2Z++/oQdMp6etDjdhb/1tguIIs15ptX1FAYlH+RSoxq3W
         /elRuS49IfYe8Y/pzHzD1Qf2gpK/1oQhfQcSwep8l+6IiHxmO7cyNRG/d8F2g1i8BBqy
         VNB7Qbn/TROlMvvMegXsDmGUy4MRWDh0vvqa6+ZbCsM/WYCFWV1FJp19FGOGcpfkgFPf
         AM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHulV32HlszJt+1gduh1ELVgVK3Ch4EDOiGmpcQ04BrAwhqQH7A895APaSoCn+UzPnIo0f6nTq6XgMKak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfOxj+hc1VZ/fZj49VwoDfwxS/wBjzpqCHyHXV5wZduWo2TGH
	Q6wk9UsScSjXR5iFX5EXHA1UwfNgbqEL8cCjT6DgC76PwwwpK1ZMCJKjuCGn1VH2Wh3d4RC8TxR
	H/FOOtc/cDI8Z/OmzmcitRSVdkWTPOAIXcq7xjM17qQ==
X-Gm-Gg: ASbGncvFvRxpbZ7UZRbVrHs80MnRkdGubvDyX9EuwFA2DdaRYwTMZitaZJ34EkPM0lK
	zvORsqI8U+76tQy3z98unrXkRoYzgrwykTUHN/isL03Tp97wjN+9eKtl1M1vSnutFkotSfRTtYJ
	uNA/Kj0jSBMAgfIuszKPYmAa+YLMeW0XYHIZFNbP81yl15J/cj+1e/GA==
X-Google-Smtp-Source: AGHT+IE0Jkesv6pAtTAvnI4YAZPll7TdweNoY+w50jD3bpHSeBhHHCGGisCxbc8QIYILMjmd8O72zuctCezkc0bAqvQ=
X-Received: by 2002:a05:6512:a8e:b0:552:21b9:8bae with SMTP id
 2adb3069b0e04-553e4fe12c4mr3138959e87.7.1750650370384; Sun, 22 Jun 2025
 20:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-8-apatel@ventanamicro.com> <175053960304.4372.5933123695583752824@lazor>
In-Reply-To: <175053960304.4372.5933123695583752824@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Jun 2025 09:15:59 +0530
X-Gm-Features: AX0GCFvKul9rLlA0ewcROor8dZBLyfCt2SyRm-GbcQtvCrJAULk_IJwmPLxWSvQ
Message-ID: <CAK9=C2WutH5+3eNvMpD89WhXdNaJAJVz=h5r6c_Jc39nBx9NEw@mail.gmail.com>
Subject: Re: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 2:30=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Anup Patel (2025-06-18 05:13:42)
> > diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.ya=
ml
> > new file mode 100644
> > index 000000000000..70ffc88d0110
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yam=
l
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> [...]
> > +
> > +examples:
> > +  - |
> > +    clock-controller {
> > +        compatible =3D "riscv,rpmi-mpxy-clock";
> > +        mboxes =3D <&rpmi_shmem_mbox 0x8>;
> > +        riscv,sbi-mpxy-channel-id =3D <0x1000>;
>
> Why aren't there any #clock-cells in this clock controller node?

This binding is intended for M-mode firmware (OpenSBI) and not
for S-mode OS (Linux) where the firmware will use this binding to
probe a message proxy driver which in-turn will allows the Linux
RPMI clock driver to access RPMI clocks via SBI calls.

Regards,
Anup
