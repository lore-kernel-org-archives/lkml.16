Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65CE28D85C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421472; cv=none; b=kS5CxWT4mC379a0cLwTaKv32aUQC6xVFD2Z0+jDvZQ3zOnX4FcpiKbCE+DFDz0vuIXzlF5NQeFrUtLw9rkz994PNTJkRSQYyC1HPPq/Mpa68kS7ALf4BWzFU3SAEM6toiAAOgLb15G2t52rznqSA/yPwhCYZm0jhw6cao3RwEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421472; c=relaxed/simple;
	bh=xHgmsI7+yZUDuvEvTwwdOr4m1lB8sBflAmr06Pxl+/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/RuVwIn5ni6al4BFjGMxXDG5pnQlUxhWbmVgJIXeCsKdPYQiQbzDcIAoaXuJc+CAtOp9uNQ0ketBBklYkjeywg9JbytwiOOSInXB1dTp15Gk3omiIoCjzQJuDY/0g/SbPkmiLS555OFTqcBVbQBh8Hmx0UR5dAtCKtfHlnOKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4046E106F;
	Wed, 23 Apr 2025 08:17:45 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 134F93F66E;
	Wed, 23 Apr 2025 08:17:47 -0700 (PDT)
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
Subject: [PATCH v2 3/9] coresight: etm4x: Support atclk
Date: Wed, 23 Apr 2025 16:17:20 +0100
Message-Id: <20250423151726.372561-4-leo.yan@arm.com>
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

The atclk is an optional clock for the CoreSight ETMv4, but the driver
misses to initialize it.

This change enables atclk in probe of the ETMv4 driver, and dynamically
control the clock during suspend and resume.

No need to check the driver data and clock pointer in the runtime
suspend and resume, so remove checks.  And add error handling in the
resume function.

Add a minor fix to the comment format when adding the atclk field.

Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 +++++++++++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e5972f16abff..537d57006a25 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2149,6 +2149,10 @@ static int etm4_probe(struct device *dev)
 	if (WARN_ON(!drvdata))
 		return -ENOMEM;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
@@ -2397,8 +2401,8 @@ static int etm4_runtime_suspend(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
@@ -2406,11 +2410,17 @@ static int etm4_runtime_suspend(struct device *dev)
 static int etm4_runtime_resume(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
 
-	return 0;
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index bd7db36ba197..0c21832b5d69 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -919,7 +919,8 @@ struct etmv4_save_state {
 
 /**
  * struct etm4_drvdata - specifics associated to an ETM component
- * @pclk        APB clock if present, otherwise NULL
+ * @pclk:       APB clock if present, otherwise NULL
+ * @atclk:      Optional clock for the core parts of the ETMv4.
  * @base:       Memory mapped base address for this component.
  * @csdev:      Component vitals needed by the framework.
  * @spinlock:   Only one at a time pls.
@@ -987,6 +988,7 @@ struct etmv4_save_state {
  */
 struct etmv4_drvdata {
 	struct clk			*pclk;
+	struct clk			*atclk;
 	void __iomem			*base;
 	struct coresight_device		*csdev;
 	raw_spinlock_t			spinlock;
-- 
2.34.1

