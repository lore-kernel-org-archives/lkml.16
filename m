Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B193F279DB5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381695; cv=none; b=RycDAsLgMt11N90EQYBGoI9ks9/EWYA4erwqWTdA+TQlzfTUJhYEUFdt5uSMj9MBR/6LGHEsM9DYYIuXPsZMFsihHbb0mcYBXDfbCft2aaq53MbIIT17qKLV7qh7JRWwkeSi0U/Ex/GquDmmJbLcO84w2fP9ROkLPfH/isiZ/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381695; c=relaxed/simple;
	bh=o8U2CyLA6oQ12QKlhMbUjxrrAki5FVq7tsPqo5eJOWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nygff8vk4Q7D/1o5xm4fCSUu3xwnNFK64Rxqi7718Q8bktr/juttI9JMt4ya58JliFJRQuwmy2VpkNzTQGbtBvMk+gATxnK7je+2yWcM5KlytzoMCc+dUv+lwYKQ+EqRA87vcrmjgzsP4SMS8v8CSMHVmfbi3EO9WzkgswDh2+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3BB5236D;
	Tue,  1 Jul 2025 07:54:37 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45B813F66E;
	Tue,  1 Jul 2025 07:54:51 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:52 +0100
Subject: [PATCH v2 27/28] coresight: Move CPU hotplug callbacks to core
 layer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-27-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=6622;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=o8U2CyLA6oQ12QKlhMbUjxrrAki5FVq7tsPqo5eJOWU=;
 b=36aOdrmbrtsRS0SdUEpj9nAw9Gg00qdz4gIseSUq0YU6SfvjlYsCffGpN9r73+NYfCZa3vxHG
 8iRj4RpC8+GBGNqhwKDJ3cmH4OYYxMU7660WKPSdK0oqC0YQJKS1Pcm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This commit moves CPU hotplug callbacks from ETMv4 driver to core layer.
The motivation is the core layer can control all components on an
activated path rather but not only managing tracer in ETMv4 driver.

The perf event layer will disable CoreSight PMU event 'cs_etm' when
hotplug off a CPU.  That means a perf mode will be always converted to
disabled mode in CPU hotplug.  Arm CoreSight CPU hotplug callbacks only
need to handle the Sysfs mode and ignore the perf mode.

The core layer invokes a high level API coresight_disable_source() to
disable a source when hotplug-off a CPU.  It disables a tracer and
changes the tracer's mode to CS_MODE_DISABLED.

When hotplug-in a CPU, if a activated path is detected - when the
activated path pointer is not NULL - in this case, the tracer will be
re-enabled.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 61 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -------------
 include/linux/coresight.h                          | 17 +++---
 3 files changed, 70 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 9978737d21177ab7cfcd449cf67a0b0736fcca5a..e1659b05738e73fcb6c66c74c8f1ce3a24ab2da4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1701,6 +1701,52 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 }
 EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 
+static int coresight_starting_cpu(unsigned int cpu)
+{
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
+
+	if (!source)
+		return 0;
+
+	/* Re-enable components on an activated path */
+	path = per_cpu(csdev_cpu_path, cpu);
+	if (!path)
+		return 0;
+
+	if (path->saved_mode != CS_MODE_SYSFS)
+		return 0;
+
+	source_ops(source)->enable(source, NULL, path->saved_mode, path);
+	return 0;
+}
+
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
+
+	if (!source)
+		return 0;
+
+	/* Don't proceed if no path is activated */
+	path = per_cpu(csdev_cpu_path, cpu);
+	if (!path)
+		return 0;
+
+	path->saved_mode = coresight_get_mode(source);
+
+	/*
+	 * The perf event layer will disable PMU events in the CPU hotplug.
+	 * CoreSight driver should never handle the CS_MODE_PERF case.
+	 */
+	if (WARN_ON(path->saved_mode != CS_MODE_SYSFS))
+		return 0;
+
+	source_ops(source)->disable(source, NULL);
+	return 0;
+}
+
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
@@ -1766,11 +1812,24 @@ static struct notifier_block coresight_cpu_pm_nb = {
 
 static int __init coresight_pm_setup(void)
 {
-	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+	int ret;
+
+	ret = cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
+					"arm/coresight-core:starting",
+					coresight_starting_cpu, coresight_dying_cpu);
+	if (ret)
+		cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
+
+	return ret;
 }
 
 static void coresight_pm_cleanup(void)
 {
+	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index f99a48511850cd6e9682533880b22a3b8fc43135..94872226dd63c5b9ed9ef95f17d717656c4e5589 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1802,33 +1802,6 @@ static int etm4_online_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int etm4_starting_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (!etmdrvdata[cpu]->os_unlock)
-		etm4_os_unlock(etmdrvdata[cpu]);
-
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu], true);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
-static int etm4_dying_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
 static bool etm4_need_context_save_restore(struct coresight_device *csdev)
 {
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
@@ -1923,13 +1896,6 @@ static int __init etm4_pm_setup(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
-					"arm/coresight4:starting",
-					etm4_starting_cpu, etm4_dying_cpu);
-
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight4:online",
 					etm4_online_cpu, NULL);
@@ -1940,14 +1906,11 @@ static int __init etm4_pm_setup(void)
 		return 0;
 	}
 
-	/* failed dyn state - remove others */
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);
 		hp_online = 0;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index e551a36c40cc2311cd72948b799db5425b93fe68..6daed3a75190617464515c4e1e0628d2169b26e7 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -330,21 +330,24 @@ static struct coresight_dev_list (var) = {				\
 
 #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
 
+enum cs_mode {
+	CS_MODE_DISABLED,
+	CS_MODE_SYSFS,
+	CS_MODE_PERF,
+	CS_MODE_DEBUG,
+};
+
 /**
  * struct coresight_path - data needed by enable/disable path
  * @path_list:              path from source to sink.
  * @trace_id:          trace_id of the whole path.
+ * @saved_mode:        The saved device mode. It stores the source device's mode
+ *                     to represent the path mode during CPU hotplug off.
  */
 struct coresight_path {
 	struct list_head	path_list;
 	u8			trace_id;
-};
-
-enum cs_mode {
-	CS_MODE_DISABLED,
-	CS_MODE_SYSFS,
-	CS_MODE_PERF,
-	CS_MODE_DEBUG,
+	enum cs_mode		saved_mode;
 };
 
 #define coresight_ops(csdev)	csdev->ops

-- 
2.34.1

