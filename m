Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F154764
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074713; cv=none; b=pIasuBb0D5InHcOlchIJPjB3QBIMG08E15Pxx3wmDhf5GIn4AW5DLpRML5L0tJJBfQGx/Arnr2L6aV5DD/dOF5pgZ7PC/K6W2aZacSKbcVNw1SsCynf/lvBLLcMOii27xflqmM/G4TacAP1lIxJLMkKCggevIxakTGtld3X//wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074713; c=relaxed/simple;
	bh=mFFEh8+hZeEVXl9Ut+Oj3ibjoUtqS7w8eehuqLHhRt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSVE6KnP9fgCE6ti33w3CbA96IrTCjO8bahxOVsBhsmcJrtk8JrcMIgy5N65pJI9uPsrq3fP1/byE82I+LEWmZsbs9+DzJqIkj0FQ6Iv8KlksvtA4BXJAG8wS+otoEKujKqYRJIBjuOOzMNIwEYRFaMLs4cHUU+2+r63sAPb0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=c9CQGNxJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="c9CQGNxJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f74c4e586so10096995ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074712; x=1739679512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=c9CQGNxJ9n/UJ7Js5zE1qreHqKdTS+QUAFhgt7CLUS/9agvl9iVStvHZW4yl+sJtEL
         xr8/x6RL4ElL/z9CZmzW0FC5gFJ+ZFlfn9fhLUaO3irwz6lByuFJvR831ZpNmB50tXLX
         rc+RbrDHVkehLakUUpyjchF/BaLwEsDWH61x1xV1wjGHbrDr5n0p3ITcPZsbRIrO/M5u
         ZdaZEE1EfIdvV7zsWA5PePdCw9SLc4zeLS3YtcJFFD5RXX5WWNkVAEv7MrT5LF0g2e78
         J8c18IaubPZ7Zw9Ril5cjF6W0ogku2f+ftYUan1UTb0AgUyVOnf++mHw/sEDI6hkKk/S
         N+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074712; x=1739679512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=gloxtGOXCi2jFvwLg+lpg5u+iknlusNldJK5oiFsT9aBMHp8IJJDBwDBIGuZXg8EHm
         y14ztK+ZzIX9ECP4DR0/Rn7iUxLDSNvBgCEYs2TooxlzHSbJqgiXIewDY5N+Bl8Tn3Ir
         A/sC4AV7371SK4FjVzewMoczIW1Lr0LKz4rm/kKVxDe/uT4KMmav22vlVN8XSzaw2rDN
         fQ5Y1U3rUB3G0Ag5vDwUswVU+I1JD/oa7j2JwXcHm4uEvkqLY+a25N6in/HPpEF0jJXE
         qAudWRlV5Awx6G2GuCZS29EQS0NnFPuy4MnrYKCTvw1AvvuVAB+lb+EexCnkjVGJxYlw
         YEfw==
X-Forwarded-Encrypted: i=1; AJvYcCUIbHePWWxdNCZe42kWz0IElYCWbjqspkytx4eAveVDaVGaPuDYyRDpQGyvC0OK/DKt6gS1Bp6goAZYaLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXy7N4N+lO/nGjTk4y3VFpjc/4cvuMctbgLD4ChWX178hhsOTT
	vPePcghC0lQ0q4qrYSt7WQndOz15bcPCk0TZkPGQ/VKKi+Q+Ijl3c5Ojh3qw9E4=
X-Gm-Gg: ASbGncsBB079st8BCZukiRRme6ZZWPSaETSD7WvTsWyS84sXSz4F5KC18kSP7MuyPPk
	zcr0YTnQprWj/ATEmOYRBASpYNuhcngYrAecoR7Az1ALfxpEcP60cWeXTOvY7Sw/QwlPXakqKuL
	T0W/zY91Vjthi2a/YH2+e1IOaQ5dN+Ja5//Lf6sX4frUx4zZnoC1jUnKXbQ367hn0dIRxE7akmz
	nxz8UedJzwaJ3nVEFMWo750pIQhUekjDQkQKXjAD+N2nsxJNLUWDPqypiXVIzjVT0gFdSMs799z
	HS44TZISCtJg0pPbrS+tkrxURiX1fNIM98CCdJ/m54s6BT+gpjzcDYE=
X-Google-Smtp-Source: AGHT+IGE4yR6cgBkkvQcZ0IHX6BsNq+H8UInEThSWisvqbLPPoF9w9oT5fD4cZTzd5CMtWIib7XuTw==
X-Received: by 2002:a05:6300:6f82:b0:1ee:1910:803f with SMTP id adf61e73a8af0-1ee191082f5mr4625773637.42.1739074711624;
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
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
Subject: [PATCH v5 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sun,  9 Feb 2025 09:46:53 +0530
Message-ID: <20250209041655.331470-10-apatel@ventanamicro.com>
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

