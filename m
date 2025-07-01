Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DA427EFF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381671; cv=none; b=m5HMcDDkWy0qwXuE0ntDrzKEoxbg+AtR5dxwmwKwMvRuvLcm2ihD42E+PHvm5rIz3aZkEs30enCc8kH6lec2PVE7rO0gUKTE4/HuGq+lrfUwicg/18VDADnJyNNZVi8q5arDvM3eBQNf6WmDtJZWMrQUwPrj33NRD3nxWiw8S38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381671; c=relaxed/simple;
	bh=qFXl7UwZDJPYjl6fs+deO8QNuiTAQtNFxmFllav6qYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChbIWyzIN+81BDmHM+MdVY4tpR6J4vop44ViS3nhTxRLSgtjiTfjnEwi+DV+VR5qcXsjDhl6RpZEHsuIdHm+kkykNlMkyUY6QDZdExLpkjBBtFQXBuOK0QY6Tme7CiuSwbMsOTKdQfO7PhVWwiCplDHhf9UYfJzg9bz0cNhERo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74954236D;
	Tue,  1 Jul 2025 07:54:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA45B3F66E;
	Tue,  1 Jul 2025 07:54:27 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:42 +0100
Subject: [PATCH v2 17/28] coresight: etm4x: Remove redundant condition
 checks in save and restore
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-17-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2489;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qFXl7UwZDJPYjl6fs+deO8QNuiTAQtNFxmFllav6qYM=;
 b=S77Op1g8F+ZWBYCr/I3kt9V3ckIw+QEoUK9ZVhgcjwfFEGDkBdbOqNM8dF0FuV8v+Az++ivOa
 vpcG+moFIKdAJAp+e2mZKqkasZPIaYqBuBRkFQ/JMsd54vGkokAyYWS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Since a dedicated callback is now used to determine whether context save
and restore operations are needed, performing the same check within the
save and restore callbacks is redundant.

The save and restore flows currently use two-level functions: the first
level handles the condition check, while the second level performs the
low level operations. As the checks are no longer necessary, simplify
the logic into single-level functions.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 35 ++--------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 92ded5c87614b2a74736005c4d127e266cb9b0e2..d71ac055c3d0b74053279a86ede7e5592f2b2909 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1851,10 +1851,10 @@ static bool etm4_need_context_save_restore(struct coresight_device *csdev)
 	return false;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int ret = 0;
-	struct coresight_device *csdev = drvdata->csdev;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
@@ -1902,40 +1902,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
-		return 0;
-
-	/*
-	 * Save and restore the ETM Trace registers only if
-	 * the ETM is active.
-	 */
-	if (coresight_get_mode(drvdata->csdev))
-		ret = __etm4_cpu_save(drvdata);
-	return ret;
-}
-
-static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
-{
-	if (WARN_ON(!drvdata->csdev))
-		return;
-
-	etm4_enable_hw(drvdata, false);
-}
-
 static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
+	etm4_enable_hw(drvdata, false);
 }
 
 static const struct coresight_ops_source etm4_source_ops = {

-- 
2.34.1

