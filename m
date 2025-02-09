Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB054764
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074722; cv=none; b=e8S007W9l6Tso+UQ8Sh7EU+YYSxRqj0Ceso4NI4yu1u/wdj2UL6r4+3ka1FwwV7UyLtn9XxP1vAIWHSnhM79WvjTFlIZPR7iDP3GamM58GWw7bAwfTqLXHeEj17lr96rXlasbwJQUbmh/L7pIiH4SpieOGdTB8PvnuHy1v/RlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074722; c=relaxed/simple;
	bh=lcMa5p2pZjzeghLKvVY9ny71KeZ3wMkdol/DU/InCzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCEDXQK5BKR5xUujer87ZoTpfVu4igncodbLglUlsy+vszwSJeA/9dGKnWGkqiOoS+RnqM0kqHnRBjq+bgqO5ICfcrbob9viC86pBGigCEJl/9z1Z2EcJ7dZzulw4Q0QUZ7Q7BPqc2mWfHGpNxNz7EiJTAMzRnq7FIDyP6vpbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XoKXB2Ux; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XoKXB2Ux"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso4843974a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074720; x=1739679520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=XoKXB2UxI3+fhtrdquaZ6sY3SONbnSQu2g4jX8UBoi6AGmr7LuZK726WnVovd3cYV+
         GYaRV9WGpA1JCui75xhMP3sKcE1Cy5v3iqgqIVmGnUarVbiePYvJyZltpForJfyhXwYz
         5ixJ3LhZSjXJalr8nGJ5SvHZzliLPKlORi3yenGYrtqZbwchLe7Ir4xNHnAWkolfuVpk
         ypNpHYrdM1uT2bVqJCL+jy3/Sm8sRzRmU+XP9w0ob9vj5SPfrjdV7S4bd/FJnD+GHH3u
         dKdRYrw6XaLn26DCqOPCU5c22QMr+RqTTtjvpnHRSDeNsFTqTDCxN23AiLsdYpoOoI3/
         bPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074720; x=1739679520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=iLeoJc05Td0pNEY28XH931cXMrredES3w0LI0dRg3U3BBlt39SPGXDBKmcdAivsXEH
         zq8m11F7vK7aJo2Mu79UHnChHtRc2O4bqxmW7w5EZZnBerW5D62x/UjxcCLs6nrhPpvw
         yHBldaJR5ABxaMAW/pG9aiC503SXQ6GqhcwBGizOfIB7/ZvYXvoDtgkEcj2jX/q1b42v
         HpGI00SpVqjgBEiMwbnfwbmvCyL9XsEw9/4pjmyB5P0HvjkeCCiszYp7g6rmvzxwfSsp
         wkJ2dD07nreUaeYWMEs6Jtk1NqWhU+vXBxWOk+Q3Wa8mQnvF1OAayUHO9pDe/y2OfUcv
         2EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZO0nDYj2vBm+dVK8wJN3+d+bMyMfLmAMNwCy1gQHnvD/6SKG6Buy6OaV8looInTizriBwgjlV3h6oxCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/EyCiCoaf2340y0cAHFSJNxvojyrPcALz3ihOM8IoyNlOmck
	Bre+4+vvDSuM6mtcuaLrJmmr9PADEgfAygwnlBbkBqZXvdSUV7c5qxE1dhcMTKY=
X-Gm-Gg: ASbGncv4d/9EjCqIzndXjvXZCYBzBuBr6ATDQNlC3n16Ptnz62BSKOgjUGZXwFw6mqO
	dZbK2o43iJsabiI6rvjD2rKzzSKjJ0PEvA5NZbyewyNHDzw8Io41W/yS5CHyRAzUgc/SSuVeuq8
	nYw3DpiIp4Zis6KYHGyB8STzO7714v/k7CIKOQ9HQ4nKWtIowkcfUWzANOdbAISaUKFL6CTMMHV
	OQJ0rmCIPYhViqsl0py89E2mmi4cmId4cDnIdw3SVxp1mtlhtudUdoih1ADByb7dmpW1w59C5dj
	pH8EZQ+LohvYKoiTGegVYSrN94o8n8lIrETBhtm9HneDPiuG2seHtZU=
X-Google-Smtp-Source: AGHT+IHUzy54yYs2fS4vJemZHOHOIs8APlSMaPpVV2klzUoQAT+FU5F1TyPBFlToppvPWeQiJJcXfw==
X-Received: by 2002:a05:6a00:949a:b0:730:75b1:720a with SMTP id d2e1a72fcca58-73075b1752dmr5977536b3a.23.1739074719968;
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sun,  9 Feb 2025 09:46:54 +0530
Message-ID: <20250209041655.331470-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
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

