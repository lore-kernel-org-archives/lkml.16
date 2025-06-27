Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1B12BF011
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025155; cv=none; b=E4a6UhebjBcjHRJJ5R2mmAf+UsjsVZzsAiNythZqKLI8b+4FxtDu7BhAhnGRxK1gzs/6MjsTiQzLduUJ6e3uFdFQrZS/Qk7mz5ItFmIbv+hKOiiMBmJ+SRZOK0Pc+JOyUa6nB/cTzM3d5WKqLa4WGZiZfDdbPA5pL3RKhlidvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025155; c=relaxed/simple;
	bh=qCJIDHlKgLxVVrOHq7iV9Oickr7qzW4eb+saKaVMpCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuvWhThbm6r5+icEYb9XO2nTrsHtn3TFN8r22haE08mn6JArmYgMvkYJ2SXTBZ+ivtm692iOTnKas8dtJlQk4mQRH76geCXDILFaVm/k/eXa4Rg4FJFNubXkxFAJ9cWJV1fvGAnJ0KNlvAjzuyO5SXVf/DIogpF7BRbO7jYYrDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393E91A00;
	Fri, 27 Jun 2025 04:52:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB0703F58B;
	Fri, 27 Jun 2025 04:52:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:54 +0100
Subject: [PATCH v4 08/10] coresight: Refactor driver data allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-8-0ce0009c38f8@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=6103;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qCJIDHlKgLxVVrOHq7iV9Oickr7qzW4eb+saKaVMpCA=;
 b=/yOmOXE0EpVTbZZ/v2wdZ6bRrIyUBlfR30WcISMGimxVGxYIVOBfz/st7QGgBJxiDwSWSTwg5
 4M8s80vQPZ2DRo2nFkGry95BFuzO9S+Y9ueGOJEYW799aytXVsn/0Lm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The driver data no longer needs to be allocated separately in the static
and dynamic probes. Moved the allocation into the low-level functions to
avoid code duplication.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c      | 20 +++++++-------------
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 21 +++++++--------------
 drivers/hwtracing/coresight/coresight-tmc-core.c  | 20 +++++++-------------
 3 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 0f476a0cbd740c233d039c5c411ca192681e2023..a3ccb7034ae14d7339bc2549bccadf11e28c45e2 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -515,11 +515,17 @@ static int __catu_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
 	u32 dma_mask;
-	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct catu_drvdata *drvdata;
 	struct coresight_desc catu_desc;
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
 	if (ret)
 		return ret;
@@ -580,14 +586,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
 
 static int catu_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct catu_drvdata *drvdata;
 	int ret;
 
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	ret = __catu_probe(&adev->dev, &adev->res);
 	if (!ret)
 		pm_runtime_put(&adev->dev);
@@ -627,18 +627,12 @@ static struct amba_driver catu_driver = {
 static int catu_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct catu_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	dev_set_drvdata(&pdev->dev, drvdata);
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 5f6db2fb95d4623a0bab08828ae00442870abd7d..3edfb5d3d02056afcaab4da575d1101c68aeac80 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -562,10 +562,16 @@ static void debug_func_exit(void)
 
 static int __debug_probe(struct device *dev, struct resource *res)
 {
-	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
+	struct debug_drvdata *drvdata;
 	void __iomem *base;
 	int ret;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
 	if (ret)
 		return ret;
@@ -629,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
 
 static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct debug_drvdata *drvdata;
-
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	return __debug_probe(&adev->dev, &adev->res);
 }
 
@@ -694,14 +693,8 @@ static struct amba_driver debug_driver = {
 static int debug_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct debug_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index ead3f5358d411b1d9e45f87986bd85cbe5be720a..e5ab4a0323354d826c831f68c71d81808cbcd8ff 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -785,10 +785,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	u32 devid;
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tmc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
 	if (ret)
 		return ret;
@@ -898,14 +904,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 
 static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct tmc_drvdata *drvdata;
 	int ret;
 
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	ret = __tmc_probe(&adev->dev, &adev->res);
 	if (!ret)
 		pm_runtime_put(&adev->dev);
@@ -982,14 +982,8 @@ static struct amba_driver tmc_driver = {
 static int tmc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct tmc_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);

-- 
2.34.1

