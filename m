Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE822A1F1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622988; cv=none; b=a0jnJCpHsejCe9nBhm4g4UzWkPjH0wh+t0Th4xOmtF/eBf+YN3Q0XwfrHHzySrFkg0Bgo9nxc42h3k+BjzJW1dmf1a2JBkUf7LTfgne9e6zdsMESs5IPGzG+yp278+HTNGLfLOooXG5b10NafsQlSvvIdH2p7xnHKSlRk9PeXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622988; c=relaxed/simple;
	bh=JVbOLSnzmZzMPzV2prjcc14AqqWQNhXjC1isd0t3iV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckOOGUCqC4zPQB+Ig9vH/5/Qp8d/FEjyoZMKQtTSenuPy0gEdmedvNawg16Wxl7FaIwxdEwqgId9JFrpVPJFjf+MOnNi9Japwr3FDw6SX9qkIGlRYGOsOE1pXf4PdVeLezU+SyjneipSlzP5bEFxLRXkKyVDyr7Tyk3T4SF3lfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=g5P5yEIX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="g5P5yEIX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6661449a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622986; x=1750227786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=g5P5yEIXgf7/H/o+94BBHQhF+9Do9uejVE3hCo6A2AXCpKG257Jd2aquUdxIxMOa7f
         xA48Zwe6629VQlIWBDfNhp2NcH+BW/fT7Deozk7hJalpDAyK5lOaH1OYQpoUDp+edsNB
         9DDc+iQ5/2esThoYo5QtGW+x4+FGggvHxr9sbReg6+Sc2o3ZD6G+ea+53OOfTF6OYxe5
         E+DhB8dMUcfJkoJYCgGyjrjea232GTfMFP8J01+QMltSwVQ8HTJF3ipUKdAa2/65crRB
         iYzrt4vDgtl98cs99hACIlDLEaz+sCZHNdP71L/n4UErwe6c9A2cqJN4C38M8LI1tamK
         opMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622986; x=1750227786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=YwyU5GCO4BdXJzbEvznC1AYNHEr0k6LgNfgtSVIbvDaHi1/6dQFyrbHrRtAjDVVKIb
         w20+YMxsZrZEZQXqBc5tXs++e6KALTjcc67SN47K01oZLHehjxzWMXAB3nn3fVwJxfGj
         2JXXF7dH1GVJS0uaWwBidkiKdGZ+l99UZwQU4exDBPkfFCAeBSs1zwuEStyIzsrWqG0j
         oHpqaRInrlwmMyiL6te2eZKUnBJAN4IoIyEGN2vOO7tZ7My/ZfIsfpFsPP0HteDr9chQ
         KGX4BsPDl2yEzWISxkr460A5/ozoY6RWMqk2AtB+s2thglWzjoH9tdXSCVKOLn+PI5ll
         +JHw==
X-Forwarded-Encrypted: i=1; AJvYcCUJTa0aU4lDnvq8Qq9gUXdjc8hul011Vt8wsjlKPbaYaeSfXNYYIzPYE7rTtce3JuDdJFoxpNurDzv6JFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoOBT70vXQfjDyd8suNRl3KtsqxCFDwaaVlKItYfshXop16Pz
	qqqv/qxL0Hs/JiB9mLrHa1fdBX6tWI+56ZJunuyr5xJb/y7TBL9JG8vYMidfC56cGxhxD7ocm3T
	ES2zYm+c=
X-Gm-Gg: ASbGncsyXBlXawYUWV1EYy5iJxc6z3ullHmXrGPR8OhkikHVUzk5qyPv48JMJckck0H
	SP+WTqp+w95W0B8zo76GM94wKCIG0mkXYqaKohaIpdhp+uFaOSd/cOKr/BNFEpaK/MwurcmhpkM
	AsfU0pU3Clkt9YiMdU7L34yJQHryZQYgkuzgyJ2mDBZ72eG91qBTtJGorW2KBSqCepMC30ryUBS
	15VytUdtMYFt/1wp6X93h0mAZmLS5iVd8ZeeXsqr6PzNet2j+u1QKOCwUDxRtq1kEtEmU63s5+w
	DEMzatKnq2G/g2K6Mcraq/uyP7MD1k4IRov2LVjTXtC1xxh7KU7AwIOiDXmezzcbKf2+mtNKMma
	HiLx9Ykczp35DfQ19QsxjvApqr48zzplIAhnW
X-Google-Smtp-Source: AGHT+IHSrTlgCLaqGGBKm2V552V4xqWgVbVjfWOuolPdJzzx1JsZPHsQKmSOy4XI9x2O/aCfniZVjg==
X-Received: by 2002:a17:902:c94d:b0:235:668:fb00 with SMTP id d9443c01a7336-23641b25d36mr26128145ad.46.1749622972783;
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 00/23] Linux SBI MPXY and RPMI drivers
Date: Wed, 11 Jun 2025 11:52:15 +0530
Message-ID: <20250611062238.636753-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
are frozen and in public review at the RISC-V International.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
and RPMI system MSI driver This series also includes ACPI support
for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v5 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v4:
 - Rebased the series on Linux-6.16-rc1
 - Dropped PATCH1 since a similar change is already merged
   https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivosinc.com/
 - Addressed Andy's comments on PATCH4, PATCH5, PATCH6, PATCH7,
   PATCH13, and PATCH17
 - Addressed Atish's comments on PATCH11 and PATCH12
 - Addressed Conor's comments on PATCH9

Changes since v3:
 - Rebased the series on Linux-6.15-rc7
 - Updated PATCH2 DT bindings as-per Rob's suggestion
 - Improved request_threaded_irq() usage in PATCH7
 - Updated PATCH10 clk-rpmi driver as-per commments from Andy
 - Updated PATCH13 irq-riscv-rpmi-sysmsi driver as-per comments
   from Andy and Tglx
 - Addressed ACPI related comments in PATCH14, PATCH15, PATCH18,
   PATCH20 and PATCH21

Changes since v2:
 - Dropped the "RFC" tag from series since the SBI v3.0 and
   RPMI v1.0 specifications are now frozen
 - Rebased the series on Linux-6.15-rc5
 - Split PATCH8 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-clock" and "riscv,rpmi-clock"
 - Split PATCH10 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-system-msi" and
   "riscv,rpmi-system-msi"
 - Addressed comments from TGLX on PATCH11 of v2 adding irqchip
   driver for RPMI system MSI
 - Addressed ACPI related comments in PATCH15 and PATCH16 of v2
 - New PATCH17 and PATCH18 in this series

Changes since v1:
 - Addressed DT bindings related comments in PATCH2, PATCH3, and
   PATCH7 of v1 series
 - Addressed comments in PATCH6 and PATCH8 of v1 series
 - New PATCH6 in v2 series to allow fwnode based mailbox channel
   request
 - New PATCH10 and PATCH11 to add RPMI system MSI based interrupt
   controller driver
 - New PATCH12 to PATCH16 which adds ACPI support in SBI MPXY
   mailbox driver and RPMI system MSI driver
 - New PATCH17 to enable required kconfig option to allow graceful
   shutdown on QEMU virt machine

Anup Patel (13):
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add RPMI clock service message proxy bindings
  dt-bindings: clock: Add RPMI clock service controller bindings
  dt-bindings: Add RPMI system MSI message proxy bindings
  dt-bindings: Add RPMI system MSI interrupt controller bindings
  irqchip: Add driver for the RPMI system MSI service group
  RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
  MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (9):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   64 ++
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   61 +
 drivers/acpi/property.c                       |  123 +-
 drivers/acpi/riscv/irq.c                      |   75 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  590 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  325 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   45 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1002 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  236 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2920 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

-- 
2.43.0

