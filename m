Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7841C214A80;
	Tue,  1 Apr 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530848; cv=none; b=kyMCH5NHNJcw1y4dlHjF5ugMDpH3zyfN7q0Y6AmeMJlN3HFGQYvN/3xYP7mCt1L1fxc0WCbQmYsFZ9BEry+0OxtHq7TDS2l1JlRpS6nfjCSJ254uWpkRhnfFskcBv89g5xelnja4HejwJT5Ucjb9qJSunUM150U7hHZeb+RLs+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530848; c=relaxed/simple;
	bh=WoWNgbhocFj0XY59o1jJzdiID78Qo61SucnnvK3zS2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sy+IqK7IsFwIlgbnOPqoHW8rXvopF2VRIjwNQHz/ywwC52CRyQzTECmOli6zn4Jt5dRfYj0hNvbrctEuwKmiARWxamU0UJxRn5lq13ruTqQxedJo+l1UHVpoKWzik43l79vt7pT/nV4hstoKh5Jsui8OTAso4RApiNCIhKFLkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886BA12FC;
	Tue,  1 Apr 2025 11:07:29 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B92E93F59E;
	Tue,  1 Apr 2025 11:07:24 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
Date: Tue,  1 Apr 2025 19:07:06 +0100
Message-Id: <20250401180708.385396-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer update callbacks disable the sink before syncing data but
misses to re-enable it afterward.  This is fine in the general flow,
because the sink will be re-enabled the next time the PMU event is
activated.

However, during AUX pause and resume, if the sink is disabled in the
buffer update callback, there is no chance to re-enable it when AUX
resumes.

To address this, the callbacks now check the event state
'event->hw.state'.  If the event is an active state (0), the sink is
re-enabled.

For the TMC ETR driver, buffer updates are not fully protected by
the driver's spinlock.  In this case, the sink is not re-enabled if its
reference counter is 0, in order to avoid race conditions where the sink
may have been completely disabled.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c |  9 +++++++++
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..7584cc03d8e6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	unsigned long offset, to_read = 0, flags;
 	struct cs_buffers *buf = sink_config;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct perf_event *event = handle->event;
 
 	if (!buf)
 		return 0;
@@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	 * is expected by the perf ring buffer.
 	 */
 	CS_LOCK(drvdata->base);
+
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	if (!event->hw.state)
+		__tmc_etb_enable_hw(drvdata);
+
 out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..8923fbc6e1a0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1636,6 +1636,7 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_perf_buffer *etr_perf = config;
 	struct etr_buf *etr_buf = etr_perf->etr_buf;
+	struct perf_event *event = handle->event;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -1705,6 +1706,15 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	 */
 	smp_wmb();
 
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (csdev->refcnt && !event->hw.state)
+		__tmc_etr_enable_hw(drvdata);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
 out:
 	/*
 	 * Don't set the TRUNCATED flag in snapshot mode because 1) the
-- 
2.34.1

