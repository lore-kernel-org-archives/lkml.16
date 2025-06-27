Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804A12C032C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025142; cv=none; b=d7Qq54OSlHoQ5PaWSSIo/Cfi8JjiJQ7cY0HXCSDP8yem0uHwrZZ8twmEiiYWApXekOi5u1bZN7BfwDZF9qdJ6pw9Z1REaFNYq9TRE1gunjp1AsJgZqBNKzXdtkF4IWTTEJY/oYLY4yCxTLjbx3h25N6jBCnCcTgE9GSxMmB+ANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025142; c=relaxed/simple;
	bh=u+1nafEkk9EBB23+tzbSoLdudRR4Y72Ha4gKlwB6mIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wxlifg0uAkd7+EcPC/azK9Yh2+xF0s8CP2GpRnY2NiUvvxF3HtNQRfo/0OGH3uRn9+oxZXSm90xNwvXKL7WYfQgLTe/6LBwFaM9zbQMyMiYnU/MjvjGKAA3uyBGs7/sF6bLUCkkhUubGKPslOctjYTKrbRJ38PDAkvsWcgMqx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FCE722C7;
	Fri, 27 Jun 2025 04:52:02 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DD5C3F58B;
	Fri, 27 Jun 2025 04:52:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:47 +0100
Subject: [PATCH v4 01/10] coresight: tmc: Support atclk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=3606;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=u+1nafEkk9EBB23+tzbSoLdudRR4Y72Ha4gKlwB6mIg=;
 b=n57p0vXfrKhe7qdph3Gte8I417UOPN47maz4U04A20yvL4nMpz+OdKbXDJKJNhljnIjT/uvfl
 gZTBGz4LXX6DNLw3M5LajCDxt1FKjVcRWB+b2Q63L1IpbvvmrUrwqBP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The atclk is an optional clock for the CoreSight TMC, but the driver
misses to initialize it.  In most cases, TMC shares the atclk clock with
other CoreSight components.  Since these components enable the clock
before the TMC device is initialized, the TMC continues properly,
which is why we don’t observe any lockup issues.

This change enables atclk in probe of the TMC driver.  Given the clock
is optional, it is possible to return NULL if the clock does not exist.
IS_ERR() is tolerant for this case.

Dynamically disable and enable atclk during suspend and resume.  The
clock pointers will never be error values if the driver has successfully
probed, and the case of a NULL pointer case will be handled by the clock
core layer.  The driver data is always valid after probe. Therefore,
remove the related checks.  Also in the resume flow adds error handling.

Fixes: bc4bf7fe98da ("coresight-tmc: add CoreSight TMC driver")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 22 +++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6bec395ba535155228d176250f38625..0b5e7635a084d226619e69189a2ecbaff754ec43 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	ret = -ENOMEM;
 
 	/* Validity for the resource is already checked by the AMBA core */
@@ -1020,18 +1024,26 @@ static int tmc_runtime_suspend(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
 	return 0;
 }
 
 static int tmc_runtime_resume(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e6c3da8685e2e1c93b228d44e66fc..cbb4ba43915855a8acbb9205167e87185c9a8c6c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -210,6 +210,7 @@ struct tmc_resrv_buf {
 
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
+ * @atclk:	optional clock for the core parts of the TMC.
  * @pclk:	APB clock if present, otherwise NULL
  * @base:	memory mapped base address for this component.
  * @csdev:	component vitals needed by the framework.
@@ -244,6 +245,7 @@ struct tmc_resrv_buf {
  *		 Used by ETR/ETF.
  */
 struct tmc_drvdata {
+	struct clk		*atclk;
 	struct clk		*pclk;
 	void __iomem		*base;
 	struct coresight_device	*csdev;

-- 
2.34.1

