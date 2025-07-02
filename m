Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4FF1EF38E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433167; cv=none; b=XzqbbPLcelgdWB9syU9NO1FGHC4I8pd6gKvOjugcTYxFHP2jJNAoj+ZqCZNJgRp4+82JvzJdjvGnZyIe15gDT90tDNQirDmhf1NvGvnX5FHt/nz2ldRu10PHEt6m66CY9Aw9DMDhE8SakcyyRNTxBLHk6Ts5V/YK9r10E39LllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433167; c=relaxed/simple;
	bh=8joN0LJaVDQo10RWLcdBh1pnMQwFO9WgLer/ZxCUWzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0cZU820tXlXRMknYVyZ9Eg3jojH1Q1eT3Fp0Z4npQPZtvr5/19WmxlP7Rg5JHxW0My6Jm/UMg7uLaUjdncUzTOGx/BZbsRTWNlIa6hIMaG17uA0zNzFfgAUO233BS2hiYFLkzEEo16jt/35uVe25XPHIjmAJ18wsVEkREyIYBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YyKniiLV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YyKniiLV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb342fso5830299e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433163; x=1752037963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QcssW5aPUXiwFCK6L0jNYXP8OcK0Ow1AwcYh0ozcCo=;
        b=YyKniiLV6eBXt/y5x1AOWoIdyUkYxzXBnf+9dy0g9hTOXHyEwBH1zF16dFf4BXXexO
         82P/PQWPPm/Q2oMhydqFn34MrTk3scnqMoFNdQqXXImojNZRuYqbv6PNL0OjU9EsUWSU
         36rBgdixMfeuqdycBMdAiBjSnCub/Hmf0JkjV25b5SEyLWUDz/2RJddIs9vWdtNw7x5Y
         Qc2uKpFo4OPKAiOTkDvBHrw/9DqIe0Vz/P+Zi+tyE2dsRr8tpPjJt/3e/5g5xQmH9WAI
         LNeYtfejnYSUqIGlTVRuhX6OxcApAT6idWOkj51yS4UF5fLcdT4XfeogI7PSDHk7jXYa
         x1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433163; x=1752037963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QcssW5aPUXiwFCK6L0jNYXP8OcK0Ow1AwcYh0ozcCo=;
        b=rRB6596LLUDDrGNlT/EOU2i4kX56++BrpDaOW/cqVC5LzrpuzVxilP8jmUz5z7vft6
         o9RyGjgLBTTNiVLoXq+yXqdKg5mHFkOyJR0A5auBqQK/k5IkP5/4neIGVuudoSzoy2tv
         FR+nI32iojtOaPB33wSgs9CyRDDPkodXa6X7UeNlvxl5gBkfisusbVAxyk7xKcf7FQ9V
         iDVbGPrb9OYRwfy1t234yl1WEM3QjsIFhPe3y4gDUjWeYsyHyoDQAJJFM4Dp+zG+Dj21
         Rcvs3Czv59G+atJwPLsslm1MpAHprg1P9iAarmlAh16vyv7caGEUSebROQba6pmevQO7
         vVCw==
X-Forwarded-Encrypted: i=1; AJvYcCVQTaefdZw8QoYWTjqHPEOD96gs2o6+d4OJirNBjEeZUOMi+d4+ZtbtsGJLqJaquVtoqNpZoc6Vlj/VU1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHwgN8OOlx2zQLHkKgXjxuYu4MLpSE5OgYFlyVOJyoa7cUJ+g
	hqUkiJMh3KEr1/MirXysQ2/D6g7yG+4YimAOIX0mrs82tWFcgnCNB+s9UQ38BZ0k0DmPvBP4PFm
	EdFq14h3NhQ/dFzXbX2Jw9E4zdnfxI8uwfoipgzaGzQ==
X-Gm-Gg: ASbGncsMilLcixBzAGkJo8a1j2RYjCbbc59aKlOfMCvhxQl85o8h/qj2Wp76c28YAmE
	RTeYLgtUc/Ofxdcwog6GH3a4MJYbXPYuFQ4g05n7eG0gOrwju35/1muYklsl29FjKEK5RUlzxeN
	3qgjZPPUqY8KOBShNUv54o1Xs7HoOSiZG7cBSn8Smj0A==
X-Google-Smtp-Source: AGHT+IHnMwkcE019cehQGVZuZ2PCc2mXaZWfa5Vu4PPJs8TwzfcwxSziD3rK0AJBRgR42ABbfp9UlrabtH6IyI6G4xc=
X-Received: by 2002:a05:6512:1149:b0:553:2a16:2513 with SMTP id
 2adb3069b0e04-5562834d984mr520094e87.47.1751433162994; Tue, 01 Jul 2025
 22:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com> <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
In-Reply-To: <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Jul 2025 10:42:30 +0530
X-Gm-Features: Ac12FXw2Suv7g_fgLu8mKqGnO_4g0j4o5PKhZ4nu9THoUoVNJahAiAcKL0Xp8_U
Message-ID: <CAK9=C2Uk9D6ZBJTq7xQ1ztjx5Z29aHmU5nu+JteK=i80=4LOFQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Linux SBI MPXY and RPMI drivers
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jassi,

On Sun, Jun 22, 2025 at 9:56=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Wed, Jun 18, 2025 at 7:14=E2=80=AFAM Anup Patel <apatel@ventanamicro.c=
om> wrote:
> >
> > The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> > are frozen and in public review at the RISC-V International.
> >
> > Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> > Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> > and RPMI system MSI driver This series also includes ACPI support
> > for SBI MPXY mailbox controller and RPMI system MSI drivers.
> >
> > These patches can be found in the riscv_sbi_mpxy_mailbox_v6 branch
> > at: https://github.com/avpatel/linux.git
> >
> > To test these patches, boot Linux on "virt,rpmi=3Don,aia=3Daplic-imsic"
> > machine with OpenSBI and QEMU from the dev-upstream branch at:
> > https://github.com/ventanamicro/opensbi.git
> > https://github.com/ventanamicro/qemu.git
> >
> > [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > [2] https://github.com/riscv-non-isa/riscv-rpmi/releases
> >
> > Changes since v5:
> >  - Rebased the series on Linux-6.16-rc2
> >  - Added Conor's Reviewed-by in all DT binding patches
> >  - Addressed Andy's comments on PATCH5
> >  - Addressed Tglx's comments on PATCH12 and PATCH21
> >
> > Changes since v4:
> >  - Rebased the series on Linux-6.16-rc1
> >  - Dropped PATCH1 since a similar change is already merged
> >    https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@=
rivosinc.com/
> >  - Addressed Andy's comments on PATCH4, PATCH5, PATCH6, PATCH7,
> >    PATCH13, and PATCH17
> >  - Addressed Atish's comments on PATCH11 and PATCH12
> >  - Addressed Conor's comments on PATCH9
> >
> > Changes since v3:
> >  - Rebased the series on Linux-6.15-rc7
> >  - Updated PATCH2 DT bindings as-per Rob's suggestion
> >  - Improved request_threaded_irq() usage in PATCH7
> >  - Updated PATCH10 clk-rpmi driver as-per commments from Andy
> >  - Updated PATCH13 irq-riscv-rpmi-sysmsi driver as-per comments
> >    from Andy and Tglx
> >  - Addressed ACPI related comments in PATCH14, PATCH15, PATCH18,
> >    PATCH20 and PATCH21
> >
> > Changes since v2:
> >  - Dropped the "RFC" tag from series since the SBI v3.0 and
> >    RPMI v1.0 specifications are now frozen
> >  - Rebased the series on Linux-6.15-rc5
> >  - Split PATCH8 of v2 into two patches adding separate DT
> >    bindings for "riscv,rpmi-mpxy-clock" and "riscv,rpmi-clock"
> >  - Split PATCH10 of v2 into two patches adding separate DT
> >    bindings for "riscv,rpmi-mpxy-system-msi" and
> >    "riscv,rpmi-system-msi"
> >  - Addressed comments from TGLX on PATCH11 of v2 adding irqchip
> >    driver for RPMI system MSI
> >  - Addressed ACPI related comments in PATCH15 and PATCH16 of v2
> >  - New PATCH17 and PATCH18 in this series
> >
> > Changes since v1:
> >  - Addressed DT bindings related comments in PATCH2, PATCH3, and
> >    PATCH7 of v1 series
> >  - Addressed comments in PATCH6 and PATCH8 of v1 series
> >  - New PATCH6 in v2 series to allow fwnode based mailbox channel
> >    request
> >  - New PATCH10 and PATCH11 to add RPMI system MSI based interrupt
> >    controller driver
> >  - New PATCH12 to PATCH16 which adds ACPI support in SBI MPXY
> >    mailbox driver and RPMI system MSI driver
> >  - New PATCH17 to enable required kconfig option to allow graceful
> >    shutdown on QEMU virt machine
> >
> > Anup Patel (13):
> >   dt-bindings: mailbox: Add bindings for RPMI shared memory transport
> >   dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
> >   RISC-V: Add defines for the SBI message proxy extension
> >   mailbox: Add common header for RPMI messages sent via mailbox
> >   mailbox: Allow controller specific mapping using fwnode
> >   mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
> >   dt-bindings: clock: Add RPMI clock service message proxy bindings
> >   dt-bindings: clock: Add RPMI clock service controller bindings
> >   dt-bindings: Add RPMI system MSI message proxy bindings
> >   dt-bindings: Add RPMI system MSI interrupt controller bindings
> >   irqchip: Add driver for the RPMI system MSI service group
> >   RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
> >   MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
> >
> > Rahul Pathak (1):
> >   clk: Add clock driver for the RISC-V RPMI clock service group
> >
> > Sunil V L (9):
> >   ACPI: property: Refactor acpi_fwnode_get_reference_args()
> >   ACPI: property: Add support for cells property
> >   ACPI: scan: Update honor list for RPMI System MSI
> >   ACPI: RISC-V: Create interrupt controller list in sorted order
> >   ACPI: RISC-V: Add support to update gsi range
> >   ACPI: RISC-V: Add RPMI System MSI to GSI mapping
> >   irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
> >   mailbox/riscv-sbi-mpxy: Add ACPI support
> >   irqchip/riscv-rpmi-sysmsi: Add ACPI support
> >
> >  .../bindings/clock/riscv,rpmi-clock.yaml      |   64 ++
> >  .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
> >  .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
> >  .../riscv,rpmi-system-msi.yaml                |   74 ++
> >  .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
> >  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
> >  MAINTAINERS                                   |   15 +
> >  arch/riscv/configs/defconfig                  |    2 +
> >  arch/riscv/include/asm/irq.h                  |    6 +
> >  arch/riscv/include/asm/sbi.h                  |   63 +
> >  drivers/acpi/property.c                       |  123 +-
> >  drivers/acpi/riscv/irq.c                      |   75 +-
> >  drivers/acpi/scan.c                           |    2 +
> >  drivers/base/property.c                       |    2 +-
> >  drivers/clk/Kconfig                           |    8 +
> >  drivers/clk/Makefile                          |    1 +
> >  drivers/clk/clk-rpmi.c                        |  590 ++++++++++
> >  drivers/irqchip/Kconfig                       |    7 +
> >  drivers/irqchip/Makefile                      |    1 +
> >  drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
> >  drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  324 ++++++
> >  drivers/mailbox/Kconfig                       |   11 +
> >  drivers/mailbox/Makefile                      |    2 +
> >  drivers/mailbox/mailbox.c                     |   65 +-
> >  drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1012 +++++++++++++++++
> >  include/linux/byteorder/generic.h             |   16 +
> >  include/linux/mailbox/riscv-rpmi-message.h    |  238 ++++
> >  include/linux/mailbox_controller.h            |    3 +
> >  include/linux/wordpart.h                      |   16 +
> >  29 files changed, 2948 insertions(+), 80 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-=
clock.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-=
mpxy-clock.yaml
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/riscv,rpmi-mpxy-system-msi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/riscv,rpmi-system-msi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpm=
i-shmem-mbox.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi=
-mpxy-mbox.yaml
> >  create mode 100644 drivers/clk/clk-rpmi.c
> >  create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> >  create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
> >  create mode 100644 include/linux/mailbox/riscv-rpmi-message.h
> >
> I am ok with the mailbox patches. How are these to be picked into
> mailbox and other subsystems? Maybe sculpt out a separate patchset for
> the mailbox?

The usual mechanism for a series touching multiple
subsystems is to provide a shared tag so that other
maintainers can avoid conflicts.

I will post a v7 pretty soon so Alexandre Ghiti (RISC-V)
or yourself (mailbox) can push it to your -next branch
and provide a shared tag at appropriate time.

Regards,
Anup
