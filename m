Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81832063D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655667; cv=none; b=AVJSODu+wmLWCx2H+rYUitKU2OUnyxbmaEAffXz3AJ6e28sHJP7I8SJm9vsLzLzWn2Sae9Nqf5aOK2uTgK7BMUq2P0EfT334E5Tm976F/rw85NEfl1+ftDb7jXY5/9+bKh+TMdoD/UDgK4E8XEB5c0NG0umuBGWyP5WSIWUa1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655667; c=relaxed/simple;
	bh=1xcyd4xbQQnsJ0VVxdhkgbe++71P2EFh7Yknlb+8V9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MeZgNb0oexPdC2FzHKht9zpPRf57iHTTqbDZECOVOnbc2HIkqpdTWF8yw8M8yCt6ieZWZr9aylaie+vIMxHXeE1Pg6URUNhmunD8StoykKahoDmWBCaeov2qoe8pwgG1zzjy2q565LnSvqwdJxReGIv9RKa8uxkXPPSbZyWI6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KRCuTI/W; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KRCuTI/W"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6eeff1fdfso479464285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655664; x=1739260464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=KRCuTI/WtQwoQfkTc3d04cyFllPW2MeWpH5VlVe/9JZmFOu6z+89qE1qvcc0oq7Uvq
         idu6WY5AkguPEN9DJuDl84wSuWCNV55s+ttgzb7KaRSMhS7xThR8fWwnuC6ZJ3NF23gG
         57SGrcPg3HEmGEzL/oHYrvJdlkxktMbEOacwlefjH7XCtkFBkQiSWZdLf2o6jcRTYuMq
         +8n2NwhSJ+0xD7fxS6Q/9dbTHXj1sEbYxIGho+uP2aGtq2yNSDdlNlE3MskveiJmxUEE
         rUIlCpIy5p8kgurquWjXjJDQnTeM4KWqxfJSPvTm4p1rZ4jw4ZQsFe+mn1bxpZyGgbUT
         FymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655664; x=1739260464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=Ski+DpSZeB1GH95LwRV9TCoXTrZnQp3G5bBpBbpeba2H4IURarqQZvqRl9z7+pCOtt
         RqU1StFrEH4KBK7JEkL6ekyt1UW/V9ZcxMkExfmwt243/blo+IaQDA1MK46oy47WLbqD
         n6N/J0TAckbKJi/bF5As3W+4SvJeFquCl6AfxRGO0wc17voBDa6Q+PJc+KuEaxByrl3w
         nvNDrtw7JzcAEQgz3c/gIsoxkyIYzZuPQTe4aPqyVZcHwSCshdOVBmYSkLMrENBHc82P
         EF41i1UmxFz9zEyeHGecIdpAlV0KCxJHbRHtZghirkgBFfbEg57j1+LJWkyPEbjVQAx4
         tovw==
X-Forwarded-Encrypted: i=1; AJvYcCW4/JwqXTtcbna6mbZhmZd4OGz9s5Id7PaYE0bT2UoZaZ5lJI0Hgm59ysggC/53jtd3jebDwZcUxSpGcx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCltCKc8mXDTPE4QqQ5xEK+CIBtE4BNf+YPm9fDJ/xmW6ZtmlM
	2bJctmo8fDETx3C8TbWKLgakcCwVMCkNMMjbrwzZaJ+Ho+mIQ8JdGAhWa0Cb+Es=
X-Gm-Gg: ASbGnctJ4k3wBq7UCL8vGC3PLHXMWir+7m93JgB2qTfC2un2JmUu2sTPVXf6H3dgTNX
	S8Cfje0CoWmdJ6WDPq4FvP/K3KxvFZnvbYJnIr2JfmNNAHF4yXQEouTnb0smvWI1H/ATz8dZFJ9
	FCwJrUgk6cTvxZeFpv6mdYALqffT8a/ABLpkRILj4gfUItfU1+chf69yz8q47YFaTVStF18C2Tu
	WL85ZCU0Osmsy+I/2Qnvw5xY1FsgfOYsnMTU8/OtflOIwWKdWYclVD5NpEIzj8PULB7uGjD0J2b
	h2MftDkosvxVu4Ze4i7YKqf2GaVGzP1KJOYFOUoCvLbkjfWhJBPOtY4=
X-Google-Smtp-Source: AGHT+IHnQYtrMWCiX8smMX+KNobk2NbP0fzLkqVqwBS3IWCPax1EIsVPqU/PPsh/vQevjqw+kgDNzg==
X-Received: by 2002:a05:620a:688d:b0:7b6:da92:fcdd with SMTP id af79cd13be357-7bffcce1d45mr3575797185a.15.1738655663645;
        Mon, 03 Feb 2025 23:54:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 00/10] RISC-V IMSIC driver improvements
Date: Tue,  4 Feb 2025 13:23:55 +0530
Message-ID: <20250204075405.824721-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 127 ++++++++++-----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   5 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/migration.c                     |   9 ++
 15 files changed, 224 insertions(+), 157 deletions(-)

-- 
2.43.0

