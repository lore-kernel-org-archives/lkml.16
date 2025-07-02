Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF31EB5DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433394; cv=none; b=I6Gx0r0abZwdwmqAkiy1A3YgO+LxuAkNgq0bKSARxVI57iQloOEqxKbcX29GTbCnR/w2a0v+cseqW8quOPEOrM7VdD/yLApFxhUeqBakL++WyecItCPiGd3B/nGE+5GdIh5R7zG8v9bKmdKruOVRHkOWab2FqUB85eE9h0yd0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433394; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAltWzx8GfSnfac/6z+swGVwI6C8irn6qQcuuZLNLIOHZAGGs06hjJ7yDQ03kpulpJfSUvFziQwy8tlbujXC5dKNI7uyeBV45BFFM3BXTgIPPIx5pck5/TTPJpY8i3oDcX3KdE0ncT8PK07YxflrUe+zeSmdinQv9ASU4qgTGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=K3lU5Ep0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="K3lU5Ep0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350b1b9129so26385025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433391; x=1752038191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=K3lU5Ep0Y4F8NeuPHf4pkqkRimPzASxkbkyPhz9fzQrFPgbcbXShsl+y8NVck0vooV
         YA2xLDEj2ifdjA6Y9q4ha2LRYPIuiqbNDb7IDkhXWl7VlQw0bptDFs9VM9VtlHnrnw8M
         dmnC2BYAvsK+jLuGYry/m9sQ6ZtJ2uvkhkc6HIlRct/mOGRqo7cSA5pg5d2WeY3bYpwS
         O4EF4LztoRVRmqG83psrX3C3foc4SDJ8elf7/ASBHwxS1Z636enqfnOxff//a/6zEmYN
         /YWuJJHcfXY7kqDulbQJfzzjZ55fe4pTLT3S4cnb8l1/g6bS5nIj0D4G9Ev4sOUyLSyH
         hSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433391; x=1752038191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=Rw71SeM5L/7kof/0yCxbAuHEdMsrLgc2MSGDZ4iM93IP4kvEPFRkZZlk+te0Hv4src
         /02Dl9igsPGeO5ovy643T5h8SKnD2MY6cfI1Ur1JN+oFu/voGMajXXN2rjsoUI7DWx1G
         hy/3+7HtgWj88D2LFi2ivPf4f4aArWG2XRqgX0vwzZpZB6loFvyh4i83OXqvglKW+/Tq
         cksSkbC4UAaYiMoD8lSKVtvCd/0+E5oANwaMh/krzPVbYyEVBdkr5X2qO4uPNEAoAJji
         U7jw0Sz7ihaaQpyvhALT2G/cpHyu7i/E8InXVaE4ZEuF5BT7xW6N6s2IUF/mHPy8UDMX
         r+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmFT6BX+ZNXbJ4dK8TWJSFYkgSlAIJMilFUzqKIFMRwqdVYRCgeNWNqIrj3hSZDuFI4igzHcaY0paQ0LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywieahe8JZ+1ZiH9LjWXpUw2x/HY2Fu8mR3DfC6z/QxsQW19gMM
	zfOn+dwuKTn7RAZTifmdkE9WERfkUljSSpEDP9hPlNdZAInsFc/oxrAvE+GCaD59qa0=
X-Gm-Gg: ASbGncuuUBalmbBXCx5m501uSsvTeguXAWtekS9KYRF9FpiVre6NQ4A+u+J1M8Ycr0+
	lYtlE0Rwr77vXOBHwVRtLkrXZG862lCIYN3qA8w+wiS/L/LDCUTZrwTCNXQ9exI4KUpiRISaQuT
	uETyeasn9s1F9yPADa+szFr012sC7+YzjLK3OL7dKBrbLI+38yEV/RWLr/ZQqg7S7G/RsY5Zpil
	+WTMArE33sAl7WJ0ITYSsAqCd0NZHDn+TZraqDIP+Ku6Oc3+DDr7olyXbfAh4nEC1El0YdCHvzi
	VmvwZyfVbvPWzncMdd53O6ObnrnS/IBavhbPt9P4cMGgBZbHqt9hSyzorl6YhN/aWtF1hwz/2Jw
	bu+5/7i95py/np6u5
X-Google-Smtp-Source: AGHT+IGVPhlwjhXki+/3hyU8U7wHE3TbWpzk5YrsdGI24+SP+ypvFn2VzK1niX3bMdBnop5rpgktYA==
X-Received: by 2002:a17:903:3c6b:b0:234:9670:cc73 with SMTP id d9443c01a7336-23c6e490fc1mr24534815ad.5.1751433390748;
        Tue, 01 Jul 2025 22:16:30 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:30 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed,  2 Jul 2025 10:43:40 +0530
Message-ID: <20250702051345.1460497-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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

