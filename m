Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823727E040
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381664; cv=none; b=Tm5GnzTsTQmJYv1l7ESEUneWg8fVNzEFA6kRLxoOjZ0qZjBA91MSJChluM1vQiMJ++LuER7ynwnAM9SpnwH0rMwcFL90F9zC2+aNrFH6ewiltsmJ9hi5XFz9zKLV/E+/GDTQ01WP/wh2NshaI8ira2xPwQjvIMucfr4tB1wT9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381664; c=relaxed/simple;
	bh=dtMHzMsEvB1w5gGKMHNjCzu2OFCynUvwXD1EeLmby78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oo5x4ZrZ5k9LvNLToFanTy0fImYtis9NJxuUIwUjraVadAbC3ghu5sWq8E1dbaInKljsr+hGn4ycRbnNq1UyT4eqiPfOHHx9XEWsAxp9cPC9sJJpTtgpFk0pqWCZt6kM9usS9E7wLeDBZdAByaMf4otBjbtcxZXz+pHtFLoLrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66AC312FC;
	Tue,  1 Jul 2025 07:54:07 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5893F66E;
	Tue,  1 Jul 2025 07:54:20 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:39 +0100
Subject: [PATCH v2 14/28] coresight: Register CPU PM notifier in core layer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-14-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4893;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dtMHzMsEvB1w5gGKMHNjCzu2OFCynUvwXD1EeLmby78=;
 b=IkPho2elS4BzAWALxdr9nwTzFIgt/hy52nqKVK5gGNv4xTvxLLMq51nCF1s5kSDVMZRngK9gr
 mrVb7e4PVznBE3mf9lBgGwZ7XvcJifWfB/ncYQBzGHF842gQ2DX5teM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The current implementation only saves and restores the context for ETM
sources while ignoring the context of links.  However, if funnels or
replicators on a linked path resides in a CPU or cluster power domain,
the hardware context for the link will be lost after resuming from low
power states.

To support context management for links during CPU low power modes, a
better way is to implement CPU PM callbacks in the Arm CoreSight core
layer.  As the core layer has sufficient information for linked paths,
from tracers to links, which can be used for power management.

As a first step, this patch registers CPU PM notifier in the core layer.
If a source driver provides callbacks for saving and restoring context,
these callbacks will be invoked in CPU suspend and resume.

Further changes will extend for controlling path.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 62 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  4 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 042e8e646ff521a15dc18d7264faa427f1ac0dc7..233e128bc61c9e6ef69182e5387fe0dadf532324 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/build_bug.h>
+#include <linux/cpu_pm.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -420,6 +421,21 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+static int coresight_save_source(struct coresight_device *csdev)
+{
+	if (csdev && source_ops(csdev)->save)
+		return source_ops(csdev)->save(csdev);
+
+	/* Return success if callback is not supported */
+	return 0;
+}
+
+static void coresight_restore_source(struct coresight_device *csdev)
+{
+	if (csdev && source_ops(csdev)->restore)
+		source_ops(csdev)->restore(csdev);
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -1572,6 +1588,45 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 }
 EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	unsigned int cpu = smp_processor_id();
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
+
+	if (!source)
+		return NOTIFY_OK;
+
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		if (coresight_save_source(source))
+			return NOTIFY_BAD;
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		coresight_restore_source(source);
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block coresight_cpu_pm_nb = {
+	.notifier_call = coresight_cpu_pm_notify,
+};
+
+static int __init coresight_pm_setup(void)
+{
+	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+}
+
+static void coresight_pm_cleanup(void)
+{
+	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
+}
+
 const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
@@ -1626,9 +1681,15 @@ static int __init coresight_init(void)
 
 	/* initialise the coresight syscfg API */
 	ret = cscfg_init();
+	if (ret)
+		goto exit_notifier;
+
+	ret = coresight_pm_setup();
 	if (!ret)
 		return 0;
 
+	cscfg_exit();
+exit_notifier:
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
 exit_perf:
@@ -1640,6 +1701,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4b15c67c200624fd46a258628dbff401bd1396d7..8d6f7cb354d6e487c757d9fe86cda895ccb1a588 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -400,6 +400,8 @@ struct coresight_ops_link {
  * @disable:	disables tracing for a source.
  * @resume_perf: resumes tracing for a source in perf session.
  * @pause_perf:	pauses tracing for a source in perf session.
+ * @save:	save context for a source.
+ * @restore:	restore context for a source.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -409,6 +411,8 @@ struct coresight_ops_source {
 			struct perf_event *event);
 	int (*resume_perf)(struct coresight_device *csdev);
 	void (*pause_perf)(struct coresight_device *csdev);
+	int (*save)(struct coresight_device *csdev);
+	void (*restore)(struct coresight_device *csdev);
 };
 
 /**

-- 
2.34.1

