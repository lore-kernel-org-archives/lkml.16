Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3023CE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255294; cv=none; b=NVHmZbBVWOlZCVBlM7KraCQ3ByPbCwIbWJkcuLO05Ma/HIspe/Bz3ItnbbUKnEbPGe2Sgw7gHDL39AP4rh1ya68Ha9k4CSEA/mo42I6qiLGg9oO1WIDQZ40FBlMScc7Iihcsc6Bqf8BiCuNi0oBuO/Aqo86JerTOcpNBfW9zV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255294; c=relaxed/simple;
	bh=LBM4mSRpBpLLuf5KUL4CdOdRDoNegAjkYl+r+qplyOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCHbMF69LrMC9fBNiy9uinz7Fv+MIOKZbv6IJ5/SM2dLL4YzZyG9T/XnDLKwDLPyr8OI16FraP64ukD+EVwo83YrETVnjNfMUdFPmE94GuybnguxcQN7qDfmQ44b4WDWXBP9DzFLCFLw+w3EAn6nWFhcN5cAzh482ZfZJyjphMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=k85nFJXQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="k85nFJXQ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2032521b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255291; x=1751860091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFeBhYBHOrC/0c43zTo39sGlheeTzLpojcRGicgsOS8=;
        b=k85nFJXQqw9OpJkkpUjRJiY9ByGW7C9hcqMn0usRVc3F/BmQbtn4j/phhDIcp7s6ek
         Ox/ZJ4ICe7Ty+X5q+rbQqOoN/mWPszJnX+dqj/0qH9IXPu8QJx68RSQHbHB5Ng+TrAdL
         CIBvOWXy8Ddd+BL19n6PzkBbz00llTPPeq68j57TppX3ikSGx4lQzWlOnV7uCfEQn6V5
         daCiqaaFmOpvhkz7CqDe1ndxOcKGQx/FZlYGoReEUnBzv7hxYKsSSAKqCiJoqtnM2FH7
         VzndeP7M4esUD7i7eiuao+2fUX0SeXC/Qf0phT3sv522BuunbdU+kH8+UL/xCaKURaFR
         toFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255291; x=1751860091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFeBhYBHOrC/0c43zTo39sGlheeTzLpojcRGicgsOS8=;
        b=O8AKtFHVFXlEJkrCNpm3mkWkDHyfCim99JHqIXqXK1MUHPLXyM3m00V4NPb1fJeuP4
         7SjX5RnHYXwkn9ZFBpJNn5Bst+vr6ysDrKm7j/GjJNrhib0fiCopdfoRt7ZPEkPXd0Nz
         PlY+e2jm7FyTto46wKbrw2XoiuvWS9hUPp/f0pmUHIuBxmvsHjIJ4fGEiT3dv+KPbkpB
         ND7NtvXzR6wTQIUTCGNSq4AUHPuc5uhmt9GxCiwRKcSDTR0rKgxWQVjhDg7YTtm8MeF8
         E1sIWaBOhyMALY40NXzdA3m4XBOIvDJth6W/lRoRpe21N3OClOzq1CEvLH6J8YgJn6bf
         B4Lg==
X-Gm-Message-State: AOJu0Yx9HINfyQQRryQo7Oe2UNV2gByfNse02z9hdSFWo+5oVJszOHMp
	MXOeRmF27YVrOudJpzNySt/UKGeTveh7KnDRAuG7nwvGSmtjFI2N9HlcdEBQaBbdPNUNEXExlw2
	msCg2
X-Gm-Gg: ASbGnctp+GEIXWZP+tqxbXY4igzAArCXTLgXh0HyG5Sd64k+HA9xX1MV7zREXSqyjAB
	pscq9bueIrsbFnxdFu5OQd/WkzKLBP9ga8ad3iOX4xIGhSiWajvA7KRaa5iDny8ASB1sThVyNsu
	oVSR3nUNqevwCERkqYCxsSrgkuOFv5Jo7smja0S315kI11qkrHu+hY0oVDRc5luVkLx7+SVwTR7
	OB6yT3bgpaOrqx4m3MxsRtsM8K2lxZ8Mmwyj91XxlobMAk8gphECyEVhVQcmaQC1Prh1iz8SBtV
	RpSP1thvUDMZt+Wq4Y1dMqyjbDPbD7PSL2pFa9U/7QNkq/IVsnbKSuLtjRkupVKmGPG5fr/a
X-Google-Smtp-Source: AGHT+IEzTTqz9HI75CbRtfblsCPZ+bl54XYhiD9/Nlz3V+rIBZOaNxNzGv638imyLy83nUUnGEXiUg==
X-Received: by 2002:a05:6a00:3e25:b0:748:2f4e:ab4e with SMTP id d2e1a72fcca58-74af6fcf67emr16315764b3a.11.1751255291494;
        Sun, 29 Jun 2025 20:48:11 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efaecsm7837862b3a.161.2025.06.29.20.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:48:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 0/3] RISC-V: Add ACPI support for IOMMU
Date: Mon, 30 Jun 2025 09:18:00 +0530
Message-ID: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for RISC-V IOMMU on ACPI based platforms.
RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
to communicate IOMMU information to the OS.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Changes since v2:
	1) Rebased to 6.16-rc4
	2) Removed Anup's SOB and link tags added by mistake in v2.

Changes since v1:
	1) Rebased to v6.16-rc1.
	2) Dropped ACPICA patch since it is already available in 6.16-rc1.
	3) Added Rafael's ACK.
	4) Fixed few issues found by bots.


Sunil V L (3):
  ACPI: RISC-V: Add support for RIMT
  ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
  iommu/riscv: Add ACPI support

 MAINTAINERS                          |   1 +
 arch/riscv/Kconfig                   |   1 +
 drivers/acpi/Kconfig                 |   4 +
 drivers/acpi/riscv/Kconfig           |   7 +
 drivers/acpi/riscv/Makefile          |   1 +
 drivers/acpi/riscv/init.c            |   2 +
 drivers/acpi/riscv/init.h            |   1 +
 drivers/acpi/riscv/rimt.c            | 523 +++++++++++++++++++++++++++
 drivers/acpi/scan.c                  |   9 +-
 drivers/iommu/riscv/iommu-platform.c |  17 +-
 drivers/iommu/riscv/iommu.c          |  10 +
 include/linux/acpi_rimt.h            |  26 ++
 12 files changed, 599 insertions(+), 3 deletions(-)
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 include/linux/acpi_rimt.h

-- 
2.43.0

