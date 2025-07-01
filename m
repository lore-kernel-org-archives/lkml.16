Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AF027E06E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381667; cv=none; b=EV+Aq8pHhMLRXZxN8Ng+ua1R5hcJzOkYQ9XVYbEAKriAsYSyg7EIdVkJVV0Yzelqu70G36WiGe571er03h6lNWn6tKC4c1nSJ/jqKWPdr15O5rcjCapuipPWi4WygQRSESKGpqv11sVmzstnbg2v6AHfnxiAwkigiIOhl4vHZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381667; c=relaxed/simple;
	bh=gBbLPhxVthr+wjtEWZl80lmhcv0f3aeEUN9SmkH9Bls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TO0jt9VWbzwb3gfa1YEkRQOCzl0IfNHFk9iRn//y4aVDurGZv+RnIJ+4g8CDDeYzEooCTZjWlgTlVwN3GoUCJihzvS+kPmFy7ea12RXkixYBo4cg8TLqd3hbGcCVFfHcwLHDaEHlERAOlenH8cCbRtmVf41Pk1+8MIRAYsGOtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC80F12FC;
	Tue,  1 Jul 2025 07:54:09 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E68F3F66E;
	Tue,  1 Jul 2025 07:54:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:40 +0100
Subject: [PATCH v2 15/28] coresight: etm4x: Hook CPU PM callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-15-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4386;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gBbLPhxVthr+wjtEWZl80lmhcv0f3aeEUN9SmkH9Bls=;
 b=iDNA0fPQEqEeaapCoVsFFsd9lFa3/2ZxmiS09jJgs5UMH8Fn8oYoT71dcLmxgMwrdx/p9IU9M
 krsNwrY2tp8D/l2NCxhSON7n2p9k7hFXYsnxS5L41KgXOM4WrLTTzAP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Since the CoreSight core layer has registered CPU PM notifiers, this
patch hooks CPU save and restore callbacks to be invoked from the core
layer.

The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
along with its registration and unregistration code.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 73 ++++++----------------
 1 file changed, 18 insertions(+), 55 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 0a585d7e0ab873ea4568e3318b0526b77a2e65e7..b76107aef9d3e42214d4bc97598795ddd96ff2d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1184,19 +1184,6 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 	drvdata->paused = true;
 }
 
-static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
-	.enable		= etm4_enable,
-	.disable	= etm4_disable,
-	.resume_perf	= etm4_resume_perf,
-	.pause_perf	= etm4_pause_perf,
-};
-
-static const struct coresight_ops etm4_cs_ops = {
-	.trace_id	= coresight_etm_get_trace_id,
-	.source_ops	= &etm4_source_ops,
-};
-
 static bool cpu_supports_sysreg_trace(void)
 {
 	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
@@ -1900,8 +1887,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
@@ -1924,8 +1912,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_enable_hw(drvdata, false);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
 		return;
 
@@ -1933,38 +1923,19 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 		__etm4_cpu_restore(drvdata);
 }
 
-static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
-			      void *v)
-{
-	struct etmv4_drvdata *drvdata;
-	unsigned int cpu = smp_processor_id();
-
-	if (!etmdrvdata[cpu])
-		return NOTIFY_OK;
-
-	drvdata = etmdrvdata[cpu];
-
-	if (WARN_ON_ONCE(drvdata->cpu != cpu))
-		return NOTIFY_BAD;
-
-	switch (cmd) {
-	case CPU_PM_ENTER:
-		if (etm4_cpu_save(drvdata))
-			return NOTIFY_BAD;
-		break;
-	case CPU_PM_EXIT:
-	case CPU_PM_ENTER_FAILED:
-		etm4_cpu_restore(drvdata);
-		break;
-	default:
-		return NOTIFY_DONE;
-	}
-
-	return NOTIFY_OK;
-}
+static const struct coresight_ops_source etm4_source_ops = {
+	.cpu_id		= etm4_cpu_id,
+	.enable		= etm4_enable,
+	.disable	= etm4_disable,
+	.resume_perf	= etm4_resume_perf,
+	.pause_perf	= etm4_pause_perf,
+	.save		= etm4_cpu_save,
+	.restore	= etm4_cpu_restore,
+};
 
-static struct notifier_block etm4_cpu_pm_nb = {
-	.notifier_call = etm4_cpu_pm_notify,
+static const struct coresight_ops etm4_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
+	.source_ops	= &etm4_source_ops,
 };
 
 /* Setup PM. Deals with error conditions and counts */
@@ -1972,16 +1943,12 @@ static int __init etm4_pm_setup(void)
 {
 	int ret;
 
-	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
 					"arm/coresight4:starting",
 					etm4_starting_cpu, etm4_dying_cpu);
 
 	if (ret)
-		goto unregister_notifier;
+		return ret;
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight4:online",
@@ -1995,15 +1962,11 @@ static int __init etm4_pm_setup(void)
 
 	/* failed dyn state - remove others */
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
-
-unregister_notifier:
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);

-- 
2.34.1

