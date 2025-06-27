Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E022D3EFD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025146; cv=none; b=tyjg8rADocvHde9rOePEyJUfAYVxupXX2lqn199ZZwd3X/RrxKUUdiTSMlD4A3bg9BBu7xkERTRr7rXlj+uKnjdkwlOuT6JJt/NdzTylkaQTDStv1K732weZ4amF0sazIscUrkZhHFKkslR2xzBU23rgnYqoIhqXNXYH9PDZO3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025146; c=relaxed/simple;
	bh=U4nSKZsHj5YF1PoSUqIXvLt/NIwLr1ExyEPeP5GWn6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhCWNwSE8ScwLP6WqRrjI9Dtk2xTrW0aFjWxfHoFxxF79fFNxDYgkknz6c6T9m4EdhRE/aYDV/nLfSZejFKUn6PlcsPn2pcNArTHWTk9Km1QH3Z89Ok1eejjh9eCV/ZFleInKaOKyCgMpHjednzlYK2y87wPiBm+uI9zoFs50kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B8F22C7;
	Fri, 27 Jun 2025 04:52:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34F283F58B;
	Fri, 27 Jun 2025 04:52:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:49 +0100
Subject: [PATCH v4 03/10] coresight: etm4x: Support atclk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-3-0ce0009c38f8@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=3430;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=U4nSKZsHj5YF1PoSUqIXvLt/NIwLr1ExyEPeP5GWn6M=;
 b=SEIMQQb8dHNUiqj1zD79NaD+i7dxGE0b1pvVE6JhfiKzSO7ejPKXygmQKrspd4yFUuphti64s
 QEBMVMTHbowAXRG0bov7ZZFtKFzGfa8YcRWMj45+oB+RnX0PmQyIxyV
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The atclk is an optional clock for the CoreSight ETMv4, but the driver
misses to initialize it.

This change enables atclk in probe of the ETMv4 driver, and dynamically
control the clock during suspend and resume.

No need to check the driver data and clock pointer in the runtime
suspend and resume, so remove checks.  And add error handling in the
resume function.

Add a minor fix to the comment format when adding the atclk field.

Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 +++++++++++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403addc6ec81f2e3184522d67d1677c04..205121c14d72ec2f6a193dccb94b7cfd5c314e26 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2215,6 +2215,10 @@ static int etm4_probe(struct device *dev)
 	if (WARN_ON(!drvdata))
 		return -ENOMEM;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
@@ -2463,8 +2467,8 @@ static int etm4_runtime_suspend(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
@@ -2472,11 +2476,17 @@ static int etm4_runtime_suspend(struct device *dev)
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
index ac649515054d905fa365203bd35f1d839b03292f..96c14ec26893a489a96c7acfe9ba308e0e890917 100644
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
@@ -988,6 +989,7 @@ struct etmv4_save_state {
  */
 struct etmv4_drvdata {
 	struct clk			*pclk;
+	struct clk			*atclk;
 	void __iomem			*base;
 	struct coresight_device		*csdev;
 	raw_spinlock_t			spinlock;

-- 
2.34.1

