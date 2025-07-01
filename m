Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD91279324
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381636; cv=none; b=OhsyZ9QRAaiYJU2pF5vl9JYf3YxqbZe7s1iJPRlpioOLWEpi/88bx13kEOQvxcTCaQQ5e4+SS89gHsS7OUkKQmuQ6ilIuwKBhS5partqqrbzeDULuxIdbrZB5xd0X9lTHEyphaWgk783eCgP8sNodRyoziydPQn0wATULFP5OJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381636; c=relaxed/simple;
	bh=0KyhXnOpUgdUCOt8/hKd8YMzF/jZHFG5SiqYIaIAEIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyYfNTZjwrj1l2ciK4wfxMfzAZzsjI9UljOKObeXmkJN3KnrszQbxUjfkr0bbEoLceg9uY5auiF5yAQYJD787UYagmdkfAGi+LOSPqZbMx/He9A4cgktGWhIz+UugjhKIKiSeN3oK6THJ5WLQKTcL47FHyt1YJr+i1ZIMgDhPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E5A812FC;
	Tue,  1 Jul 2025 07:53:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73EBF3F66E;
	Tue,  1 Jul 2025 07:53:52 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:27 +0100
Subject: [PATCH v2 02/28] coresight: etm4x: Always set tracer's device mode
 on target CPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=6651;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0KyhXnOpUgdUCOt8/hKd8YMzF/jZHFG5SiqYIaIAEIA=;
 b=sSYpyBWBA/l0TJHEAKJkC4UWhcdNP8vKQbg+xK/+JUA9ye9wuQ4BI0kfZ7X68O4k6wqXmc+JT
 JX4rEHt3fhQDLL1zqqjmIzdq363lo0EKp0+PpexcISP3THQdeQWYTbc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

When enabling a tracer via SysFS interface, the device mode may be set
by any CPU - not necessarily the target CPU. This can lead to race
condition in SMP, and may result in incorrect mode values being read.

Consider the following example, where CPU0 attempts to enable the tracer
on CPU1 (the target CPU):

 CPU0                                    CPU1
 etm4_enable()
  ` coresight_take_mode(SYSFS)
  ` etm4_enable_sysfs()
     ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
     			                /
                                       /  CPU idle:
                                      /   etm4_cpu_save()
                                     /     ` coresight_get_mode()
	       Failed to enable h/w /         ^^^
  ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode

In this case, CPU0 initiates the operation by taking the SYSFS mode to
avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
configure the tracer registers. If any error occurs during this process,
CPU0 rolls back by setting the mode to DISABLED.

However, if CPU1 enters an idle state during this time, it might read
the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
save and restore tracer context that is actually disabled.

To resolve the issue, this commit moves the device mode setting logic on
the target CPU. This ensures that the device mode is only modified by
the target CPU, eliminating race condition between mode writes and reads
across CPUs.

An additional change introduces the etm4_disable_hw_smp_call() function
for SMP calls, which disables the tracer and explicitly set the mode to
DISABLED during SysFS operations.

The flow is updated with this change:

 CPU0                                    CPU1
 etm4_enable()
  ` etm4_enable_sysfs()
     ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
                                          ` coresight_take_mode(SYSFS)
	                                    Failed, set back to DISABLED
                                          ` coresight_set_mode(DISABLED)

                                          CPU idle:
                                          etm4_cpu_save()
                                           ` coresight_get_mode()
                                              ^^^
                                              Read out the DISABLED mode

Fixes: c38a9ec2b2c1 ("coresight: etm4x: moving etm_drvdata::enable to atomic field")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 48 +++++++++++++++-------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403addc6ec81f2e3184522d67d1677c04..ee405c88ea5faa130819f96b00b8307f8764d58a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -590,10 +590,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 static void etm4_enable_hw_smp_call(void *info)
 {
 	struct etm4_enable_arg *arg = info;
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
 	arg->rc = etm4_enable_hw(arg->drvdata);
+
+	/* The tracer didn't start */
+	if (arg->rc)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 /*
@@ -809,6 +822,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
+	if (!coresight_take_mode(csdev, CS_MODE_PERF))
+		return -EBUSY;
+
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
 		ret = -EINVAL;
 		goto out;
@@ -828,6 +844,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	ret = etm4_enable_hw(drvdata);
 
 out:
+	/* The tracer didn't start */
+	if (ret)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	return ret;
 }
 
@@ -880,11 +899,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 {
 	int ret;
 
-	if (!coresight_take_mode(csdev, mode)) {
-		/* Someone is already using the tracer */
-		return -EBUSY;
-	}
-
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		ret = etm4_enable_sysfs(csdev, path);
@@ -896,10 +910,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 		ret = -EINVAL;
 	}
 
-	/* The tracer didn't start */
-	if (ret)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-
 	return ret;
 }
 
@@ -951,10 +961,9 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	isb();
 }
 
-static void etm4_disable_hw(void *info)
+static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
-	struct etmv4_drvdata *drvdata = info;
 	struct etmv4_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
@@ -991,6 +1000,15 @@ static void etm4_disable_hw(void *info)
 		"cpu: %d disable smp call done\n", drvdata->cpu);
 }
 
+static void etm4_disable_hw_smp_call(void *info)
+{
+	struct etmv4_drvdata *drvdata = info;
+
+	etm4_disable_hw(drvdata);
+
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+}
+
 static int etm4_disable_perf(struct coresight_device *csdev,
 			     struct perf_event *event)
 {
@@ -1020,6 +1038,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+
 	/*
 	 * perf will release trace ids when _free_aux() is
 	 * called at the end of the session.
@@ -1045,7 +1065,8 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
 	 */
-	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
+	smp_call_function_single(drvdata->cpu, etm4_disable_hw_smp_call,
+				 drvdata, 1);
 
 	raw_spin_unlock(&drvdata->spinlock);
 
@@ -1085,9 +1106,6 @@ static void etm4_disable(struct coresight_device *csdev,
 		etm4_disable_perf(csdev, event);
 		break;
 	}
-
-	if (mode)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static int etm4_resume_perf(struct coresight_device *csdev)

-- 
2.34.1

