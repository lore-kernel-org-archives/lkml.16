Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655922DF84
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970806; cv=none; b=nID0qxYyMvjymPRQad3Y7WAyn+7qxqtc3lqlbxuQzXW2sld8JFyXReC8B0+cxDf3hlEsgnnZ+fJxvdMNFAeetUHH7BLjcVz4qbsgHW1KJi01DlPOF4x5nxvJzVBgw46Kb7nXwia/kXBn4ALmqNfTDcpKsDuhL1BaBhGBGUTqvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970806; c=relaxed/simple;
	bh=HGHg9nY8u9T8EijBXpElYgMjpPIpbIwca+aoW36YdV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2WuN4tf5HtK1IT8LCXBc4Pzo2AJixGUQJ9E14hIzt5gMyVnv0RCOyJac58lqs4pboEsajoT1buPOD9zhtv7d3L0mv8tF02pdl6DgeHr2i9MTSaxQ4pgqYzfgesvnKJyyjvCbh/0/KD+2oEdKtAo38y/Lb1kprNFfMctC+ji6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SvEIRyoM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SvEIRyoM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e033a3a07so38092575ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970804; x=1747575604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2X7+jVVNL7UrA8dHN/YI8a62ZSrvEZ5auq7El/7vY8=;
        b=SvEIRyoMycW1wzPzAWjzEYNi/f0IRNgf8H9mndmyUqgFOZXGandEr6S6dG8BiGwVDy
         1LTXgyxK1S8hkJr9NCwuKFXExGSPwpt6yvmGPu1NknkMtwOEk6C68TIOmrg7no8+cAaz
         I81wSyq71DwyiKr8zy37QGbB8UUCemcm4RpfCMN+Niyh4gF/ByaURjRvEnrAFYmE8vkX
         b6JE7pls4Q38VwhaOv5XoboENJdcJZF632YlKrUAP2a1sm2yfDMqOoa6BipMouekazFw
         xd2hbJUvZC4KfCi2zDz3t+F3LvG2kqmJQJJWbFIskVlhJqpzlk34zf87RKFJM2sNKIP/
         oaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970804; x=1747575604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2X7+jVVNL7UrA8dHN/YI8a62ZSrvEZ5auq7El/7vY8=;
        b=m2FLDItju76YKNH9IwEhsi8Zc/4d51vbkkS+1CMsMf3CmuAlMYvQmhZ1OEsrpeBKaV
         pm9CnQariamPIJzk9NGm5p2FkDu+E7xErng3lChnYENDz4covN3ktTxxaVogcjdz+k4K
         IvKFnElrYxgeUTBO/akBURxTf4rHbm0g53zdTMHHVlk/ZrQuDw6wGABR/DZvX489xw6n
         77MvlrgR2QfhCKcnZQc2Y66CJJRf0VCZbRntD1zq25EIMCch3lrOrDK2MDlsklKOPEWM
         h/E4ex6U1GtcnD+P05mTj2G0cFsnfyX2b3CJYLK8OK7wl605vrxTdYa14RQ4kCOUVxzO
         au3w==
X-Forwarded-Encrypted: i=1; AJvYcCWTU16c3fucQ0HJKGV4+wACFbvgwuX7+Nb/tMCpC2I2PnGkPHUomXu1LN9if33bXzRcU5kXX4pXgq4Uzxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuFvMtw3Fx90cx39MjbHb0StnVYsmZz9a8iKzFOec4Qe5K1nG
	1HWOh/mSjfLpjpoJ/Tpr3w9+bpZXUMBMtPU/DIzgJTq71RFLej/oBzdvi8a/mgM=
X-Gm-Gg: ASbGncvo8UXTHMabuD0NlVdhFAedqTMUli1uObIylY17JTCbKmIULN+KUJVqduEZyKD
	c5cyELNACjgvrkEQMqp1BqEBzCS+zKi7cKExubbwmJBjXlApyBC4LlnDY796HXQ7S70/S3Xarb4
	tFzaieELO+/+EB7kxzF0onIJHv0vUv5SVUqWD26Dd0IXSCDsJEmRbaDny4/V3QZlltSfyWDsUY8
	4y2i8xLNsYuG28Fdcj+1W0Yqpe1iZYExSCK4ohLFVzAzDFrERIfejHIJt+Twn5lzKG/LdlvIDnO
	xLfFT80aFh/XFwofAcD6F+6dGJaofdenhXsjq2kndo80pLtXyekpseL8Og4eob/QBkdGlY0Wkv3
	hjq5LnbT5F97dqQ==
X-Google-Smtp-Source: AGHT+IFeovprhIUjCenVGzvCSweIJ9z5nY2eghETFdt8kR3joqVLkksTBy7OfdfpRIPRnZrpPXtoAg==
X-Received: by 2002:a17:903:32c1:b0:224:c46:d167 with SMTP id d9443c01a7336-22fc8b51a28mr143434215ad.16.1746970803926;
        Sun, 11 May 2025 06:40:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:03 -0700 (PDT)
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
Subject: [PATCH v3 00/23] Linux SBI MPXY and RPMI drivers
Date: Sun, 11 May 2025 19:09:16 +0530
Message-ID: <20250511133939.801777-1-apatel@ventanamicro.com>
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

These patches can be found in the riscv_sbi_mpxy_mailbox_v3 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

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

Anup Patel (14):
  riscv: Add new error codes defined by SBI v3.0
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

Sunil V L (8):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   61 +
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  148 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   72 ++
 drivers/acpi/property.c                       |  118 +-
 drivers/acpi/riscv/irq.c                      |   80 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  601 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  315 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   48 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1007 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  235 ++++
 include/linux/mailbox_controller.h            |    3 +
 26 files changed, 2925 insertions(+), 76 deletions(-)
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

