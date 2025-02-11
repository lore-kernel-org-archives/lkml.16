Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093FA1F7092
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270438; cv=none; b=PwkG/eBi0RNpcnkuA4I819eqM6BC+lf9J7cSra3Cz/VeWAIneLRdaBRa0LNr7InH0K7K0nmlGOAxKsBo/UrolgvGEXuXV+wC14W5Bp8zA7mdbK9SRohZ0b4H90+De5lRpq8DpP7YIjL0FawPDQZKnhXslineKCKM3Jk5yc/vgyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270438; c=relaxed/simple;
	bh=gHc5jDXQiQiTAR9Imk2fAGWK16jugMlecrXNhaImdQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpHDsNTZ8sIftak/GXbkduY+cGFxxBqMZF+fN2Z+zLW7e86jGwL5FBnaXP5uXyhRHmnl1WsQwJVuXKrXr2u8KUpDyZyUyg6ZQUFF+q+NVszcG1tfxQ19ShmglRC6QCzH1EuLwR4+gEFwPtU69ayArzhxua0jKEgtUNmxcTdLluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhwDdoxc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhwDdoxc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a39e659cso37022145e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270434; x=1739875234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zZ0OrtQMgfnUz7Pqgs5oe7tlQZDOHSDEQQYtTNC+PI=;
        b=zhwDdoxcR7IiEcD9rMejaWYs2T7RF6Ah3t/cMjvpMAjJwrUnUBICZjLHJ4ZlfgKn9c
         m15dq+oj+Ic5890k3KoHmLkfuSVxXx/WNGrsuKov/iy8p2c4BXgYbj4lDInsKnRuJE11
         X2NQ2qVCIQXUcc433EcLwSs5gZfDVffGAeWMxLx57o0D0WcqQvhqbCWT+grpNNakVxuZ
         ltNgqO0LdAeUlcele4vy+CVKQ9HCK+SI7PLHXpLH9YoNzct+tajPmFr2qG1VBYEkcl9o
         I3FUlzoba09ks/sOrxRALDwhiVbyTKaHtW3gfMNWALeSn6hsRFQ2ufrwTgIsCYkCC672
         qXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270434; x=1739875234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zZ0OrtQMgfnUz7Pqgs5oe7tlQZDOHSDEQQYtTNC+PI=;
        b=b1gDQc+N3Fkk1okOWxbi0sNn60HW/HBzP3DwMoP2Bypt6u+rIVHACur5rv0/sF7CwI
         ITMUmZ7h1rm5+EDVeHViZpsm5RJF0cHHyxszu7LwKiew1un9F1BZ3gqlE1a8JZnOG2TM
         KacqzOWV7hGDtUGpuhDsHismIAOuGnkyXt4TLZqyvRPiOML/yTsnqMgfFFrd0jHjOrrU
         2/ajK16eU8+5rq4HvAIaFYm+wY7lqoiTrfuwXUxbWkm+Dya7mJpjymH2yEfxrPXM/6Jf
         KmVURvxdL5kXfdy6XrGlJqw9B1pOlphIoJNk1vsHKvRDEKAkuOOix6VqAI6iuboORL+t
         E/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXvvqjncTHxrULkTtWnQ7fGhXfMJo49C6c3SSw4Pte02zcj1fx55ZGj6D/c/qJvCSGRedAz7gOmRd62IEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy99rGloFTr6kQuoR+FnKPPO3h/dIZDHeLhpFwpwGHRVMIhDZ0
	djrtq4WcObgvkysh2tS4gjYts0kWSMs/R2U9bYsG3F4ES3Liov0lbLyryyd2hzs=
X-Gm-Gg: ASbGncu7CQTtXMgnTy7GXl0QfDZe4xP3mUa7EU1OHfg5ie28J9sqkP15zADdaNgGS54
	tUiAstrUN9KjKjrYWUP+ys1eGAOfsRPZL63NmnW1j++1HZBy/wLOKZh9wVU2dGMLUTyEQ06wo8M
	cuP2nLjYFElmM/ZjjASH1EfpWxrzkJg3kRRdEaEj8/Siaf4SgCRLJLkyaH8XBEEsw+w8DURzVNC
	EgtY9c4/Km4fJnni3apIisbMIVPLvnGSQqsLWn0ynSd4l22ahawviNZD34RdnYlXwzyto55XXLP
	YjNMlkQG/EOr
X-Google-Smtp-Source: AGHT+IG1QC0ZJB8Dsyjrd4BKscl8IOtVtmsqNcKjSxhkXZoFddZatFd1vyjkzTkufMPdlU+5dsOvHQ==
X-Received: by 2002:a05:600c:5494:b0:439:5016:3867 with SMTP id 5b1f17b1804b1-43950163b9amr16347735e9.23.1739270433358;
        Tue, 11 Feb 2025 02:40:33 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:33 -0800 (PST)
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
Subject: [PATCH 2/7] coresight: Convert disclaim functions to take a struct cs_access
Date: Tue, 11 Feb 2025 10:39:38 +0000
Message-Id: <20250211103945.967495-3-james.clark@linaro.org>
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use cs_access instead.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c  |  2 +-
 drivers/hwtracing/coresight/coresight-core.c  | 45 ++++++++-----------
 .../hwtracing/coresight/coresight-cti-core.c  |  6 +--
 drivers/hwtracing/coresight/coresight-etb10.c |  2 +-
 .../coresight/coresight-etm3x-core.c          |  4 +-
 .../coresight/coresight-etm4x-core.c          |  2 +-
 .../hwtracing/coresight/coresight-funnel.c    |  2 +-
 .../coresight/coresight-replicator.c          |  4 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  8 ++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  4 +-
 include/linux/coresight.h                     |  4 +-
 11 files changed, 38 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..d9259c0b6e64 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -474,7 +474,7 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 	struct coresight_device *csdev = drvdata->csdev;
 
 	catu_write_control(drvdata, 0);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	if (catu_wait_for_ready(drvdata)) {
 		dev_info(dev, "Timeout while waiting for READY\n");
 		rc = -EAGAIN;
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 523dbb381f90..a669872b4118 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -127,31 +127,31 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
+static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 {
-	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
+	return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
+static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
 {
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
+	return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
 }
 
 static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) != 0;
+	return coresight_read_claim_tags(&csdev->access) != 0;
 }
 
-static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
+static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
@@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(csdev);
-	if (coresight_is_claimed_self_hosted(csdev))
+	coresight_set_self_claim_tag(&csdev->access);
+	if (coresight_is_claimed_self_hosted(&csdev->access))
 		return 0;
 	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(csdev);
+	coresight_clear_self_claim_tag(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -202,14 +202,10 @@ EXPORT_SYMBOL_GPL(coresight_claim_device);
  * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
-void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
+void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-
-	if (WARN_ON(!csdev))
-		return;
-
-	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_self_claim_tag(csdev);
+	if (coresight_is_claimed_self_hosted(csa))
+		coresight_clear_self_claim_tag(csa);
 	else
 		/*
 		 * The external agent may have not honoured our claim
@@ -220,14 +216,11 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
 
-void coresight_disclaim_device(struct coresight_device *csdev)
+void coresight_disclaim_device(struct csdev_access *csa)
 {
-	if (WARN_ON(!csdev))
-		return;
-
-	CS_UNLOCK(csdev->access.base);
-	coresight_disclaim_device_unlocked(csdev);
-	CS_LOCK(csdev->access.base);
+	CS_UNLOCK(csa->base);
+	coresight_disclaim_device_unlocked(csa);
+	CS_LOCK(csa->base);
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device);
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index d2b5a5718c29..073f67a41af9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -175,7 +175,7 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	writel_relaxed(0, drvdata->base + CTICONTROL);
 	config->hw_enabled = false;
 
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 	spin_unlock(&drvdata->spinlock);
 	return ret;
@@ -683,7 +683,7 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 		/* CTI regs all static - we have a copy & nothing to save */
 		drvdata->config.hw_powered = false;
 		if (drvdata->config.hw_enabled)
-			coresight_disclaim_device(csdev);
+			coresight_disclaim_device(&csdev->access);
 		break;
 
 	case CPU_PM_ENTER_FAILED:
@@ -746,7 +746,7 @@ static int cti_dying_cpu(unsigned int cpu)
 	spin_lock(&drvdata->spinlock);
 	drvdata->config.hw_powered = false;
 	if (drvdata->config.hw_enabled)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	spin_unlock(&drvdata->spinlock);
 	return 0;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..d8bc3e776c88 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -344,7 +344,7 @@ static void etb_disable_hw(struct etb_drvdata *drvdata)
 {
 	__etb_disable_hw(drvdata);
 	etb_dump_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 }
 
 static int etb_disable(struct coresight_device *csdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..509f53b69e42 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -599,7 +599,7 @@ static void etm_disable_hw(void *info)
 		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
 
 	etm_set_pwrdwn(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 
@@ -624,7 +624,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	 * power down the tracer.
 	 */
 	etm_set_pwrdwn(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index dd8c74f893db..45b30a4b3eba 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -922,7 +922,7 @@ static void etm4_disable_hw(void *info)
 			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	etm4_cs_lock(drvdata, csa);
 
 	dev_dbg(&drvdata->csdev->dev,
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 8faf51469bb8..e986922d555b 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -116,7 +116,7 @@ static void dynamic_funnel_disable_hw(struct funnel_drvdata *drvdata,
 
 	/* Disclaim the device if none of the slaves are now active */
 	if (!(functl & FUNNEL_ENSx_MASK))
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 }
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index a1181c9048c0..5d42a9a8c460 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -54,7 +54,7 @@ static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
 	if (!coresight_claim_device_unlocked(csdev)) {
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER0);
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER1);
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 	}
 
 	CS_LOCK(drvdata->base);
@@ -167,7 +167,7 @@ static void dynamic_replicator_disable(struct replicator_drvdata *drvdata,
 
 	if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0xff) &&
 	    (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0xff))
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..1e4d874a8448 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -53,7 +53,7 @@ static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 
 	rc = __tmc_etb_enable_hw(drvdata);
 	if (rc)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	return rc;
 }
 
@@ -99,7 +99,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etb_disable_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 }
 
 static int __tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
@@ -136,7 +136,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 
 	rc = __tmc_etf_enable_hw(drvdata);
 	if (rc)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	return rc;
 }
 
@@ -148,7 +148,7 @@ static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 
 	tmc_flush_and_stop(drvdata);
 	tmc_disable_hw(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..7ba4f79191de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1066,7 +1066,7 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 		rc = __tmc_etr_enable_hw(drvdata);
 		if (rc) {
 			drvdata->etr_buf = NULL;
-			coresight_disclaim_device(drvdata->csdev);
+			coresight_disclaim_device(&drvdata->csdev->access);
 		}
 	}
 
@@ -1156,7 +1156,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 	/* Reset the ETR buf used by hardware */
 	drvdata->etr_buf = NULL;
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..937931d107e0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -653,8 +653,8 @@ extern int coresight_timeout(struct csdev_access *csa, u32 offset,
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
-extern void coresight_disclaim_device(struct coresight_device *csdev);
-extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+extern void coresight_disclaim_device(struct csdev_access *csa);
+extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
-- 
2.34.1

