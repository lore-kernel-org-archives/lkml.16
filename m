Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E102066F5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655745; cv=none; b=t9LINi4gh3v0ZmmnlBF+d5IkcvxAANNBYYzIaMBJ4iI+vA2l88IGQV4wviwaUHUsh4WWe563ub1cghonYaxdW1Mroo8JhdAGoNcDfaTqSImxjJgddKSJGvGNPVv+OfFLScHijblQ1yKN7R6lwYb9tPdv3E1o9RfFSjvfoT/jDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655745; c=relaxed/simple;
	bh=Ml7O27y247NCehftSqvlxz3dmlGKg5+3Av1RR28gVzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmA49BIjrJ7yRUirpPh8juesV+GOygXBQdk5n97Vh3fXIeCTdz1Mir3ponNrj7Y3Yq6diUsEBPYmTPOnxynzRDP16UhVhvxKpfIGllgtlnRUo/zimx98voKhxo8dmhSTk323UE8UMyscqAp4g4NxF1oIpL4zMdM8vW9m57gQqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Loch76NE; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Loch76NE"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so473124985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655742; x=1739260542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=Loch76NEYUEltoOitvcFhUlfDSE24H8fL08wG77vlDwD/8LchtbTLgqsaH6iGNtMbB
         rfFH1glfjP1fXPoHlHuU5U/1KLCDhJvs2bXufGGArh22Tt+J9wiisL/BI2u/POaBGixr
         VrEf4PRAAI6ijugR2Hx1O6DFwaQB/aycCR63smMhG7k0Big/3tn4hU68dk7HaN3rbXIa
         9g1vDlhid8oY4AfvBWgG8Fi0fvNqXRJokgvLK6+uuzl2rerq/Zk7rOkhnVA2kbdPsWjU
         fJ8IXbdGyWxx5yKZVF2uhez3E5PcFd/QxSDXKVlabnEN9x5fo/JswehB6SH3WUCh6xdX
         sqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655742; x=1739260542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=QhYS4wdlje6rsX96jqki72XK/4ddWcPWKlE7dMjdz9aWFxQj4R+uEr3+BCzk/Knd3V
         wRjXIU9H6VhIB/mrAGssPBv4rVrfVgsiL2CFov8StFfO5rcZrZuelmB8LQs+aR1b201C
         BYIDy5a1fgP5RxQRS1Gn7V/ZKf7RRhShyl5x/3PNvfchG8JuAqcHwMrMVTXfckodQzqM
         0OoPdaO41xqFK6QhcTagGkVJdcOjR/IDPUEWMRa4W29emBeEHVR6gLARPGpqoJpdoARN
         EE+nzvjxKDFg6iET55OiMzC9YXAAlkK5LGz4qgDjTqNySSqKnTLxPa1J8CMsjNBLjtWH
         gN4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhu1HPfPKzXSTSOq9RLvqFMB9XsTMT2mIl1yWUQIrtbeh6W+aX/PEQS6fFioYs6iHcddjHb+Yb5UDI6xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0li4wFsw2FTRwpG/y4cHYnygocosVytzymUPcVceqDvZJrJPb
	hUXimGxHPdZB5bL+1Ag+oGTJjTjY2682khLbatLVKlxevG/A6Sstjjzc3gxYSbU=
X-Gm-Gg: ASbGnctbLFMmOtAOoqNfWisa/v/LfoVjQSTd75TjJiPDkRe4iyIRomRCprirVan0DPD
	IV8cwEpf5VNduauulFsF7ejGgLONZT2RNot7KCxtfdP90iwfSqK8F2LMreiP3dJO/ulRiD3Oh4w
	ksNI0R95YaJWBgtyer2vdh5Y6dO1Mvl4+vCUjsxX5m4kczl0k6kdamr3qCAejoaawZNIGvrPLQD
	t6KvrvM6yJLjwL0YJ6NuXwzRz3Vsri36KOpM+HA/GgwQYgIaOEOe3lUNH8A+0FoHi6JJHwXjXKh
	ryVs7f/R2GUc/dKjOfjKJga48bVx5vBbbAChyqqU1ul7c4D0X9veBOM=
X-Google-Smtp-Source: AGHT+IH3PInyMoZqyc0SRTAjhuFIMbhus6lgn+l4uL8MxLHlStsGNic2bJF7E2l/TEt5N03Sy8JF7A==
X-Received: by 2002:a05:620a:4382:b0:7b1:56f0:e09f with SMTP id af79cd13be357-7bffcda14b6mr4536316585a.54.1738655742363;
        Mon, 03 Feb 2025 23:55:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:41 -0800 (PST)
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
Subject: [PATCH v3 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Tue,  4 Feb 2025 13:24:03 +0530
Message-ID: <20250204075405.824721-9-apatel@ventanamicro.com>
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 2fab20d2ce3e..fae47b8ccf73 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -156,6 +156,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
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
@@ -164,6 +195,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 649012cc47a8..54773c27c411 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -332,6 +332,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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

