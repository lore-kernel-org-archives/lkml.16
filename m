Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1125C813
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749532851; cv=none; b=Gdt7+izMiWaUaZ6iuVRmOHECz3x1jNYO4kFYz1POjkO6X+sr0E+9O3zEvnWnY5BkOQ7fEyHvGABMtS+p1d+8tOyT/g8bTSLtBKULove9UOPDSrNgPDBzwOnhY7fv7TvLNAP/zXAfKsbIn6kl8i9pVwIXkDfxEtQG8zNYmRvUisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749532851; c=relaxed/simple;
	bh=2oite7cEAOqYfMc15nQ7u1+djDNCxUal8aR0webzx4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VStF0FyL9P5uCPmis5qk6OApR9UkR4YfOWzgncgX1DUqYdbgxtHzOfeHaU7pzFDmMw0TTK67CbQqCgFRZzjX3C61HPNJfAGKQu++AsJD1lrwpXD4mVLgQn2rLQGPC87EDW2uQmwfRGio6ihJk5OiswxAOI/vR3Wb3YxQc81H7Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EkRedGyP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EkRedGyP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532a30ac45so4648586e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749532847; x=1750137647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmTF4qV0RYmWw+ybuIh+3cVh2LX7i9DDgBKJzM2NILw=;
        b=EkRedGyPsJ8OvpgBSnXKFTd+FxJ5xf/TSqTJks9lm436dJi1MJKRzGleMBxiQztrOz
         9SQhjQJcVDtqDv6XiY8DxZUmDOBfpi1raH7EK7126zPCH4IoGcZBTLvQBH9IHpDVz3uu
         dPvTF4LQbpKIhF6mPJgDjiYnJp6E5sD9iRz9UTW9mIZBbyxD8bpCeL0I8PEFZkBFgZgH
         2p/q8brLUDTFgchiheuYevPtHdFO10xJLpU+NIVASQwjtMjgCfyJuR0TwyNHGx+C2P6j
         TEeOQ+EMeXJLhcgZ6hYou/p3wZbVfGGa18CFM9zmsJeC/J5QQhW3AKYNYL5NyLyQi+g/
         9VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749532847; x=1750137647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmTF4qV0RYmWw+ybuIh+3cVh2LX7i9DDgBKJzM2NILw=;
        b=ZpKtiWGKpVVF1qGdW3WW7wHFmYTeEZZ7bqjDDHgibKgP1QUG/LTVEpBqlfxTaclUjq
         9W5GxZAz/DOohOh9oBnehtTOovO0A1E/P055MY3pXTumZLGoJXUvq29Zi7hyVhu+WZBC
         071fsYbOCj7FYhNXJz9spsXa2cCfFvdNxvA0lP9YeqK1NFuJRYFXWvO36MyD4J2+YzPV
         heI2Bvqj3nZJRzI5ccS91vpgJ7pBLAsRmcqqOT4Y7CZIjIBY7i3+0uQPSpHoHjsYFKgr
         3ExWyFQr2AfisYQONxDgQLda6luUsSqH6RG9jA1wLZ/MQ0JzeEEAnzNGbh2jwY8iGRgn
         QmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUodJYGAJj3uAwkV9ftsL3WWHQF9GumOFJZq+VipDcA8MGv4b45XadhwF3A/YtRjiIA5RRom+/YB8+3PLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaULx/gjAnMrYnKRmGgou7HNGjBrV0Wag14jcdAzQrOZv6NYnf
	GzDGYSCk3weiNmQ1wW0HdX28daYAnuSAeeEzrFF3ENptQxd7rXtcwPl2Z7FZxu1vifnuyKFtwUq
	4C0q347+QRiQv7C43/LmGJh/LOfttbmURYUqOr8PMlw==
X-Gm-Gg: ASbGncsFr8ZE1S/Zeac5pbP5FTzNwRK23Zvmy0ABI3zakRZUzTphJhXOdsIFgl8/XPi
	k0Vuu3WhAamTn71psPyx4HgRjMM0ENZ5zEgaozm2TduaP+iWIydc2s9uIA2WE+nHyLHuIoLiAde
	oio5dkH42W83CPEAumQ6c9L9mPkcCKaTxhA6Ce9KvS45HF
X-Google-Smtp-Source: AGHT+IE3kgKkVTatiXjLhBs2ID8jLzFcQgDLrCorEvfhipa1LZ7VqXob3i0ScHraWw7Nta7tAX4V3YYaxNtr4ZvTZ0E=
X-Received: by 2002:a05:6512:ea0:b0:553:660a:4c9a with SMTP id
 2adb3069b0e04-5539316961dmr599951e87.9.1749532847227; Mon, 09 Jun 2025
 22:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-10-apatel@ventanamicro.com> <20250530-squatting-chatroom-230f035f18ef@spud>
In-Reply-To: <20250530-squatting-chatroom-230f035f18ef@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:50:34 +0530
X-Gm-Features: AX0GCFuSkYjuAn0nKTg3vjMOZr-vbcntRpWviUWfwQSNW1KeC5eZy6YDX8Ko6Mc
Message-ID: <CAK9=C2X1svSheL8KFF40vXT9Fc2a5_zyX4PzWRkcR44rd3KmBw@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, May 25, 2025 at 02:16:56PM +0530, Anup Patel wrote:
> > Add device tree bindings for the RPMI clock service group based
> > controller for the supervisor software.
> >
> > The RPMI clock service group is defined by the RISC-V platform
> > management interface (RPMI) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-=
clock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.y=
aml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> > new file mode 100644
> > index 000000000000..9c672a38595a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI clock service group based clock controller
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |
> > +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> > +  messaging protocol which is modular and extensible. The supervisor
> > +  software can send/receive RPMI messages via SBI MPXY extension [2]
> > +  or some dedicated supervisor-mode RPMI transport.
> > +
> > +  The RPMI specification [1] defines clock service group for accessing
> > +  system clocks managed by a platform microcontroller. The supervisor
> > +  software can access RPMI clock service group via SBI MPXY channel or
> > +  some dedicated supervisor-mode RPMI transport.
> > +
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +  References
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  [1] RISC-V Platform Management Interface (RPMI)
> > +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> > +
> > +  [2] RISC-V Supervisor Binary Interface (SBI)
> > +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > +
> > +properties:
> > +  compatible:
> > +    description:
> > +      Intended for use by the supervisor software.
> > +    const: riscv,rpmi-clock
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport or SBI message =
proxy channel.
> > +
> > +  "#clock-cells":
> > +    const: 1
>
> Could you please add some description here as to what this clock-cell
> actually does? On a normal clock controller someone might cite an
> include file with a huge list of defines for what numbers map to what
> clock. In this case, this value is CLOCK_ID in the spec, so it's
> completely platform specific as to what they mean so citing some include
> isn't helpful, so just mention that it is CLOCK_ID and the meanings are
> platform specific.
>
> I suppose technically it can be something other than CLOCK_ID, if this is
> used when the SBI message proxy extension is provided by an SBI
> implementation that uses a non-RPMI transport, but I don't think that's a
> can of worms worth bringing up in the binding. Anyone doing that can put
> 2+2 together I think.

The #clock-cell value must be the platform specific CLOCK_ID as defined by
the RISC-V Platform Management Interface (RPMI) specification irrespective
of the underlying mechanism (e.g. SBI MPXY or RPMI transport) used to
access the RPMI Clock service group.

Each platform must publish their CLOCK_ID values as part of their SoC docs
or as a header used by their SoC DTS files.

I will add "description:" for clock-cells along these lines.

Regards,
Anup
