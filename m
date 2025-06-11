Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020F22F75D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623135; cv=none; b=kGTha21rR2CM8FeDsPncP7abFQYrIuZH5QsBKawlhdnF8aQzFgkL9KxT/8VV3VmWnGUFVjEvS5CZ+ryga/zx2THLIENLSzGAjdWLHJjFEHYIe9yyH/sKTO+Fz60159IRIR6ZeoEAMkSy3dVfnrQvB1MTuwFcW/YK7+VmAB1FKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623135; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcs58yZtgT1FgX5ntZl2WqDUTP3Th/I5lx4ZUs4Qcg2Ye0h/smpbsfykFinj/twaYKdDgDL3sTn5LtMRKOzaaPLQR1grjJNm4yopyIXNEA3cIIrCOEJPaGf5Kej8DmPNPj8bVsyxlBeAtm4+VAczEpBUpjAv1M+0GI6toSBMOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=B2jJZpiG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="B2jJZpiG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d366e5f2so71490815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623133; x=1750227933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=B2jJZpiGg04yarCx6myK6NWU1VEtVsnvm4x62tzl4Hj/+gAzyWgYqRFySwYer3bgIb
         SLil8J4EKO0sYng9FZNUEaeIe2yt7qpq5hgghEINKzave+u+Tb6OIOA5PtBRAyGsEpda
         sR9U5f8tPCVAOIlBnlhNW50DMV1NO8Lg33y6vCGWh8//wQ/uAnkqwB5lPviKyWePyevp
         tbSn1fVZzIuYy3t5Cu79iTLSiw9UpQK+pdsdXkh+iQqpCrih/GBGLiLjpPQT6BHi3A6I
         1UoLd3WWeX+Zyt+g6suIqv5CkEMIVkieOm3eiyNlKwrx2hk8oB0PJmoFPnEy2JwtecTs
         HV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623133; x=1750227933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=PyCcArSEjN+lnPzqoAABoVVumq0WV6zDUPIJep8TCrEEF7Aeo4kLNMStd/S77xkA/a
         d+Yw13vVanmuTw2mSq8Q4JRLViZoc3sKRA/sTnI3XmbJ2QHL6kGKs0OxD3bYFsP4e3eC
         xBLuioQBgj7zAKRD/SANjhtT2wI6TRkHqzW55NrF/fdYJ3RSa/D5/QG6XCbqhalN6F5R
         FfGeGxUKRAshWL1cbsiJWLtRoPoTX8WAe9rR6uvMwvNa9onxNw39DVLLNKoLUMUDHNfr
         1Au7NQsHRTjRSlhIhB6OoxHy44Jmt6zyPJSHK25aq3q8rVw0OO7g9ruUiE4Y5TqCVbb1
         HedQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwmQENH3qf21SdJgyqUZhGD7X2YA8f18E6Do9j+kdg7FAPmVIhpRvjsAYL3DyYGxXhtt1YgQsn8tiCb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcfjq6aMOR1vDtNCDNU1h/Hv3baVgH950GaSq0Liw6VuF3n5p
	EbRMLdIyOL1UIDRMExPLgWRxVhCbJwUYgJk50Ue13SWJ6c3rBSvVoX6tAVRuBw0RvWA=
X-Gm-Gg: ASbGncvt+o8kVuclBRG+jYrLengoqN5WnHfyP19wFd2JYdLvhjbzsyTXM8hPpq3sAB4
	BY0fDzIz393WS3nMTX+V/BuemfJO7zpI9fH6fwYdjO+oisekyxNHEg5gCtABMbnYRG4z3RE9pN8
	KmUWhKXHcLHCp/wFNjiF1dj9GAFpOb0q2JNkWf26AP69vq93b0SwGm4kNJupVR//GEu6dOoQYMe
	97rLFZ2J3iEV2Xozmov76r2MXzHccDD1DQvVEwaMJlHbtPUyk2O26Bu0nW4d6EEqASV07eUtfD8
	LvaNn63y0UXSB8PCX0SKG3mIvJmQ/3VhbnngIJfBbfecWCfH7y+EhndCuBbYHkLLyPgvzvWfYVM
	e2eBB56k4xRE+i7hvhOL1UtE2XtcVMRZwI+Yx
X-Google-Smtp-Source: AGHT+IEwIvq+MzJvJvKzSGNR//1g1SyAHTIWb/Bau/CEh4PRJwyomTrDPbcTXddUHnHcaNXUPycI9Q==
X-Received: by 2002:a17:902:ccc8:b0:234:b422:7120 with SMTP id d9443c01a7336-23641a8bef9mr26337945ad.9.1749623132858;
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
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
Subject: [PATCH v5 18/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed, 11 Jun 2025 11:52:33 +0530
Message-ID: <20250611062238.636753-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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
index 2caf049f09c8..9c9d22f5165e 100644
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
index cc1928422418..d9a2154d6c6a 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -168,6 +168,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
@@ -222,6 +249,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

