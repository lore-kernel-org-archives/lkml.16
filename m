Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43DCA94A;
	Sun, 22 Jun 2025 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750609595; cv=none; b=BQPc2xZNtqPHyVt0RmOnDMyuxJ/dtLDc35+mlyC7fKtEPnwl+1eGKTdRsgQDEYUXff26JSv/SZVna4f8WoQIGzllzBeWuRnYYqLhJshw+T549lk+WeUulyybuAxhnPG1VYH43QYqA0mJ8s+tRg8iS3YzSfniy6MLzmKHnpSCcpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750609595; c=relaxed/simple;
	bh=hcvBAyL2nO5uN0HKS+mZSaERkQndnWAZ48Ki+wKaxuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmYHtEdSmF2BWlQUH712pez2scoB+7LhGG8ESxs5J1vw+BLx0ujRi17e2aXtayzymcVX8rlUO8FyRfFdCucq8RvqfbkOguPaTFSpDUWCt7p30yySa/25JkmjBWRyolcv1YtzrPM7+c0Ajq4I02VfUj63ud9S8vEI5QNk187y6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0TaBdM0; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0TaBdM0"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60402c94319so1848826eaf.1;
        Sun, 22 Jun 2025 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750609593; x=1751214393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPNRi4v9GuTX7NJX9p/Qh5yNwgUiKHh6E67PPib8xfY=;
        b=Q0TaBdM0uaTj8QBptf8+v3sE/UK6tezomMDeXQa7YtwExWv1OahbQAxCasUAE1DRnn
         6wGEj9A8ZGoyqLnpziMgVHuYvdWOl9crxZa61jQ8THGWPh4nm0RgpYpy0SfEWLZRtZ4c
         /9HiLSBYSTHeihOJ9Z5Rc+Hyo6sPKiV5RSgpojTwM9f8yLGkuTJSr2ei/R9Gtqat1ThT
         O79RF2QBUIgljzQGIsJCYBLBq6Gi2GHld0RXLxJhoXAFOD78OhgUvz20JzhJajDShzjA
         QXxp7dDREco9F5+NzmGwi0IBF2as/D4mcMkNWkCMjfhiQSTvcOhkHr/5raEqDvN+Rlif
         +lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750609593; x=1751214393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPNRi4v9GuTX7NJX9p/Qh5yNwgUiKHh6E67PPib8xfY=;
        b=v2Zb8/DLMJTiTiVCJzLBHqqEfUFaBqrFvRqMQL3g4mNBiEDq5q5mY2umDMUb5WGCeL
         qnCbuzWKCwNdEl0VtprsdaeIGTb8loVOaiM8s/uVLq9RIcZz1NPVsNNJ73YSWKOykMhF
         9j8+djlAX1pBY1xoRlme6nSTUp4UIJWH2b3KxzeqaXuyW0FwlpeQs/hrs6dFCeCRP0df
         PmBM48LCD8KpfID2Y0BsMG+6bbrkqoqqdyRB3TAgBtVz2AoFNK86CaZWAi6M2B1qfR9Z
         1WgOz7CnkBvhLxjqy2i3QVrPhMngRypiVcsi8KWu68TrH1TSGwqlGu5BD3435LNarEt/
         gBnw==
X-Forwarded-Encrypted: i=1; AJvYcCU5NdGn2lNONdsBEqqJwIEC5rFo8/d+FDLLNFAnDAVjcB8dHzjIDr5aPoZi6O1hYOgS+LPqRApk7D0x/bjT@vger.kernel.org, AJvYcCVL+fwXDPWEOLKRjMlmrUB8XL03jkUBjpcHvlrPJ+H17evDszPfR+Yl814BqkzCAUYu/VXtKTE6ip/T@vger.kernel.org, AJvYcCWdHIBLCs1iKzUvqkrzHVilS6fCRBPzmV4vIv+H4fbqwrKCQeuG31Cn7ebW2LVX6jodNdYnQrtYIq2h@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+cGsn7/0JmrVhgTJCe3E5UKlAUwsnLJb3ESWOTzzXICb5WmB
	FzgBrVElKRY3KDLSc00Mv63WhiGDM4FebKKAuSPYus/Ie1f2OXzn8PnxGI3+kBqqKwkLkc6230F
	whoSFOFrkA8TmsW5RH5taLFc0Fb/JqEo=
X-Gm-Gg: ASbGncs8J9BCRklJk4LXuVc58p4W7+cI8rSO5CYv1MhHs2BdHjheX4vYeAtcINqb9yH
	vP58KfM86Z6plhPXv2y2cYLvRYYrEsFy7DesVivai3xyQJwYTbIJp0bwA8QYN1GDwyhWNWKqMQ7
	pOz8r4XozT4RJ+Z0YynI+Xs0UNKXrQSxAl7HM0HuIF0glE
X-Google-Smtp-Source: AGHT+IF92NUZOfnRyGje/7W7p7LD0ORAUzHI6vJBbGev/I0S5HOYe7jI5dB43mD7ia2DCqvsLxSZmANhvPe09sx6+bI=
X-Received: by 2002:a05:6871:340e:b0:2d5:2534:ac19 with SMTP id
 586e51a60fabf-2eeda55ff67mr7436836fac.4.1750609592841; Sun, 22 Jun 2025
 09:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 22 Jun 2025 11:26:21 -0500
X-Gm-Features: Ac12FXys2TbNcyGqYrx0pLjWREyiaKQwDSu5qzne84TMeE8NYzhVYqYwI4pT6Wo
Message-ID: <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Linux SBI MPXY and RPMI drivers
To: Anup Patel <apatel@ventanamicro.com>
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
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 7:14=E2=80=AFAM Anup Patel <apatel@ventanamicro.com=
> wrote:
>
> The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> are frozen and in public review at the RISC-V International.
>
> Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> and RPMI system MSI driver This series also includes ACPI support
> for SBI MPXY mailbox controller and RPMI system MSI drivers.
>
> These patches can be found in the riscv_sbi_mpxy_mailbox_v6 branch
> at: https://github.com/avpatel/linux.git
>
> To test these patches, boot Linux on "virt,rpmi=3Don,aia=3Daplic-imsic"
> machine with OpenSBI and QEMU from the dev-upstream branch at:
> https://github.com/ventanamicro/opensbi.git
> https://github.com/ventanamicro/qemu.git
>
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> [2] https://github.com/riscv-non-isa/riscv-rpmi/releases
>
> Changes since v5:
>  - Rebased the series on Linux-6.16-rc2
>  - Added Conor's Reviewed-by in all DT binding patches
>  - Addressed Andy's comments on PATCH5
>  - Addressed Tglx's comments on PATCH12 and PATCH21
>
> Changes since v4:
>  - Rebased the series on Linux-6.16-rc1
>  - Dropped PATCH1 since a similar change is already merged
>    https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@ri=
vosinc.com/
>  - Addressed Andy's comments on PATCH4, PATCH5, PATCH6, PATCH7,
>    PATCH13, and PATCH17
>  - Addressed Atish's comments on PATCH11 and PATCH12
>  - Addressed Conor's comments on PATCH9
>
> Changes since v3:
>  - Rebased the series on Linux-6.15-rc7
>  - Updated PATCH2 DT bindings as-per Rob's suggestion
>  - Improved request_threaded_irq() usage in PATCH7
>  - Updated PATCH10 clk-rpmi driver as-per commments from Andy
>  - Updated PATCH13 irq-riscv-rpmi-sysmsi driver as-per comments
>    from Andy and Tglx
>  - Addressed ACPI related comments in PATCH14, PATCH15, PATCH18,
>    PATCH20 and PATCH21
>
> Changes since v2:
>  - Dropped the "RFC" tag from series since the SBI v3.0 and
>    RPMI v1.0 specifications are now frozen
>  - Rebased the series on Linux-6.15-rc5
>  - Split PATCH8 of v2 into two patches adding separate DT
>    bindings for "riscv,rpmi-mpxy-clock" and "riscv,rpmi-clock"
>  - Split PATCH10 of v2 into two patches adding separate DT
>    bindings for "riscv,rpmi-mpxy-system-msi" and
>    "riscv,rpmi-system-msi"
>  - Addressed comments from TGLX on PATCH11 of v2 adding irqchip
>    driver for RPMI system MSI
>  - Addressed ACPI related comments in PATCH15 and PATCH16 of v2
>  - New PATCH17 and PATCH18 in this series
>
> Changes since v1:
>  - Addressed DT bindings related comments in PATCH2, PATCH3, and
>    PATCH7 of v1 series
>  - Addressed comments in PATCH6 and PATCH8 of v1 series
>  - New PATCH6 in v2 series to allow fwnode based mailbox channel
>    request
>  - New PATCH10 and PATCH11 to add RPMI system MSI based interrupt
>    controller driver
>  - New PATCH12 to PATCH16 which adds ACPI support in SBI MPXY
>    mailbox driver and RPMI system MSI driver
>  - New PATCH17 to enable required kconfig option to allow graceful
>    shutdown on QEMU virt machine
>
> Anup Patel (13):
>   dt-bindings: mailbox: Add bindings for RPMI shared memory transport
>   dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
>   RISC-V: Add defines for the SBI message proxy extension
>   mailbox: Add common header for RPMI messages sent via mailbox
>   mailbox: Allow controller specific mapping using fwnode
>   mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
>   dt-bindings: clock: Add RPMI clock service message proxy bindings
>   dt-bindings: clock: Add RPMI clock service controller bindings
>   dt-bindings: Add RPMI system MSI message proxy bindings
>   dt-bindings: Add RPMI system MSI interrupt controller bindings
>   irqchip: Add driver for the RPMI system MSI service group
>   RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
>   MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
>
> Rahul Pathak (1):
>   clk: Add clock driver for the RISC-V RPMI clock service group
>
> Sunil V L (9):
>   ACPI: property: Refactor acpi_fwnode_get_reference_args()
>   ACPI: property: Add support for cells property
>   ACPI: scan: Update honor list for RPMI System MSI
>   ACPI: RISC-V: Create interrupt controller list in sorted order
>   ACPI: RISC-V: Add support to update gsi range
>   ACPI: RISC-V: Add RPMI System MSI to GSI mapping
>   irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
>   mailbox/riscv-sbi-mpxy: Add ACPI support
>   irqchip/riscv-rpmi-sysmsi: Add ACPI support
>
>  .../bindings/clock/riscv,rpmi-clock.yaml      |   64 ++
>  .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
>  .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
>  .../riscv,rpmi-system-msi.yaml                |   74 ++
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
>  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
>  MAINTAINERS                                   |   15 +
>  arch/riscv/configs/defconfig                  |    2 +
>  arch/riscv/include/asm/irq.h                  |    6 +
>  arch/riscv/include/asm/sbi.h                  |   63 +
>  drivers/acpi/property.c                       |  123 +-
>  drivers/acpi/riscv/irq.c                      |   75 +-
>  drivers/acpi/scan.c                           |    2 +
>  drivers/base/property.c                       |    2 +-
>  drivers/clk/Kconfig                           |    8 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-rpmi.c                        |  590 ++++++++++
>  drivers/irqchip/Kconfig                       |    7 +
>  drivers/irqchip/Makefile                      |    1 +
>  drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
>  drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  324 ++++++
>  drivers/mailbox/Kconfig                       |   11 +
>  drivers/mailbox/Makefile                      |    2 +
>  drivers/mailbox/mailbox.c                     |   65 +-
>  drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1012 +++++++++++++++++
>  include/linux/byteorder/generic.h             |   16 +
>  include/linux/mailbox/riscv-rpmi-message.h    |  238 ++++
>  include/linux/mailbox_controller.h            |    3 +
>  include/linux/wordpart.h                      |   16 +
>  29 files changed, 2948 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-cl=
ock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mp=
xy-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,rpmi-mpxy-system-msi.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,rpmi-system-msi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-=
shmem-mbox.yaml
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-m=
pxy-mbox.yaml
>  create mode 100644 drivers/clk/clk-rpmi.c
>  create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
>  create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
>  create mode 100644 include/linux/mailbox/riscv-rpmi-message.h
>
I am ok with the mailbox patches. How are these to be picked into
mailbox and other subsystems? Maybe sculpt out a separate patchset for
the mailbox?
Thanks
-Jassi
