Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4623284B33
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552415; cv=none; b=IsM6TPIDDWYWpTUMJ6fHDuaM1DUaBapBqtGpAI3Vbgo9LP483WbP7j4MTldrpPNEVDgpj6mERi0rh390r9qbFf+LHrEpLgRY1BsGFVbOGlDCyONbhRFX+MXvcJhvX1mh4kqSW9zwRS+XLGix7VUcn9Zbd8vU3xpmPsDF196jWbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552415; c=relaxed/simple;
	bh=rFU2UJPmZv4id90emePuWsRP9dfAuwHCWZzl/IU3wDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLnnCJ1luN/jPMTJyw6CnJWhZl6PZ92PWIfEM/CAFz/DrHpe8NNa/GUzdvF1TOT2cuB4XhXdXV2qXlxrdPESb9p8oI+oKf9eZESmw8KAKr0T/8q15jMutQnhOC+Ybye6Hy+o0XLJwzN6n98vfbTS34p7M/MDY3/3AYgvhvl3tcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aBInlypV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aBInlypV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74849e33349so1908963b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552412; x=1750157212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7MV4ZMTiUsINwR8be14xviGNX2303UWr44QeNbdncU=;
        b=aBInlypV6krwWqwYqPhiPDeIv8ArxgQoeKtsZfMW7o1aji+zlQxSt4gIbkuQsKRa5P
         zuXIIi9WjzmYniHWc2ddeYEuyGDGGoDM4flzIXFgTpXcjChNe7F1/Xr7HFSJPGk6qX/v
         zwzVHHX5CFGNWSTqpwdS8cnDtlL7nHKJwxmkH/RF898swbTGW13DtjlNQqiM5f/czn2k
         M6z0xOMsOqvDBNmgHg+Pg53MGDnUxFLftRuUl8S804TPsVtbub9+lzfxzkldGfUF6c9b
         YYfIWOs6qB/V1kJAo9J8y5+VKzZAeeFffacuYwFLlXYuZENesepqQ6cqyh3pXDvAVWmV
         Uqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552412; x=1750157212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7MV4ZMTiUsINwR8be14xviGNX2303UWr44QeNbdncU=;
        b=bhbAZ/weM8BposifflfYwlr/90QIMS5DeRNRwcWsiM8BV9TYfarO4jke1x5K7UcM79
         UCpv9QV7R3qH0bYXIEDBD3vcE1a/WMW22GH/EEzvslCNZqTcTojt8HyoA2z9YYo5mY1j
         irzH1B4NpmA0bIaAFIBIFnEGanyzqS3xB8HjP/vDW9SjpuUDbZvagsgHcwxZH747dte2
         xaacOIF9N1T57sIY6BQ3b+L460WtqP5xlPbMj2lvFnvNOnIUQsBJb4U8UrpYXI/7H/uu
         koSS3/Apnl4bUnCo4YZSqnXUz/AHL+tBoAGm9QIwdLLd9yEB0jST6Tgf4Qrcth55QZ+H
         Fskg==
X-Gm-Message-State: AOJu0YxnjZWmrD4NI2C2MMJ77FXHX3agq6LdFqs0txAvlm0b7s5GATGg
	u3zrQLrkEf1FPJTkVjo+OxEIH9bog3G3RaMVc/4d9iHfERP5xlQeiRAr4xFRTvCyI/1sZkLexZV
	n6eZujFg=
X-Gm-Gg: ASbGncvS8KIvTuh5rvNk3vRvKvrOBuyv5+Edwy68mlCfUxqqeBklhQyeOHaKmH1omrW
	qFT9ipvmN7DfvqMmgmm8DJdkEaC0yKobUF/wpUYCao0TlzfolVhPxM5atvFAARSQfl5+6s1UMwT
	9REK/+eD8nt8tuMM2XU0HfbpWutThLp1cYpyQCYTuY8kAjKooEchGOrIoRULHkNeofrJ1+TQagW
	peVweaf2+TmukXBnl8UfxOia+IqucJMQ1sT7tQHvpX+/YtfqjTwZNYM4ICPyJNtTRNJ51csQA3R
	m12ODJw0cy/YshnlhTd31c7PMAxH/HJBFcNnTZnkXQXMtMOAvFJAO//SO4gbLZM92Z7J+Fj+TPx
	ncPGCoXk=
X-Google-Smtp-Source: AGHT+IHiwomQ11rrELOJ2Yf8/Tcge6XeBMEJudTG7v72UH6QPTwRLqU3OkHUxntGY1aE+8OCZaxGTQ==
X-Received: by 2002:a05:6a00:10c2:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-748618a8e87mr2593505b3a.15.1749552412214;
        Tue, 10 Jun 2025 03:46:52 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:46:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: [PATCH v2 0/3] RISC-V: Add ACPI support for IOMMU
Date: Tue, 10 Jun 2025 16:16:38 +0530
Message-ID: <20250610104641.700940-1-sunilvl@ventanamicro.com>
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

