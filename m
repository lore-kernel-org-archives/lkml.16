Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CDA27978C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381639; cv=none; b=WC7vVFI5PdW3BugnbFETMQ18sdrb7c40lTrJs81rPoLnsk8L+WcWqnLSiRp2YZZ5GwaoedW/XbNcbb9pvF1pWxudUH+yb3miNX8WzwyvLLdYPMdu063hkNgNPvwbM4HPnC3dzfNMfCUlZ9Dysu+XkSIvfxdkX+EXV69XwvG4MFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381639; c=relaxed/simple;
	bh=hHZZDqN/p6iUgxNmY12jSlSoJInGMCRM/0cb9yFbFds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpNRO4XccE0bRWn3zr99v2Sgs3cDMZUUlFY+vjL4duAiiX3lie2WO341qpaLozh1INYEpLSgtLVCtIQgySXMPXaAg75/AuQN8vctIWHMao0g/0w/mpdElm9y7x6PqwrzT5WQYp77YacGJb+/T3b9rcFDuO7ac3bkY+VoRZfth08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84F7A236D;
	Tue,  1 Jul 2025 07:53:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA4003F66E;
	Tue,  1 Jul 2025 07:53:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:28 +0100
Subject: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device mode
 on target CPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4730;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hHZZDqN/p6iUgxNmY12jSlSoJInGMCRM/0cb9yFbFds=;
 b=+RNrbLzYmpVMFiR6ddblWoWY4bT0oBUaByaU2ViaSvlnGGo2RczZL6Ur6SCN1ulFpjFGFtoj7
 tlru5yS9RIEBkNi+xy/wPVC+IZlXiVJ6Bzwq5kgmdgYdiW9S2d69lHZ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The ETMv3 driver shares the same issue as ETMv4 regarding race
conditions when accessing the device mode.

This commit applies the same fix: ensuring that the device mode is
modified only by the target CPU to eliminate race conditions across
CPUs.

Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 60 +++++++++++++++-------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 1c6204e1442211be6f3d7ca34bd2251ba796601b..0f160f2f97344e6a96343cd8658f4f19806193e0 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -442,10 +442,23 @@ struct etm_enable_arg {
 static void etm_enable_hw_smp_call(void *info)
 {
 	struct etm_enable_arg *arg = info;
+	struct coresight_device *csdev;
 
 	if (WARN_ON(!arg))
 		return;
+
+	csdev = arg->drvdata->csdev;
+	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
+		/* Someone is already using the tracer */
+		arg->rc = -EBUSY;
+		return;
+	}
+
 	arg->rc = etm_enable_hw(arg->drvdata);
+
+	/* The tracer didn't start */
+	if (arg->rc)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static int etm_cpu_id(struct coresight_device *csdev)
@@ -464,17 +477,29 @@ static int etm_enable_perf(struct coresight_device *csdev,
 			   struct perf_event *event,
 			   struct coresight_path *path)
 {
+	int ret = 0;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
-		return -EINVAL;
+	if (!coresight_take_mode(csdev, CS_MODE_PERF))
+		return -EBUSY;
+
+	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* Configure the tracer based on the session's specifics */
 	etm_parse_event_config(drvdata, event);
 	drvdata->traceid = path->trace_id;
 
 	/* And enable it */
-	return etm_enable_hw(drvdata);
+	ret = etm_enable_hw(drvdata);
+
+out:
+	/* The tracer didn't start */
+	if (ret)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	return ret;
 }
 
 static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -519,11 +544,6 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 	int ret;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	if (!coresight_take_mode(csdev, mode)) {
-		/* Someone is already using the tracer */
-		return -EBUSY;
-	}
-
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		ret = etm_enable_sysfs(csdev, path);
@@ -535,17 +555,12 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 		ret = -EINVAL;
 	}
 
-	/* The tracer didn't start */
-	if (ret)
-		coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
-
 	return ret;
 }
 
-static void etm_disable_hw(void *info)
+static void etm_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	int i;
-	struct etm_drvdata *drvdata = info;
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
@@ -567,6 +582,15 @@ static void etm_disable_hw(void *info)
 		"cpu: %d disable smp call done\n", drvdata->cpu);
 }
 
+static void etm_disable_hw_smp_call(void *info)
+{
+	struct etmv_drvdata *drvdata = info;
+
+	etm_disable_hw(drvdata);
+
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+}
+
 static void etm_disable_perf(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -588,6 +612,8 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+
 	/*
 	 * perf will release trace ids when _free_aux()
 	 * is called at the end of the session
@@ -612,7 +638,8 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
 	 */
-	smp_call_function_single(drvdata->cpu, etm_disable_hw, drvdata, 1);
+	smp_call_function_single(drvdata->cpu, etm_disable_hw_smp_call,
+				 drvdata, 1);
 
 	spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
@@ -652,9 +679,6 @@ static void etm_disable(struct coresight_device *csdev,
 		WARN_ON_ONCE(mode);
 		return;
 	}
-
-	if (mode)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static const struct coresight_ops_source etm_source_ops = {

-- 
2.34.1

