Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F5239E62
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433378; cv=none; b=Q8+V4f6PtLJlNLFlMmGHG8zEl9ZmIBD/2uc1C+mKxkg2FqcFe1JECiXMvbtZWbhQkphQW/GaANfynSyjpbEgoyXfjf3apYjOrjDY12frpqg25/TY4OY2Fj3EAoNEveorUhz2XnZwk5vXwUxDxcoGidzS1UyVLAziDwifo5/tc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433378; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6hHIcySPpjJ2T/E76xLUd26sgv0tk2zNKi7MdcNrmCJ9OXVW03kvmUhG+G/VjXIvRhP+Q3G3PC3LNBYltiSk97jQJ4xLO0q3pc49EvZMcDwVSxph0QsXS9lbb6UBhCWv8CV7+X3mgKHv7XVu6fAR+YSEqzZKDyJg/tjsAUSAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mLshOdYw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mLshOdYw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234b9dfb842so36876145ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433376; x=1752038176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=mLshOdYwRso9NYdA2xWmc5BHkiXVkNhdQRS7fkM+oi3HN9lYqr2zu+SU7N3RFUXsv7
         6ixs635lpXrjRzRqmEGLVFAvMZYxRbbj9BnsG4/G52+rBkAwMedcv0iYG/S8r4uw3BGp
         OUaaVq7kS01vqrJJfNWDVrkhOV2F2ciyegq6PCPnDI8PbZS6aEYt3Ut5rNJ52eHvhi1/
         Ia0j1DWBdlf+DBMsGVNyK0YGqBBmyMnrf51ZfVLtHmEMP225zyJRRLxmuy0xAPn3OAu+
         xnLRVfArzUqmBP/G88cgclovYfLVBPVixhnrcpYvPXeClFjaiHKS6ZFp/YfqDN08lr3U
         JfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433376; x=1752038176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=BDVOjKrmMl6M6py7WK8/tDZa0q+ycnoXBOJA4YJDNahtnxsMs8rGArfAzut+elT5Mg
         rzbMmaIg2vtOqm2EMBtIcCNyp/iR1lNKToLqlx3eqdv42cyw0xh/G3QxRI8n7UPbf3up
         By3DEDSh2n0s8oIaXL/PaJuX35Ki9WbpuPTZFyhmSoWZkTSuqLo5rZ0vEvUhjOO0JBHX
         JC3mM4SBKRYHjRSTfVeBbgNipmwkBm0y2zj4GecCCfMyaV/zbK2+vZEbW6DYDGnmZJjk
         QOkAy8mWbLXCdqm72TbcwChY/6Wd7fSFv4Vly+3wLwMFU8Tl8r+LiTh+6qn+zK2BXTS2
         /Hpg==
X-Forwarded-Encrypted: i=1; AJvYcCW8+erdaOY95g3dd79qRuRqGAK8UDCxSju02gKTu4f8XFTBzAPigpyuUteMDnt3vHUvEnmqGaL1MziRIxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5OwEkkAzLnqfi0OmGHvW4zH48SnJyEVsqIWV0Z4sbaOQ2o65
	cbTXgY1bLRG1tfXEUbOUyLyGO79nSWAtrhqHh0Apdl62ujeDgpl7d3WQ7lmB68xfiGM=
X-Gm-Gg: ASbGncsU1ynNcRjdW+C9srNRofAU5TP4LJBluV+2Zxejae/FgOdZibDKR4wAnDRhFJq
	ugXR25HD3OH42bj8uoDi8eQ23apZtFL/blzTArOT2njqAC4ShV5khyRV4QiVgFCNpF4+GMtw0yH
	7RjmEnnWjhM5RIjOdB1mCfWi0FJ0NszNErMPUASxcPnNhBDxu+7BIyG2VXevRYwgkI5fjSJG6SV
	FNXxz0VBCq4Sv1d0nGQ28lE86PhzPNzLpnBHFAd4WbkDGGe96HtwWC3F6BzXTItnnQHduvn3M8a
	eAgnfyzIhHt+AXXxrKihrGs2T/nH5XjDGaO/sR2jnauyF4zDRzygqWxQEvjAfAybo93RkGc1Vkb
	zf9RQpnIe5J8bjBo6
X-Google-Smtp-Source: AGHT+IHK7JJshpTCYWIRPYhBfujfdQF43fCmzueM9e8EwtFQkDR9S8tXHvcjhHdLfuN/8WzEAqudfQ==
X-Received: by 2002:a17:903:948:b0:236:6f5f:cab4 with SMTP id d9443c01a7336-23c6e4d3578mr24923105ad.5.1751433375731;
        Tue, 01 Jul 2025 22:16:15 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:15 -0700 (PDT)
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
Subject: [PATCH v7 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed,  2 Jul 2025 10:43:38 +0530
Message-ID: <20250702051345.1460497-18-apatel@ventanamicro.com>
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

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..33c073e2e71d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,12 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
 
-- 
2.43.0

