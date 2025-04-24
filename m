Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84C28EA4A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519777; cv=none; b=PIh9F7v3gOqYwZhYq6ae9fSS/iSgF1bd3wh0jkhPl75WnwBL9VT6OHQt9Ho+nwZCcCZBt32QYwHr2Fy5iMlQgCaqJKk3XE1B+kw4GtsnzNfy/OR8UoSmx7PioYx9Sp46bK8s+JY0NiCQkPeMa8a3HvkK7KoWub4HPNLfre16uZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519777; c=relaxed/simple;
	bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kotB8k6FYjUlbv3lzffcLWo7kGIxD4O4cicNo6BUPOlwf3WRB7+thU1dHesVMznXDCLqRfwHsgrysLg+jI6K+70+ttHKeGFVElfcyFI1yAdkyq+d/kb17qqdj7nzOJ44ACfsD400/yjC9Ke+b6uKnB+roLR0Ot1x7d8Y3W0tsu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPN80D90; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPN80D90"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-308702998fbso1298330a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519775; x=1746124575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=CPN80D900ENxWn06n27UEutbG1iqNAEQUF2g5KISwoXAGjCpeVtkge/AYuAx9+9Cc4
         FmFBh3RmEVhZUugixPgOB+hl90jNrovgXnv97IcKC3yUbMcC+ha2698MOEYRQQzYVA7K
         Na0R8GmhYbBWGTG5Fd1E9YzXsFgp9ycbPDbJ0zpJ+lJXGiN9slEIWzrwU0N+7Ja1kZOz
         +V0VDkaS7X54/e3n1PZ040ei68pdw0kbUTExg42HVpHwHqYumY4zKaea+tygYUZNtQlp
         rbCeYRTB1MjXiwaRxrAvoe7KTo14um/IRhH52JmasoFQgRbSqLZzVukQp2Y36sYMJEzg
         PZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519775; x=1746124575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=xK804UQx0VKtT1HZxhMTy3dFPy+IUW35bNcASY1vY/gD6Qt42L8n4ZK1vkdWx84+KO
         88iZjnrC8OawPJ9DDRMmtgdGPWzj77lvQL6cwwEbLLT2GgYnoVWXEMtf8uBoUSfYIXln
         z1zWiEnWUKN/05yUlPZq1jMx6rKhzFpsTAcyHcCwHYggOKTQQbFF2aoX8XhoxfFsVRmm
         MecGNOEX6IGMjX98AITT1uRzXpfVNfaoQ260Pszn0YTmNGnfof0cSR7rzyh/AvCgoHox
         Bi1j1Si05zA4DiQ4gaNjXmXi5DQVFHsW/vB43SYMkRsKqUZewYi4oOsqDRuWMB0ZxKoH
         2HAg==
X-Gm-Message-State: AOJu0YzEXGX8itolwVV0hHEy8xyY8t7Tb6VpKG9tGgFRhNK+KFE6QULQ
	WLy1Yps6lSvU7J0kxHzWLm2mmEhGZRdoqRDDRmhi/cVdTMDqDDlP
X-Gm-Gg: ASbGncuelkxXOmkvV47CpiFizpAxsv6iPXcrVERmYSWHOYnev9ohEREbiHMuGTSzRpy
	3qStME2aCW1svDK1Blpr90rFZt8mQv78/0hTCTCkYxFVdneRwFRr/6fMUGCxDxfHzsXcrpHYIlI
	d1IemmiSBH4fDRlNvOQVKImc6+TJcod2f688nloupN7dlRX8BToi8aaw/DuiEHZ14Ca7Fyoqk4X
	aGQMPuBsr2ggC99YbJkpwEjIIYXvLyd9QCXuQVqsZQxcwjntGd+lqi3qbvbQg7z4FjVJ3qw0ICi
	XfRAxyffr6e2RuEVUaKHSCudVhRE9t+yuW7v5I5JKvAn8vUxY3KF
X-Google-Smtp-Source: AGHT+IEEDtoVXgeW00/znJ03dj8QOc2rEKTzqVN9hbM25x/CWolg0jP+EcqxTj1n7m0VR4tpCdRWBQ==
X-Received: by 2002:a17:90a:bf06:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-309f554b8b4mr905191a91.16.1745519775450;
        Thu, 24 Apr 2025 11:36:15 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:45 +0400
Subject: [PATCH 4/5] irqchip: vt8500: Use a dedicated chained handler
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-4-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=3948;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
 b=c1oXrgxD03TnBoaePI33Tc1myEsrAfQwBvAQZvufdR8bybKZOnqTxGMc2cJhH1vZdUthW0kAq
 soR6657v3wxCQQZxRDW1WBKZ5292wsw3YCeJheMinobjUNqT1K29lNy
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Current code for the chained interrupt controller maps its interrupts
on the parent but doesn't register a separate chained handler, instead
needlessly calling enable_irq on an unactivated parent interrupt, causing
a boot time WARN_ON from the common code.

The common handler meanwhile loops through all registered interrupt
controllers in an arbitrary order and tries to handle active interrupts
in each of them, which is fragile.

Use common infrastructure for handling chained interrupts instead.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 60 ++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index cf24a88f52d1b90f033d429288c88398439b92d1..aea43c838430d2a541aa9b3127a215531abecad8 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
@@ -66,6 +67,8 @@ struct vt8500_irq_data {
 /* Global variable for accessing io-mem addresses */
 static struct vt8500_irq_data intc[VT8500_INTC_MAX];
 static u32 active_cnt = 0;
+/* Primary interrupt controller data */
+static struct vt8500_irq_data *primary_intc;
 
 static void vt8500_irq_ack(struct irq_data *d)
 {
@@ -163,28 +166,38 @@ static const struct irq_domain_ops vt8500_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static inline void vt8500_handle_irq_common(struct vt8500_irq_data *intc)
+{
+	unsigned long irqnr = readl_relaxed(intc->base) & 0x3F;
+	unsigned long stat;
+
+	/*
+	 * Highest Priority register default = 63, so check that this
+	 * is a real interrupt by checking the status register
+	 */
+	if (irqnr == 63) {
+		stat = readl_relaxed(intc->base + VT8500_ICIS + 4);
+		if (!(stat & BIT(31)))
+			return;
+	}
+
+	generic_handle_domain_irq(intc->domain, irqnr);
+}
+
 static void __exception_irq_entry vt8500_handle_irq(struct pt_regs *regs)
 {
-	u32 stat, i;
-	int irqnr;
-	void __iomem *base;
-
-	/* Loop through each active controller */
-	for (i=0; i<active_cnt; i++) {
-		base = intc[i].base;
-		irqnr = readl_relaxed(base) & 0x3F;
-		/*
-		  Highest Priority register default = 63, so check that this
-		  is a real interrupt by checking the status register
-		*/
-		if (irqnr == 63) {
-			stat = readl_relaxed(base + VT8500_ICIS + 4);
-			if (!(stat & BIT(31)))
-				continue;
-		}
+	vt8500_handle_irq_common(primary_intc);
+}
 
-		generic_handle_domain_irq(intc[i].domain, irqnr);
-	}
+static void vt8500_handle_irq_chained(struct irq_desc *desc)
+{
+	struct irq_domain *d = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct vt8500_irq_data *intc = d->host_data;
+
+	chained_irq_enter(chip, desc);
+	vt8500_handle_irq_common(intc);
+	chained_irq_exit(chip, desc);
 }
 
 static int __init vt8500_irq_init(struct device_node *node,
@@ -212,8 +225,6 @@ static int __init vt8500_irq_init(struct device_node *node,
 		goto out;
 	}
 
-	set_handle_irq(vt8500_handle_irq);
-
 	vt8500_init_irq_hw(intc[active_cnt].base);
 
 	pr_info("vt8500-irq: Added interrupt controller\n");
@@ -224,10 +235,15 @@ static int __init vt8500_irq_init(struct device_node *node,
 	if (of_irq_count(node) != 0) {
 		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
-			enable_irq(irq);
+			irq_set_chained_handler_and_data(irq,
+				vt8500_handle_irq_chained,
+				&intc[active_cnt]);
 		}
 
 		pr_info("vt8500-irq: Enabled slave->parent interrupts\n");
+	} else {
+		primary_intc = &intc[active_cnt];
+		set_handle_irq(vt8500_handle_irq);
 	}
 out:
 	return 0;

-- 
2.49.0

