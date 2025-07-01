Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C37281530
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381688; cv=none; b=bJU6wzmcV5J+28WINy18z5j+aLyh+l8B7Vz+km7ZjJaU8hIy/gg4Yvhyv0DW+816u38mUXjNVtaPzTt11BrvjusKFSKNya8memDunobWhBKJcAdbctYQdMsQurLU/AuHWO+Y1Bpmr/lXcA61MtglxizCRNIfyc8/d8bovA2fz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381688; c=relaxed/simple;
	bh=h4VCTwtgvwPr/SEDI2cRGubtIWCp+Z3G3QpcWxIpQlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrdSQWzBRntGQsvZ7PV6ejvERv/jJoHLUV9WqfYhbIzuRHbqQ8nxWnRxw6yRCYzuWu9eR7vLZNF99U1KuivTWcn4YgMrJzTrV9LOZ5CN0ozrgqQhKSyeovfOd36BCaxD6cL+y//at8DqdtGTD8FOBkK5a1ZxTaBJi+Mc6pKzAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E650C236D;
	Tue,  1 Jul 2025 07:54:30 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37FDA3F66E;
	Tue,  1 Jul 2025 07:54:44 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:49 +0100
Subject: [PATCH v2 24/28] coresight: Add PM callbacks for percpu sink
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-24-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=5895;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=h4VCTwtgvwPr/SEDI2cRGubtIWCp+Z3G3QpcWxIpQlE=;
 b=ouqwSuo/Ejud3ncanKqdeSTcFz8oOMgraJK1/gcZCr5Cm9RDY/oI5G7Wtf73Pz6GwoJOj+ga2
 Jo2z3Xq1NGgAWPRW8wiHI4KmuoaTFRj30nm1rDUy+La5XNfYBv1a2rn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.
This commit registers save and restore callbacks for the per-CPU sink
via the PM notifier.

There are no changes to the coresight_enable_helpers() function; the
code movement is solely for compilation purposes.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 101 +++++++++++++++++++++------
 include/linux/coresight.h                    |   4 ++
 2 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7693a0eade1a8de6d0960d66f6de682b5d5aff17..9978737d21177ab7cfcd449cf67a0b0736fcca5a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -391,6 +391,25 @@ static void coresight_disable_helper(struct coresight_device *csdev, void *data)
 	helper_ops(csdev)->disable(csdev, data);
 }
 
+static int coresight_enable_helpers(struct coresight_device *csdev,
+				    enum cs_mode mode, void *data)
+{
+	int i, ret = 0;
+	struct coresight_device *helper;
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		ret = coresight_enable_helper(helper, mode, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
 {
 	int i;
@@ -478,6 +497,43 @@ static void coresight_restore_source(struct coresight_device *csdev)
 		source_ops(csdev)->restore(csdev);
 }
 
+static int coresight_save_percpu_sink(struct coresight_device *csdev)
+{
+	int ret;
+
+	if (csdev && sink_ops(csdev)->save) {
+		ret = sink_ops(csdev)->save(csdev);
+		if (ret)
+			return ret;
+
+		coresight_disable_helpers(csdev, NULL);
+	}
+
+	/* Return success if callback is not supported */
+	return 0;
+}
+
+static int coresight_restore_percpu_sink(struct coresight_device *csdev,
+					 struct coresight_path *path,
+					 enum cs_mode mode)
+{
+	int ret = 0;
+
+	if (csdev && sink_ops(csdev)->restore) {
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			return ret;
+
+		ret = sink_ops(csdev)->restore(csdev);
+		if (ret) {
+			coresight_disable_helpers(csdev, path);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -551,25 +607,6 @@ void coresight_disable_path(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
-static int coresight_enable_helpers(struct coresight_device *csdev,
-				    enum cs_mode mode, void *data)
-{
-	int i, ret = 0;
-	struct coresight_device *helper;
-
-	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
-		helper = csdev->pdata->out_conns[i]->dest_dev;
-		if (!helper || !coresight_is_helper(helper))
-			continue;
-
-		ret = coresight_enable_helper(helper, mode, data);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int _coresight_enable_path(struct coresight_path *path,
 				  enum cs_mode mode, void *sink_data,
 				  bool in_idle)
@@ -1667,9 +1704,12 @@ EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
+	int ret;
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
 	struct coresight_path *path;
+	struct coresight_device *sink;
+	enum cs_mode mode;
 
 	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
@@ -1682,18 +1722,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	if (WARN_ON(!path))
 		return NOTIFY_BAD;
 
+	sink = coresight_get_sink(path);
+	mode = coresight_get_mode(source);
+
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
 
-		coresight_disable_path_from(path, NULL, true);
+		ret = 0;
+		if (coresight_is_percpu_sink(sink))
+			ret = coresight_save_percpu_sink(sink);
+		else
+			coresight_disable_path_from(path, NULL, true);
+
+		if (ret) {
+			coresight_restore_source(source);
+			return NOTIFY_BAD;
+		}
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
-		if (_coresight_enable_path(path,
-					   coresight_get_mode(source),
-					   NULL, true))
+		if (coresight_is_percpu_sink(sink))
+			ret = coresight_restore_percpu_sink(sink, path, mode);
+		else
+			ret = _coresight_enable_path(path, mode, NULL, true);
+
+		if (ret)
 			return NOTIFY_BAD;
 
 		coresight_restore_source(source);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f52e834640b72534ea83ab223aae7544b195bbaa..e551a36c40cc2311cd72948b799db5425b93fe68 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -363,6 +363,8 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @save:		save context for a sink.
+ * @restore:		restore context for a sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -375,6 +377,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	int (*save)(struct coresight_device *csdev);
+	int (*restore)(struct coresight_device *csdev);
 };
 
 /**

-- 
2.34.1

