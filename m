Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B7239E7D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535613; cv=none; b=JZBD+lv/mY8iVsy6wCZCK1YwniXTxeFx1MPBiNKBiL0j6wEMtdIefknPb5VpYPrtNJgw0G4q9dVDt2/eceq2RtPSkJGauLA6HChTIXjLJT1oLibSgIV7z674z54OAUREohSmVBTExDqk2J2b3tydhoCub/Jk5KnhFPg/0HX1puI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535613; c=relaxed/simple;
	bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pge/LUBCREA7vLCYpXFUttsIs3SRlORK3DNSxM64HGAlfuyr9mp4nrF5QlzIdjHRxTFeEFx4lZ/FmBXsNG6Hn7WB/w65I9B3PkEJ4F8Tz5RDGFPQUOxpTOR1QVbq0aDNuEyV4lmz+M79wEqrCeF2KsD/u7eYWjH7546RDLquh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ztf3a0nB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ztf3a0nB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so4506746b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535611; x=1747140411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=Ztf3a0nBDHXbE5HrQrYO1wiDmQShONc+1x9Yirf5gu5dJPfugGytlmd/Pw2hfMxOzS
         c/lRRO2wzivtaOVqkpSB+QorkZKu3ZLuV/dIehEedG/+Ea/aJyqYS0vpn0f+sQcB13/J
         td2FEzjm5bYlUe+QXi75KQaI5ILI/v3m2WXUcu3eMc0JuAKZByCzsB4OActf2WNw2ocw
         5iuV1PGxkquqo3tE2iJqbeLre15DAUevsi2YdalsVpFpKwu3BPwEdxqwdFMn51WGmOlj
         hfYYlB8UQkRKYY0PlWG5YregnqkA7vxUIg/HYaVryjBlq0AZfgLJN3zfIKzXMpFKBfzE
         gVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535611; x=1747140411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=IYPv3K60MEDQhRJvIo6DNEHtJJ1tnwTpUcdkGoCfZpvXDE440JSsbYOZTzpsZHdE9i
         q+isl6mNuDqPI9JYiCZBM//3CUZtqshleOiLecZDz0sXSfL2JSTIGmBfs47wpoJInoFY
         Yk2bpuwFJUqTopZunqo87ZERPW8pAODexy0X+7gAxHP1loz9jOrytPH2MAgLCd5k65R9
         cCr4ZBueKhrLfwNbNtbxaxZyeXoAyKhDiYxIVVoNAhBLk1dwMX02DUBjxQK7/ikbLK72
         /gW3AFD7dlIbxP9UmLc61gvZbUV946FjBzQzO35aWDjWycMbbAwWzdAF4UQPMKRq+uL0
         uBsg==
X-Gm-Message-State: AOJu0YwvxU0od+458s1mUVHvRbiQxcLsNiKOFZQizoAPSvgkiEpb+7Yj
	cPLwmn7GzVnbE8kvosaNzlOcCusHOy4JcoPxc7psZwOXK/hfYGrX
X-Gm-Gg: ASbGncuJKOafWC/CYl2HqlH49qI78Hf34QJ6Cv9wSfae2m3z6dieaGHy39m2kKIiVU1
	eYSirs3qT82eSRZd2MmyVDaeF2sYmO/4vU5cdpm93Bm2ikPxkCuNOiJU1F9kJChvZ/exwhMJaWv
	FFR3SmtHaWjSj2Pbluth8TywiKfuV9cKYC8AHwsdgKS72HhTkhZz0iVHdCGOkuQKiFCyG0JlRw9
	nh1Fe2TEY0KncSKQxzhFUle2y+2/nXWKDh/+FH59pncQfyeiwB4DH8uAKvKV3hFgihz5Xt9B+B9
	8eFnHZnwqPNmZAV8nn4NxkRHASQnG2ApAmSIb7wv4AO/eYrVpp3l
X-Google-Smtp-Source: AGHT+IGt0OfmjZdbzWABnMzYK9s5aOTopCPcBf44B3mse0L30V1n9a6FbyIPkSvKOjCg75pe9VtBXg==
X-Received: by 2002:a05:6a00:340f:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-74091a0447bmr4126556b3a.3.1746535611537;
        Tue, 06 May 2025 05:46:51 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:17 +0400
Subject: [PATCH v2 4/5] irqchip/irq-vt8500: Use a dedicated chained handler
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-4-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=3948;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
 b=O6fqrOR24uJ9xju6Sd7nqpOfeF5O89fby817sqf0xcnOuX6HnJocQbCrgP0eX/5PZm+seJkdy
 GhWNgcnZlmLBx6RlQpxxyT9wt0xS5LljcdDtydrN0geSCSk1SmBdHt+
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

