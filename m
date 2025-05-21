Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485122FAC3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807971; cv=none; b=M1lMJg3O6WnIPdPoM+PBnUkB01X+4Yh7Jsjc5xSKh2BdH56gLE6cuY8zoaM9Yy9F1IAdGLni7Ln/9suJ5/EZrG+8QPDntlPM1etFGnpKxGN21nfKNrdxfUWrFFzdsz/dkf6vZ0nFzWEAU65F5yH2ihv9ZdP5dKD+NYYBWDLHuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807971; c=relaxed/simple;
	bh=jDGkcMHrdQW8PoZ0LZO7UgrSooz0ig2j/E42PfL7bGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUWbjdtTiYh0kcbNZUkNdaEeb4E/tVRuJ89ETRb0A+XeQE1JF1R2z3vng2ZXhrIYerLK5N2I8iOkujGxRvvwssg9ksslRTlVwc0boljGD80gX9g4G1YUc+WE9z9y3WTocLjZsuPhb1jf0jKQa5feOlhPbGGkyuu8HXu7Hz4oHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=RKW4COdO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="RKW4COdO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9453000e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747807968; x=1748412768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC5bi9a3FPR1l0JcG/8Ssakf//mcFlido2AkIaD4UEU=;
        b=RKW4COdO/gMNAxcqv/X1DgKFI6VVXRqKXq0RgckyalPOC3mkWJhcS16Fij27dQUPFn
         iqNZxRFa9bEicE8t97pjtU3asWByR0IhXi5isNU6XvFtcnEO01ozBTScHYI65Qi3H3hz
         MUdvQCEcPQeS6HBui/ReSAmht2TTX3AEr1v686aTp9TF7UBaC8OMsmHA4qyg8A3ZS1gB
         /RSGEQBojX5gVLgP9BRi7HNM8iwrwHyN+RogRMAAlwD5XHRmCZWWamWvxaXRAALREUX5
         btWAT4rGoF/6JLfAE9M5FIikLlSZE8z4Q6ZUmYOJAeXu+zrDsOddmPmCJhBpoVFpYkq9
         HyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807968; x=1748412768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC5bi9a3FPR1l0JcG/8Ssakf//mcFlido2AkIaD4UEU=;
        b=MdyFeuz+NjLxlrZQoL7cKgn6HgBW32lZ1pAA0/0xfHS80l6TVqIddPdOAYuSqU5PaQ
         ih3K2FMP3FcZZyWRL86gGt+4u2w73grlvxriDG3SIlkeXuB6kmCv6gUMgd/a4qdbT5gD
         yfGuz8Za/sisqqfIbwmZcLgI8x5RLDjVBePK/McE5CsDT2AkQ80UTitvfz47hFp/J3Tp
         1C6gxK/r8ahkVvkyZKLWAiHFXSUFJaIBQlJiRZ90fuzfgIdNR4AxhcyLAibdw5eTxJ1H
         hUBqRdNqh5rBSO+7GeK2XG66FJmrhReyqzW18P1+v5Dr/qXZ9/hes2i0fsqnNxUzmbtl
         BR/w==
X-Forwarded-Encrypted: i=1; AJvYcCV4qt9GlYnDIe2ZrI6ra6ETOQTHl0epX/BUug2hDun+QZy9o3Ek9Xi4ZE1X5FtDO9F0caaBhDy8nYOi8BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPaSaLIPrq8YFZZF6w9apx6AGT+2x/1k2O1PERLhSBJ0AQzHJ
	ASLXVcHx7Mey7prE1YoTHtI6+IiV2tSdOdilYCG59j+JsHZ911cZWswMAgOTThMPFzZrpNNqzxk
	XWVuHcsiMs+120sK2tKIi8nVRTHoYgXCWSwFGVFFNFw==
X-Gm-Gg: ASbGncuacY7IS+/8vX/4m0Kgqg43+N1oYJokdUe129RKWMq+uCs5rzREKt/j7HZ7K0m
	sIVbrfwic0s8avxjlzFzvFHIXL9uSQWzvsHtkNSei33FQYYGsXQEhDvvtFb4nYRNm9PZRN6uT4z
	JZZpuFS0lzQj1t9TyRHSFJUVwgHM8NabiEMZYGtrkAoOQB
X-Google-Smtp-Source: AGHT+IFKARCQdM1HLrIEnihUfSXY0RLuVuHDtMwlKOriDZOtnH+UUzAZAnITsP1ZpOOH2Jp6UaEtHGhgljWO/FcWTzc=
X-Received: by 2002:a05:6512:2616:b0:54e:8194:9a72 with SMTP id
 2adb3069b0e04-550e71d276dmr5523061e87.28.1747807968079; Tue, 20 May 2025
 23:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-3-apatel@ventanamicro.com> <20250519172647.GA2603742-robh@kernel.org>
In-Reply-To: <20250519172647.GA2603742-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 11:42:37 +0530
X-Gm-Features: AX0GCFtJLAy00hbWeXR9faFUaINr454pMWu8LepI2bolOypLacOs_uVRABcxLNQ
Message-ID: <CAK9=C2XBkSebjLQJm+uZZfw9ffGGKeGTMxETCUa23RFkuzOdTg@mail.gmail.com>
Subject: Re: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Mon, May 19, 2025 at 10:56=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Sun, May 11, 2025 at 07:09:18PM +0530, Anup Patel wrote:
> > Add device tree bindings for the common RISC-V Platform Management
> > Interface (RPMI) shared memory transport as a mailbox controller.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 148 ++++++++++++++++++
> >  1 file changed, 148 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpm=
i-shmem-mbox.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem=
-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbo=
x.yaml
> > new file mode 100644
> > index 000000000000..3194c066d952
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.y=
aml
> > @@ -0,0 +1,148 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Platform Management Interface (RPMI) shared memory mailb=
ox
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |
> > +  The RISC-V Platform Management Interface (RPMI) [1] defines a common=
 shared
> > +  memory based RPMI transport. This RPMI shared memory transport integ=
rates as
> > +  mailbox controller in the SBI implementation or supervisor software =
whereas
> > +  each RPMI service group is mailbox client in the SBI implementation =
and
> > +  supervisor software.
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
> > +properties:
> > +  compatible:
> > +    const: riscv,rpmi-shmem-mbox
> > +
> > +  reg:
> > +    oneOf:
> > +      - items:
> > +          - description: A2P request queue base address
> > +          - description: P2A acknowledgment queue base address
> > +          - description: P2A request queue base address
> > +          - description: A2P acknowledgment queue base address
> > +          - description: A2P doorbell address
> > +      - items:
> > +          - description: A2P request queue base address
> > +          - description: P2A acknowledgment queue base address
> > +          - description: P2A request queue base address
> > +          - description: A2P acknowledgment queue base address
> > +      - items:
> > +          - description: A2P request queue base address
> > +          - description: P2A acknowledgment queue base address
> > +          - description: A2P doorbell address
> > +      - items:
> > +          - description: A2P request queue base address
> > +          - description: P2A acknowledgment queue base address
> > +
> > +  reg-names:
> > +    oneOf:
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +          - const: p2a-req
> > +          - const: a2p-ack
> > +          - const: a2p-doorbell
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +          - const: p2a-req
> > +          - const: a2p-ack
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +          - const: a2p-doorbell
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
>
> This can all be just:
>
> minItems: 2
> items:
>   - const: a2p-req
>   - const: p2a-ack
>   - enum: [ p2a-req, a2p-doorbell ]
>   - const: a2p-ack
>   - const: a2p-doorbell

Okay, I will update.

>
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The RPMI shared memory transport supports wired interrupt specif=
ied by
> > +      this property as the P2A doorbell.
>
> "The RPMI shared memory transport P2A doorbell"

Okay, I will update.

>
>
> > +
> > +  msi-parent:
> > +    description:
> > +      The RPMI shared memory transport supports P2A doorbell as a syst=
em MSI
> > +      and this property specifies the target MSI controller.
> > +
> > +  riscv,slot-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 64
> > +    description:
> > +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> > +
> > +  riscv,a2p-doorbell-value:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x1
> > +    description:
> > +      Value written to the 32-bit A2P doorbell register.
> > +
> > +  riscv,p2a-doorbell-sysmsi-index:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The RPMI shared memory transport supports P2A doorbell as a syst=
em MSI
> > +      and this property specifies system MSI index to be used for conf=
iguring
> > +      the P2A doorbell MSI.
> > +
> > +  "#mbox-cells":
> > +    const: 1
> > +    description:
> > +      The first cell specifies RPMI service group ID.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - riscv,slot-size
> > +  - "#mbox-cells"
> > +
> > +anyOf:
> > +  - required:
> > +      - interrupts
> > +  - required:
> > +      - msi-parent
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (RPMI shared memory with only 2 queues):
> > +    mailbox@10080000 {
> > +        compatible =3D "riscv,rpmi-shmem-mbox";
> > +        reg =3D <0x10080000 0x10000>,
> > +              <0x10090000 0x10000>;
> > +        reg-names =3D "a2p-req", "p2a-ack";
> > +        msi-parent =3D <&imsic_mlevel>;
> > +        riscv,slot-size =3D <64>;
> > +        #mbox-cells =3D <1>;
> > +    };
> > +  - |
> > +    // Example 2 (RPMI shared memory with only 4 queues):
> > +    mailbox@10001000 {
> > +        compatible =3D "riscv,rpmi-shmem-mbox";
> > +        reg =3D <0x10001000 0x800>,
> > +              <0x10001800 0x800>,
> > +              <0x10002000 0x800>,
> > +              <0x10002800 0x800>,
> > +              <0x10003000 0x4>;
> > +        reg-names =3D "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p=
-doorbell";
> > +        msi-parent =3D <&imsic_mlevel>;
> > +        riscv,slot-size =3D <64>;
> > +        riscv,a2p-doorbell-value =3D <0x00008000>;
> > +        #mbox-cells =3D <1>;
> > +    };
> > --
> > 2.43.0
> >

Thanks,
Anup
