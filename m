Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46A1F7092
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270446; cv=none; b=BypTB580DKzi/a8WBBnv9Qwom3Wq5GAcFDXsqxsZVgJ9SH6qUlUWQmNS8FjxPe8+LNv68xI+ncBylN+tRxZmt4ZjUPYxf01Hu6Bu37ydY75P7ZpeyQgWe9KEh1dKWyIDk1YBgsIhC2FcPATedfyEmK1bln2hxKhFTKqL1NsKuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270446; c=relaxed/simple;
	bh=uWukpFKUeLUKaPpmmKnkWNdyZ2t1oo0yOS9KLFr2xdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=El6EY0zZuJh7yTSEkNIcaiAqrJ1A7/F7wudEy8BteqURqW4UHcUk3+sI2Q8Y1cVJBdXa3LPTggVxQiM0//cqTzytuavdE0qvYBSmvTet4HZnoLXmDhdKPxkh5GDLzUXGzU1x8PSwA7YAZ8EVPYyQFJoZGh1CgJ3RnVU7MOBhErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8N/ovEK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8N/ovEK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394c192285so7627835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270442; x=1739875242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq2yuNxgYvmlFHK8kUNExyKdrcQ68pV8lBs/vzGd9Qk=;
        b=P8N/ovEKKQAw+rkLNQ759liIdq5vmoA5IbrLzMEwIkdn4XvVQ1YvHAw57PiCQly3Mo
         ZsztuqaJUW2sTRpF/ebIN6UoOQWV6EQYgP8UMVZjfkExMRJMxgYo42lyWtzRMxt3DV43
         oZzbi5+YQHAhCjJDnRH9JvFCSlBfokePOSaD0Zw1ZktmQL2lgMF/N+g5x5RlPUZtLpe8
         D/QVFxujw41bVARrNmrcYfvh6xAd+o672XrHPK2CKL7mfvZtDaHJz4ymMOGCl/21PdXA
         tePFQPFdDMhvQuViMcIyar88SxxEQ9qM/3+otUJfZC/9lcF2/R/vWOZ5EhEuhV/na0ir
         rhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270442; x=1739875242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq2yuNxgYvmlFHK8kUNExyKdrcQ68pV8lBs/vzGd9Qk=;
        b=RIKbEF77enU35tBsNM6DkhDuLdJnpJdHUbhlb8nbCt/4vSxX6YY8LdrXC6nLALrRH7
         u2y7FUroVcG7uB2mU1855c365HipCF4YfZ7jhqfCUgvRkRiQxbPcx4lucg/SRk5nwebJ
         nxjgu8itUbO50a0AWTiv2xK961asDUrH7Gou/m1JPCyGchlvtIF0i7t7DF1ozcNLdMSO
         XMFU7rzrhSIV9y2e794Jfbw2GfflYmYxjmPf5GmOAyTAv6i0b+QVMUiPwSq8tyjHKGhV
         w61jRog2c1NzXr+J4jZ/+KlAkJsT0O0gdWdcaV22HqEhF2jV3MU5TN+mha+n2dX2WZ3L
         GACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG7vq8lEfTFiOp3dsX0Jr2I84sFmTBQrV8zsNyaamYe2Ty35IyE2/BrHYJsXtVJBfIU+jPj95BzdqNOag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUf027LK3JVHHILMorpqoC+DbRgoY3ID0zumB8m6m98tDvMUb
	9IGchcJzdjEEHlDIP+feI/IzLA49pBi1VMeW5nRaeykX6RzT1u/UGFMWPh3Mgx8=
X-Gm-Gg: ASbGnctFIXNeICy+jFwg/pyXjiQarZCetLBn0CZaZF3p47IUq5IETwLaNS8FxfpkaSD
	STxVeNGg7VsMpJwXGZm6ZBhzXedIKueuye34MzW0I5lZ3f2g783u6zprihW+Eqjt8HbIY5VYitF
	KiOHx2nVYZUNBOhf6nPohs+YUo9FWoBBWPkN3qs2GaM2CCu8vRr+LJOm0Dj6bRRpoOJYydklh7j
	t1lwouQcuVvSgO8TnGwdajDoxVxKkc7RlC1Tusw5hW3wx6i3H/6hFQCEc/7eWU79EMawaqqpdJk
	+ttDDpOZq6k+
X-Google-Smtp-Source: AGHT+IHtNNw9kps89Ef5g9lEwJ3sKBZ5nK8SGzKs6tj6r0kcmS4zP+Yxly2l/qcnZuMUHS5vBCNvRg==
X-Received: by 2002:a05:6000:184e:b0:38d:e3fd:a9aa with SMTP id ffacd0b85a97d-38de3fda9c9mr2385131f8f.42.1739270442289;
        Tue, 11 Feb 2025 02:40:42 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/7] coresight: Clear self hosted claim tag on probe
Date: Tue, 11 Feb 2025 10:39:41 +0000
Message-Id: <20250211103945.967495-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This can be left behind from a crashed kernel after a kexec so clear it
when probing each device. Similarly to
coresight_disclaim_device_unlocked(), only clear it if it's already set
to avoid races with an external debugger.

We need a csdev_access struct in etm_init_arch_data() so just replace
the iomem pointer with a full csdev_access struct. This means all usages
need to be updated to go through csa->base.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c  |  1 +
 drivers/hwtracing/coresight/coresight-core.c  | 48 +++++++++++++++----
 .../hwtracing/coresight/coresight-cti-core.c  |  2 +
 drivers/hwtracing/coresight/coresight-etb10.c |  2 +
 drivers/hwtracing/coresight/coresight-etm.h   |  6 +--
 .../coresight/coresight-etm3x-core.c          | 28 +++++------
 .../coresight/coresight-etm3x-sysfs.c         |  8 ++--
 .../coresight/coresight-etm4x-core.c          |  2 +
 .../hwtracing/coresight/coresight-funnel.c    |  2 +
 .../coresight/coresight-replicator.c          |  1 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
 include/linux/coresight.h                     |  3 ++
 12 files changed, 73 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index d9259c0b6e64..575c2d247a90 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
 
+	coresight_reset_claim(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
 	if (IS_ERR(drvdata->csdev))
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7fe5d5d432c4..97f33ffad05e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -212,20 +212,48 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
+ * Clear the claim tag for the device.
+ * Returns an error if the device wasn't already claimed.
+ */
+int coresight_reset_claim(struct csdev_access *csa)
+{
+	int ret;
+
+	CS_UNLOCK(csa->base);
+	ret = coresight_reset_claim_unlocked(csa);
+	CS_LOCK(csa->base);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(coresight_reset_claim);
+
+/*
+ * Clear the claim tag for the device. Called with CS_UNLOCKed for the component.
+ * Returns an error if the device wasn't already claimed.
+ */
+int coresight_reset_claim_unlocked(struct csdev_access *csa)
+{
+	if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED) {
+		coresight_clear_self_claim_tag(csa);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_reset_claim_unlocked);
+
+/*
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device
+ * and warn if the device wasn't already claimed.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-	if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
-		coresight_clear_self_claim_tag(csa);
-	else
-		/*
-		 * The external agent may have not honoured our claim
-		 * and has manipulated it. Or something else has seriously
-		 * gone wrong in our driver.
-		 */
-		WARN_ON_ONCE(1);
+	/*
+	 * Warn if the external agent hasn't honoured our claim
+	 * and has manipulated it. Or something else has seriously
+	 * gone wrong in our driver.
+	 */
+	WARN_ON_ONCE(coresight_reset_claim_unlocked(csa));
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 073f67a41af9..389a72362f0c 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+
+	coresight_reset_claim(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index d8bc3e776c88..b598b2c0c9bb 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+
+	coresight_reset_claim(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index e02c3ea972c9..a89736309c27 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -229,7 +229,7 @@ struct etm_config {
  * @config:	structure holding configuration parameters.
  */
 struct etm_drvdata {
-	void __iomem			*base;
+	struct csdev_access		csa;
 	struct clk			*atclk;
 	struct coresight_device		*csdev;
 	spinlock_t			spinlock;
@@ -260,7 +260,7 @@ static inline void etm_writel(struct etm_drvdata *drvdata,
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		writel_relaxed(val, drvdata->base + off);
+		writel_relaxed(val, drvdata->csa.base + off);
 	}
 }
 
@@ -274,7 +274,7 @@ static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		val = readl_relaxed(drvdata->base + off);
+		val = readl_relaxed(drvdata->csa.base + off);
 	}
 
 	return val;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 509f53b69e42..0b010683b883 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -86,9 +86,9 @@ static void etm_set_pwrup(struct etm_drvdata *drvdata)
 {
 	u32 etmpdcr;
 
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr |= ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 	/* Ensure pwrup completes before subsequent cp14 accesses */
 	mb();
 	isb();
@@ -101,9 +101,9 @@ static void etm_clr_pwrup(struct etm_drvdata *drvdata)
 	/* Ensure pending cp14 accesses complete before clearing pwrup */
 	mb();
 	isb();
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr &= ~ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 }
 
 /**
@@ -365,7 +365,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	rc = coresight_claim_device_unlocked(csdev);
 	if (rc)
@@ -427,7 +427,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etm_clr_prog(drvdata);
 
 done:
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev, "cpu: %d enable smp call done: %d\n",
 		drvdata->cpu, rc);
@@ -589,7 +589,7 @@ static void etm_disable_hw(void *info)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	etm_set_prog(drvdata);
 
 	/* Read back sequencer and counters for post trace analysis */
@@ -601,7 +601,7 @@ static void etm_disable_hw(void *info)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(&csdev->access);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev,
 		"cpu: %d disable smp call done\n", drvdata->cpu);
@@ -614,7 +614,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* Setting the prog bit disables tracing immediately */
 	etm_set_prog(drvdata);
@@ -626,7 +626,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(&csdev->access);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	/*
 	 * perf will release trace ids when _free_aux()
@@ -772,7 +772,7 @@ static void etm_init_arch_data(void *info)
 	/* Make sure all registers are accessible */
 	etm_os_unlock(drvdata);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* First dummy read */
 	(void)etm_readl(drvdata, ETMPDSR);
@@ -803,9 +803,10 @@ static void etm_init_arch_data(void *info)
 	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
 	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
+	coresight_reset_claim_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 }
 
 static int __init etm_hp_setup(void)
@@ -866,8 +867,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	drvdata->base = base;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
 
 	spin_lock_init(&drvdata->spinlock);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 68c644be9813..af566b62785c 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -50,11 +50,11 @@ static ssize_t etmsr_show(struct device *dev,
 
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	val = etm_readl(drvdata, ETMSR);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
 
@@ -949,9 +949,9 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 45b30a4b3eba..3609bb74c4ec 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1337,6 +1337,8 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
+
+	coresight_reset_claim_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
 }
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index e986922d555b..be2a47636ef3 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -255,6 +255,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
+		coresight_reset_claim(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
@@ -272,6 +273,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	desc.ops = &funnel_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 5d42a9a8c460..679a36effbe8 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 
+	coresight_reset_claim(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index e9876252a789..5ac4e3c706ac 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -558,6 +558,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
+	coresight_reset_claim(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 937931d107e0..11808aee9d1d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -655,6 +655,9 @@ extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
 extern void coresight_disclaim_device(struct csdev_access *csa);
 extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
+int coresight_reset_claim_unlocked(struct csdev_access *csa);
+int coresight_reset_claim(struct csdev_access *csa);
+
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
-- 
2.34.1

