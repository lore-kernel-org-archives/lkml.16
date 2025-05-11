Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D922580FD
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970951; cv=none; b=OYtzEwQ0jH1TdygbsGtD2tFMDO1M3hInZRWjxI3nlTIjM8vU+fI3UDi1P9K4qRA5GQf1+5kiuI+UjyJzg29X3L8PjNdb3VlPv1w46bBH3uAEeYTzSwOWglSlsAlxsxBAeDwQFwPG73siOvo1NOoycJ3amoYEwkgEr5Ue9Hethno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970951; c=relaxed/simple;
	bh=iYFTMRQJYHERqAkl7SYjQsJyICxvZIoB3wXVxoG7tuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9WTfT3J2ckAvIebvWRlqRwV/xsvg+ndG3c812804btmPmTbEDWlNK7VjmET3xVJw+qFVnR7AIGzJvD+6/+wfFU554M/Dw3KcKO3hHgK6ladPFuhbVV6dBi6CGsfLr8p+37m8ChGv1QM+cheI0R9molnpjsDFYQUIf24IddDzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Bal7FfTg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Bal7FfTg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e45088d6eso47105665ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970949; x=1747575749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=Bal7FfTgTOBojacRRWl75bV127Aj/9YIp3AySd4izIFQld5uz3dhhMu/Y/UG4XdQQx
         FmS+KpUxTjQCINdjvEw+td7Fy4vUH435psmwpcsgKocxSqpqWFYRtXYyOYKbqI7oUEUK
         jd2Llg89hgpabphCnF8zVEODtqVaomG8AfHVNSFcIuwWrsWyFDSu97joXaixDVJFeOFg
         N/GBF4lnKdn8/O5zeECplGI74bA6d8T4kE2eGXsLh98Q6BYcSO5G3GwpQCMFG/FM1zjB
         bYYypLeeKOXBjFU5uzyu36lkCYVptWSaX2j/5/fBBrywVI7wnPcL8V5d0hjJcqoldpaa
         u9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970949; x=1747575749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=rLNTa6v5/xTd9k1zm6kZxSju/zwRgeocO4J6RsGqsIBfj1YVEvP0D8ES+uRSfLUaYl
         gm7rIbdGZSK3YG21jn3UxxsWEiIiNajfZqjdMTZt4A/KfplVD6UrPovofV+yKJiTEp2D
         HGk2q1qlMPozwHl7/Oy6Cjiysmx3Rbz/jS1GwbvctFHTmMOJyVhUlIycuaqSF3OydLCG
         uovigssNXjlwqIduwB/NOOT6o1Jb5ydMq9uH2qL3VqDi2kLs8kBSRwyGQYS4RrCVwEDC
         q7jsMCUbE08PiEBKfk8C+bLhMMtdYGwQu6AwPRXVKxAsxh5XX0peuMxUI2uvnTnrimaV
         TQmA==
X-Forwarded-Encrypted: i=1; AJvYcCU/o8JPYCSJ36NAR9KRpmjU4Po85fA4/LJv+oDv0cBBtYj40rrzu2hMwxqWGESmp7X/w3FYaWC8hLCQdd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88FlxAedI8Ugm8nhsLlusPHX0Uzdgc6QkefULZOwnkzVwIJju
	k8qN4nwSQgA2GHHaRjPIbZgTvBMjcjAVo0fa0zomTsYU9S+YrzIpUyPeRccwmQE=
X-Gm-Gg: ASbGncsJKYxM1lwwpRAXBmZR5pl/yH9iyn31PjBUeYf1vavNEihzu41HcAaGyLuD6Nn
	3t33fwXtn37ipkDfhVCcBqkspEAW5HCj4cWMjEsPBISP0IVChkFl3zdX7FCeYw3ozoAijWDkJhy
	ejixwI1rY1Ilmgv6vTiQmcDQ18Fs4lhtXEm6FtsCjKcMspIrAcphM0iF28GOG2C9W8pHaWc6O5T
	1/tRmkO94svAlq54H7/h42Y9sOjhxdXTG6blGb8Y+4x9h6nkZXvQzlWqTMQDd7wwUl6mR9yY08F
	KNL9Pv8H1Zl97ydOBSCX/QwIkx5ACqOa7EKhhD5bcDGjnKn9ISwqMHI909IrFP9wUNBekO7bQtc
	qu9EbYg8NXqCidA==
X-Google-Smtp-Source: AGHT+IEe5MoHmRn7VMhcjZzc/oDhZp6CpsUXB5Vc9hjV0uT28JPcfqXvqK8cpfVDg2JO3fpzBT16Ng==
X-Received: by 2002:a17:902:e949:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22fc8e99d25mr152020315ad.40.1746970949344;
        Sun, 11 May 2025 06:42:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:28 -0700 (PDT)
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
Subject: [PATCH v3 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 11 May 2025 19:09:33 +0530
Message-ID: <20250511133939.801777-18-apatel@ventanamicro.com>
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

