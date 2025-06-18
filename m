Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3232DA753
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249004; cv=none; b=JBx1snjrJNSNw1wTP0zG/q+1r9u52RWPN/3eJ6wMWf4EZFRr5Ft8BgazhTRe2hjfIJu4+d17NB+BVNFtjXYHb7Fl+1HxluZL+gi9AR4zwQnV+knlb/c/ZQIFsAN2ms9c3k85TeqZwcRYf/JgU2GdALH1hpaggvEUbKNu2ZNH/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249004; c=relaxed/simple;
	bh=bDMVpDUTCKSQxIzYquuybqhsrFm52uIQJL3fLHSkHZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huZM08qOxAm0hXYCwmmdiJr1Ne5tIdag+TnWCQ4Hs2/ZjF3zrAZ/qimHWgR/sm65tnWf6LyMqwmPku1ACPAhgGet81w6usZKuNY2pI+/dInRoe3gYRXg2AG9IeeKJZuclAI2KghgQ/IS9BJXsMPSVyOzDX68h7KaoKIzHq8DqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hZ2ZMmAV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hZ2ZMmAV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747c2cc3419so5314316b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249002; x=1750853802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=hZ2ZMmAVUgHPqFxG0Hkn6W5h9YecGlleAG7w64hfms4+ym0P16/AEevLMYQFso5wEH
         gAN//HGKDNdCzcLIdGRK7nVjZ7zGhAULJbiLC5ZlHxEC0TFMQ8cxljVchOfgkltIfeuD
         D3df+1GpL3gXWRV0aKhYgq+65IH4C2lHty/oPVzAE/9+bszavqgd0FrrTxzhw+jd7ShQ
         Z1pMEX88B8+EpeJID6BoawLiVVEgWGwY5YoSlN57gQNxVy+GEUNoY2k3p+iD1AvqVatB
         /ueyEYA+QkVrdg4MY/4B1csmSYB4JH3BDZNFtmBvuGU47NutV6oeAg35Xke5zvBBYESm
         ylvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249002; x=1750853802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=wSvShAOBW1Z1Zi5z61uhEKsN8/AEbV6CqLBQ5hVwaqsK2UOkvA4x9Sg704HcdIdd4h
         2q2r8V3UzdogdXOZguaImjX7DWb21NhtFf9uFUiJG/nUFhtX8AC4VCFD/tMpWB8Zl7aa
         gcmYV0Zl34JfueK1zlYf/ZcWYSXJJw/m2ooOvFuTtGaZSvU5p+yIHZGM9ZyQOf5T4qnq
         nXMi1oP9lPEWUvUWHx8RNvovtHFofvuxYj7WP8+OQPVMvTVplm1PIDgvOs+8emvXCskf
         WiZ5H5SyS3mlCnW2EXJaV6xLXzl6uWgLPdO0JXacv+KFzTvucFSLYnyD0K//j7t5E/sh
         a62w==
X-Forwarded-Encrypted: i=1; AJvYcCX+7tnI4+XI/MEKyjDaD3Ea5g7MwygQa7+52iXVD4cboIG898P/KyQ8i9mCapPwZrEqLclq+fkvdeDVbhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTzik5VejZ069EXrdKmbnHUUNY+FZ9YZZHzYOu/6sDzED+sZq
	kEddCESoHtUX4wkGG+RtS4WasrNE4ZIloBS7U9BRUQhrQ6Hw7OhUl+coBuNmc+oLW5U=
X-Gm-Gg: ASbGncsxi+rD0afgcUSB63m4nN2XZlmPdA+6TbZeT6VONGBw22tl2V+yDWot30/zlXe
	BP5V97YOzarLxR2VcmqHbVxJbvyLrWZtaZGvO2bubsd1+NFNZCVxirxiiHMUzPues67jWqJ+K8s
	clj20rambhDIdWylzx4/JfOVDgUo9Pidwwvlxm8O87vWE5KyNcmZWH9+hOj0OYRqhDKWSwW++De
	nllUr17L0iuG872bMb7NBjycvyxmWDBzzCTkChqNcbGLV13zu8PxfNSHV3XtY9DEidMBCPh4/Aq
	OYSue7ZnU+O9lA5RJ+O30Akrc6gb+M7TOQZNI11PxXffAPElybFHmZiaHkky6yg9nt/IGfQ64tL
	09pQNwKZyoRH/e3XgYg==
X-Google-Smtp-Source: AGHT+IH2P2w3U/h/GCyVrF4vWBLzughOxmxuriiQUW79HX0TxSqhiFkSr2jBzgPxCEWk+K4/KL10ag==
X-Received: by 2002:a05:6a00:14cc:b0:740:4fd8:a2bc with SMTP id d2e1a72fcca58-7489cf5c8e8mr20222421b3a.5.1750249001664;
        Wed, 18 Jun 2025 05:16:41 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:41 -0700 (PDT)
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
Subject: [PATCH v6 17/23] ACPI: RISC-V: Add support to update gsi range
Date: Wed, 18 Jun 2025 17:43:52 +0530
Message-ID: <20250618121358.503781-18-apatel@ventanamicro.com>
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

Some RISC-V interrupt controllers like RPMI based system MSI interrupt
controllers do not have MADT entry defined. These interrupt controllers
exist only in the namespace. ACPI spec defines _GSB method to get the
GSI base of the interrupt controller, However, there is no such standard
method to get the GSI range. To support such interrupt controllers, set
the GSI range of such interrupt controllers to non-overlapping range and
provide API for interrupt controller driver to update it with proper
value.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  5 +++++
 drivers/acpi/riscv/irq.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..2caf049f09c8 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -40,6 +40,7 @@ unsigned long acpi_rintc_ext_parent_to_hartid(unsigned int plic_id, unsigned int
 unsigned int acpi_rintc_get_plic_nr_contexts(unsigned int plic_id);
 unsigned int acpi_rintc_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx);
 int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resource *res);
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -74,6 +75,10 @@ static inline int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resour
 	return 0;
 }
 
+static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	return -ENODEV;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 33c073e2e71d..cc1928422418 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -10,6 +10,8 @@
 
 #include "init.h"
 
+#define RISCV_ACPI_INTC_FLAG_PENDING BIT(0)
+
 struct riscv_ext_intc_list {
 	acpi_handle		handle;
 	u32			gsi_base;
@@ -17,6 +19,7 @@ struct riscv_ext_intc_list {
 	u32			nr_idcs;
 	u32			id;
 	u32			type;
+	u32			flag;
 	struct list_head	list;
 };
 
@@ -69,6 +72,22 @@ static acpi_status riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle
 	return AE_NOT_FOUND;
 }
 
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+
+	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
+		if (gsi_base == ext_intc_element->gsi_base &&
+		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
+			ext_intc_element->nr_irqs = nr_irqs;
+			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
 {
@@ -115,14 +134,22 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element, *node;
+	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
 		return -ENOMEM;
 
 	ext_intc_element->gsi_base = gsi_base;
-	ext_intc_element->nr_irqs = nr_irqs;
+
+	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
+	if (nr_irqs) {
+		ext_intc_element->nr_irqs = nr_irqs;
+	} else {
+		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
+		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
+	}
+
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	list_for_each_entry(node, &ext_intc_list, list) {
@@ -130,6 +157,13 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 			break;
 	}
 
+	/* Adjust the previous node's GSI range if that has pending registration */
+	prev = list_prev_entry(node, list);
+	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
+			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
+	}
+
 	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
-- 
2.43.0

