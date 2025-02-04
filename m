Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7F12063E9
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655714; cv=none; b=h6oxMiOER4n01wzJ8rp5LkZKiqjcGlO3GTLnjZ1/fA1JXkoYd6Lcd9gc/Aw32eDLO/hS1GDJPhtXCPMmMFsh9JqJQm0fIGCvzTWRYQy+Eb2vlHU6oDeyKA4tsN2ElocwLumcY+OKuM7zopXPxUx1XnF6FMBKexd1N6N+evtmCac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655714; c=relaxed/simple;
	bh=3zBJABDp2VjAHeAkIM6CLZBnc4fskYwTWZG6ia7OHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oI23B6Off1s5Y5inxSPWasGq8mkIUjos+TaKOXv00U8f1YyDglWvF2C8HDX4ajA0Wj9kG1D7ibIO/jr9qKtia6o6aRi/56CPjRywhUyzHres8gi5mvZGLZPdbt9Z05xMY3jMnOusZk1V6WxejBUP9bBALZYWm2tfXdKGrhKUzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dv98Ue6E; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dv98Ue6E"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be8f28172dso263998885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655712; x=1739260512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=dv98Ue6EoIyi2Zku5MIDRZGlF091ZXCQnNv5Didp3fQkaLgTUIvIvJSRTPNJAwcS3W
         OAY+NxXgSe7JsF1DhCSMZfK+vAcXqlNrmMiyA/5cZMLxGZvp5bJ9J32xSEh3Euk1gwtX
         l+V9b9fXdSux3/cRohVtj5eGOukEduoaX5MPGJua/qmuWHxmOTSsawwfh7IyYNPMJkRK
         aDo/4/huRiZlslOI8VU8Y3FkCIgNmfss93x2W04cDLru62n3BVcOXMAkK1RuaC+AlmCu
         eyeYhgjV6b3f2PcwICQcT4Tt0BwFQsrEzfKl96gYYf6yOsI5nEHM9JlLcn2zwlCXvV6s
         kbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655712; x=1739260512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=vHGgUxt4hiSk4+O4CnM4l5exHgtBAnIM9lYUAQHwMUl++W0itQC8T290ypyWpmNOxc
         TcoqQMUXg2tiaQCeRlRPxDow+jKb4V48u2cneGa7Cqsj4lgP7rSK2lrX8ImC4GObfZdg
         543Bte2jDUHVvwgz0huANf9lm/ySwZ8dKOBVSfkb9JxPLgsRJlpS+ZcgA61BEJ3SkuFO
         BYaEHI+9nf0dLId7PABTyY/lhwjG0YkgCNSL20VkZEHvavIutKHZ+SQIrR95kxMr2ZNo
         NSvURTwk7g4Rkuy3yo8pf3/j8ni69hSFOLBGa2jF9d46E/v3GsHhRuJwaA31lCCy9sGJ
         Nlqg==
X-Forwarded-Encrypted: i=1; AJvYcCUiEUfYr6b82hMO0tKKVA7Sn33Sb7EZ8fblo7qPBwXC/qjD8dN+wx789MpLRyvg8ZNi5/CQBb448BKQYiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUjhsgoNdEhVPSSbU9M5HixMZPCoNJiur9Gy0gANFeWCUjFJSB
	mKKJvZheglKErCvKAI8PjzHZ0ftb2mjMp/oN0asgxClb6/NU3tCdahYxxpoS19I=
X-Gm-Gg: ASbGncvBAe7Q8a6PsHg65hgfh8gmg9slKxDZZwV+PiPewy980kwSYn9a6qTIf/SICQf
	tdoWRsyipoJW9bW+SzdHIwhd9D3ABZ8jEwXDlP7SPZz4yLCdKhd6O4CgsrTTUfPIZ84b9zkmr8G
	oPE3o8uWnrYmlq2CmybdJYrWuez2xhOOg0F5wn7wNPXNtWcOJicSBeoSC9SsfOa9U/8vgT5ZoE6
	M4j9lmY7JpweKpSxBmUT//getpg7CaI/wKdpBEjZUFpUq3dCsr22M/sH0jXNqBrwr1VNOgeDm9S
	VyOD2vW7HTVvUj9MQv/q0kT7fJdZexcGmqR2MOWeDmJ2detu08dO5JI=
X-Google-Smtp-Source: AGHT+IEygJlzRE1f+LllQAS/xZozPVCC5zlNa0cJxT7IbmhuAFZYxlHSMSOoINty/Bxd6fyVjhK48w==
X-Received: by 2002:a05:620a:2b8a:b0:7b6:6c6f:fb5c with SMTP id af79cd13be357-7bffcce52e1mr3541223185a.15.1738655711939;
        Mon, 03 Feb 2025 23:55:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:10 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 05/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Tue,  4 Feb 2025 13:24:00 +0530
Message-ID: <20250204075405.824721-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GENERIC_PENDING_IRQ requires an arch specific implementation
of irq_force_complete_move(). At the moment, only x86 implements
this but for RISC-V the irq_force_complete_move() is only needed
when RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce common weak implementation of
the irq_force_complete_move() which lets irqchip do the actual
irq_force_complete_move().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 5 +++++
 kernel/irq/migration.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..1884fa4ec9b5 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,10 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+#if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+	void		(*irq_force_complete_move)(struct irq_data *data);
+#endif
+
 	unsigned long	flags;
 };
 
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..2920024475a3 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -5,6 +5,15 @@
 
 #include "internals.h"
 
+void __weak irq_force_complete_move(struct irq_desc *desc)
+{
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+
+	if (chip && chip->irq_force_complete_move)
+		chip->irq_force_complete_move(d);
+}
+
 /**
  * irq_fixup_move_pending - Cleanup irq move pending from a dying CPU
  * @desc:		Interrupt descriptor to clean up
-- 
2.43.0

