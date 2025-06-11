Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322722D4C4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623117; cv=none; b=CmV2Sg0EGxDevSV87XNf9erglLMQfNYlWQRlWOW/rM8yENRyKt7oV8oDfO5Vo5N7iTKO9cov3NZ7gobcGLKnaVRpXCtR+noWc5hScdB7t45JsGuIevQxJb9ZtfaokGgubYzxDLLqGhHzI3bcK8oI6dCn0WDlQksbjsandiICapA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623117; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/VK/xbuypLT0u+rBZILZTYQX6ULw8nfwZrDxD5B1XBP/JiQNCFrqxb+Iz5u7vbyAewEaOthcf6IGuJTMa89vgV6gYc04rck+KOu+B8sIr10bWI0klN++/l5pSp06zZT1Ukw6pABNXMLhjZRiFBzOvvqAMsbKhW7GBnIL14j1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DApETb2h; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DApETb2h"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2353a2bc210so54799505ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623115; x=1750227915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=DApETb2hsZEWhXaNXn39qAjIm51iYesPlMrA8VTbm7ew33yX80i7uH/TPJNJK6wY8z
         V8BNYvco/eOvjqD27/k5MUiLjWIl0rdsWm60ZV3EJtPmUIkf1wywt+VJHZIJJBXDEy0H
         Uvlcux4yCEyma8Q1PvclYw9Bbgrl3DOngukQdjdwpHXbZVv0ph1kgiiYLUo+r+vWxO4F
         3z9/Ht2+wQ5n6fx9entZIZ8zlmhTkttylrHWVVTBWws7wEA+sozI/zi0O6/vWz0JQGRV
         fa4tsnScl+6tPKb9+b5Dx82EYpz0S7THiOxtztHpGUX7xSPmdZqw7WNVCRJNkXcIsDgT
         IH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623115; x=1750227915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=R/qdb6nXDs1UETjZy/SNeTc1bgcRHgGeRfPdQqj/OoFXfCGJ7yE58G+CS6EIMA4IcJ
         rvs2kByOhRa/MExjxGErRTT+oSM5BpBo9nqgvctmOtojTGH65TogElbI7/7uv8nDq6cU
         NsqMecVL19QrwC4V8ghV/YEHHnALVF72FT4HqSEr1RLL55T7EGzus1Q4yDYCT5kTM02N
         auMr1GdpiwZxMDkmd3V4HlYuEDwR7oRxvBKjzzoUrDKWi8Gf5FRE6VlcVEYtkHkHDltk
         S/6+Ihoiz+CoKrGiEGbnmmSzKhysDzCyTnhKlW8dYbze87h6xLcLGRj31H2Iz1neMZR2
         AoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmArvnTOswIhEMKxauszNJcWXDCGCLXCOwttX/IvCq9cqqmV2Asg3Sg/DRd9NKyNxP2BPgqZXeWhJ01iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWpdwN/8Cur/8LZpr/7sFdQ55c/HHjS74BZFszOh9765Wlct+
	csE3T7IFfnMk/H31+9XZo/8Bu+2rR+6O9QYe3qRL+F6ZMFCn4HkFr0JWixWJnHmdF3I=
X-Gm-Gg: ASbGncuIvKFM9/IR9txrJ15yBqyvIdmdr9AwfjhRudOFLpXedLPKpJPQq35IpQSvjIJ
	AqY+PM5CGOC8wR8C80NVyE9pnje7l8y696thVEZUjVQZypYv0DtAa4TIiy4WmJt6TAN5MJcfSTZ
	NuKRP9Q0YDqjxyPMzDexVFHz7tqcpMfuVfhHS2OPrW/5o8fh1q5Q7gAZbjlNP0Eb3S0wDsgmSVC
	KFWYmBWt0dlKqy/b46UV7QkWU1YglOgxgxf5/kcXhYR3hPzCKKm52J0C2UXm5mOBo+gbiLk/7Nk
	BYbGvD0trptoE0B2YbhhQPFRMrueWFbiFqgoDDXHaFnig2sl43zuSYIM6uTUV56M36zI86bn9dx
	2OwVkaNT+usS8TdSPHtZxh/pPaw==
X-Google-Smtp-Source: AGHT+IFnqBNnTwbehZbdbVmid5c+EUoLDt9iVtCEphlQwJCdvquAFaXOuTjhhB4h2PkL4dhMiL1o0Q==
X-Received: by 2002:a17:902:e741:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-236426b7493mr21510465ad.52.1749623115115;
        Tue, 10 Jun 2025 23:25:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:14 -0700 (PDT)
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
Subject: [PATCH v5 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 11 Jun 2025 11:52:31 +0530
Message-ID: <20250611062238.636753-17-apatel@ventanamicro.com>
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

