Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF01DC198
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771279; cv=none; b=P+1I/49G6/jVwFyhm3RImKcq3n5XH7y+pVFM6RjIYZHqP3WNb35pLhLzMyXhwbxplPSmqQV2nsUlUgyaLV3fCiwtNJygkkYEWnGlD8g8cOLd/+v+nyG9t4ehZm5AdmF5S4MWCpETQ3KYkOcL5O6bmbMq9IFKBzGKW3PysYyiXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771279; c=relaxed/simple;
	bh=tNahCfxLRgNIbiBla43nJrTI1GFGdO1edGYaRhyK8s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7IjrQvA29N6MlBEksapeOK4aT/cyTqEmtmnquw9hyfB30ScEmOZFsh4KVKe03dF+3OsxpJE5zG29v1lvI++948z+uSVOt1RmVveuJCMt2QOa92ctHfR1VFUsc03lcd/QSbu+p63JRAAXdhrFQyWNXYksL74AbWVKSJyqHGxtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BdXhlMYZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BdXhlMYZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21670dce0a7so9323825ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771277; x=1739376077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=BdXhlMYZoneg4XjFolZY4NOxBbTXtBUuRlqe9sGih0KPAOjEy0ItrsDIL6ft7Fyacu
         ylQa9zvIJLziUbZBk5JPc2KaxX3W75AFoFg1Hr3uJpTLlDvtV+Y/ArCA6gCw2sjCCbNq
         Ce+skkP9c7XVk1DHs1+BNZrNtfvQcHQ95VXBzEt2f2qZxxeWiic0RQogeIGAmS17CPJz
         ohch+eo0BqkPETjqyrPaonE3LA/YeyaMsxT17LS8pYZq+GwT2xC/aB8H0xPUPfIjRODN
         X/mZDtIkyVjXkML+3YJcP3JhDaTfBjrbDbixeHcvTSmuvDmjEA+7vblHb/scJhEiyuXV
         Xxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771277; x=1739376077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=Crwf2R+2AK/rRSGUkZAhB9qE4wLbgXd0cMGXBnd9vmirrtpKBDPkZcryrkxC5ALp9o
         s59owuHQ3xEAOEFoKe02Dehbi1k7IDyonour6fzGSEtJZedMFq72RPKG/PaRhwT09bRB
         gBOBRSxImKE4FQqGPmkqnSMQYYsVHylO8buOg+73vFtqS9/qNBtY6gSahXi1X3uEkf0Q
         S4uOUWwZ0s0qWesatZB33oAxzL0ffPqh1+/cM3ToRQoyS/jOkIdkMz6+DtFrHr/kcWX0
         9/VRoe1jcecuOgQJOp6ga4w9xLMdsGXnZH8mL+/BVC6rGMLE67KQnPFcquA4G9qQsGRR
         Zl0g==
X-Forwarded-Encrypted: i=1; AJvYcCWl1DveZhuGcp9DW5rnSbNtnO7XUnueFTOeloMJlVUoTlaQ7hjFW8M+ipccdgMl89HmzkCX8mjVhcHW/tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3xY+9crGbPhJGOsPa1H1nz4jDrr/QpE3INiMPBYO2vvKgPLi
	TTvZFX7KsjhCFQA/EYi1RKOrfdYhDO5Wo9o5HXrJ97MxfQr4Yu3BziqGDM1WifM=
X-Gm-Gg: ASbGncsr4UILB9MLXks6RxZPZEeRQLCimpGzvR1Yty/rgBmroKkaNGwL+/TimHv0NhB
	UBXSlSms6Qo55uF7+kmuMJGcY4Rx/7/ySPibmXi82M9COA8eo46rTSGbXGLDX60o3wZ2jr2SxXq
	j+hUody4Hm3p/l3bZavcN9VH3npsZaY74Z5v/i5wsZlH7Suvod8Clt/Gqwuj5gW/PQsML2dlovT
	TGh4xSgkRJ6a6xVYpYoh14aXTsBWtnPJv06QqOdAIIFtce0y4k62mSpypDqIl8IAkhmk9rEptnM
	ai8bzKL0nytnEV5gdqPZ/NKX9AUwP4u+xXcrldQvGnw7ndKFHpVyzsU=
X-Google-Smtp-Source: AGHT+IFTclDON/r36LodehwMg78zlP6BqfcqB9QXn3ksA4PSt60KgNQ9lMw/GuAJ5JZoMSZ1KuB8Cw==
X-Received: by 2002:a17:903:18f:b0:21f:75c:f7d3 with SMTP id d9443c01a7336-21f17ec7bd9mr56546085ad.38.1738771275532;
        Wed, 05 Feb 2025 08:01:15 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:01:14 -0800 (PST)
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
Subject: [PATCH v4 11/11] irqchip/riscv-imsic: Special handling for non-atomic device MSI update
Date: Wed,  5 Feb 2025 21:29:47 +0530
Message-ID: <20250205155948.81385-12-apatel@ventanamicro.com>
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To avoid losing interrupt to such intermediate state, do the
following (just like x86 APIC):
 1) First write a temporary IMSIC vector to the device which
    has MSI address same as the old IMSIC vector but with MSI
    data matches the new IMSIC vector.
 2) Next write the new IMSIC vector to the device.

Based on the above, the __imsic_local_sync() must check pending
status of both old MSI data and new MSI data on the old CPU. In
addition, the movement of IMSIC vector for non-atomic device MSI
update must be done in interrupt context using IRQCHIP_MOVE_DEFERRED.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 73 +++++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c    | 31 +++++++--
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 6bf5d63f614e..828102c46f51 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -64,6 +64,11 @@ static int imsic_irq_retrigger(struct irq_data *d)
 	return 0;
 }
 
+static void imsic_irq_ack(struct irq_data *d)
+{
+	irq_move_irq(d);
+}
+
 static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
 {
 	phys_addr_t msi_addr;
@@ -97,6 +102,21 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
+	struct imsic_vector tmp_vec;
+
+	/*
+	 * Requirements for the downstream irqdomains (or devices):
+	 *
+	 * 1) Downstream irqdomains (or devices) with atomic MSI update can
+	 *    happily do imsic_irq_set_affinity() in the process-context on
+	 *    any CPU so the irqchip of such irqdomains must not set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 *
+	 * 2) Downstream irqdomains (or devices) with non-atomic MSI update
+	 *    must do imsic_irq_set_affinity() in the interrupt-context upon
+	 *    next interrupt so the irqchip of such irqdomains must set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 */
 
 	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
@@ -115,6 +135,33 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to such intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check pending
+	 * status of both old MSI data and new MSI data on the old CPU.
+	 */
+
+	if (!irq_can_move_in_process_context(d) &&
+	    new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -171,6 +218,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -190,7 +238,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -229,15 +277,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
 };
 
+static bool imsic_init_dev_msi_info(struct device *dev,
+				    struct irq_domain *domain,
+				    struct irq_domain *real_parent,
+				    struct msi_domain_info *info)
+{
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
+
+	switch (info->bus_token) {
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->flags |= IRQCHIP_MOVE_DEFERRED;
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS |
 				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index d0148e48ab05..3a2a381e4fa1 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -169,13 +169,36 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			if (__imsic_id_read_clear_pending(i)) {
+			/*
+			 * Device having non-atomic MSI update might see an
+			 * intermediate state so check both old ID and new ID
+			 * for pending interrupts.
+			 *
+			 * For details, refer imsic_irq_set_affinity().
+			 */
+
+			tvec = vec->local_id == mvec->local_id ?
+			       NULL : &lpriv->vectors[mvec->local_id];
+			if (tvec &&
+			    !irq_can_move_in_process_context(irq_get_irq_data(vec->irq)) &&
+			    __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
 			WRITE_ONCE(vec->move_next, NULL);
-			imsic_vector_free(&lpriv->vectors[i]);
+			imsic_vector_free(vec);
 		}
 
 skip:
-- 
2.43.0

