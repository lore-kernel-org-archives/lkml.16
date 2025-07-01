Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E9627935F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381674; cv=none; b=UeJKsfMWEkHSTRVF5KV7IWWNYpVQRdvJMWvi+H8dQHW7s2IHZNwzsp2rr2KBOGuX6Lrpx+/01O1bxxhrgqDy+tFb8B2QSn4LiSf7nLxs8iXNKgH65NKX6tLoPqZzlcEZzR3lEd/S33XZxfi4Kpwo+hAcAqjccckI8nek4RCTq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381674; c=relaxed/simple;
	bh=uRYlDP6dnhuGc72f+O0qQkOV4DdiUexNSfcr6jhbU9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBgn1aNHl7VPXxHwJHgfdmNOfKPRkOJ6NaY3vtcyKJONRe/1DKScZ2FYMHl2iNVmdSc32bLrFligthZSi7uti/rM/0slmZbZEJiji85tG210DDPT9efHYXY2ODLYSqx5/Ds3sq3VGjeJlxnCcAj62U6l2GWzcjK8mwVOgMjRsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA26912FC;
	Tue,  1 Jul 2025 07:54:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0113F66E;
	Tue,  1 Jul 2025 07:54:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:43 +0100
Subject: [PATCH v2 18/28] coresight: cti: Fix race condition by using
 device mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-18-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3033;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uRYlDP6dnhuGc72f+O0qQkOV4DdiUexNSfcr6jhbU9E=;
 b=Cu3nyVHoTNzCKnBdv2dj9gwjaMRfjLRlILl3n53fRgW8TWIWgiE//0hE269uQAwDLZyAIZkAb
 gdIExrzMiknAkqlJhdsoK4X5avSz9IQW3rvaa/i8XxfS8t20nZ3H7DS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

A CTI device can be enabled as a helper in a CoreSight path or directly
via the SysFS knob. Currently, the driver lacks protection when multiple
flows contend for access to the same CTI device.

Use the device mode to mark the CTI as in use, and reset it to the
DISABLED state when the device is no longer needed. Any conflict will
cause the attempt to acquire the mode to fail, ensuring the device can
only be enabled exclusively.

Fixes: 1b5b1646e63d ("coresight: Fix CTI module refcount leak by making it a helper device")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2c8bf5dbe8b8206c92ae5ea64a26c947ef5b9582..ba4635dfc2e30b4e9ae4972f91bdc6647975b719 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -87,20 +87,31 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 }
 
 /* write regs to hardware and enable */
-static int cti_enable_hw(struct cti_drvdata *drvdata)
+static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
 {
 	struct cti_config *config = &drvdata->config;
+	struct coresight_device	*csdev = drvdata->csdev;
 	unsigned long flags;
 	int rc = 0;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
+	if (!drvdata->config.enable_req_count) {
+		coresight_set_mode(csdev, mode);
+	} else {
+		/* The device has been configured with an incompatible mode */
+		if (coresight_get_mode(csdev) != mode) {
+			rc = -EBUSY;
+			goto cti_err_not_enabled;
+		}
+	}
+
 	/* no need to do anything if enabled or unpowered*/
 	if (config->hw_enabled || !config->hw_powered)
 		goto cti_state_unchanged;
 
 	/* claim the device */
-	rc = coresight_claim_device(drvdata->csdev);
+	rc = coresight_claim_device(csdev);
 	if (rc)
 		goto cti_err_not_enabled;
 
@@ -116,6 +127,8 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	/* cannot enable due to error */
 cti_err_not_enabled:
+	if (!drvdata->config.enable_req_count)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	return rc;
 }
@@ -165,6 +178,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	if (--drvdata->config.enable_req_count > 0)
 		goto cti_not_disabled;
 
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+
 	/* no need to do anything if disabled or cpu unpowered */
 	if (!config->hw_enabled || !config->hw_powered)
 		goto cti_not_disabled;
@@ -803,7 +818,7 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
 {
 	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
 
-	return cti_enable_hw(drvdata);
+	return cti_enable_hw(drvdata, mode);
 }
 
 int cti_disable(struct coresight_device *csdev, void *data)

-- 
2.34.1

