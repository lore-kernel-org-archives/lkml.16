Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224623182C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623126; cv=none; b=jCJsdRY9edwNcJdB7/nEopWgqDJXNYRMrA5h8pKDfM47JrcXgGPMelQo6bMV+rqyjefzAJhInO2sCf6xv3Yq21X5SNYZsZIDOAAzT6j0LMaZwqt+fqZCNQuJ6G+EPq5JRWqkGrF8HZb1ogZFNllPN0khHOgFb22NdBFKQdGeuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623126; c=relaxed/simple;
	bh=bDMVpDUTCKSQxIzYquuybqhsrFm52uIQJL3fLHSkHZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyG7sN6BWyjM3rDFrv/yhmb3FEDh5u6FJXP1fFOO9agVnQV1wLDTjdlgejLKTn6/5YnvX9sxlJvbme1czYSDuPqKSd8gRWYflhhhKRbugIdCJ0cTvFXuR7s0g6IjTV9R//zFNhyXdOa/beJJW3xHv2XiVprcoAQHgm0Fris05Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aOLNLSBV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aOLNLSBV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363497cc4dso18828835ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623124; x=1750227924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=aOLNLSBVq4WLH7iTTLFU42LhQxBn6hbTSabYvx2Aqf7QXi1OyioL73qzpnc4oegiXJ
         D/8w9FvUuNBNzgJqqZu3KyuIxWHIt+2+3o2lHnsAefLgYEtWRbjsRGU1+b6letnWlHl/
         bo5gE1zDSY3+s+EhMBTK6ODl2XKFNrES/fLh8WhHaM+eVMp1++AfFULtHdrFqQQ87yTU
         +imgPkYnkH6GdZeCqkotK3D6gRFzNSF+rLxMRSKihsaAc6dWHM8Is100aJWQTNNCOLrO
         my1KjEuMvTfKcM4NRIpT7sMqqsyG25XkAMBhAK3w2DI9KlAV3xdIIy4WFezRvTMJwNiJ
         GXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623124; x=1750227924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=OA/+fdTqGArQlTIj4Kj7qsrtMkYqEEjIc2DJqrRjOi2bJzhrKjqxSRhT4aPfu0Ul0a
         urkl4vNjF+sAAuEaJ1pQF6Wvr+0LaFRmM1lbvDSBHBRLAW5SY/6Rpk0/KeahOqdzsAgY
         dgbNeUOYBZnkBQB7nQ+YGvD+Q6CxvCMlIkzXFF95W31pmmOkPP+ygM1c1WIPMj853dC4
         qvpFI1BdumtLf83K95iDF81GN8zBHeDy2Xu2Fzcohy5ga3g0d9FoIfxSmOCld/iCCkZn
         27IUS9X6otzBIQFO2pTazUys6JloHYljQOdRBElUGXBO5+ZHmMFn/Ofki6SLbHCSayH+
         vJJw==
X-Forwarded-Encrypted: i=1; AJvYcCUALEMcxLGNZxRFgGL4NVzISpxpyjel+Y49uz4WNkPgSLkvxc12gvZ9xZbIlwR54TzLSgnWYWKoDUTGMqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Xwtd5J/IYxRt5wzI9iJMm9Dgcj05U+cmN1GrGkeWzSEhjnC+
	Mfdcy3tlM5VbW1ZCgeAqkma4nRe5AOe8FRK9ccHgdy5/LX+kfCX8H8qh92iiGZRYpzI=
X-Gm-Gg: ASbGncuVq7u/BEFAdneLAbiVncAp9LTtEF2t1aGGzX4WciFIf6xYVzV8APxYHOZ8TEp
	3ND3Yra7GQ9Pirz6pD42VQjfDiUnj7b1mqC+JEM6OiDP6Oj4uS3gzH+oDOIkdZys+9enzFOApi8
	KbAVw4lViGCxLO0kGZkr3htf063j13iKiB/n+yBeb2Ar76YLtkxcjwcVAclr9VkPqfpNWeQOb75
	t0HeX/ogmoZpiNCbCZBFjWn02gW3VHhMr/xpLkKcXhrlIs/Lg974ABl5PVboVNDSwkTbLtnOj4N
	gwEU62vbH14bzjz3p2blPWVE33uTpkqQzK2BqIyHwHRWQPHZD1CBD7LFLmQnp9h4rbqZewAiVhC
	jk+iCt/JTt5RF9Rq0FtRkmKjsaA==
X-Google-Smtp-Source: AGHT+IGEWLvHu+QitAoaSc5JCFVSXTiR4zAQBrrLEPUMyZeyXwPVzV+EQ4Eq/uT7lUdx2oEJTNiDkA==
X-Received: by 2002:a17:903:2407:b0:224:76f:9e4a with SMTP id d9443c01a7336-23641abc3d7mr31388505ad.14.1749623123949;
        Tue, 10 Jun 2025 23:25:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:23 -0700 (PDT)
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
Subject: [PATCH v5 17/23] ACPI: RISC-V: Add support to update gsi range
Date: Wed, 11 Jun 2025 11:52:32 +0530
Message-ID: <20250611062238.636753-18-apatel@ventanamicro.com>
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

