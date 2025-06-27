Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491312DBF77
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025154; cv=none; b=djR6Hkd7rp+B8xIGnv7oEtsQqxmlDyLEFpS57AIQPyClbnY1v4wAs+NhepB62jPETybBwIdlLRDkayKGkwKW523HTX6AYzd4x5DDSH3lrnT9lPLAnuSMhYim0o+rc7jZ4pXWniB15j/GSqI7pJmzRwEDumUL1H/fIVvaVvpgLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025154; c=relaxed/simple;
	bh=WpczpQZj/Wb28bhrqX3rvG99XOBPc/AkeTq81hLWt7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM5eEXMQvG5Xk34Vrj5BW12IHVhTdjQcUqapMNt0X94kcVkVGeDTEr3HSrg8uqPzIgIWVDZtefQ4U+5Ydfqwg1aIvXNppPS7MKaaH6oCos/cg5KFcHfZOuHvIYKTZxmlvFfnOXGFx6A42QxBsWQHVuLZ2SBwSf5N+yH4UBunHfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DED022C7;
	Fri, 27 Jun 2025 04:52:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2033F58B;
	Fri, 27 Jun 2025 04:52:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:53 +0100
Subject: [PATCH v4 07/10] coresight: Consolidate clock enabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-7-0ce0009c38f8@arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=15479;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WpczpQZj/Wb28bhrqX3rvG99XOBPc/AkeTq81hLWt7k=;
 b=19v8TEHi78+HNrhFRBw9JB5g2Dcgpqxsl0HO5JxwNKb38bfOZKPXi9HyhQKmmVTDmMHliYM12
 9EhvfYhy5NQCX69VznWMumUGzadzxt+3QlJwBuXnNK6CKVCj9dHHUEv
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

CoreSight drivers enable pclk and atclk conditionally.  For example,
pclk is only enabled in the static probe, while atclk is an optional
clock that it is enabled for both dynamic and static probes, if it is
present.  In the current CoreSight drivers, these two clocks are
initialized separately.  This causes complex and duplicate codes.

CoreSight drivers are refined so that clocks are initialized in one go.
For this purpose, this commit renames coresight_get_enable_apb_pclk() to
coresight_get_enable_clocks() and encapsulates clock initialization
logic:

 - If a clock is initialized successfully, its clock pointer is assigned
   to the double pointer passed as an argument.
 - If pclk is skipped for an AMBA device, or if atclk is not found, the
   corresponding double pointer is set to NULL.  The function returns
   Success (0) to guide callers can proceed with no error.
 - Otherwise, an error number is returned for failures.

The function became complex, move it from the header to the CoreSight
core layer and the symbol is exported.  Added comments for recording
details.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 10 ++---
 drivers/hwtracing/coresight/coresight-core.c       | 46 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 ++--
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++----
 drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++----
 drivers/hwtracing/coresight/coresight-replicator.c | 11 ++----
 drivers/hwtracing/coresight/coresight-stm.c        |  9 ++---
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 10 ++---
 drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++---
 include/linux/coresight.h                          | 23 +----------
 11 files changed, 81 insertions(+), 76 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 4c345ff2cff141ea63c2220393e5fdd00c449ca6..0f476a0cbd740c233d039c5c411ca192681e2023 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -520,9 +520,9 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
 	if (!catu_desc.name)
@@ -634,10 +634,6 @@ static int catu_platform_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827552a5c97b6bdd05d22dec4994b22..54455f8c025d3f838e9cd04e5de8bb45c5d47c7d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1698,6 +1698,52 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
 }
 EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
 
+/*
+ * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
+ * for the given device.
+ *
+ * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
+ * skip to get and enable the pclk for an AMBA device.
+ *
+ * atclk is an optional clock, it will be only enabled when it is existed.
+ * Otherwise, a NULL pointer will be returned to caller.
+ *
+ * Returns: '0' on Success; Error code otherwise.
+ */
+int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
+				struct clk **atclk)
+{
+	WARN_ON(!pclk);
+
+	if (dev_is_amba(dev)) {
+		/* Don't enable pclk for an AMBA device */
+		*pclk = NULL;
+	} else {
+		/*
+		 * "apb_pclk" is the default clock name for an Arm Primecell
+		 * peripheral, while "apb" is used only by the CTCU driver.
+		 *
+		 * For easier maintenance, CoreSight drivers should use
+		 * "apb_pclk" as the programming clock name.
+		 */
+		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
+		if (IS_ERR(*pclk))
+			*pclk = devm_clk_get_enabled(dev, "apb");
+		if (IS_ERR(*pclk))
+			return PTR_ERR(*pclk);
+	}
+
+	/* Initialization of atclk is skipped if it is a NULL pointer. */
+	if (atclk) {
+		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
+		if (IS_ERR(*atclk))
+			return PTR_ERR(*atclk);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(coresight_get_enable_clocks);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index e39dfb886688e111eee95d4294f37fa85baccd14..5f6db2fb95d4623a0bab08828ae00442870abd7d 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -566,6 +566,10 @@ static int __debug_probe(struct device *dev, struct resource *res)
 	void __iomem *base;
 	int ret;
 
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
+	if (ret)
+		return ret;
+
 	drvdata->cpu = coresight_get_cpu(dev);
 	if (drvdata->cpu < 0)
 		return drvdata->cpu;
@@ -697,10 +701,6 @@ static int debug_platform_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index de279efe340581ceabfb9e1cd1e7fe4b5e4f826e..75b5114ef652e4a47c53fbd2b7811c1bab575645 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -188,7 +188,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	const struct ctcu_config *cfgs;
 	struct ctcu_drvdata *drvdata;
 	void __iomem *base;
-	int i;
+	int i, ret;
 
 	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
 	if (!desc.name)
@@ -207,9 +207,9 @@ static int ctcu_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->apb_clk))
-		return PTR_ERR(drvdata->apb_clk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->apb_clk, NULL);
+	if (ret)
+		return ret;
 
 	cfgs = of_device_get_match_data(dev);
 	if (cfgs) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1915da95b93d953a61778a71b4880c87b91fe17a..a742466ad0e14d2ceeeccddec5bba4f2160793c2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2211,13 +2211,14 @@ static int etm4_probe(struct device *dev)
 	struct csdev_access access = { 0 };
 	struct etm4_init_arg init_arg = { 0 };
 	struct etm4_init_arg *delayed;
+	int ret;
 
 	if (WARN_ON(!drvdata))
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
@@ -2301,10 +2302,6 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	if (res) {
 		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(drvdata->base))
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index b044a4125310ba4f8c88df295ec3684ab266682f..02e0dc678a32c3b1f32fc955bf8871142e3412e1 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -217,6 +217,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	struct funnel_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
@@ -230,13 +231,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	/*
 	 * Map the device base for dynamic-funnel, which has been
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 9e8bd36e7a9a2fd061f41c56242ac2b11549daf5..f1bbd12e63e0c130f945d8df34fb2334bd21336f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -223,6 +223,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	struct replicator_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
 	void __iomem *base;
+	int ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
@@ -237,13 +238,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	/*
 	 * Map the device base for dynamic-replicator, which has been
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 57fbe3ad0fb20501d4e7e5c478d1e56e98685c40..a931282ec0eaf1b2a5db8ccc8f21789441cd634d 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -842,13 +842,10 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	base = devm_ioremap_resource(dev, res);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index e867198b03e82892da7312c9dc1c69676602c598..ead3f5358d411b1d9e45f87986bd85cbe5be720a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -789,9 +789,9 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	ret = -ENOMEM;
 
@@ -989,10 +989,6 @@ static int tmc_platform_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 8d6179c83e5d3194d1f90e10c88fcc1faccf0cd7..5e47d761e1c4e99072eeb492c1eac7dd4285a591 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -132,6 +132,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	struct tpiu_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret;
 
 	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
 	if (!desc.name)
@@ -143,13 +144,10 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 
 	spin_lock_init(&drvdata->spinlock);
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	/* Validity for the resource is already checked by the AMBA core */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e..96cc814c1886f02bf802918b3ccb457b245bdbd6 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -474,27 +474,6 @@ static inline bool is_coresight_device(void __iomem *base)
 	return cid == CORESIGHT_CID;
 }
 
-/*
- * Attempt to find and enable "APB clock" for the given device
- *
- * Returns:
- *
- * clk   - Clock is found and enabled
- * NULL  - Clock is not needed as it is managed by the AMBA bus driver
- * ERROR - Clock is found but failed to enable
- */
-static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
-{
-	struct clk *pclk = NULL;
-
-	if (!dev_is_amba(dev)) {
-		pclk = devm_clk_get_enabled(dev, "apb_pclk");
-		if (IS_ERR(pclk))
-			pclk = devm_clk_get_enabled(dev, "apb");
-	}
-
-	return pclk;
-}
 
 #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
 
@@ -726,4 +705,6 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
 int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
 			       struct coresight_device *sink);
+int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
+				struct clk **atclk);
 #endif		/* _LINUX_COREISGHT_H */

-- 
2.34.1

