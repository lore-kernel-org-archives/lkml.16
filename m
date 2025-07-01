Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF8D27AC35
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381653; cv=none; b=WtRzb2smRNmwuWepTAMOd6ddo/ZHTw8OoP3OwbtCbHzSt1n726Pr3D7ft6ybTTJVs+QT4kWmcorf4ULQHWaB6OMMLsYfi9jWXF/14jc4HfuxjD3Pdf82ylT0dJ1lRFXTzc2XwBixybuhGywq3dXq36jMIRYBt2/cSNgag0BVOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381653; c=relaxed/simple;
	bh=3FzsJ294Km5DXl6Zl0XTZsLcfLP+hKqykLaREdcqh7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhFVUdUlKwNVZ0zRAcZhyIsRDGLvJAWBad/LxWu5pvSWbKpbcpaypVsHCtip9/GB1/XLzixd8sf/5mVVRRtj/4r26/zX1Zgz7IT1TnQ7pWIgizl3l6dIMRvR0eCwLcPYV7V0o7KhaeeMAMTiuTf1WBnLPA0TelDav0IIYGdKOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0AD612FC;
	Tue,  1 Jul 2025 07:53:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B5C3F66E;
	Tue,  1 Jul 2025 07:54:08 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:34 +0100
Subject: [PATCH v2 09/28] coresight: etm4x: Add flag to control single-shot
 restart
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-9-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2609;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3FzsJ294Km5DXl6Zl0XTZsLcfLP+hKqykLaREdcqh7Q=;
 b=vnizEWirvSP9CyTgezy74SOV99JSU/ZlgmUOyQufbb5U5UqvIEa7NIfNqmAgzXzvO9NPGguK6
 ou9l5Af1n21AIsxHQq4FP1vmJ4YQ7K1yRZF8kHOBn9oJe07ccPdLAwi
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
control.

No functional change. This is a preparation for a subsequent change.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1faf8614366f38eea4909152558fe8e69730bde4..7bbdee92859cd227fd4077df6ff25470b9d76950 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -486,7 +486,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	return 0;
 }
 
-static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
+static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
 {
 	int i, rc;
 	struct etmv4_config *config = &drvdata->config;
@@ -560,9 +560,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
-		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		if (restart_ss) {
+			/* always clear status bit on restart if using single-shot */
+			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
+				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		}
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
 		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
@@ -626,7 +628,7 @@ static void etm4_enable_hw_smp_call(void *info)
 		return;
 	}
 
-	arg->rc = etm4_enable_hw(arg->drvdata);
+	arg->rc = etm4_enable_hw(arg->drvdata, true);
 
 	/* The tracer didn't start */
 	if (arg->rc)
@@ -865,7 +867,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
 
 	/* And enable it */
-	ret = etm4_enable_hw(drvdata);
+	ret = etm4_enable_hw(drvdata, true);
 
 out:
 	/* The tracer didn't start */
@@ -1830,7 +1832,7 @@ static int etm4_starting_cpu(unsigned int cpu)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
+		etm4_enable_hw(etmdrvdata[cpu], true);
 	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }

-- 
2.34.1

