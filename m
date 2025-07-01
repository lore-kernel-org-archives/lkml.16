Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4061527FB03
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381678; cv=none; b=FeemcYvOxxP4mBY5D9Sfwn2bbnznvXa+goU3VkPYDLUT382r5tOvS8ASpilSgMeZWBSC+JM3CsNKxT/bK03+KRD3Dnf397LlM2QhGU41hqDA6M1tyreBeQmUYIcGEcJyg8zyWgcu99U6UWR66qO0sDw+FDR1OU7/aMWiCpLy24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381678; c=relaxed/simple;
	bh=bnoqGLGLvkQZM71kWFaBE9XSAfVwfMZlT8ssFD7sZow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vhn43DU6xJbuofKVZ5KSXiYSxsaJKxWrtNZ2xdfI02mBIutACoJrzEtsj/GE0CQJizJmoZDBHgX19gcG8DDUKE7lgXUQC77uoTfCjOY2/lM9An0M+tji7nhjBvYp3xCWmnnaSNb0vzdrN7YV+y6gdtt5UTbydLA9ciL77nzeeGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E4E2379;
	Tue,  1 Jul 2025 07:54:21 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C79453F66E;
	Tue,  1 Jul 2025 07:54:34 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:45 +0100
Subject: [PATCH v2 20/28] coresight: cti: Properly handle modes in CPU PM
 notifiers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-20-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2826;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=bnoqGLGLvkQZM71kWFaBE9XSAfVwfMZlT8ssFD7sZow=;
 b=80Tlb6gH6ObmrEHBgVOfdT7YeEX140AFqPYxSUE3gKFwvgSlzUEa/uQP08pPsuEaTGf5bqG+A
 tfqjQQn6r88AiBRNfj94GxraPPJRdmpTR0cUO1gBxagTwDmMlHltaUg
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This commit distinguishes CPU PM flows based on the mode.

The CTI driver retains its existing behavior for the CS_MODE_DEBUG mode.

For modes other than DEBUG, a future change will be made to manage CTI
devices by iterating through the CoreSight path in the core layer. To
avoid conflicts, the CTI driver no longer controls CTI hardware in CPU
PM notifiers for non DEBUG modes.

However, the CTI driver continues to update the hw_powered flag for all
modes to reflect the device's power state.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index ba4635dfc2e30b4e9ae4972f91bdc6647975b719..c91d339d7ccbf71db71cb7156f9a6f2961ae2198 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -141,6 +141,9 @@ static void cti_cpuhp_enable_hw(struct cti_drvdata *drvdata)
 	raw_spin_lock(&drvdata->spinlock);
 	config->hw_powered = true;
 
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DEBUG)
+		goto cti_hp_not_enabled;
+
 	/* no need to do anything if no enable request */
 	if (!drvdata->config.enable_req_count)
 		goto cti_hp_not_enabled;
@@ -697,21 +700,27 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	case CPU_PM_ENTER:
 		/* CTI regs all static - we have a copy & nothing to save */
 		drvdata->config.hw_powered = false;
-		if (drvdata->config.hw_enabled)
+		if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+		    drvdata->config.hw_enabled)
 			coresight_disclaim_device(csdev);
 		break;
 
 	case CPU_PM_ENTER_FAILED:
 		drvdata->config.hw_powered = true;
-		if (drvdata->config.hw_enabled) {
+		if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+		    drvdata->config.hw_enabled) {
 			if (coresight_claim_device(csdev))
 				drvdata->config.hw_enabled = false;
 		}
 		break;
 
 	case CPU_PM_EXIT:
-		/* write hardware registers to re-enable. */
 		drvdata->config.hw_powered = true;
+
+		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DEBUG)
+			break;
+
+		/* write hardware registers to re-enable. */
 		drvdata->config.hw_enabled = false;
 
 		/* check enable reference count to enable HW */
@@ -760,7 +769,8 @@ static int cti_dying_cpu(unsigned int cpu)
 
 	raw_spin_lock(&drvdata->spinlock);
 	drvdata->config.hw_powered = false;
-	if (drvdata->config.hw_enabled)
+	if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+	    drvdata->config.hw_enabled)
 		coresight_disclaim_device(drvdata->csdev);
 	raw_spin_unlock(&drvdata->spinlock);
 	return 0;

-- 
2.34.1

