Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C002571C9
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970968; cv=none; b=eL41TQ2JRIRRmnHl1Sv1ScksESpmyW/GAe/16e63E/K5eXGUlst5AtLgBibTbFM5XxGeiTvAg2WGCrixlyMnODUmo+VrKoi5toox4/fgFz2MzDqX688d6PeIfv3qa/t++/eBJXHygQpLcIrkyWKMOgeuXgkycWfWqtVMFGm+yKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970968; c=relaxed/simple;
	bh=2c0c8jsJfWRci4YgLo4Jwd+/KiY2TElC2GWw/k+HR44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWMqBb5aFvfPMjbvp02iTCFljYjwlXVWWjijdNF4X6s8S5Fp1r2mJxXRCjgWWoB7erO9ocH74EoBWF8+Oqwf7TiiS2d2Mu+wNnpiHkHBMoaaCyyZVH5GnQaOKNKBRqPyCaoS954DhhaNltgasdFdA3hS87F4laNQLzFtjQ43ZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EkbRdAaU; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EkbRdAaU"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso2493200a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970966; x=1747575766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=EkbRdAaUAU6qLgzMqOGrizv1qSaaWwft+hPRk7nOLOj2HzHWdeX12lQ2iJobsBhsYh
         2nCfbsO707lEKJj+Sbj2ZJSaWtqF7tHeqYgNOocSjhKhQ3YXp/tdwXSaTRctcPGDwVRh
         5srszSV9B/ijuMoVEwhCGhf8UZPLoeQWaJTFLvFE3SwQCPJ0sKkCfcm2Ym2zTij6T+gA
         PwXBPirtA49iuiYihIoHHgvvJL2Z7PsLL3gcLxDv7DysbEef4MOhoxcGnsslTmypdvTY
         bVQsJ4pmni/GjqMdt8q+RM5VXuhk8JgVfJPlYgFRFSXQ0jqSMs27Op4LNZ9ESdXHlIZS
         l09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970966; x=1747575766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=RoHc3t0Dfm9p2G0Rec8YNfof0NrAN3Mzwp0+HBaMUC8360+27WancD28+CVdxCi+hP
         hFI9gQAHO37vq3w172lDJsdJHkdwHc7mVCx3H9V6v56xBSqQbLnVv2stHxWcGtI/hRwn
         QmE/JqnjF84QQGwrTBrkw1J2vlhzatf4iTWnFxnFCKttLZ/8kHYDIcnQpSYUvXyp/2Kz
         8eDMplhaeC1aig7vCONzolO8yT1YGdirREqcEPuV4cxcOQwg4lD2SNxentg84Ysf5Bw6
         07xzaipA74HpUlSJ7ba6+hfwCB1JPzYsApVViLzUjBdvRuNUnbmf78N4JRDpomZXdPAM
         vIrA==
X-Forwarded-Encrypted: i=1; AJvYcCW+/HNM7jWW5SaJTrnMDNRYCamoQuL+EIrj6QDYuJcNC8vdvV2TukywXv9lYfU5MPNzB6sHrmZMImX2Uz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJeibqkEdKhUMBFxBjQZY7573YNiL4ByAoDCzVG8qWzZOEME3
	+LqHDBx4iJFI4VhKg9jw64L1EBV+/XCj5OK7Ow2cJWCUWxMNd8o5R0wEvJiWzy0=
X-Gm-Gg: ASbGncv7pSqa4rGw/aoQdjuREApE2CvA/EtzVTvHHLC+bqjhE9vDrr1hd4gjBtySjY/
	DEef2tbg4I7wWd5nNPFZ/p0T3GIUm4bB6ZoUkjAQXe8Fv4xMjf4mGcUNgHzZNSsZN/gW/czAVnZ
	yhZvFIolvS8D1Qlbv6Imjf2YkFGyUitbvcn46vYF6I5gFh+1JrabFydQbAl93/F7gUfwypLt0nn
	vDU+MU/AFw34ePNL8TOyv4GM5HgJWNIgU5ilXK4HW8hnYYyNgGCHPugeQZ4m9+laEUpeohVq4pb
	dH8QQsZlcwryAY+uzLAJ4YnThZwnKqxa6HATWlx25yALufllFr7uva8cNb1kW8j+CI45z6XpQ3n
	gBeTmaIq+fPAeUA==
X-Google-Smtp-Source: AGHT+IFD9aro01q26Oqr2tLLTgh9Uxp62papfpR06AdmrrPoZMhToINHO7wyBBWzA9lmGnJCy0hp7w==
X-Received: by 2002:a17:902:e393:b0:22f:b25b:8e93 with SMTP id d9443c01a7336-22fc918d15cmr122283765ad.48.1746970966248;
        Sun, 11 May 2025 06:42:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:45 -0700 (PDT)
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
Subject: [PATCH v3 19/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Sun, 11 May 2025 19:09:35 +0530
Message-ID: <20250511133939.801777-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI device will provide GSIs to downstream devices
(such as GED) so add it to the RISC-V GSI to fwnode mapping.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  1 +
 drivers/acpi/riscv/irq.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index ef4aff62fba7..d28f90a25421 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,6 +30,7 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
 	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+	ACPI_RISCV_IRQCHIP_SMSI		= 0x04,
 };
 
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 2ce311042627..42f79940a69d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -173,6 +173,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	return 0;
 }
 
+static acpi_status __init riscv_acpi_create_gsi_map_smsi(acpi_handle handle, u32 level,
+							 void *context, void **return_value)
+{
+	acpi_status status;
+	u64 gbase;
+
+	if (!acpi_has_method(handle, "_GSB")) {
+		acpi_handle_err(handle, "_GSB method not found\n");
+		return AE_ERROR;
+	}
+
+	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
+		return status;
+	}
+
+	riscv_acpi_register_ext_intc(gbase, 0, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
+	status = riscv_acpi_update_gsi_handle((u32)gbase, handle);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
+		return status;
+	}
+
+	return AE_OK;
+}
+
 static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
 						    void *context, void **return_value)
 {
@@ -227,6 +254,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

