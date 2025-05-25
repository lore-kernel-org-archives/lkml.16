Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC071E1A20
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162987; cv=none; b=opciYSVFkuU7e6EBys4pmrbpXY/ELZ8EuKLK4Sr3Q0ONO8vvH/pw2v1FEyDhbVFUUXCqkC61cFNbnGrZ4Gzz5KvIxBvW8xT9bJ2cEByr0pipufNhOeKsl2cOsDaDJSz9qKCNkAvEbHpgz1NZQwXOhSIzBQRVdm+iqsycX+Ytegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162987; c=relaxed/simple;
	bh=iYFTMRQJYHERqAkl7SYjQsJyICxvZIoB3wXVxoG7tuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBSgmZ9Cz6/h9P+CN6mxUxyAzOEiqNqE8E3OfuGd9AqN7xu1g4/uS85urJviCVaSHBB8oJrebLXRPGG0tuoZv+wFNB3JY3h6wxdAu3cFB1fZ8p/TU6W8mNePmfd6orWRYKvNClOsPcLN/l2TPMlrvj6AgLnAKPeFBbwLdlTuDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Sere2Dq9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Sere2Dq9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso1321930b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162985; x=1748767785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=Sere2Dq95x7CnZcCUYc9cz0+IFwF/lerDK3DWaP8wS7p98iA1k5O1lQuFXxWbuB/El
         /rRZAvWVjDJkPcKlsq97fMCq1LfgqBJn+JWl2L1kOntuHsCGkalOhR2S5VqspYA+uTVe
         cWGXGc3gpK0wB5vPhrn4F46vAVlgjKR7qmoGBi9Uxann9oE8Oeu8JPXD/rNoftCBeF/H
         8Y9BQEroTBZtZCqN+00Cg7t9GuZ/vNLptPjatd5lXVeoMf8O76HUbPzKmtX0zi00e75R
         C1HkRlH1eMTkqvGUAkNXaBekg0wED4KVfl3AxYQuXeEmnKSIsHVYvgxGeX2H31bVwy1u
         eivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162985; x=1748767785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=YJmxu7mnrE0avvPCUEwpshyYA58Jij2cD/b2vmHRtvKTmTyaEXlx5U/dio1XXpqh5T
         HQT7q3hHezoq7wt1Yn0waLyAM+nsKiIgPtihUqpzM9m0NdZFb9Xz6reF8nBGpyJNN3dE
         cG3h4Wun4NfOijaFNTPupwY5q44WGN85L8J2OLeSfXGIxwW8DggPm58Hb2VcU3f7YZzy
         MzdsHofgWT5R/Tu2LKg8zVka/rBxeZ3N1VOnaoQ01i0oczxasVLQXJ3x5V/sQ34suCS1
         9i0D3Db4ZGwoSpQGdWKEr83IhwBumGKV6Im1/K1dHw0AS7nozZ6DGZkg0/iMxZFssWQL
         sE9w==
X-Forwarded-Encrypted: i=1; AJvYcCVVI5efmY3Zjm1myYblO1RJWgdOvJyTbfbWTVaZhLtr37+i29yXnwbITtkV+U6A9EOogGmsRfchBUt7+j8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrrf3rxagX8UwiRPSi7hjphKDhKSWeIYZuohorijQhgrqSH3Fh
	inp1mD0qlWu/+bovbKVuiqN+drL5X4bOeXI8wFjk8QkqgjaPRVHg1FLLNRqcr5CfkZA=
X-Gm-Gg: ASbGncun7ZVARIZ3QIbhzpahdxig25umpcbDxrGToRVrBbwjeSsAgJNRg7w332Xc43/
	OlP58YKERzEBUK60UHu1LAYOOx8NgQ3Crb40F5p5QqBR2Mv9YcmVLd1Izs8ydRKEpkb5TlOBtiv
	RQwF4X/CVVFh0F206PpzFDnRKcSAHyM0rg757naYbSYJdim1ECmdZJMEsUZEa9A4iFhSHTWiHS8
	rs7Tflme6iM2RVvCOky7eZx/aryhf57tsHDWxjihy3vV458laaq/X26/OEP0NVr/qOzR7WUdTlf
	AKnz0dT49qG77HGZ2jviLg6shz7gMuHmV5V7X67Xdq5CpUQBOVoIkiiBP7ql9Rk3+rz+W0IGLvx
	5SdfMsdGsVONpqujkj6k=
X-Google-Smtp-Source: AGHT+IG9TTZb+OY85zw+H0eNYjGgFyHc981BMuloFhe2PCTtl6RRkSB8ul9TS3wJ36HaA/NGbUjQ+Q==
X-Received: by 2002:a05:6a20:a11c:b0:215:e60b:3bd3 with SMTP id adf61e73a8af0-2188c353194mr9297558637.29.1748162984743;
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 25 May 2025 14:17:04 +0530
Message-ID: <20250525084710.1665648-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
---
 drivers/acpi/riscv/irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..95b4d7574ce3 100644
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
@@ -125,7 +125,17 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	if (list_empty(&ext_intc_list)) {
+		list_add(&ext_intc_element->list, &ext_intc_list);
+		return 0;
+	}
+
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
 
-- 
2.43.0

