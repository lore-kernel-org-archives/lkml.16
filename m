Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E91FC118
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572738; cv=none; b=eaZG04gy5ApEVMugRbedXiiY9sY1REBQV/1VBxhRBcj8LNvydY5GjBh72G9iDAgJgGtCPmPYbI24Jway7QDx2cbIq+Y9rDGePfCXzITar3eItxJLccRvPHBXIgjBvDzKIw3PrCdfYLCLLuXoaHmGjd+/Z9F7fLBkwjWvbLOqc9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572738; c=relaxed/simple;
	bh=XvE6Vcit10jj+EGi7W0UE9JcLMFnOwfkX8uYHZdyz0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxEN6KlGszfpVw+sXdIMBvUew9iVBMxnySQYKHP1wgwphVFwkvHQhtrx3esMZbVXp6QX7adQRAFpuSmejHqm88zgCZBpyBi+woY47ta7K5CYeevefj/u/hFJJA+67/3vcr5X9O/UXaE6AxIOFOR9+ZrXg1SzGJ+jzYx0wAkMN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QfoqgTyz; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QfoqgTyz"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679eacf25cso26964831cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572735; x=1739177535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=QfoqgTyzLrOvVtcHhcX92iOfZ3EAVZX9HJ575jqQdzqlYeNGNb/OUa249VRxtu/zy6
         meIz/rHELUHMZvIY0tHu/9w/jLdrbyV1iBV7iOku0GBrljU6n/pSoQYBrMZZoGQJk3A7
         n8WofZup43BaUxXe6w5GKeIPp2xYBSsq+V73937mNnR8Qc0vxwgqbSRn4MIa/NbmFW9L
         IuzdSax+ffAD39SW8O1PTLWr/6R8ENAc/eF2xdsfH4nFpRu2R2usru0kmw7NOOfYqfDa
         LxOOHZo8kFBX722Q6lvThAHkgfUWmSKIRJd52SXDAD14IWy51YmzXawQc1KuGl9lv2jF
         M4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572735; x=1739177535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=dHMyf+5vclbpTUb9h7Q6HHnB/qWs7t9UFG4dj9vsC1GcJLH3DAsHl9XvRIQKSoBu9i
         ZpZ7zTGYvdNMnT3A8MRCSekb9Mhc0CxS61FMu+3lmrk9xPqW3cIRUH0I5l7vg181m7+E
         AXhFbTMsTfdH12YUVykSvX2951UKrSiQOLLYF0E2mXd+CSA1lObMDtXo0LZ3oWCjnySh
         bNKVpdroJyEup7/koNhGx+xzRFXB2ko3RLPDpV8oJ71FM5LcHyEPFYL9mt+Pq24YhQQk
         MTXqN/gsrEBNxPenHzSTSihO/wqd7AIJN762Ovv1X3zFm4kDi409LFsBIpn+Dvd2fLgI
         CGVw==
X-Forwarded-Encrypted: i=1; AJvYcCXsg5l7OWUAVnaRHdAc+UiRilyOHhkk5TNt6DtQwb8PxYBpy2pxncuYdHry4sAbehR1uaNDtqGOS21OK0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YywYqExn1UNtFFcQNKc8pqzsxyhbi7YmEWLNgBofzf7IbpjS3Nh
	BNkzxXgV73F8tztlGXmyr4af/oEjVg/pzyA0NCWpYPQI5mzpuHdSq2N7Sf4Bre0=
X-Gm-Gg: ASbGncvsvPA3vRA54dFh4Z9sawP1MQ7vLcAPCdDMqqwa/ZjreVLluLBg9YHA5214V+M
	YUE01GswAMO7dCvsCo0iLFhhKaJI20tkHR/ia3qrNGcSBZ/T5vSjgv84eqpYm7iHuIjXZ60rtkx
	I4YX1IZBGAmZPc2GlnraaGHwNT93vxLKS5eIS12S0uHadvSWhIRnrHq6AFbavIHWzT+6uhw8OXL
	U8TqT3sRzwH4+FtU4ipqBWrn2EYkr27cLEzrgv2jTuBjSYwB5S7apW+JNRWLLiPKiltoDr6RcXW
	5qMn6F4C7LhBcxXppVc7EleHcjHXNkwmWtWe1q6x97y9cYrPE2WDn+Y=
X-Google-Smtp-Source: AGHT+IHyOsiVqCAtnNa8Q481eo/B2M8Ztab6qXUkekooWXnznAT6Se1XFkIj6MwCVgjL4f2KC2DyyQ==
X-Received: by 2002:a05:622a:4108:b0:469:715:d94c with SMTP id d75a77b69052e-46fd0a123abmr298052801cf.6.1738572735411;
        Mon, 03 Feb 2025 00:52:15 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:14 -0800 (PST)
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
Subject: [RFC PATCH v2 14/17] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon,  3 Feb 2025 14:19:03 +0530
Message-ID: <20250203084906.681418-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
 drivers/acpi/riscv/irq.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..144f97189112 100644
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
index cced960c2aef..c141975c62b3 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -129,6 +129,36 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
+	/*
+	 * TODO - find out number of interrupts from ACPI method
+	 */
+	riscv_acpi_register_ext_intc(gbase, 4, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
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
@@ -183,6 +213,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

