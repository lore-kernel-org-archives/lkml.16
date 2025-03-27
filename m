Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B618621420A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075512; cv=none; b=tsfGp4G/7RSA9JBsdg7N1uw410pcTGzO0ZkgGC0xfXBpZDsa83OcL4nOCzkaA+o2EZQW0BBV/jAVQRqQY+JPKNLqacnFLnr4InFIj5hAU5RQXOgaZpvu7GKSxBpgs9QWrE7BkOtCRcfkXQL75opbQChHx3DC8VqaZ9+z3x9LtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075512; c=relaxed/simple;
	bh=e5sYw9GdpYklsVxC0btJUFy4UIGQC9rbA0p3shKqNPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LuRJxePunoZbSV021JzRcGhn+Gdh3E3dX56waIyzaLtmEx9GsEIF67kuW/PzasmK/ScrdYxYUtZPr56fVhvzomR+/DGVwP1oNnL2Bf20guVlCrVgJmg2xaHhDwWtgQbjVxWXiUq7bxix3hoiGMDXUdoKogOElwxcFlum0qdvirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963781063;
	Thu, 27 Mar 2025 04:38:35 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B4B03F58B;
	Thu, 27 Mar 2025 04:38:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 4/9] coresight: Disable programming clock properly
Date: Thu, 27 Mar 2025 11:37:58 +0000
Message-Id: <20250327113803.1452108-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327113803.1452108-1-leo.yan@arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some CoreSight components have programming clocks (pclk) and are enabled
using clk_get() and clk_prepare_enable().  However, in many cases, these
clocks are not disabled when modules exit and only released by clk_put().

To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
by replacing clk_get() and clk_prepare_enable() with
devm_clk_get_enabled() for enabling APB clock.  Callers are updated
to reuse the returned error value.

With the change, programming clocks are managed as resources in driver
model layer, allowing clock cleanup to be handled automatically.  As a
result, manual cleanup operations are no longer needed and are removed
from the Coresight drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  9 ++-------
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  6 +-----
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 ++--------
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  9 ++-------
 drivers/hwtracing/coresight/coresight-funnel.c     |  6 +-----
 drivers/hwtracing/coresight/coresight-replicator.c |  6 +-----
 drivers/hwtracing/coresight/coresight-stm.c        |  4 +---
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  4 +---
 drivers/hwtracing/coresight/coresight-tpiu.c       |  4 +---
 include/linux/coresight.h                          | 16 +++-------------
 10 files changed, 15 insertions(+), 59 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 9fcda5e49253..c0a51ab0312c 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -627,7 +627,7 @@ static int catu_platform_probe(struct platform_device *pdev)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
@@ -636,11 +636,8 @@ static int catu_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, drvdata);
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
-	if (ret) {
+	if (ret)
 		pm_runtime_disable(&pdev->dev);
-		if (!IS_ERR_OR_NULL(drvdata->pclk))
-			clk_put(drvdata->pclk);
-	}
 
 	return ret;
 }
@@ -654,8 +651,6 @@ static void catu_platform_remove(struct platform_device *pdev)
 
 	__catu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 342c3aaf414d..744b6f9b065e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -699,7 +699,7 @@ static int debug_platform_probe(struct platform_device *pdev)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
@@ -710,8 +710,6 @@ static int debug_platform_probe(struct platform_device *pdev)
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
-		if (!IS_ERR_OR_NULL(drvdata->pclk))
-			clk_put(drvdata->pclk);
 	}
 	return ret;
 }
@@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
 
 	__debug_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..de279efe3405 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -209,7 +209,7 @@ static int ctcu_probe(struct platform_device *pdev)
 
 	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->apb_clk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->apb_clk);
 
 	cfgs = of_device_get_match_data(dev);
 	if (cfgs) {
@@ -233,12 +233,8 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
-		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
-			clk_put(drvdata->apb_clk);
-
+	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
-	}
 
 	return 0;
 }
@@ -275,8 +271,6 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
-		clk_put(drvdata->apb_clk);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 537d57006a25..ff4ac4b686c4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2237,14 +2237,12 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	if (res) {
 		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(drvdata->base)) {
-			clk_put(drvdata->pclk);
+		if (IS_ERR(drvdata->base))
 			return PTR_ERR(drvdata->base);
-		}
 	}
 
 	dev_set_drvdata(&pdev->dev, drvdata);
@@ -2351,9 +2349,6 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
 	if (drvdata)
 		etm4_remove_dev(drvdata);
 	pm_runtime_disable(&pdev->dev);
-
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 static const struct amba_id etm4_ids[] = {
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0541712b2bcb..3fb9d0a37d55 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -240,7 +240,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	/*
 	 * Map the device base for dynamic-funnel, which has been
@@ -283,8 +283,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
 out_disable_clk:
 	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
 		clk_disable_unprepare(drvdata->atclk);
-	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return ret;
 }
 
@@ -354,8 +352,6 @@ static void funnel_platform_remove(struct platform_device *pdev)
 
 	funnel_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 static const struct of_device_id funnel_match[] = {
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index ee7ee79f6cf7..87346617b852 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -247,7 +247,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	/*
 	 * Map the device base for dynamic-replicator, which has been
@@ -295,8 +295,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 out_disable_clk:
 	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
 		clk_disable_unprepare(drvdata->atclk);
-	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return ret;
 }
 
@@ -334,8 +332,6 @@ static void replicator_platform_remove(struct platform_device *pdev)
 
 	replicator_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 26f9339f38b9..c32d0bd92f30 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -851,7 +851,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	base = devm_ioremap_resource(dev, res);
@@ -1033,8 +1033,6 @@ static void stm_platform_remove(struct platform_device *pdev)
 
 	__stm_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 6aad2acd0378..86ea3fea7abb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -990,7 +990,7 @@ static int tmc_platform_probe(struct platform_device *pdev)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 
 	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
@@ -1014,8 +1014,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
 
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 97ef36f03ec2..4b9634941752 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -153,7 +153,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
-		return -ENODEV;
+		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	/* Validity for the resource is already checked by the AMBA core */
@@ -293,8 +293,6 @@ static void tpiu_platform_remove(struct platform_device *pdev)
 
 	__tpiu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (!IS_ERR_OR_NULL(drvdata->pclk))
-		clk_put(drvdata->pclk);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..b888f6ed59b2 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -476,26 +476,16 @@ static inline bool is_coresight_device(void __iomem *base)
  * Returns:
  *
  * clk   - Clock is found and enabled
- * NULL  - clock is not found
  * ERROR - Clock is found but failed to enable
  */
 static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 {
 	struct clk *pclk;
-	int ret;
 
-	pclk = clk_get(dev, "apb_pclk");
-	if (IS_ERR(pclk)) {
-		pclk = clk_get(dev, "apb");
-		if (IS_ERR(pclk))
-			return NULL;
-	}
+	pclk = devm_clk_get_enabled(dev, "apb_pclk");
+	if (IS_ERR(pclk))
+		pclk = devm_clk_get_enabled(dev, "apb");
 
-	ret = clk_prepare_enable(pclk);
-	if (ret) {
-		clk_put(pclk);
-		return ERR_PTR(ret);
-	}
 	return pclk;
 }
 
-- 
2.34.1

