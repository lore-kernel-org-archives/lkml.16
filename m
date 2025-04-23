Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751B32918C1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421485; cv=none; b=KGC71iKNsIxpZaA+sGSdhpH+OplJz6O9qqCymMMK8NTKQBy6TNPH0dfSA969wfJAm+vmUW01Frh7mIhrlT2Tfh3c9TK+lTeh8dtL8/jBvTaxujf2izCTFhAORQrHSET9do4P65w6uSJzcMJC+8TlegvaQVMgJ78pE+852qVg6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421485; c=relaxed/simple;
	bh=FfOdKXjF8u5XLXe2Du7VGTMkNtrK6ss5m2V6pG2HzFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rk8ekYNfLc8ohX3CXzW821CpqiDxuUxfCr+At/yDqtUCBySnfeJ3C/9n3lqapAIVU4xMkZKL8+fSRhctH7EyM5bLQlOtsuDy/aH6NfhWnYTHyoYtwaViY1b9ZVP7ARQmqxGWXpeoCLUuxTec/KmKZAWWYrVtQNod8xL0qBm6qQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326C3106F;
	Wed, 23 Apr 2025 08:17:56 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0552C3F66E;
	Wed, 23 Apr 2025 08:17:58 -0700 (PDT)
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
Subject: [PATCH v2 8/9] coresight: Make clock sequence consistent
Date: Wed, 23 Apr 2025 16:17:25 +0100
Message-Id: <20250423151726.372561-9-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423151726.372561-1-leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since atclk is enabled after pclk during the probe phase, this commit
maintains the same sequence for the runtime resume flow.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
 drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
 drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
 drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 173fee3aaa6e..62e5125c37ad 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -296,11 +296,11 @@ static int funnel_runtime_resume(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 7250a2174145..56b03e6d8336 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -334,11 +334,11 @@ static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 89e90e7f54de..f17986edac00 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -969,11 +969,11 @@ static int stm_runtime_resume(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b3d0db0e53b9..4701b34778bd 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -218,11 +218,11 @@ static int tpiu_runtime_resume(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
-- 
2.34.1

