Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B611F2B90
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162979; cv=none; b=IeO7nsT7z21Yn8vQNALrtZQdk+LYs52i2Z3/N5otdTyur2prehCzxrA31y+XsckUVJkRyhPAXQ51C+TITVzZWwPfNn6FTAVjMxKEFI8J3AIlPwbZZRZf8qg5hAxB/fcKIax6ZoWQr+LvvMle+Jd8WPytwpe+b3BFh60sxBxDbg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162979; c=relaxed/simple;
	bh=BiKDpKKLxE/k6ZY8kMmrwXJi+9HFJObjqUV7Aozt30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNG5ll12z+gzarb5Dfz2OT8d/AtukANbzduEN/ifXR6DzJHAeqcRuvBQRiOa38zYNdg5ioJNjkUojdqBKqB9CDm/klRUsEhAXPbnD1IltN4M6mWj3mVPxGOBripgQI+uSPYJm496rFMhalqUQUUGzSOimpAgvrSGvWaClKzYk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=i2vPtOoY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="i2vPtOoY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c035f2afso761371b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162977; x=1748767777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=i2vPtOoY8rgAgb0c9M2NNSFOPbvXJ6i4lfA24uoKjwFtGJJBS8nmMsjVU21AfDj9nF
         1a8HbAk1N4ZBQGloyu9oz9hNrDZ8LcXM9JLKuODnOvxZVtivwVKis7ABRwoohpyAZnVD
         qZt5FAqC+Omq01fVg7gIyVNqo0bDK3DUNPrd0hur+BbIxBeupd18bEkdZCp/HdE7wQ0e
         F0HK1zH4X15sIDJ/aPdbzt0SU+rHVhQk8SCl6PUa1nDUP/wyTaWXs/4EVfqQl01uD/0Q
         tHD/2/3fdq9D14eVDNulD7Sf+O5Gx6+fUsUD3WU+0jiCKO6Qo6lGNs2iaHoWSJoaQObP
         4stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162977; x=1748767777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=GVWhR0NkhD37Qqkd6nmOwm6cLI6noH9E/b7ZVJANy7W35tCPyIhu22M6J35LqGH9zA
         SjELdzXsMQLC2iGbztD8l84sFsb1lWpE9Z7MFGH4cG2Mf0QWhxiL0KrMJ1/LtyjvQ8mS
         Mb0eMqsWhIUUQcdUoFJElZTNjQ+AVnirSUUkk8654Vy0MssmtuXB0Lk5FENNsG4BOjOS
         lEZXbG+vfc6r7/Dws6gaoPQsWziBSaqEcBGpsOCM3Z9NjSiN0mj7vv/YwQuZZJnsxXBk
         ZH9af96yto14LfvLpBMJTdpuL0RYGdI2Kf0VmVG1DlKpqCc83teyhSs1NsKm3zjn4NuN
         2hxA==
X-Forwarded-Encrypted: i=1; AJvYcCXU21VcpcnTxPxGbI4K5Bo0l7GAmafvg0B1OFKwtf5JVQHcQFxUXKNsBLibvqgD2+DxEEjmocyxdER41R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIzGLiQsNPNkBQxQbiRt7UTLPSRDveIKFHMdYRy18gCOkqTuJp
	K1o8hKcbA4F4ByT4bWWmkHRMAJEJegXiYYccaBuXLMQ5bfEcXATCBmRHwV7LBH5aSd0=
X-Gm-Gg: ASbGncsMJ/TeeJNdVkJ3SwT+nBdxleovkyQc2UM/i9mn/TXONiRLI5Ah2Gy6Y8rkvmD
	GsYsPHCYI3yES/xwLrMgzSrZL3ViZXL5kptQEtHIxfD0WRoDb9f7mR2N6RcN2JerPGQZJix+8WB
	CLGQ8OenVnDRuivgZ4Jsclg52YdEYS+zZxt/CQEokks4zrSh23vdzUE10LIihNHjllJcqmllPTo
	I7hLkir7QL/qm+PoIxVRVPCa1IQoCUk/wauss9ClW9U0mSechNo0KoASe8Qr/9XRmvD9l4xrg2a
	59x6F/Qbjfb98/PF11EnAEcZV+NGeHuAWQUr/dY02AmvvYR9tq5ZWMBoc05T5LsHYIPI0/x293d
	tXulWelQm
X-Google-Smtp-Source: AGHT+IEMtmYq1fIqRMzhXzdfqRTh3cIPR7oyaCz2qQz6tIkocykg6S0/hjESUlPztU71trdqlLiVMQ==
X-Received: by 2002:a05:6a21:600c:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-2188c329374mr9918942637.29.1748162976641;
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
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
Subject: [PATCH v4 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 25 May 2025 14:17:03 +0530
Message-ID: <20250525084710.1665648-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0

