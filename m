Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718811DA61D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771228; cv=none; b=useNU08Tt3lRHDGxqzB+veqp1ur363RndKuSXaco9VISSVPfdrKIorFlHqeauvjnikuUfA0HaaxANoo/+Zhrkm3TTL235rwzkTk7nEPyfsXz5Ao3+KEyT6Q0dF+4zpfGb7HSqeX5j/Mj+lKINP+++zHtfDrX78qz+u/b8JNaUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771228; c=relaxed/simple;
	bh=3zBJABDp2VjAHeAkIM6CLZBnc4fskYwTWZG6ia7OHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD3OlQmI6slEbxE2PsiWbA7vwmXnzVVDN3WtBCMK57KH8GZobnF4s7sgYPCRoc7ZEk46KUcJgWlUXxKb3+YkFnpWJsv/nksvhH4bCGGZ6XFPmgE3+6TUOZG+vABFjTbuTY9b4OVrirA79fUyyH7FVTYWg+8SB1W+yHp6JJrGgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mew13Adf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mew13Adf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163dc5155fso124417925ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771227; x=1739376027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=mew13Adf7VzrECcvNOUxS/MprQv5vhV2LktHre+nhnx5UHxnORaqQJwAj4IFIFo1L0
         gOhkLnp1jYi2dqKnBoeo4sTxKjF/nAOy4ag3KLhF4ogtCP4vxXlrbCrKJt9htdVMnICy
         M4hw84SKcW+FvTnB/6jYxdRUG7Pb6WBkDWkCN58jku33Ls3HMZCVODquzLpDhTgFNlh6
         pj6Qxp289P2LRPlep6fscRKagLvd5yBaJbtYRKTdDxp9cNjENd4gi1bGOhyILrZ6ZRJ4
         pzqRNGE7ZYrwBhNh3oJTEbPLc0tckuaC/ZcekH40Qi47PZ1gtXyeZyfRcm7eS+6d+jTZ
         khtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771227; x=1739376027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=NFQkatRrkQ8Xx9cRqkElNByIhzopuNIsY3/KaWRctCt7Yq7X8c6EwXbJr57XQJgZ+v
         2aeX5DM1+iGEgVRu6P39ItY6JUthCtK4xrt755FPRXwTqHh6P53tyUOqYkVW/3Yn6REH
         4KRnJ/hr+2h+IwFKPXDvKc5iF1XLajL2jbo8Sz+X3HI40WNcXL5GhtYq0+Z2nDf6IR7x
         Kcp0oI6mqM+3TkOW4qJUGY6vJ54PoCXylKmgIVB1AX1cq/xC2aerRF1/xtFMqIoGcbbp
         S76bPyOFr/yQm/Wnia11HQick50fyDLsWRfvuLuP4V8+0A0yAVfQYh1l1zO9KrEI/gJi
         Dsrg==
X-Forwarded-Encrypted: i=1; AJvYcCUwOcYonWo+/U4AP+jxm40vwymoCbTW1z3NBk76VAPooI1QkvdRdZlNSqLeg1jzahTOwGtKlpXv56SQeow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/awQvknRRsU7UNlr1Qd0YGxQ23IyMmXWZCfuXuJLyFuyxzlQA
	kxFLsntw5CykyEb3GF/fvb3WBhYyyH7Dv/mIm9uWBPcVV8vV1DCdMnrr82eolZc=
X-Gm-Gg: ASbGncuRHn850vcYLWKpaLHIhnSYS9NzcKNoqP5BaltmkEMslU0NxKYxp+vZEHxqGfK
	Vd8TmfzNBVMilr6tMAuHhUyhyFj8bcoYeJdGOa8/+6pZsSqg10tZN2s4GnWhSN2jMjih6tbo5OL
	LByKQ/zisknn5qD4Q8SK2x210dzoZrtAz0X7DWUs6Btia65jDFkHsYd0X19swBiVYT9EMFo5VXB
	99hF52Pq2WaIOlvDAHUiX+5DaEYK8udowC4jSmFJqnVlpQ1Sn/GbGHslywjxKsY90DP3FfbIblt
	QcOv8lnSNTvgjAJdW+asaCxXh37G4EsSFxU3HmOSo/b+l8vK43gQ2fg=
X-Google-Smtp-Source: AGHT+IF8jFyxyV/f5JzHUJJ21FDiQHGu6kpLDQlz+2/R29XsqdFXb5Fuvhx/j03+dIK/P/pfOWQ0WA==
X-Received: by 2002:a17:902:ccca:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f17ebb95cmr57042015ad.33.1738771226541;
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
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
Subject: [PATCH v4 04/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Wed,  5 Feb 2025 21:29:40 +0530
Message-ID: <20250205155948.81385-5-apatel@ventanamicro.com>
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

