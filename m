Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10931F4C8D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747202257; cv=none; b=VqVwJZzD8+4fhzt0p2G/FXPQ811TOCMcV+Xc8gDGjtIsh9LjpVeEbarI/KwcsKOtrC4SbeGFeZXoQ1QfzSApGv6gr5YACzH5AewP6Sv3t06eo4i663BxOqc5kOuG4pSTgLBijgU8JA8U98nftBy8ZmgSo58jmRseEN7KdSsj/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747202257; c=relaxed/simple;
	bh=k9d4wVwHo5YZav/2fiCXaibFEPXpZ3HGlFkqOL063qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkI5EVpN2Qohz51h5Uh8gkKoOF1V4CLJUc3A+ZRGnCaVy+NPNUJNkhdOa5c+ENmtaf5NqFbzepcujn10y4io2GflYdfm17H4+dloSbdWMoQuBjyyyUWqph757KJaY+/tLQMBcIz+959GpT58W519NpHzb3DWTkAezsYIYYuN7UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GYtqIJdm; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GYtqIJdm"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b074d908e56so4351710a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202254; x=1747807054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7VBon2ln4fM6kR0PL6UdXDhBglynbmL1e31ZWLd3nM=;
        b=GYtqIJdm+r2Tdrtr0kO2Xd0sNWjRY8u1An6rcEX5i6fhxCvZHe0NzvW7Lbfy7nRxJk
         CS2WUYs1kUUu6NpIg44klitER2Psbxns8V1mGgjP7dpcAi68B1GuMAYkVrfIMYGsVviX
         3vn2sbakLynLhF/Pg+iuM4pvI1cRE2IaxzBK6wJQUrBNgfl82tnOFsXY1JxnMJGQ6b7G
         x/opdskgj1LIQKT3hJYdUkg/ilRPeiRw16N3a0nXqCv8DM7z1LjFmXdQX1BEYcZCfVDi
         7dAa17OJHiyUxMc2sxIy1GF+4duYU9uG6E6nUcputDILgeN4B83CA9/PD8k5tTSnS3vz
         d3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202254; x=1747807054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7VBon2ln4fM6kR0PL6UdXDhBglynbmL1e31ZWLd3nM=;
        b=l/bexs4qZRTThreWFV9kVB8eXL5Q5s43n5J33Z3CqchsXRP+EMgjC7u4fNsKIPjJ7v
         FNn3T8yKFsv1iyrCTKXTySgoiX+ys8jj3liuer8nDXKutiqU/WC0lS1WSdLLYBduYY4t
         fC4KQqrI/WQJiswxvR0t6d2DFLTvUw1Sipl7bwyCp53i5YhmuhFBDFiBEmhiprX3Cnze
         cY4Alzjnu9i1Kgw5HPQV34N5OB0O4+gao+YpmExUKnNoLGCg+e0/RLyPnyF3o2Bhh67Z
         gsr3tiYnQFdF9JT98JgpOPczC9RJj+V1Eb7Y+E2b65q5APgR1AkCGV+DM5i18dzwzDxe
         1yyA==
X-Gm-Message-State: AOJu0YyBikHxKkOwenmhVdTSafJQyvIpQvVmfTgdD4DcGGWffuisaV3B
	01V38aHbKvqzVcgvMZCgaYSQh3nAoOx5MfFvtZAOTZFphi0hZVy26Ehezz2jwycaoaDzZiSMgDx
	71kU=
X-Gm-Gg: ASbGncscgVUF9fGAb8bP/vk+lWgsBjVbZ3mOWOeu5uKZjr3Zty4gMjhyq6pI06UcWth
	mXXbXGODu8RxxeSZbg3F/YzP4zf3bQEI+b8nSBJcy1VKzlAD/yek4QEvkDgXQJ0IqquCN25PxVH
	rV0lycGniIfCuO4LmTiolFGVXXkQuX2EXTWaoIoBRPWlteOx7JG1UhcztktXNgGgDjNx7aPBFF3
	aP/bV+v5imjOqxGqXK5dAq+BC8j9puRyZDr3+4cmcVNDP0m14U0ni8N1takM4P/mLpEUreF4BJ9
	z9+bt8UckJCeftHqw+XG6qer1oelzi5LJHlFGeUL9NT9y1ePPjQ4hTzWHIJt+w==
X-Google-Smtp-Source: AGHT+IHXp/JfgXqigWBcidR4kq8OP+kMXnDiqEfkci8MHcvamvdKxF9wFw2bKIstdi8Xr6ptuIylqQ==
X-Received: by 2002:a17:902:f644:b0:21f:7880:8472 with SMTP id d9443c01a7336-231981c8d93mr39801485ad.35.1747202254322;
        Tue, 13 May 2025 22:57:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:33 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
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
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 0/4] RISC-V: Add ACPI support for IOMMU
Date: Wed, 14 May 2025 11:27:19 +0530
Message-ID: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
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

The first patch in the series is a ACPICA patch which is already
available in linux-next but included in this series for completeness
only.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Sunil V L (4):
  ACPICA: actbl2: Add definitions for RIMT
  ACPI: RISC-V: Add support for RIMT
  ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
  iommu/riscv: Add ACPI support

 MAINTAINERS                          |   1 +
 arch/riscv/Kconfig                   |   1 +
 drivers/acpi/Kconfig                 |   4 +
 drivers/acpi/riscv/Kconfig           |   8 +
 drivers/acpi/riscv/Makefile          |   1 +
 drivers/acpi/riscv/init.c            |   2 +
 drivers/acpi/riscv/init.h            |   1 +
 drivers/acpi/riscv/rimt.c            | 537 +++++++++++++++++++++++++++
 drivers/acpi/scan.c                  |   9 +-
 drivers/iommu/riscv/iommu-platform.c |  17 +-
 drivers/iommu/riscv/iommu.c          |  10 +
 include/acpi/actbl2.h                |  83 +++++
 include/linux/acpi_rimt.h            |  21 ++
 13 files changed, 692 insertions(+), 3 deletions(-)
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 include/linux/acpi_rimt.h

-- 
2.43.0

