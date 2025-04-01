Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72E320E70B;
	Tue,  1 Apr 2025 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530843; cv=none; b=ptDZr0+MTSRfSrqYcBQqm2WFL26YZNR608CLtpcBGSGJIwUI0cD2gCny+YKVHQjBDcGJcN6Z2fsguEPQ05fH1DlCHZEPPRfvpJBfTFV2qOnNNb5lBJzNTrsRuSOImCvmbHI3FV02mzkm/rG740YRmQmk+fdSma48wU/cs6xWnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530843; c=relaxed/simple;
	bh=ej/DlqTt2VSU0cvrPLsd4z6xUhYXzhoEq79+4VJuTLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r6hnwqKJ1egWFB7ilTopEAE+0dl9SDtKXQ+S4BFzRS4nfOqtNL+U5dzfhF0OqK3YfNyywAZMbByhliSfOWhvmcVzmcfHDGLq87zY+ezKAbl03XWFE+Rg10ZsyKrxB32gLBV7wkVcLkGWiydE+FU3rIwr4zsbr2+0/w7ZQ4ev9eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB3E1655;
	Tue,  1 Apr 2025 11:07:24 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 653BC3F59E;
	Tue,  1 Apr 2025 11:07:19 -0700 (PDT)
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
Subject: [PATCH v4 2/7] coresight: Introduce pause and resume APIs for source
Date: Tue,  1 Apr 2025 19:07:03 +0100
Message-Id: <20250401180708.385396-3-leo.yan@arm.com>
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

Introduce APIs for pausing and resuming trace source and export as GPL
symbols.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 22 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 include/linux/coresight.h                    |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d4c3000608f2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -367,6 +367,28 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
+void coresight_pause_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return;
+
+	if (source_ops(csdev)->pause_perf)
+		source_ops(csdev)->pause_perf(csdev);
+}
+EXPORT_SYMBOL_GPL(coresight_pause_source);
+
+int coresight_resume_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return -EOPNOTSUPP;
+
+	if (!source_ops(csdev)->resume_perf)
+		return -EOPNOTSUPP;
+
+	return source_ops(csdev)->resume_perf(csdev);
+}
+EXPORT_SYMBOL_GPL(coresight_resume_source);
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82644aff8d2b..2d9baa9d8228 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,5 +249,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
+void coresight_pause_source(struct coresight_device *csdev);
+int coresight_resume_source(struct coresight_device *csdev);
 
 #endif
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..c95c72e07e02 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -398,6 +398,8 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
+ * @resume_perf: resumes tracing for a source in perf session.
+ * @pause_perf:	pauses tracing for a source in perf session.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -405,6 +407,8 @@ struct coresight_ops_source {
 		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
+	int (*resume_perf)(struct coresight_device *csdev);
+	void (*pause_perf)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.34.1

