Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73788258CFB
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981327; cv=none; b=mXkb4XCLLrYIZgMjXzMQnR+dHtXi92BBTEnTIcHWcomsNaMxX8TdmCVumHR1zHUVwSr4tBv9SpQgvNWwUgN94t9hzyguvMHGmvCU9ikXJoxLc+ZaFs46viVKZVlfbW/Q2u2fQZxrSHVtwnyo/QFCmVoX5lldkttIOlCzWiwyq4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981327; c=relaxed/simple;
	bh=MkHl02Hcg/C7P/syAv18JHro8Do6xpxM2jr5nO1nbsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gvZY/warNoH/PAL9TFoA5Hae+S6BUs7q7gCclyXkXCuhX+sqIhRvOAlhNzAPnNGOrp7xZV8GDFXKhGDQ57b8cKwHrO3dD0N/qWg5qC3won458tyHt0Wki39mmop4BcSNPOhLTbNJ0D0XgZDLdgrYHPv9p+nHnCG55iEjK2xRvqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJuzghMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJuzghMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06494C4AF09;
	Sun, 11 May 2025 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981327;
	bh=MkHl02Hcg/C7P/syAv18JHro8Do6xpxM2jr5nO1nbsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJuzghMIFy93VmeAdc0IgjOjuB/Xh/vCUxyzAT9AoC6LkyjWgQ/LQfDqcNh74AuKb
	 oZSXhJtWB2L7razBEJO4q4Rv5zZhedjDrbYrm4fvGWTubJcoyOaACaksA3FtFVS2/x
	 4rk54zMacmJpoy7Wq4ekz3oqQJo2xFvAtnGFmI0EOf3Qg5S6ht1SmLCky5FxAcleDT
	 Rs5DsrHLHxhlTN+rHO9qoYBKzIH/pt7SUL9AV3zdbgzNzBmF8g2uaft7Rv3xHvQGWk
	 qePrDU9WxRQ3HbIE0hjKguulDSaqOXETnR1F6DpNYKrEm2D5IC9/IjBjvG3bH0M/Sc
	 /r8NDLoCRUWHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e8-00Dt22-Th;
	Sun, 11 May 2025 17:35:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown() callback
Date: Sun, 11 May 2025 17:35:18 +0100
Message-Id: <20250511163520.1307654-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250511163520.1307654-1-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

We currently nuke the structure representing an endpoint device
translating via an ITS on freeing the last LPI allocated for it.

That's an unfortunate state of affair, as it is pretty common for
a driver to allocate a single MSI, do something clever, teardown
this MSI, and reallocate a whole bunch of them. The nvme driver
does exactly that, amongst others.

What happens in that case is that the core code is buggy enough
to issue another .msi_prepare() call, even if it shouldn't.
This luckily cancels the above behaviour and hides the problem.

In order to fix the core code, let's start by implementing the new
.msi_teardown() callback. Nothing calls it yet, so a side effect
is that the its_dev structure will not be freed and that the DID
will stay mapped. Not a big deal, and this will be solved in the
following patch.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 10 ++++
 drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++--------
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index bdb04c8081480..76b94f55b00e2 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -159,6 +159,14 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 					  dev, nvec, info);
 }
 
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
+{
+	struct msi_domain_info *msi_info;
+
+	msi_info = msi_get_domain_info(domain->parent);
+	msi_info->ops->msi_teardown(domain->parent, info);
+}
+
 static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
@@ -182,6 +190,7 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		 * %MSI_MAX_INDEX.
 		 */
 		info->ops->msi_prepare = its_pci_msi_prepare;
+		info->ops->msi_teardown = its_msi_teardown;
 		break;
 	case DOMAIN_BUS_DEVICE_MSI:
 	case DOMAIN_BUS_WIRED_TO_MSI:
@@ -190,6 +199,7 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		 * size is also known at domain creation time.
 		 */
 		info->ops->msi_prepare = its_pmsi_prepare;
+		info->ops->msi_teardown = its_msi_teardown;
 		break;
 	default:
 		/* Confused. How did the lib return true? */
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 0115ad6c82593..3472b97477104 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3620,8 +3620,43 @@ static int its_msi_prepare(struct irq_domain *domain, struct device *dev,
 	return err;
 }
 
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
+{
+	struct msi_domain_info *msi_info;
+	struct its_device *its_dev;
+	struct its_node *its;
+	u32 dev_id;
+
+	dev_id = info->scratchpad[0].ul;
+
+	msi_info = msi_get_domain_info(domain);
+	its = msi_info->data;
+
+	guard(mutex)(&its->dev_alloc_lock);
+
+	its_dev = its_find_device(its, dev_id);
+
+	/* If the device is shared, keep everything around */
+	if (its_dev->shared)
+		return;
+
+	/* LPIs should have been already unmapped at this stage */
+	if (WARN_ON_ONCE(!bitmap_empty(its_dev->event_map.lpi_map,
+				       its_dev->event_map.nr_lpis)))
+		return;
+
+	its_lpi_free(its_dev->event_map.lpi_map,
+		     its_dev->event_map.lpi_base,
+		     its_dev->event_map.nr_lpis);
+
+	/* Unmap device/itt, and get rid of the tracking */
+	its_send_mapd(its_dev, 0);
+	its_free_device(its_dev);
+}
+
 static struct msi_domain_ops its_msi_domain_ops = {
 	.msi_prepare	= its_msi_prepare,
+	.msi_teardown	= its_msi_teardown,
 };
 
 static int its_irq_gic_domain_alloc(struct irq_domain *domain,
@@ -3722,7 +3757,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
-	struct its_node *its = its_dev->its;
 	int i;
 
 	bitmap_release_region(its_dev->event_map.lpi_map,
@@ -3736,26 +3770,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 		irq_domain_reset_irq_data(data);
 	}
 
-	mutex_lock(&its->dev_alloc_lock);
-
-	/*
-	 * If all interrupts have been freed, start mopping the
-	 * floor. This is conditioned on the device not being shared.
-	 */
-	if (!its_dev->shared &&
-	    bitmap_empty(its_dev->event_map.lpi_map,
-			 its_dev->event_map.nr_lpis)) {
-		its_lpi_free(its_dev->event_map.lpi_map,
-			     its_dev->event_map.lpi_base,
-			     its_dev->event_map.nr_lpis);
-
-		/* Unmap device/itt */
-		its_send_mapd(its_dev, 0);
-		its_free_device(its_dev);
-	}
-
-	mutex_unlock(&its->dev_alloc_lock);
-
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-- 
2.39.2

