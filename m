Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78BD25D212
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749535791; cv=none; b=cAt2gTl/BuRtQPK4b9FSMv2+SjryJr7iLOowVLBNm8GxN1d+Q00YTPqsHRQb0t4J7S8BJowRPYQHK84fM5b3ETxfSXldniAwojICRpkOh6EOssq/p5I+Wuv8nOOUNFEXmzfix+VTkkmBcM0+MyhPS4dqHUVzMydr7WChIFifaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749535791; c=relaxed/simple;
	bh=deL0AORLTTGY5BQlHNdX7DRyFTNvXJD5bCgwvsWjOdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxJWwAwPKM6EgTyIChMerasTr0dypIsTXKh0/WfNcoS3zvXqHOVkxe1M9kcrwrsQe8jzlnMqRdSXMntJcBh23135CPES+b51NQe4yMpHVeUYfk4tTrn1uXpOn3c65aK/blqOLLEPtrNxrMmY1LumtumrkTRXq1arIRnnkGIlRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=asStmQI+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="asStmQI+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553241d30b3so4670859e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749535787; x=1750140587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=asStmQI+gWGAHT6yjv5ieGkbDd/Z3pWnsiNvGwdGPxz2Snt1RJEWmMUpk0nbjcU3Yl
         t5ZIul5ov8rVh2T6ew+trJc8WG5rBckLQlI44dU1k9JZgE2Ihn3bW3AwnDCRInONnl0A
         +SLiLlbZlTzXKdrJGAqtXU4PNT5ymKYJaDkLqRoUNbQy428fcjdmg9rGQ1XXDBBEC7NB
         f615GW4jYOkyjVFclgZwYxoqFQDxD/As7mw5GvMiNryi8zSN9QwbGmR4YCyDo+aIVkrB
         sWwVNOBWGOAjJ7oH8W1f/LiLCr1xmbC5DvZdXjccovXPwWyRP6FyVqtLyj01d2IV/q5x
         oB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749535787; x=1750140587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=QCZqk3u8TT07TyAtGB/WHCBT6P/7KCqqpK+Awq5MtZIHFozMIZUK/HYV97gjRkobJT
         x/6AR5Hb31ajwU+LySNNWskAGOTMD3doVAchgEUY1xb1MBxc5iGd/QqBwNWUa3VO13Fn
         5jmM4Fx34h7rKpGBB3Sv9zvxy0PoBPF3HtnZHdik/zOa1FYDANO4cUEXmE44Kapb5yB6
         BkRL2QhWq0IGyMTJ2MjZyAIsQBqha/efp1ofJy94cGmsWi5xEJX7kzT7ga/fTvuJyboQ
         ba8wsBipNRoDCybCDPesXcajD0fyKVu8s17AChuwU2J/BG/I07FnQWkoyB1+yU0FNfze
         t48g==
X-Forwarded-Encrypted: i=1; AJvYcCUww8rAU+Ij40JzZBfQlXOtqTe5t9KfqT0kVS/qU+bWqF/ppJwDEF9aG8c84vSZyFhJ4HAVNPx5KhWbdgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1R47WrprRX7+S2Fkb9bEC7y0WoP51P45vVrJ+1l0nLVGWPs8p
	BmRDvol9keC2uXiOx3hEBFbbe+oT3FLi6QA8piOR8C9zs0WmYsM5A3fh7gspH8LJ9O5lEy1pEWl
	oDYSPLmJg/tJ1F/6tx3vKsjZYnuN1cxV6JEHNH2kdsA==
X-Gm-Gg: ASbGncsb8eRRCDqAG0ac4j8YCIjHzBvzodaGKrmn8LBvzGKFQrdIiJcpu4QGS+VCoGz
	wChT2X2+YNBg9kmHCGPxRzbEp3InCKH8fLUaTwm45FBbY4bpdIY5UrIjqSjJJSgttfHbjUtczQH
	+egR9I260GixGattDndq+QNW0B6KLayw5dcLoeMpZbT1eR
X-Google-Smtp-Source: AGHT+IGkcoUE3xlnQMYl1o7j1hnkz7cT7TnZBE2tt+E9xu1wPE99h1iWmlxxu85+hyVu269VB3sueRiisqT0j70UOq8=
X-Received: by 2002:a05:6512:1387:b0:553:2bf2:e30b with SMTP id
 2adb3069b0e04-55366be6735mr3903750e87.18.1749535787322; Mon, 09 Jun 2025
 23:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-12-apatel@ventanamicro.com> <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
In-Reply-To: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 11:39:35 +0530
X-Gm-Features: AX0GCFt-V6DR7WSCvS_15t_rjYO_PCMDY_MmyOZ2P-IZ0Vijw-NrT_XPrxpCJ90
Message-ID: <CAK9=C2V7E5dmJdMffadXOo839945XNRT_mMKcVfT7bTDz5fBZA@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
To: Atish Patra <atish.patra@linux.dev>
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
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 4:29=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
>
> On 5/25/25 1:46 AM, Anup Patel wrote:
> > Add device tree bindings for the RPMI system MSI service group
> > based message proxy implemented by the SBI implementation (machine
> > mode firmware or hypervisor).
> >
> > The RPMI system MSI service group is defined by the RISC-V
> > platform management interface (RPMI) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   .../riscv,rpmi-mpxy-system-msi.yaml           | 67 ++++++++++++++++++=
+
> >   1 file changed, 67 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/interrupt-contro=
ller/riscv,rpmi-mpxy-system-msi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-=
controller/riscv,rpmi-mpxy-system-msi.yaml
> > new file mode 100644
> > index 000000000000..26dd13731350
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi=
-mpxy-system-msi.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpx=
y-system-msi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI system MSI service group based message proxy
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
> > +  The RPMI specification [1] defines system MSI service group which
> > +  allow application processors to receive MSIs upon system events
> > +  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
> > +  event, memory hotplug event, etc from the platform microcontroller.
> > +  The SBI implementation machine mode firmware or hypervisor) can
> nit:
> The SBI implementation in machine mode

Actually there should be a "(" just before "machine mode ...". I will
update in the next revision.

> > +  implement an SBI MPXY channel to allow RPMI system MSI service
> > +  group access to the supervisor software.
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
> nit: Refer the latest frozen version of the spec ?

Actually, we should specify the spec version number in the text
and avoid a specific link because the link of the final ratified version
will be different.

> > +properties:
> > +  compatible:
> > +    description:
> > +      Intended for use by the SBI implementation.
> > +    const: riscv,rpmi-mpxy-system-msi
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport.
> > +
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software.
> > +
> > +required:
> > +  - compatible
> > +  - mboxes
> > +  - riscv,sbi-mpxy-channel-id
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller {
> > +        compatible =3D "riscv,rpmi-mpxy-system-msi";
> > +        mboxes =3D <&rpmi_shmem_mbox 0x2>;
> > +        riscv,sbi-mpxy-channel-id =3D <0x2000>;
> > +    };
> > +...
>
> Otherwise, lgtm.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>

Regards,
Anup
