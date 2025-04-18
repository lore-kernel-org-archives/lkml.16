Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A11FBE87
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956296; cv=none; b=oHF5LkLoIBq7qIh7RJUzddr+0hu9Lisp9x/gxgpkh4k3trBfrViBzbsABLpgpxaHlXXQvg03jMecza3ACovYCu2JEAVuUnMjICfHltqDD2XlSBjg6Rs49TsqLDWv8oSgCDdQ0xUQbNxMAb6nQ09V2JCrX5PxN5x7kQaLdKsuWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956296; c=relaxed/simple;
	bh=y+byh670rtAsYYmXqKzm2eDUyZBPhj/asfCYJvpewEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcvO6CixTqbgvgJZGANNGWocRJnN/0fbAgi/+n3Mqi02/kIGl1U3AyfH5EcsbBG0molmFs8I7VROcfK4reQGaLxSjF02OeSM05bHbN2rITFKMaB9sHXa8YjPfg005CC1MLwX0dDmwJXXPRUY5DvcPoqPIYz0EDDImLpp9zC3xVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Zf3z96ydyz5vMm;
	Fri, 18 Apr 2025 14:00:53 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 092F6140258;
	Fri, 18 Apr 2025 14:04:43 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:42 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:42 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <mike.leach@linaro.org>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<hejunhao3@huawei.com>
Subject: [PATCH 3/4] coresight: tmc: refactor the tmc-etr mode setting
Date: Fri, 18 Apr 2025 13:58:19 +0800
Message-ID: <20250418055820.3689408-4-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250418055820.3689408-1-hejunhao3@huawei.com>
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn500004.china.huawei.com (7.202.194.145)

When trying to run perf and sysfs mode simultaneously, the WARN_ON()
in tmc_etr_enable_hw() is triggered sometimes:

 WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
 [..snip..]
 Call trace:
  tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
  coresight_enable_path+0x1c8/0x218 [coresight]
  coresight_enable_sysfs+0xa4/0x228 [coresight]
  enable_source_store+0x58/0xa8 [coresight]
  dev_attr_store+0x20/0x40
  sysfs_kf_write+0x4c/0x68
  kernfs_fop_write_iter+0x120/0x1b8
  vfs_write+0x2c8/0x388
  ksys_write+0x74/0x108
  __arm64_sys_write+0x24/0x38
  el0_svc_common.constprop.0+0x64/0x148
  do_el0_svc+0x24/0x38
  el0_svc+0x3c/0x130
  el0t_64_sync_handler+0xc8/0xd0
  el0t_64_sync+0x1ac/0x1b0
 ---[ end trace 0000000000000000 ]---

Since the sysfs buffer allocation and the hardware enablement is not
in the same critical region, it's possible to race with the perf

mode:
  [sysfs mode]                   [perf mode]
  tmc_etr_get_sysfs_buffer()
    spin_lock(&drvdata->spinlock)
    [sysfs buffer allocation]
    spin_unlock(&drvdata->spinlock)
                                 spin_lock(&drvdata->spinlock)
                                 tmc_etr_enable_hw()
                                   drvdata->etr_buf = etr_perf->etr_buf
                                 spin_unlock(&drvdata->spinlock)
 spin_lock(&drvdata->spinlock)
 tmc_etr_enable_hw()
   WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
                                the perf side
  spin_unlock(&drvdata->spinlock)

To resolve this, configure the tmc-etr mode before invoking
`enable_perf()` or sysfs interfaces. Prior to mode configuration,
explicitly check if the tmc-etr sink is already enabled in a
different mode to prevent race conditions between mode transitions.
Furthermore, enforce spinlock protection around the critical
sections to serialize concurrent accesses from sysfs and perf
subsystems.

Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
Reported-by: Yicong Yang <yangyicong@hisilicon.com>
Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 77 +++++++++++--------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..3d94d64cacaa 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1190,11 +1190,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
-		ret = -EBUSY;
-		goto out;
-	}
-
 	/*
 	 * If we don't have a buffer or it doesn't match the requested size,
 	 * use the buffer allocated above. Otherwise reuse the existing buffer.
@@ -1205,7 +1200,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		drvdata->sysfs_buf = new_buf;
 	}
 
-out:
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free memory outside the spinlock if need be */
@@ -1216,7 +1210,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
-	int ret = 0;
+	int ret;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
@@ -1226,23 +1220,10 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	/*
-	 * In sysFS mode we can have multiple writers per sink.  Since this
-	 * sink is already enabled no memory is needed and the HW need not be
-	 * touched, even if the buffer size has changed.
-	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		csdev->refcnt++;
-		goto out;
-	}
-
 	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
-	if (!ret) {
-		coresight_set_mode(csdev, CS_MODE_SYSFS);
+	if (!ret)
 		csdev->refcnt++;
-	}
 
-out:
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (!ret)
@@ -1652,11 +1633,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
 
 	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
 		rc = -EINVAL;
@@ -1685,7 +1661,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	if (!rc) {
 		/* Associate with monitored process. */
 		drvdata->pid = pid;
-		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
 		csdev->refcnt++;
 	}
@@ -1698,14 +1673,56 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
 			       enum cs_mode mode, void *data)
 {
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	enum cs_mode old_mode;
+	int rc;
+
+	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
+		old_mode = coresight_get_mode(csdev);
+		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
+			return -EBUSY;
+
+		if (drvdata->reading)
+			return -EBUSY;
+
+		/*
+		 * In sysFS mode we can have multiple writers per sink. Since this
+		 * sink is already enabled no memory is needed and the HW need not be
+		 * touched, even if the buffer size has changed.
+		 */
+		if (old_mode == CS_MODE_SYSFS) {
+			csdev->refcnt++;
+			return 0;
+		}
+
+		/*
+		 * minor note:
+		 * When sysfs-task1 get locked, it setup the mode first. Then
+		 * sysfs-task2 gets locked，it will directly return success even
+		 * when the tmc-etr is not enabled at this moment. Ultimately,
+		 * sysfs-task1 will still successfully enable tmc-etr.
+		 * This is a transient state and does not cause an anomaly.
+		 */
+		coresight_set_mode(csdev, mode);
+	}
+
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		return tmc_enable_etr_sink_sysfs(csdev);
+		rc = tmc_enable_etr_sink_sysfs(csdev);
+		break;
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		rc = tmc_enable_etr_sink_perf(csdev, data);
+		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
 	}
+
+	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
+		if (rc && old_mode != mode)
+			coresight_set_mode(csdev, old_mode);
+	}
+
+	return rc;
 }
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
-- 
2.33.0

