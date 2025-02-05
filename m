Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A34192B90
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771264; cv=none; b=eqfGM5ncg+tYPsG30GMnOQ6vmeilwz5QhEUxSZzvwR12IPdAlviHcE2lnrJ2LsM3Pf8KUo9y+WQf9fu2c71rzrbpNnVcRLpK3Fe+Pk/j5yf7L/E/8DXZR/wvSoq/YUVJWIoXrCQ4jyQoa0D4a0wwYkAXdVnrIlFXIBmQTRItp7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771264; c=relaxed/simple;
	bh=mFFEh8+hZeEVXl9Ut+Oj3ibjoUtqS7w8eehuqLHhRt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKM0+hNXKlrDAWDvpxcBaIVk9RrOukT3sjZtvL0D/xw7VtFMKmcdnLuvmcHqKlYgQZk1P/JRH51n/9OxU4w6ykorqSmWBt0ZFKSXYtOq6O607wInSHrBvqQwKLrvwotrMporH7PL2H4XzKXtFHB561RHVyQqMe0lcz2s/S096Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YnqfgO4F; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YnqfgO4F"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216728b1836so122755575ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771262; x=1739376062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=YnqfgO4FhuLi/86UawPv18Z5+jeAjZEq1hzeJpP35sEwCjW/OI38Meq/b7vZU4xF1O
         n3c3+jaPuJ7k7HdhWunp3fTOHp2AJEZyDF0e0U8sBnFTvY6e6XV5D4VXBJOSJSTmdfd8
         aCbBFmX8BybEpi7MIaDyl9hPpJTJMXmeRqsAW9U7bqCb5cJmOxNqjLMevsd2T6f/ZiyI
         C1SSMu1RAUS63MpQGTTEUKfs7+dNbFbarJATG0IhAdaJ0ntFuqVikTdBeBRwEJGUOdSZ
         5rdFgMD/L++9M49YL9x4sMMF/cNPeMVea97xc5TTW3IUZzIZ3z2zOeLsIbk64Fy85zc5
         N8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771262; x=1739376062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=gigJZ0PgyFc0qegALZcaX4Cd6Xh3AGIcH13dPtLmieUhLlefsNhKjiKdTFpOMzkceQ
         rYEFHeZ7ktU/3m0E6KVWevCrotCjZvAgfllGDQpSiJh76IbQwXyP+krvbJejMbTRzMoc
         DOehuMMgyIWeWECnpEAwcfQPzhp8uTdFq53N0dZAYj0+Ss2edfu11Wk0CySMTYtrbKFj
         kLdIGvFoNRWiehh3VvcPOXSP8L4EeaclNtPDete+wdRkxHamjCiZoAE8UEOfToa3630B
         hTJMGyD3wHddy6xVfgfgSXCvMll3/anRHrP3DLh23Yj39evjyyjVaxNOmA69/aBP4MkD
         XXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLcvWx/rPdvgKJ1cvgT8cBwm7r30L7FUEmKaVk0Aqk4f6uYP9nfDGMOhHuZcK7mQI3Rfz6rWOkMSR7Zmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQgCr/+eDOFPultZdLfH4CPGs1BYnaXLoN2K+PaqpnvXtJxFS
	X1z34266+WzYrfWuhQiCqhGuap7sYKhsY+CmdjcKMNv7s2yo6iDbXinR9uTprKU=
X-Gm-Gg: ASbGnctt/yV+JlrJ2ih0IOTVxEaLJB2aSOWvZbM+3fFXcakZrIsvCYUe/Tnyv+T0HZf
	pSynckL1kpS6AQlAemvGtELMol969UiPNeOVPs6BZWS8WG9eShmBhq1zl9Ph/rPmb7kx78xop9X
	tC+g8u+jDLTuO1ghQT1CFxTUVweqVmQ1k/TiB20uJdi7Hp3mD7kIMTETaMyy45+m1FwLKpAohwr
	pSNZfFeoUDd9U8N5KSutlm7OOdGTFci9Ke1+c6h2Xp2VO5qe0V5Tbg5h2N2lCbM2sz/qgVZpSjt
	uVriidnQycR5g/aRhYMEs9h6Zf2gzPYkMdHb6fRss32/o6fhaFV1TRQ=
X-Google-Smtp-Source: AGHT+IGA6bIArcQBSZQINkR2ug10cWLWOtAjnqU2/HK+jfs8kC57mwS6eJ+lRGDZ5WGk1pjMRxBEnA==
X-Received: by 2002:a17:902:ced1:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f17e2719dmr55903235ad.8.1738771262008;
        Wed, 05 Feb 2025 08:01:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:58 -0800 (PST)
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
Subject: [PATCH v4 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Wed,  5 Feb 2025 21:29:45 +0530
Message-ID: <20250205155948.81385-10-apatel@ventanamicro.com>
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 9a5e7b4541f6..b9e3f9030bdf 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -129,6 +129,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -137,6 +168,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 96e994443fc7..5ec2b6bdffb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -311,6 +311,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0

