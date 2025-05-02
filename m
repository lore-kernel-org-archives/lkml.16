Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D3155A4E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177326; cv=none; b=cLG3FasxASA8Kn1Mgfsu06enGo6zbXbxm/EIDoC2T7snil9N3BhpS5UM2t7gD0C0yOUzzcSQ+AbDCbOWH0XXx2E3R0kZV5Wivgd6OrQCzynd2Fh9SLxMu+LpCZrCzko9X+qX53N9INDqoBALENtwSXedOuo1GtWKxPho/hW/ScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177326; c=relaxed/simple;
	bh=6bEpawpXIDzZfqyu4PYlTXodaquhp8PzImJzwv3zh4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+TGW7G8Es7vZAxYJwaB1WYIG2uSEQSrO0+6i168fj6+E5so/KLxGv3aomxoaAjUt/AR58tfSxuVVHy/X7nWNzE0U7rXqHCdYRgFxle292MhLDcGNixAyE9morCQ30np7jGGFVL9tQnel9ET5aMHv1GdC7hJPWH0NgK+qWWZ3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ImFeBpZf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ImFeBpZf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1910153e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746177319; x=1746782119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySX9w+oPBio7ccREiLDzIFMncjou8m/kgRIbKYHKSu8=;
        b=ImFeBpZfvXFC0MnPcSTArYWil6kUeNjnmxM9p8Ljj3xaOqJY6XrSLLwQgQzzjlSkKf
         J0UfqjCvlInVcOEnmjal8GLiHoO3tpJ8UxsTCM/+ZYSEhXQF0zE9IB7gnJJhaTWyPD18
         FCDQkU5yBC5UvPrPgm1PCnXN0hHy1MWbKbbxkuMCacnUi4MpN8Lm8Q5c1Mr7HNGI1+FC
         42mLspxFX9Er4qPrGyfFsRlzozzDTdcAIxUoqqUEZHtWyU/w917J68utjb0qkqK6RwWG
         08TToHy9j4QTR8nhVLGgztjNU1UmGa17CZUAtoZs6kOvRFb/xcABX0eTnRTuqMWEN4qm
         9x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177319; x=1746782119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySX9w+oPBio7ccREiLDzIFMncjou8m/kgRIbKYHKSu8=;
        b=DC5HfhuWEUNl6Wuem1unG3pMPWhJCtN2Ls5lCwu18V2iJyCzPD9een5Ing+UH4309h
         33NebDVFd8d+fSrvID4Z8IDXYigAAd1QgbJJwzieW6rfFgyRd6bV5k3NYsG3ddYfCNss
         PVLK4vji2beCk5FRS3DXfpk3Gcx/l4f5KtavudrMZr8CcBvjsB6yRPyLkFUyMK9sGZ/z
         CBMXJdgD34LyyoHhFQIZVpWZcmDep2CfKrK8sZhKuvFVvXFNIxMqdzRi8RlUV37nP4Pj
         INLykCEmFClXNEZziaSxRG+IJInv2oInOwQiRDaldGT1vgbMBgcThoZB1uW2RVYW2u3z
         hvEA==
X-Forwarded-Encrypted: i=1; AJvYcCXK1rM/PyHMAmQdPbWCfsG6o7CEbUhCZC/GhVusfcmlyikcc7ZNPO3EFO/mno4m2R3ZhyERIsjIYnCqDNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiW/1zZqbRYTOnvaqw8UecEHX/SDc/3PQyDlfPWMDQvzP8KtI
	wIq8ulLNhNJdLP2eLXZVuRHgoxx2t8Ot6R2aB8G3lLtxOBoi39xcnR1CtfGendKeS1tI+H0gUQT
	Fyji72LT9MMERBXIyyEgXSMPBDbVWXyJ+Sn/LoQ==
X-Gm-Gg: ASbGncuuM50Jv2BGvhaUTKJxTFNUKQnlayE6rkGFQ2KG+ogoeT5BLyRMcyUBAVhz6yq
	bvTLhgIgbL3JfMa/0HAxGsxe4+h+rYe/jsrlLHa9/TF/RSLc/+T+DWfpESdnAe217bI4YQ0QnYN
	Q6TSU7C2i5sLMW0X0V34vx+Vs=
X-Google-Smtp-Source: AGHT+IH05W+rHs8mZ1MIYxcHQsBlr++/4hOQdFgIvbgfRF1B9qUyGrmZWQ8wKGlpA+Rc8/GY0pzZWNyON1esrRA5bVg=
X-Received: by 2002:a05:6512:3e15:b0:54a:cc76:ad5e with SMTP id
 2adb3069b0e04-54eac1f0a74mr544047e87.3.1746177318745; Fri, 02 May 2025
 02:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-3-apatel@ventanamicro.com> <20250203223020.GA277987-robh@kernel.org>
In-Reply-To: <20250203223020.GA277987-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 2 May 2025 14:45:08 +0530
X-Gm-Features: ATxdqUH92AZUQ116dRuBh-zB0wpJxtNGQiHH2dWPIJIE2lX8xStUOkLcjPgQASo
Message-ID: <CAK9=C2VOxFJVfZxCPBi-79ZynexTMCa4nHinbH_MNt3Bdm-arg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI
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
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:00=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 03, 2025 at 02:18:51PM +0530, Anup Patel wrote:
> > Add device tree bindings for the common RISC-V Platform Management
> > Interface (RPMI) shared memory transport as a mailbox controller.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 150 ++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpm=
i-shmem-mbox.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem=
-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbo=
x.yaml
> > new file mode 100644
> > index 000000000000..c339df5d9e24
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.y=
aml
> > @@ -0,0 +1,150 @@
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
> > +          - const: doorbell
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +          - const: p2a-req
> > +          - const: a2p-ack
>
> These first 2 items lists can be combined with the addition of
> 'minItems: 4'

It seems "minItems" is not allowed under "items".

If we put "minItems: 4" under "reg-names" then below
combinations become invalid.

>
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +          - const: doorbell
> > +      - items:
> > +          - const: a2p-req
> > +          - const: p2a-ack
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The RPMI shared memory transport supports wired interrupt specif=
ied by
> > +      this property as the P2A doorbell.
> > +
> > +  msi-parent:
> > +    description:
> > +      The RPMI shared memory transport supports MSI as P2A doorbell an=
d this
> > +      property specifies the target MSI controller.
> > +
> > +  riscv,slot-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 64
> > +    description:
> > +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> > +
> > +  riscv,doorbell-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0xffffffff
> > +    description:
> > +      Update only the register bits of doorbell defined by the mask (3=
2 bit).
> > +
> > +  riscv,doorbell-value:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x1
> > +    description:
> > +      Value written to the doorbell register bits (32-bit access) spec=
ified
> > +      by the riscv,db-mask property.
>
> You mean riscv,doorbell-mask?
>
> I'm confused why you would need both? If the value to write is fixed
> here, then why do you need a mask? You could just mask the value here.
>
> I assume there's some dependency between these 2 properties. That needs
> to be captured with 'dependencies'.

We don't need the "riscv,doorbell-mask" property because the
latest frozen RPMI specification only defines a write-only 32-bit
doorbell register. I will remove this property in the next revision.

>
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
> > +              <0x10090000 0x10000>,
> > +              <0x100a0000 0x4>;
> > +        reg-names =3D "a2p-req", "p2a-ack", "doorbell";
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
> > +        reg-names =3D "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "doo=
rbell";
> > +        msi-parent =3D <&imsic_mlevel>;
> > +        riscv,slot-size =3D <64>;
> > +        riscv,doorbell-mask =3D <0x00008000>;
> > +        riscv,doorbell-value =3D <0x00008000>;
> > +        #mbox-cells =3D <1>;
> > +    };
> > --
> > 2.43.0
> >

Regards,
Anup
