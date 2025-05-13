Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37922BE7BC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153912; cv=none; b=AqUvmuNVTBP92raR883UPlnBsndyK9Lvuslhg2YcyM9NQUoyxLhQdip5lVyHx/1xdgXc5mX0tKAoZR4M70P9LK+KSK6kzdETkWvRL3gotSQnCsGnuoNfNLDJhgQ6R+tF/0MvofQf3Fvxf+S0FsqD6zAlzGpGASYXOQSb/vh+lB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153912; c=relaxed/simple;
	bh=WVNzJ1QslGOZvrM8+INHuUbrNxIwVxMRLbrLof8UGE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X2iYytWlZbRtbRk/9cMikgOBeLmo0IMzGD2mCN5977wPBTT/q3uoYo56nduBMynJ+n5floRij24LVqQmEs+ud9rbOba8VpyPpbqq76Z/iMwJiISJxO2GNN4hKlhSaw6n9FdoVo5+0UV7uNy+SxnrhxcNygiAc7iGjAcuOI2D/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9kMzXXD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9kMzXXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628CAC4CEF4;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=WVNzJ1QslGOZvrM8+INHuUbrNxIwVxMRLbrLof8UGE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9kMzXXDBuRa3vfoSYnrhhdB5pvIx2WCKZ71M0Pmc2Lept3bgCBcto6sgWuvVOqro
	 bBcP5w5R2OtBt//zq3TGAw24/hnSQcAUBq0MDr0LiyVbOtAR02KfPej14Aey3jH/4t
	 hC2A/uBZasZ8xAw7a09lCVCzznRqJ9nEgWmNctrkza/7yBewxiIDQhxWfqP9neKFVA
	 NLY8E9bYBe0hrXcqDdiTDMJ3DHOxPRUWSffMDrUoQcfklHtrg3+xkGh7jhR7m01zSj
	 ZvKOIaFI4A8l8H5fzHJi9OiKWFr5ra38eRKnk/xoZkkT1Bk8DSc3ar50F4KdFRE0Kc
	 mX5Jj+HKhMtOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-Ba;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device allocation
Date: Tue, 13 May 2025 17:31:42 +0100
Message-Id: <20250513163144.2215824-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
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

The current device MSI infrastructure is subtly broken, as it
will issue an .msi_prepare() callback into the MSI controller
driver every time it needs to allocate an MSI. That's pretty wrong,
as the contract (or unwarranted assumption, depending who you ask)
between the MSI controller and the core code is that .msi_prepare()
is called exactly once per device.

This leads to some subtle breakage in said MSI controller drivers,
as it gives the impression that there are multiple endpoints sharing
a bus identifier (RID in PCI parlance, DID for GICv3+). It implies
that whatever allocation the ITS driver (for example) has done on
behalf of these devices cannot be undone, as there is no way to
track the shared state. This is particularly bad for wire-MSI devices,
for which .msi_prepare() is called for. each. input. line.

To address this issue, move the call to .msi_prepare() to take place
at the point of irq domain allocation, which is the only place that
makes sense. The msi_alloc_info_t structure is made part of the
msi_domain_template, so that its life-cycle is that of the domain
as well.

Finally, the msi_info::alloc_data field is made to point at this
allocation tracking structure, ensuring that it is carried around
the block.

This is all pretty straightforward, except for the non-device-MSI
leftovers, which still have to call .msi_prepare() at the old
spot. One day...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h |  2 ++
 kernel/irq/msi.c    | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 63c23003ec9b7..ba1c77a829a1c 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -516,12 +516,14 @@ struct msi_domain_info {
  * @chip:	Interrupt chip for this domain
  * @ops:	MSI domain ops
  * @info:	MSI domain info data
+ * @alloc_info:	MSI domain allocation data (arch specific)
  */
 struct msi_domain_template {
 	char			name[48];
 	struct irq_chip		chip;
 	struct msi_domain_ops	ops;
 	struct msi_domain_info	info;
+	msi_alloc_info_t	alloc_info;
 };
 
 /*
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 31378a2535fb9..07eb857efd15e 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -59,7 +59,8 @@ struct msi_ctrl {
 static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl);
 static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid);
 static inline int msi_sysfs_create_group(struct device *dev);
-
+static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
+				   int nvec, msi_alloc_info_t *arg);
 
 /**
  * msi_alloc_desc - Allocate an initialized msi_desc
@@ -1023,6 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	bundle->info.ops = &bundle->ops;
 	bundle->info.data = domain_data;
 	bundle->info.chip_data = chip_data;
+	bundle->info.alloc_data = &bundle->alloc_info;
 
 	pops = parent->msi_parent_ops;
 	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
@@ -1061,11 +1063,18 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	if (!domain)
 		return false;
 
+	domain->dev = dev;
+	dev->msi.data->__domains[domid].domain = domain;
+
+	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
+		dev->msi.data->__domains[domid].domain = NULL;
+		irq_domain_remove(domain);
+		return false;
+	}
+
 	/* @bundle and @fwnode_alloced are now in use. Prevent cleanup */
 	retain_and_null_ptr(bundle);
 	retain_and_null_ptr(fwnode_alloced);
-	domain->dev = dev;
-	dev->msi.data->__domains[domid].domain = domain;
 	return true;
 }
 
@@ -1232,6 +1241,24 @@ static int msi_init_virq(struct irq_domain *domain, int virq, unsigned int vflag
 	return 0;
 }
 
+static int populate_alloc_info(struct irq_domain *domain, struct device *dev,
+			       unsigned int nirqs, msi_alloc_info_t *arg)
+{
+	struct msi_domain_info *info = domain->host_data;
+
+	/*
+	 * If the caller has provided a template alloc info, use that. Once
+	 * all users of msi_create_irq_domain() have been eliminated, this
+	 * should be the only source of allocation information, and the
+	 * prepare call below should be finally removed.
+	 */
+	if (!info->alloc_data)
+		return msi_domain_prepare_irqs(domain, dev, nirqs, arg);
+
+	*arg = *info->alloc_data;
+	return 0;
+}
+
 static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain,
 				   struct msi_ctrl *ctrl)
 {
@@ -1244,7 +1271,7 @@ static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain
 	unsigned long idx;
 	int i, ret, virq;
 
-	ret = msi_domain_prepare_irqs(domain, dev, ctrl->nirqs, &arg);
+	ret = populate_alloc_info(domain, dev, ctrl->nirqs, &arg);
 	if (ret)
 		return ret;
 
-- 
2.39.2

