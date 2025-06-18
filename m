Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54B2DA753
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248995; cv=none; b=BxdOry/HSJtJk7UIqJH7qVn4w24AR3qKhMinL9JCTsijHEl/hXAAi7l+6MwG7MEQBxKTyDYkGG4pJHw/jrFiJqAjZL8c5CSAH9S4SBkEGTGabLBGgA2iDSxhPTddStlnwqCCSNF4GeFvqM2aqF9UfqtZR+RErAeVZRL7rP1C/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248995; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adT1Cbhg8EInqbrVo1xW0EN4yG0rE5BjJEcjwsmPkdYinTD5+SbDs7k+X1/hWGH7MJvCAgLiMd2/iXjcvLQgQdYM4G5F+88zvLjcWQpRPqZfa4kNZX2qgIC9KDSfeQeZKABn1CCuGPXLvMi/a5fQ92dmPFFxlEtDsIayov4d5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EUspiqLV; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EUspiqLV"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4679179a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248993; x=1750853793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=EUspiqLVIvB5+2Q1jsOuu0av3HbQPNe8KIajUCJpCI46mnPksI891WJGeE5sC61wHi
         560c1pVVwMDJQ/qqo0zymjMfyf0HGtXwdr0RGneKmFQwlH8aN34lMoRqaA1N72PyNqO2
         gkjE96mogcj4NrOP4+akdHVNUkHk5CmGa1xhSjvUZLeGPcly6uKTq7JeodO6/OHg1lkB
         WEAjPm8c44ebIRu/BcUUA8Mmg+finBsSVbeOY74LhiLFOppQZD0XKrmYGFNW6cYXUdoq
         lM8HlYNiCK1jPSSKumCx1I0aYsdxEgbOgLj6VTGMOvG19I598B9bKL9j77LUOOBk70ty
         vzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248993; x=1750853793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=tXofw66iLQBdDNmvCYhBMcOTTmdzoU4ocRcff59kCJ0NvadQTltFp7eGzOzFPBF0LY
         rnTfbipbhWa1+kjVvYkhsDWBf2RNsw6o0p6Ab+AMSkwXvUflPZUv7QSoQFLLe8oBz0ui
         Jl9JcdTLe1yaXpaz5q7zEkPzO1xElQ+hyqgGSu5LwCt//WAL7LdpNazfnR3k17FesBpJ
         r1JtooTY+XS0ghSSuY5YugDoj9T1KTyTdr5mg8WI/Pp2hP2wv51WwyNeiwCeaAfwT/Kn
         0i7WY13cU66crsdJ53zYjBIidSf8NJsZ37MH8ophnDPh1sylHVH/4Bs6F1CihK+dfcjm
         kFfw==
X-Forwarded-Encrypted: i=1; AJvYcCWe53ISmnItdNiaOj9j/YX0ROmhk6N1btyWC3WzhB4viiQHhXtIIuTQAuTlH1Yx+X8uJ2sQhiPKv43TnAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3S0XqlSLUZYxXTd1kiWD+PRQfe55VWf8hplEFoxuJbvYn7pS3
	hIfscQxbcVPeZApmBEeDFwb9fG338vwAbcd16b63sgTgm10wU7YE+YGUDxcOlQGaSxY=
X-Gm-Gg: ASbGnctXmT9NywJsNeItrKgz8HwXaSViuV6Jv3MZpNdbDwVbzkQRL83Osrf3aLL6yXJ
	nZRsElXGLO2afNCkHTMaVeUTrNKadpHMUEmEtS9R2Njlk0P70n93JM2Qdb0cVz5wU9GLw0J9OJr
	hLZzA19ph3L6rLAh2Yo9OLiGFp2AgX8z3GUG02pjyXoHIncnVmsB/6KpVKTI3F+Pg5DZ0GI1ETp
	Bs6ANjQVLIqJm9b51ol2srdr1qgdGBfjxXXiyk+SfMQ9oEr6Kn//rJStHvJH3icAshheAgiXUv9
	w9SQuFIA1Rz9ORdrO4cA7RbyxuFyOxVW6yzdXFp4xPe89xtnRurwU280sfr/wVLTOjoW99FXBPL
	l1NLl2+ZxUHJAt9KbLQ==
X-Google-Smtp-Source: AGHT+IHwjSX/UY3bVpxGP5NviX4zYZWa4ulipSV5sKhfmblor2hgMtTZAatndUzhakZYZeOzNsQJuw==
X-Received: by 2002:a05:6a21:3283:b0:21c:fea4:60e2 with SMTP id adf61e73a8af0-21fbd50703amr29528863637.3.1750248992905;
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
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
Subject: [PATCH v6 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 18 Jun 2025 17:43:51 +0530
Message-ID: <20250618121358.503781-17-apatel@ventanamicro.com>
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

