Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D791927E7DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381669; cv=none; b=sAU/eDEvvzwLmMbDgPV8ZxqwDAZbrG6TC2VqlCRds4IUTKGtyIrbpzIv+E/Z+U2HdMUmddktHIbyl7H0vzgPCPIk3BJP6M+LN7sP/pblZjT+FfrIKg5kcvUoEGC+Moy4tQoZZFUYoBffgfJ64WiAXYo37jtVv5NTLE87lCV2TSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381669; c=relaxed/simple;
	bh=WCOg1Suss97xRLtE2LtYRgzZ8clj4Sy7iX3GHHiQCzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJjSmNfBRBmjYXnzY+z6WARPGiDgOF6mryjMpQa6jqfVr0CEyiHynzY9vtXAWOmeWIAmou8cwZfBoXwXe8eu760wNhvbKaYjEDau1THdwije7hmOjOZrBzKAoIPVwB5MowcYfGq8z1f2ilsQDmzAHgH4/SyC0ypl7JMUIz9oCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E9B812FC;
	Tue,  1 Jul 2025 07:54:12 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6429F3F66E;
	Tue,  1 Jul 2025 07:54:25 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:41 +0100
Subject: [PATCH v2 16/28] coresight: Add callback to determine if context
 save/restore is needed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-16-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4323;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WCOg1Suss97xRLtE2LtYRgzZ8clj4Sy7iX3GHHiQCzY=;
 b=KUAFt6aIfRB42uBtR4UZ/V1Fgyg5OthtaipZQ6YGSSR5E/VIpHnmwvbW7ySOFzxzifaXvIRWz
 HZZcFwlWGNtB41fJCCprrVuiUryPZV8YWHHiCmYnHr/pYzQ7759QT7H
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Add a callback in the source device that returns a boolean indicating
whether context save and restore operations are required. The save and
restore flow is skipped if the callback returns false.

The ETMv4 driver implements its own version's callback.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 16 +++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 30 +++++++++++++++++-----
 include/linux/coresight.h                          |  2 ++
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 233e128bc61c9e6ef69182e5387fe0dadf532324..45f15a1f51295b298073551cb328d20cc2c36cdb 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -421,6 +421,20 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+static bool coresight_need_save_restore_source(struct coresight_device *csdev)
+{
+	if (!csdev)
+		return false;
+
+	if (source_ops(csdev)->need_context_save_restore)
+		return source_ops(csdev)->need_context_save_restore(csdev);
+
+	if (coresight_get_mode(csdev))
+		return true;
+
+	return false;
+}
+
 static int coresight_save_source(struct coresight_device *csdev)
 {
 	if (csdev && source_ops(csdev)->save)
@@ -1594,7 +1608,7 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
 
-	if (!source)
+	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
 
 	switch (cmd) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b76107aef9d3e42214d4bc97598795ddd96ff2d8..92ded5c87614b2a74736005c4d127e266cb9b0e2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1836,6 +1836,21 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static bool etm4_need_context_save_restore(struct coresight_device *csdev)
+{
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return false;
+
+	/*
+	 * Save and restore the ETM Trace registers only if
+	 * the ETM is active.
+	 */
+	if (coresight_get_mode(csdev))
+		return true;
+
+	return false;
+}
+
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1924,13 +1939,14 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
 }
 
 static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
-	.enable		= etm4_enable,
-	.disable	= etm4_disable,
-	.resume_perf	= etm4_resume_perf,
-	.pause_perf	= etm4_pause_perf,
-	.save		= etm4_cpu_save,
-	.restore	= etm4_cpu_restore,
+	.cpu_id			   = etm4_cpu_id,
+	.enable			   = etm4_enable,
+	.disable		   = etm4_disable,
+	.resume_perf		   = etm4_resume_perf,
+	.pause_perf		   = etm4_pause_perf,
+	.save			   = etm4_cpu_save,
+	.restore		   = etm4_cpu_restore,
+	.need_context_save_restore = etm4_need_context_save_restore,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 8d6f7cb354d6e487c757d9fe86cda895ccb1a588..4d5c07b7ddc67991a3871851fe45463f92bd32c8 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -400,6 +400,7 @@ struct coresight_ops_link {
  * @disable:	disables tracing for a source.
  * @resume_perf: resumes tracing for a source in perf session.
  * @pause_perf:	pauses tracing for a source in perf session.
+ * @need_context_save_restore: if need to save and restore context.
  * @save:	save context for a source.
  * @restore:	restore context for a source.
  */
@@ -411,6 +412,7 @@ struct coresight_ops_source {
 			struct perf_event *event);
 	int (*resume_perf)(struct coresight_device *csdev);
 	void (*pause_perf)(struct coresight_device *csdev);
+	bool (*need_context_save_restore)(struct coresight_device *csdev);
 	int (*save)(struct coresight_device *csdev);
 	void (*restore)(struct coresight_device *csdev);
 };

-- 
2.34.1

