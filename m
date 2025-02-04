Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FFF2063D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655754; cv=none; b=VE97j7uUiXrmPlv82Q+bafqsB0CNo0H3IC/vI8M4Kb8PLRoaGq/ccT7X69EEUZ09pgs2fUeuIeaFvmSbGJRgMeBRKZ7sobHvrnVffzyU2wacud2dtBaKj1FpvJnw/GC4DmJ4BbyZ/jJo5rzGeMada8KBCtOSNHjEvWl7L6Qoxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655754; c=relaxed/simple;
	bh=moLyNyX8E1Yk5kbVo+RP2IIS9y4p4D50KKC39sIwWNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQsvDgY1uK4K7YvQ6VwTqRXHuDtvAzUISKm0IjeELrw/2oaDwDUwsBKB8VI1q1LlrM4sRQzwb+EAp/C/PToe4qlwfXUdpwwI5KJpQKLkUwrxPpUav/U1U4t/wojHsmznYrn4i/QISsMy9xFdIO4tvTayjZgMq8ASCW9tzcbuu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SidjJ22+; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SidjJ22+"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7bcf32a6582so466921085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655752; x=1739260552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=SidjJ22+Gpag0g6GXhC/w4vC6XHvw2LHXbX4ZF7eossvh/NnPkG8yAOvRvpAfVS/0g
         ccq84iwM2T+LOi+9MKdqR7p5Scmz5m/EqiWaSPCg4ZQFKCmiiylGaAkx7+lYBG4Yy/xv
         U2uzu7FnP8ALyIhP4+VSSFJaWtR/+U68C2x0IUylF4UMkuATx1g9uF5FD+YC+UCpXoQU
         bk2eBEs9iNybiLIwOWraj8ytU3UMxzZW/6skQMeAOoHvLTrzmXWU41wxojxQHbUtTnJ2
         DSAjsfhSRSqacPavK6sVvGJUdXSUDQ/c41O7TcNKZeD1UuCgOVt7KUAePd04c+yx1kat
         kkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655752; x=1739260552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=v6x2GAw9/ZrmpK3lwYWrrU4xiKXr1OiOEsRvg9Z9ttJMtJFexJNimGtS7be1+i7PEG
         nl9zIruQ04T+Tzwz6TG17LojMaZnJLcjMlQbU29NNU2ChdmcHgYg+RtN19DD86S3yBKu
         7JQrsviHIeatMDMQZjKgZhCmfJ26moTYNSbmjWjdxltt0s9NgJaGp1swDcQ0/9QgniYC
         WG+qBoPFYMzGWYTgMc1q0qID+GLV16HTt2HeMM/sVtpjiVn4YqI0tbKb+4G7x0kG8apn
         FBNuOOKlFcdHa8tcQXAumm0BzwQ/+7JSK4mzFTXV5pskMERv9B0l+DgT8cG3/s4yvyok
         +kbA==
X-Forwarded-Encrypted: i=1; AJvYcCUYmPYbDy934egZluXGNsxEvRC+WwwBmR8wsHnwW6UqxwD41bXnYca0P9xHKR6k/pep6mKtrVMpXrKp1sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjdhRP04jV5lbOqGkYluz988bYlsFIvMHB1GEH05tgD7Sljnwx
	/8yAcsdwCOdGO/oflAO8PnlTGFCelh1B/pLaJmap6oDqr/zrKYVZu5N/qK2gFHggBCunmYwstYk
	a7GQ=
X-Gm-Gg: ASbGncvoWqAZ2xgt52XmGrkKWSAwcP33Ss9FUqZ3DTfqYaajcLIROU6nmX/nJtbv4N2
	bWWsB9l3Q+wkLHG79PiFOQbt69PsI3voojv/XJSQRk1gwfVMRiQ0cUyErjVyKEG2oXfV7+HeXj6
	JlyvwNz8lW+uToLwRUhjo8YHGJJFpZlFyUub8EtTUd8yiy0P/1/M0/XxLf+7Mcxkng0wrW4plVK
	YwUdty4V2jXNLWllbftBnJL2O40B595ytcz4yU0JrSwj6QSLNcoEcQu2rHxFA4I2aPOIXeU6g2g
	Vm8LdxkRYM93VQfZF14Z7BT/SDRUSUGXjpXjmFFEh5KlTo0R949TGnw=
X-Google-Smtp-Source: AGHT+IE1kqeyReImTVJHGW5IDLgtzpBSrI2/ZE4aOj+o6f7vrc3hrNQAxAn/RUr7v38bA4d+4LAZBQ==
X-Received: by 2002:a05:620a:2992:b0:7b9:a387:3cd8 with SMTP id af79cd13be357-7bffcd956e1mr2941465585a.42.1738655751905;
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
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
Subject: [PATCH v3 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Tue,  4 Feb 2025 13:24:04 +0530
Message-ID: <20250204075405.824721-10-apatel@ventanamicro.com>
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
index 73a93ce8668f..0c94ce8ce580 100644
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
index fae47b8ccf73..e6c81718ba78 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -112,7 +112,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 54773c27c411..e70f497a9326 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -443,7 +443,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -459,7 +459,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -472,7 +472,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -531,7 +531,7 @@ static int __init imsic_local_init(void)
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

