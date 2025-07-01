Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6A279DA6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381643; cv=none; b=E4keLkNvbNRlsMRvvVk+ixzzR6kOqLCE+TVjfrIjba2Tffi30hKEoWfk9WuNfBxB7YAYw0a4M0nOGGRGOMTDCFkBweOG5kJfQaLQVU9K+7VzVIuRe+nW7HFl7xy+wGKXm5SvNPStDaTlmyWisbXzfmzUtm4XFO0q6cbCe97esP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381643; c=relaxed/simple;
	bh=cZSgSqHyGz4g339eEwnz63jNxp9jl1FHzIgfY83DJVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es5/WdrJuGf0v7PEAiE+u7T9HcgA02n3FmX6PNV3/ym0DsEkGd4uz6cKfvFwUDKNlT+mWRfNAd5xOXR410U83T9UDTuIK+ECbNhI5rbY2Dgwvz4R/nEanV308eSpdRrsa/DQRD972u7kQIvQJNvG52YH7WiISt9KFDdPlcS/Tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D141236D;
	Tue,  1 Jul 2025 07:53:46 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 821523F66E;
	Tue,  1 Jul 2025 07:53:59 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:30 +0100
Subject: [PATCH v2 05/28] coresight: etm4x: Ensure context synchronization
 is not ignored
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3873;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cZSgSqHyGz4g339eEwnz63jNxp9jl1FHzIgfY83DJVk=;
 b=dPwCRABFBE79Xl5//j6oYONooKvweBNCvADww5mRISOWoNXscg3g/apLgtTmEsftnm+/CHvIm
 h0Rxm0ASydeAnF7wDcLYsz81asATC6mZCZSr7iuwDgvp4JqWw+yFbD3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

As recommended in section 4.3.7 "Synchronization of register updates" of
ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
ISB instruction after programming the trace unit registers.

An ISB works as a context synchronization event; a DSB is not required.
Removes the redundant barrier in the enabling flow.

The ISB was placed at the end of the enable and disable functions.
However, this does not guarantee a context synchronization event in the
calling code, which may speculatively execute across function
boundaries.

ISB instructions are moved into callers to ensure that a context
synchronization is imposed immediately after enabling or disabling trace
unit.

Fixes: 40f682ae5086 ("coresight: etm4x: Extract the trace unit controlling")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 38 +++++++++++++++-------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 0f2a8b8459c93ca29d270b6fa05928244e0761c5..af9d3b2319c5f49ccd40dfa0ccf0f694ce9e2f4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -459,13 +459,6 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 		return -ETIME;
 	}
 
-	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-
 	return 0;
 }
 
@@ -579,6 +572,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 
 	if (!drvdata->paused)
 		rc = etm4_enable_trace_unit(drvdata);
+
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 done:
 	etm4_cs_lock(drvdata, csa);
 
@@ -954,11 +954,6 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1))
 		dev_err(etm_dev,
 			"timeout while waiting for PM stable Trace Status\n");
-	/*
-	 * As recommended by section 4.3.7 (Synchronization of register updates)
-	 * of ARM IHI 0064H.b.
-	 */
-	isb();
 }
 
 static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
@@ -981,6 +976,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 
 	etm4_disable_trace_unit(drvdata);
 
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
+
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
@@ -1118,6 +1120,12 @@ static int etm4_resume_perf(struct coresight_device *csdev)
 
 	etm4_cs_unlock(drvdata, csa);
 	etm4_enable_trace_unit(drvdata);
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 	etm4_cs_lock(drvdata, csa);
 
 	drvdata->paused = false;
@@ -1134,6 +1142,12 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 
 	etm4_cs_unlock(drvdata, csa);
 	etm4_disable_trace_unit(drvdata);
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 	etm4_cs_lock(drvdata, csa);
 
 	drvdata->paused = true;

-- 
2.34.1

