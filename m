Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EA192B95
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771207; cv=none; b=pH50tTl6xEwAf/o3zPvC9XikO1uv3rI5im2TcXZLpITCNuaGGd3Ez0DDoOQkCQjtjMHKmqgFd0ltFnGIevMKsIUtQZtGaEDxxl1e1ewa/tKlIwfq9sKlXg44LN0SceHjFvdi6xonCTrxw0xBjv7N1NXOYolBabdQLmlTmmXmdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771207; c=relaxed/simple;
	bh=gGGEYK7VGgFWWdh/qLZbuuJY+xZwb2aTgVHnwmrr23c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0ejduOIFraWWXEER54EkgNPWiTwo61VGWFL85UkvjNBWFJwmUNZIc+IwmaQqDv37VjbXLcjOWEB7SEvfSaq3LHq2f5Wv6+gvMyyvPOZcm1rTpj+DFKzH3JAojbZ0w5AaTHb1TKA9ZGKtRtfwD/UOehAMPNOAVLYCirg/BDBxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TR8ztHwv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TR8ztHwv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f16af1f71so16752655ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771205; x=1739376005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=TR8ztHwvjBWTRUqu4GzOPO5qI+kZBnJodvGx514ndAAKm3pXvU0ca5ZdbvMNWfY41t
         qFVr5DDGT+c9ko7+NxLxgd61dAQw/Md2X0R6hFlTxyCNk8d9fPL/z6ICsU1/uou/1fHo
         umd3hoElgiAD38vNx15hpNla14Ax6YuI5JrDVIkWRuKBEbNTITocinVFrq0XKRRpCNxD
         a1xnOXswQsu2F0ZGdW0RGrr9Xjc91g4ZH9smOEEENiwfo8b0C3TEp5xME323BZ1T6PTk
         r1RAm30fJgFaBHoXghgZsP8+qXNYhGbaIOOAxxLeXmVUUik0q0o3/tw2koP0PyuVYcJu
         y+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771205; x=1739376005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=IsiBh0filIP+yNhbpQPQfpa+dGqjKoRdlbRMwT3t7Y2/7oHRRFBU1nUKN9sNsqO3cL
         N9pbI2ITHc5fZx0g6pORS7lM3hj4tmCybgZrcHtTnIaP7nxCLduAlEfgwajqgvuMKk7x
         Bqp3ZVH0v/Cncd0UGcOmmz0M1zHQh9zy2Bin/Puk9nC/HQD8uumj0m4bFRSuWgd9KPlM
         Fbg+foouvsmoJy7WqdZMffnLqrDugmhNwp5MT5ZpVI+VgV51AptDwoy1ip3IH82ZajAM
         GJfpbcx69yvHXEkUEnXuTLJoltqDYybcD0RsAk5W5Y5+i7YXqamTF21pCOrVFdIn6ugY
         s4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5ZgRd2LldutDUCcsobSWUojKe1swnT+fo0CPyq6E2ouo0E1PuB1JPsq2c+HfSujS1MrHDm7m2RULMMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OQyRxkrjWh2n5lu9BWi+Tz1QbWRqNhTfl4A0NoBXOjWBovoS
	+2HPPWHSabrwZHM49hSSsD6R1roaVkdKI0ufaTbap3WjFffA79KiNrcTEizufRE=
X-Gm-Gg: ASbGncv+ncXCD9yyg+xGdOllINVcCj8BsMOAN21JD/B8HAgfoPQX1ehCJDehc6Iw/3Q
	wMj3xNw6kyp64EquDzPv3rgBDdMrCZRtkmbGpBb8mNghfiAJisvBv7/DP5GyH9juE+IAeXFtJAK
	Dv9Hm9DrpSaulfE7n247cZ9Yhb6ENV/UjSWIAnegf1eLpa4I5EqQXkeoMpxwsEfQ/pE5bXNZH2Q
	CyKLPwJgFdY3y/2kpLG2yr2ATDmAHjoz0vl7zZVPZydvcfa013CFXRE8xg3hcObAx23RHToZkb6
	MaB/qc65JcnVn5lZC0V3DM1mugasW92fyccTlDqMvoJdKBXPbXYuFX0=
X-Google-Smtp-Source: AGHT+IFxrHkC5lry9v73hirVrwz0VwaueSl7vlCr1NVutMq+Q53roymPHtPchmK1sMCpMcVptQ1tdg==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr44908125ad.41.1738771204969;
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
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
Subject: [PATCH v4 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Wed,  5 Feb 2025 21:29:37 +0530
Message-ID: <20250205155948.81385-2-apatel@ventanamicro.com>
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..5d7c30ad8855 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,9 +96,8 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -116,13 +115,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
 	/* Update irq descriptors with the new vector */
-	pd->chip_data = new_vec;
+	d->chip_data = new_vec;
 
-	/* Update effective affinity of parent irq data */
-	irq_data_update_effective_affinity(pd, cpumask_of(new_vec->cpu));
+	/* Update effective affinity */
+	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
@@ -135,6 +134,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -245,7 +247,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
 #ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = imsic_irq_set_affinity;
+		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
 		break;
 	default:
-- 
2.43.0

