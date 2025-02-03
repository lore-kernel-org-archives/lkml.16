Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D81FAC58
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572567; cv=none; b=GUsCz8R5iX5F0ohKYQ5/K9QoLjrf0Jn5mZtqcQhaum2Xg5O6FsKsC3Z4VFyXnzZo1BKM9OKKjJYNVGWmbgQhJayr+c2+znPTIKmRz0SPCwUG2Nn6B6vtGcTWwWlA/cMA27q4JKu5mGYQdIJ+H9oTzioURTG0IdPnSGnLSH3zevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572567; c=relaxed/simple;
	bh=QX7jvlQtJHPQQYG8K+ZSemcwjKxBQzn04tV2KwSSgSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZau7JXOKuMg40JX0BrMxyjD2/uhUV4XgDj+KuxORp8Rr396N+lM86na8B9as5WQqjhp1gqX2ZOeBzyCOWoGhrxcqyKMdNLRcC60Pf+HRkJrZIuHAnbaVRIdB8BXYjnJjTiLAGA1vkOA0V3RthkG2wo7h9AKPpzeL99pPjtvEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CEHwPyEk; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CEHwPyEk"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467838e75ffso55677921cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572565; x=1739177365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYXXlTk5HduQbMTIlt80IsYvDUjFzMF5KSYRQGJL3Uk=;
        b=CEHwPyEkB32JXlqIMEVtUcOgmxV3oBMYDqRJ+3WCpyMsy3bTYxoj+Y18cGmPY017QQ
         B9RQRAmYEvhEPG+j8PAoIi30aGU/n2FKBKiv8SBVyWBRhJHriZC9KIE0OsIEi5cAEEnH
         CbtT+hhfGDh8QtXAfUEDkER0teao1imyUSnMbuG5wcF94fVrLpFNwPpcermhFPfobemq
         jmZP5wVZ4HcoOK6ZG/b0rC9Jz20eTqBmMf0OX24xRj+KU7Q1g/rEJ6wtn2xO15lK5Q6F
         PQEGqchkp9IwtXOoekcZAcFPrSiOgcyjJTiO8tT6pCFCpPttB0oe34MgDe4DtZ0FlNT9
         vnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572565; x=1739177365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYXXlTk5HduQbMTIlt80IsYvDUjFzMF5KSYRQGJL3Uk=;
        b=gkYJC3tqVMrLHwdsdt4TKXlHZJDySOmi94d4YkWUVvoo+g+4pzhBXF7qN7OMToxJZn
         clcm0kdlnQMJAY8VSPvqIKQgYWixHk//k9fuLV0jMH6+jVy2awIglReMpUYgqD9r2b4N
         Bl3J/x2DqHCBnA8OxIv23Jxd68uOn1NPrJf0/K3q6LymaNdj1No2JONjs/fg9VyL5Qhc
         WvLNjSGWud/lq8j7iJlnyadFb/AUUE8v0WLPdPi7C9uhDM1YLDJ8UoS6Hsuceq1hMWlL
         AGwHkaHPo2Yqj3KO+Z/DEhiZCbqVeKQoIJVr/Rw5xL86r3brzx259QxU/QlFffDAAj12
         ke+g==
X-Forwarded-Encrypted: i=1; AJvYcCVTmbF9k/K7+aJ4gbi8Li79MwLTxxo+QMzDJwDaDTXrF4EhtLNA3nWKELad7rUeqtbb4jCjtvM2UQzCV0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1Zy9ENZZLo1EtQl/ihuVK3Rsm5Q+w+bPtOQN6Dn1SQtQpiTU
	zE0+fkCvfYN9wE4bQhsrfPiwC8+z1iyki7X80aUztdLL24e4ILmNC4W5TkgkIRQ=
X-Gm-Gg: ASbGncvJyODWWM7K3o5XQpc8t0BGYXEeET+k4taa+iUQGc8QBVFyBrELSk0+qKZOBJl
	jtXIK5ovp6QiMDIQR+OC72Aoa17tCyqzBxTVValnsiEwvxCBembTydnmyUUUmRdl2zzsw2DVE8o
	MEWXT4SQyVlcsMZIFaLvCrBNonY2OHanOiBwnJiwoh0402RSQmXaKPVeHl+hS5THChUBMGLuwr/
	1iItBikuI1yZcsnnMZFkcISjVsnUk+f5D0s+TuO0WKJ1JChuN3mr3PeCEtxU9/6PvxVVRm1/K3X
	oOVfMLJkhqpmzozR80QuDdGKsO0A+8YafTHzyFDXfoNRpdTpxL4GrIE=
X-Google-Smtp-Source: AGHT+IGH0XTcN/X29iLH8kRSIgCwIt85vlSYKgmJJ/8YJqUZ2p1KY2bxWsy8EAgScZgVFzZwv6JhNQ==
X-Received: by 2002:ac8:584f:0:b0:467:5e4f:3d1 with SMTP id d75a77b69052e-46fd0b924b4mr302004001cf.33.1738572564583;
        Mon, 03 Feb 2025 00:49:24 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:23 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 00/17] Linux SBI MPXY and RPMI drivers
Date: Mon,  3 Feb 2025 14:18:49 +0530
Message-ID: <20250203084906.681418-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBI v3.0 MPXY extension [1] and RPMI v1.0 [2] specifications are
in stable state and under ARC review at the RISC-V International so
as part of the RVI process we would like to receive an early feedback
on the device tree bindings and mailbox drivers hence this series.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
for Linux only has SBI MPXY mailbox controller driver, RPMI clock
driver.and RPMI system MSI driver This series also includes ACPI
support for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v2 branch at:
https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream QEMU branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

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

Anup Patel (11):
  riscv: Add new error codes defined by SBI v3.0
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
  dt-bindings: interrupt-controller: Add bindings for RISC-V RPMI system
    MSI
  irqchip: Add driver for the RISC-V RPMI system MSI service group
  RISC-V: Enable GPIO keyboard and event device in RV64 defconfig

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (5):
  ACPI: property: Add support for nargs_prop in
    acpi_fwnode_get_reference_args()
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   77 ++
 .../riscv,rpmi-system-msi.yaml                |   89 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  150 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   54 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    1 +
 arch/riscv/include/asm/sbi.h                  |   70 ++
 drivers/acpi/property.c                       |   15 +-
 drivers/acpi/riscv/irq.c                      |   33 +
 drivers/acpi/scan.c                           |    2 +
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  601 ++++++++++
 drivers/gpio/gpiolib-acpi.c                   |    2 +-
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  315 +++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   44 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1027 +++++++++++++++++
 drivers/pwm/core.c                            |    2 +-
 include/linux/acpi.h                          |   12 +-
 include/linux/mailbox/riscv-rpmi-message.h    |  235 ++++
 include/linux/mailbox_controller.h            |    3 +
 25 files changed, 2737 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

-- 
2.43.0

