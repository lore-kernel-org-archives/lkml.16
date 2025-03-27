Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6158214A9D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075521; cv=none; b=LGXNe5EMn2xVUihnLkb7b8eKX7UPKxl4kIGW2hFaLd7Dh6gzAtCPbw1tqjUSVxLCDGt/rEpLMEgkq9JWGTnzknphx1Ldrm4hjsB6abK9DaHeQtTKmgECWMOXcMEhOBwJJcwQZDchQxlF03Qf4GfHQq9JkWXaUmkq8tNXcV0lk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075521; c=relaxed/simple;
	bh=dATjNG4ffSOaguL+LF9ubCIxyzI8aEkIb4sbeAxffbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ibgErwWmQQfAo+ExWwiQ+4OfIb0qa9giTSVM2748cr0jUuOFRZY2IGWofWUmz1ihHu4ggdFEOSnbeRUPo0IH0frydBXx0P6cTBhBesXnVvsl7hpB1HMH6tMhKLD1tlEZHkuRx4jWJF5678fp1pD1yKU3982+ws8XZcXJsarQ35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BB671063;
	Thu, 27 Mar 2025 04:38:44 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FC4E3F58B;
	Thu, 27 Mar 2025 04:38:37 -0700 (PDT)
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
Subject: [PATCH v1 8/9] coresight: Refactor runtime PM
Date: Thu, 27 Mar 2025 11:38:02 +0000
Message-Id: <20250327113803.1452108-9-leo.yan@arm.com>
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

The validation for driver data pointers and clock pointers are redundant
in the runtime PM callbacks.  After a driver's probing, its driver data
and clocks have been initialized successfully, this ensures it is safe
to access driver data and clocks in the runtime PM callbacks.  A corner
case is a clock pointer is NULL, in this case, the clock core layer can
handle it properly.  So remove these redundant checking.

In runtime resume, respect values returned from clock function and add
error handling.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 +++-----
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++------
 drivers/hwtracing/coresight/coresight-etb10.c      |  8 ++------
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  8 ++------
 drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++----------
 drivers/hwtracing/coresight/coresight-replicator.c | 20 +++++++++++---------
 drivers/hwtracing/coresight/coresight-stm.c        | 20 +++++++++++---------
 drivers/hwtracing/coresight/coresight-tpiu.c       | 20 +++++++++++---------
 8 files changed, 53 insertions(+), 60 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 744b6f9b065e..5f90351778ee 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -738,8 +738,8 @@ static int debug_runtime_suspend(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->pclk);
+
 	return 0;
 }
 
@@ -747,9 +747,7 @@ static int debug_runtime_resume(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
-	return 0;
+	return clk_prepare_enable(drvdata->pclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index de279efe3405..edd93ff2d3c5 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -278,8 +278,7 @@ static int ctcu_runtime_suspend(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
-		clk_disable_unprepare(drvdata->apb_clk);
+	clk_disable_unprepare(drvdata->apb_clk);
 
 	return 0;
 }
@@ -288,10 +287,7 @@ static int ctcu_runtime_resume(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
-		clk_prepare_enable(drvdata->apb_clk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->apb_clk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 45c2f8f50a3f..3f3b0eb48fdb 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -807,8 +807,7 @@ static int etb_runtime_suspend(struct device *dev)
 {
 	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
 
 	return 0;
 }
@@ -817,10 +816,7 @@ static int etb_runtime_resume(struct device *dev)
 {
 	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->atclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index adbb134f80e6..615ff743eef0 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -925,8 +925,7 @@ static int etm_runtime_suspend(struct device *dev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
 
 	return 0;
 }
@@ -935,10 +934,7 @@ static int etm_runtime_resume(struct device *dev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->atclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index e378c2fffca9..fd60491c9a19 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -286,11 +286,8 @@ static int funnel_runtime_suspend(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
-
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
@@ -298,13 +295,17 @@ static int funnel_runtime_suspend(struct device *dev)
 static int funnel_runtime_resume(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 78854f586e89..aeb2b3d8e210 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -325,24 +325,26 @@ static int replicator_runtime_suspend(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index ddb4f6678efd..d589fc61a00e 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -960,24 +960,26 @@ static int stm_runtime_suspend(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int stm_runtime_resume(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 8212959f60d4..5821ae73a34a 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -208,24 +208,26 @@ static int tpiu_runtime_suspend(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int tpiu_runtime_resume(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
-- 
2.34.1

