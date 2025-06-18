Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CE285CAF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248986; cv=none; b=D48JTXjCyikNk2d+J9pbH1+ovvoi7p4vsmdDB/hIvNYEITIJdUcUlDHatv03Fk7TDdIc/aZygyX0SmDGmcc3xZiW+SJFOwLBWNqxe5TZZE9JUXpxhVxwcPf3A4sjbM0LYTaOaelLIRBA6YG0sarnzlW6TLby/NHszN7kn+rchD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248986; c=relaxed/simple;
	bh=vaT9fKqdkrP7eBvkYV5AtQjKTPo8A3kQSz0hOZrkoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyQi4pK5ew14aBakwPL4H0e3rTFqczrQVxdDWeQwSjAPFFfiknuiIaajPGI0TEfd6gTHPFMaN/eF/ym1P0U50086HnDnWRz6viC4FdFsptBA/wJaV9Mz3dzf9MMsS9Kj5eoufa32VYWJ9mGmKM7mWmKXEJUoC3pzZMrDZhq6QdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ppcrbtdI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ppcrbtdI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso5541579a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248984; x=1750853784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=ppcrbtdIblDj11MqplfzTs5utSx7VIEi/5Pbd/NPApfxsOn0/AnzK9BsR0gYuCgDdM
         /H1mB/hMO1OWjTwZNyZZsUtTZmzNmdoUAay/DcR17j/+dKFJttNfcXiA4lSPTDkKvvL0
         YKHTiDXg5SN4G4bLgCR+Yxd8RaQTSejfQ9dMgWkydVGimMcBdD/6Iws0B0h4C07SZZl8
         a0xrF8MhiaubZ/BCq6Jc1F27BFpcJOzFbbG6I9/ztK+tpYQ/Dnq9elFa9qrUFX7GniMj
         Nh5xUKGrXn3HfXWsJyU7AySvJW/QCbShI4+lvU/XBUu1q6DPfg3LxEw2zqmn8fuTftko
         NjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248984; x=1750853784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=adSyo/GNdmsgC4g+mMLFZoXFAcD4jVJBVuOyVckP2+crOjLSd37XMAM6rGIDY6d1P7
         ozNV6kHQuypQ0/RUSaksHzWredK862wm+MdC58hL49Jz72kYF6VjfRU+vSYlLq2xGh4e
         i2GOieYwO9J3QIPBnIilnoMVO15LyatkRrsFkJu4T1DXLJYXHYFRaW1yTNSTLU9/jpKt
         vIsbBTZnNvDvSg8W05uuHv41tR9qFIp2qPRRtl2RW5dpcF0dw/zNTfJ6ANsqXWWZVT1x
         dILdpjRFwlPIL8/WyFgoQkrjRpHBZdxOg6wPDF3Fc9faXknJ6uP+UsYmRAwNSjYyLdsT
         o4qw==
X-Forwarded-Encrypted: i=1; AJvYcCW6MAvj6jW81yOMVIPcEeu2GDGuUq1el5f3MN4zqp5eGjjJzyuQ0sD/EskhbAgQVNov3u+43GrKnxS1W5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcokpzhDV3g5VnwcqorwkKnYjWGWbmF4Vx4ZXFOfYvMAYUnWqY
	Ras5NETi4ZzQBKMUIj24JnCTTCIUTK10JZ9q4VOrXwNsJ3DtiC7PtQti2bIw6JPoYVo=
X-Gm-Gg: ASbGncuYamQV8OEF8kte9TlL4FFcatAgEpD3vS48PcwHOsqaFPsIcNjFkfiJmGjFnMW
	ugFNpPhaRADe7cRLAT/ro0/D/C0NHt3NP/kistobmcdzsJjoRPZF+5pjxq/GMjJkbuq/R0DstYu
	Gm4HYCtL8YDLVAtOOU5qDBqRY1BzmT2H+CaG2tefMhjKG2MS9rD0xGKpnPrN5SpIAxhYUHscijI
	Y/QgvMcZI9PVt/sW2MIC9oFlFcO2anE/tuAuC8OdyEfx9qG3UfPmF7ZiricNV32OewT5LdBpyjK
	OFLSCcpawyWpPgYh0oirvppht8umVGr1Lr/az1F2dDpYd2JkT+oHuZpnu1HacZYplX4H9uiTaid
	JGgqbdNEyhs3a/5ZVLw==
X-Google-Smtp-Source: AGHT+IFC5oonHbqa+1WgrcguufpT3Zth20l/25Hqy8auGK0Yi1uMoUCsHOZcemPZLHn8HliZdK3kyQ==
X-Received: by 2002:a05:6a21:4d8c:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-21fbd556dc5mr26732280637.23.1750248983978;
        Wed, 18 Jun 2025 05:16:23 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:23 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 15/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed, 18 Jun 2025 17:43:50 +0530
Message-ID: <20250618121358.503781-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

