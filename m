Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF7D17597
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074644; cv=none; b=n5ZtUVli22TYfVxSpzPzgdDkiS3912Z3SNoIomAEkQs+i52mH8GfOvbYoUzzvX8UOYqZY6Tsws/NObUR7XY4VPMwpDBgbYQ1mclw0zVmGEz5TUKPZ0mcF2rM6Zs4BvY5StflONujl40Gg8r+B/Z3KMRZSSPQTRJPoU19H1I4t7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074644; c=relaxed/simple;
	bh=gGGEYK7VGgFWWdh/qLZbuuJY+xZwb2aTgVHnwmrr23c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MX/kmdxdY2P9idjfQOnpCfIvqWoR/MGr3oSBsT2iGpjQw3T42iC53fmOA8I0NdZauhsOKqNXXcw2jWi588byxmPizycK9ZDp7o9OwNqnpXj7y9ixaybpYYGRsX2e96kQvy0Nmy09iU229Vg8WtaFGpkJo1nSO55ZfmWw2jQu1Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AzPoVJD+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AzPoVJD+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa51743d80so819121a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074642; x=1739679442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=AzPoVJD+RGzbpA/i/EAv1blZwA0kZ9x/yV6QUjS/UhlN4P8ydtwSfIXKUdedValTT5
         e0rpRIKvs9qwp8Ihug5j9oZuyGaqBOH/Rd3FVpUc1EkVcgY4KQcXvrn3InXD24P9gBHO
         X/yr1X1Sv/o06IQRB0Kop/KgBazDRxnJDu2p6Y1JF7maPboeU+bifeM/nTq03SnQeIpv
         qKMnLc8I8VdIRHd+RcgpIEvDWVXr2d5NIluAVliuyHJEBArvIwFuJDtMZTLZi0+qh8D6
         TWX0MLZXiJz+7OEYmvA24luIol8cnTn46RiV3CKHVUHiiQZBQstIjaTOQslMExZvYJgY
         HS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074642; x=1739679442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=Z4htPsxSN88HMY4W2A6qBJJ4dipDFRG9HKkYZyP4t9FFPhEcHzCydSLrGq8WMnR3OX
         /m6YhVEWUBTCSWs3JZooq0JWmENVnhOgDf6wdbHVkcRNMlgfdozyylUZkBSgwgqPfma6
         SmwNbb0TdTQ7+I5N92ELbTsFyDisrbfKMxNr4mmInTrJ+pPtd1hZ2znjnxuSthoDuZAy
         S4yd/64CxS8ghurxYG6/E3qb954WLXeVbup6gux41AMaNUkZ9mtQT8EVScfuYcSGD7tV
         ofr4OUxL75nlLZ7iwkDDo7Yqq3TlZm7fQeOYPssXPOnqAakSYjUWLRU5UDVDXPBvutVn
         rdUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwHQq9v9hsTDU75k41w4EGSaSafOqpMjFqCciPJ5+x8RIxtulAuQCkYOXXZ8DEdV9COfkJAjMDEDx1f2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qiyXeu9YQpmz1WIKFDYJmecYBECbNJLDRTcbnlVKq8SLGl/z
	RRvHM10wV2awvXT0S5a6PyBvNyNmobW3O187b9LpbcZfKAtfX0ggw4g+TLIxz74=
X-Gm-Gg: ASbGncvaSOWQTzgmgijHe05qZDgMocay+hiurOkn/u4BhdbqHeg5ZnD9xEP02t+SXbL
	hehSj0SmBkqzCf3yjhSEVkUIiH952coT6XQZWDXG85hVnEiBXK72indppiuq8m3/9pXJrAr7ovL
	V6VCZPp5PRLPTXB+wsWAMikimvToQNQ9EkJUc8gL0Z9zL0o1NcoI8cY19SGshq1oBERVfgpJZvO
	ub+Kc7Z7iHtUTBtlu+SwqOOoPJdwkNmtQakPukBrSR73U2RbQO9PnGjbUSjaQPkDmo6D4llAiyu
	8aYKY74v+N5+TQEecfNZDOcM9PUhkB2cPbgGmaLZmnfIYIXtrlmfS5E=
X-Google-Smtp-Source: AGHT+IHRXdIPs1mvVVeCpBykzAl+ifFcG5qlvMFYrTkFKgREylWnQV7fAuN/+eShJoWgxmV452gK/Q==
X-Received: by 2002:a05:6a00:b41:b0:730:8a0a:9f06 with SMTP id d2e1a72fcca58-7308a0aad32mr287596b3a.16.1739074642169;
        Sat, 08 Feb 2025 20:17:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:21 -0800 (PST)
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
Subject: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  9 Feb 2025 09:46:45 +0530
Message-ID: <20250209041655.331470-2-apatel@ventanamicro.com>
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

