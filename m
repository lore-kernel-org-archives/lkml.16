Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51321991CF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771272; cv=none; b=pmh9ouO6oCPrg49eR7Mi1j0rDWZ0JeUfGuObMut0psvoF0DbnrHgCpE6a1Vso4nP7S1wc4PLZc1cLQJTLc1ECFz37Kp+AseL7XgIwMhJ68Lrm275uvXCC1TYnL0HV13JIu2mY1yu+5th60AHkrpATyQNh49x2CpEogfgTSwkM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771272; c=relaxed/simple;
	bh=lcMa5p2pZjzeghLKvVY9ny71KeZ3wMkdol/DU/InCzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXoDTwF2O1c1oxOq9Qag5y1nS/q5m2AhY3rrAgYjYcvFvasVCVn6vtGIWrEiRvLlm08Xt+/DWEVmbPr/OFZQXiOc+ygSwwb5NdvibuYjjNw3W8YtEn3ocvk5orwILcYN+J6kAn+9wlcD2qNlOKNm7LLhG4nQGaNgCQ5k6kbE8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CQ0AfwQW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CQ0AfwQW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so2062156a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771269; x=1739376069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=CQ0AfwQWi0KNP9OlLNt8pAooVeyyN7NUr0W8A8vtHvbkG5BxCzobqINgdlUx/lbIeb
         LfrvlkZgbnMwKgETjHXP4hyaZT/DpDWR2uhIiNvLq06Yk0BRFCpgGiXypLrEwSYINpdf
         8OBRNKsjoJLl7vbZW31aJ1EHjsSpPPW2ZRc1FQcnGhgxfLueDxKGrA46k6drMRFURWP1
         BygPqdoAiuBmA8GPGqlKDzt6nW3+mL2dXFqsmaDbgSPH0RizqQos7BoYgfCA0m9O3w58
         nPZa9tiulF9uoKQQOoINIdgzL8eCikiGJqJcBEGo3tgtOp+/N3+5DO5WBqLLbecOtkdv
         faqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771269; x=1739376069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=iaTWH/cuWzeHK+8VxWhPFA+dfnbrfkCUN8DEnaBMsC/IqhpFY2al9FeRgno+rCQEoc
         n00Yfza4EfBMZJcuKQYSBC5HgwUfuHb29gGqCjUyBHDzWShD8AZMZrwxEoIiL1QZuPC9
         KNzyqsU3yXL59wpXnZecNRkaN/mBuruFw88iIoTKEu9onFhVwcIxX/OkD9a4pLyfheOJ
         8ntM1x30BHUyoDF61KzUKIOell2L+N+0zGL9szNFI3cnVLyLzPDiXdHiqUFrUvsESmom
         9kKwZWJc6kNsMfq/yOK3P4DlFH+Uv5FpQJXqtQnZWcbc2+H15QRZjYpmyOV4xay19UDS
         D/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV7iUKBdyN6/D5lYDitT22+S6v14gQQvEYH3afW/DbUO6AVKYqUqMQqRtsBQLZV3vXneKyItK1OHzzBOUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKbOxQWG9SUBvAgzms5QMZVOvf9GB7E8nc4R1fRMmZnwJfPoa
	ErDptv6SK9ETBqsrp+BRlCNJuokJidAaOoHlA2kWDPE2ktXp95Eu3kk8w/cMw7k=
X-Gm-Gg: ASbGncvrpoFzogtHx0gUIQhlHXUBdkJm0XmucjR9zrMkrI6B1aNGheeKHAWeYe8litR
	YUXGfgPUbqSG4pHW48jAttY967GMWbP7kEKO+4Y+lhGJPcUUHkJxzmfCFu6foWWuXzvE0n0cxUt
	XuFAxt1JvikP8coEBVb44elq75WLaPPDjKwFWCi267IIdFROVfHX+xK3z+T+OdZB9hhLjQ0C5ah
	VBgWMUTk/zHxG7sJB6ZPWYvkGFdkm0PAo8bAgECFFaGRLCOTereHoCbp24mRFIa9bUuSDeelc8q
	+Y1H68f63omELYh5YqNwzQYLNDd5ZMdCe4s/J9WNylFpjzgGdmqNxXA=
X-Google-Smtp-Source: AGHT+IFnLvRLZKvgJpx8dmK1OqS269EnZ/fW86sG/bu7Q2nxZbfcOX7ctDxWBsYaZVjqDvgkXox9sw==
X-Received: by 2002:a17:90b:4a8a:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-2f9e08003demr5011059a91.27.1738771268829;
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
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
Subject: [PATCH v4 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Wed,  5 Feb 2025 21:29:46 +0530
Message-ID: <20250205155948.81385-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the imsic_handle_irq() uses generic_handle_domain_irq() to
handle the irq which internally has an extra step of resolving hwirq
using domain. This extra step can be avoided by replacing hwirq with
irq in the IMSIC vector and directly calling generic_handle_irq().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 6 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 8 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index b5def6268936..d2e8ed70d396 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -73,7 +73,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int err, cpu = smp_processor_id();
+	int cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
@@ -103,9 +103,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		generic_handle_irq(vec->irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b9e3f9030bdf..6bf5d63f614e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -111,7 +111,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 5ec2b6bdffb2..d0148e48ab05 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -422,7 +422,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -438,7 +438,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -451,7 +451,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -510,7 +510,7 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->hwirq = UINT_MAX;
+			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 19dea0c77738..3202ffa4e849 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				hwirq;
+	unsigned int				irq;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -96,7 +96,7 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.43.0

