Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A62DCB40
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967921; cv=none; b=ALGTfmT4s9bgsZwgn3KKiBz/fDhQa9i8XIjyUEInYbrhy/Wy1cu+LBovOws6l69GuwtW2OgiSN9XG7K0dGieRd/lxdBRI3fpvWEjEz+DdIBSJf++ZVfIG1WLCsYeoyVuYrG5pF3lAdpCd+oPiBVbos5JUYSc4u6ZJTwBdK59G3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967921; c=relaxed/simple;
	bh=wKpQ2zpAHbQxRjpmRKw2Q6HoFTAs9gaEa2OoClEUtco=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gcwbCSpT7EdZmlHmnFNFH8Big+zkO1VbLV7ancvZnRMmwOnnHX42Ouw6bTLL08g9ArNyd9oH6pKGYYWuEHbc08Uif/lTTsgKkucBpXjGRShLvlBZTcL+n/A/K27gtNkGxgc6TLKrdESxKRpnPvuI4jY/6ni5qqulYJ5UNF5uHL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEi8J/fT; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEi8J/fT"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso215116a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745967919; x=1746572719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GFiJRsSYTyPAXrhNaWQT1b/jnx69ee7FboyvHeBQWw=;
        b=LEi8J/fTEd/e3xQLVK0Z2lc+pCVlyQCII4aY8Cm9QhXjxd7Y+LbtK3UTp0kxJnEQPg
         aEu+CHJRzOSm+Ehm4WA3heDbeSqdxyNzpdvyAxX6ydqwPtilZpB8gteZRA7wb+6RAGhM
         K3wY4Z4Fqjg0IquVwWvFY46X96dudlyYLWvCTiFhDo3tXti4RRpACeX3MPO4vo2H2Ys2
         pD4erpCJKS4JHpSFj0SngBjgNp8i7c/Sv2KxgoVBCsPWrM5Po+VBHFLwmScYCsW6D4LX
         4sHiFpEZx9C2YumfpgI6M6mrGAvwYO8ETBrl0F/3gQUTwrSnBilsgw0GkBb+Cf5SVaf/
         LLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745967919; x=1746572719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GFiJRsSYTyPAXrhNaWQT1b/jnx69ee7FboyvHeBQWw=;
        b=usCkr8GncLr5VzcusEscrhizTkitNE9sLBPhXQCo1gl6Dke5iER7rw+vu5wde+wjvh
         hY1g0WKaBbihKxtC7gXBwzk/E9rebNhGBpkDeu4kgjdwoP4zjjcS+b3tjITtvlPTQ0qq
         +jGSRi1zl9ag1Ml1sCjewA6T5hpSf/phPNQr3PS29eOaNnK7Fpo2dgOVoM5LrBCzGcxq
         bCxnLqlCpziavOQA5uMUl9dx+2yQ7Xuj3NCckaP3F9Aa2AtRoMqKmBYmP5tafgQPjHsZ
         voJcjrbq17mFiBCJqHBY3xMyeRT94aTQNw5W6xL5nvrBR1BfYWnXKXQudAId/+OPSKs0
         Gsgw==
X-Forwarded-Encrypted: i=1; AJvYcCVjCbvgLEmh3byw4jruwWkINJfy9rs2uTJyr+RuxcRxdQ3s3PxN3jac4t0uDtYEdhEiucFdirtUYDi6aXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtsYe9FamOshI8nfdggSec0V/mdiGHRjV8y7YHqUR094ZsFm5
	j1Nx1VCubqN+0vr5zM/0rtxEyART88SAHJE1ZTunmgAXR/gxE+q8tQXSBFbGaU33EpRgS+d/UEp
	R
X-Google-Smtp-Source: AGHT+IE0PWA7WS7Lu00x6+TazDT2LPv2nCnsOi9/Lrjv+V/EJAq9DaNIm6TCSJBFMF+6b3GjArs3Y5cEKfA=
X-Received: from pgba24.prod.google.com ([2002:a63:4d18:0:b0:aee:900e:e3d6])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:439f:b0:1ee:c830:abdc
 with SMTP id adf61e73a8af0-20a90c09495mr788906637.15.1745967918935; Tue, 29
 Apr 2025 16:05:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:05:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429230515.1906253-1-yabinc@google.com>
Subject: [PATCH v2] coresight: trbe: Save/restore state across CPU low power state
From: Yabin Cui <yabinc@google.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

Similar to ETE, TRBE may lose its context when a CPU enters low
power state. To make things worse, if ETE is restored without
TRBE being restored, we have an enabled source device with no
enabled sink devices, which can cause CPU hang on some devices
(Pixel 9).

This patch adds sink operations to save and restore state for TRBE,
and calls them when saving and restoring state for ETE. This is
to ensure that we always restore the state of TRBE before ETE.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 .../coresight/coresight-etm4x-core.c          | 13 ++++-
 drivers/hwtracing/coresight/coresight-trbe.c  | 58 +++++++++++++++++++
 include/linux/coresight.h                     |  6 ++
 3 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..aaabbda97afc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
+	struct coresight_device *sink;
 
 	/* Save the TRFCR irrespective of whether the ETM is ON */
 	if (drvdata->trfcr)
@@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
 	 */
-	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
+	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
 		ret = __etm4_cpu_save(drvdata);
+		if (ret == 0) {
+			sink = coresight_get_percpu_sink(drvdata->cpu);
+			if (sink && sink_ops(sink)->percpu_save)
+				sink_ops(sink)->percpu_save(sink);
+		}
+	}
 	return ret;
 }
 
@@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
+	struct coresight_device *sink = coresight_get_percpu_sink(drvdata->cpu);
+
+	if (sink && sink_ops(sink)->percpu_restore)
+		sink_ops(sink)->percpu_restore(sink);
 	if (drvdata->trfcr)
 		write_trfcr(drvdata->save_trfcr);
 	if (drvdata->state_needs_restore)
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..d94d1a7a2330 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,20 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
+/*
+ * struct trbe_save_state: Register values representing TRBE state
+ * @trblimitr	- Trace Buffer Limit Address Register value
+ * @trbbaser	- Trace Buffer Base Register value
+ * @trbptr	- Trace Buffer Write Pointer Register value
+ * @trbsr	- Trace Buffer Status Register value
+ */
+struct trbe_save_state {
+	u64 trblimitr;
+	u64 trbbaser;
+	u64 trbptr;
+	u64 trbsr;
+};
+
 /*
  * struct trbe_cpudata: TRBE instance specific data
  * @trbe_flag		- TRBE dirty/access flag support
@@ -123,6 +137,8 @@ static int trbe_errata_cpucaps[] = {
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
  * @drvdata		- TRBE specific drvdata
+ * @state_needs_restore	- Whether TRBE state has been saved and can be restored
+ * @save_state		- Saved TRBE state
  * @errata		- Bit map for the errata on this TRBE.
  */
 struct trbe_cpudata {
@@ -133,6 +149,8 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	bool state_needs_restore;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1187,12 +1205,51 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void arm_trbe_cpu_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return;
+
+	state = &cpudata->save_state;
+	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
+	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
+	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
+	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	cpudata->state_needs_restore = true;
+}
+
+static void arm_trbe_cpu_restore(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state;
+
+	if (cpudata->state_needs_restore) {
+		/*
+		 * To avoid disruption of normal tracing, restore trace
+		 * registers only when TRBE lost power (TRBLIMITR == 0).
+		 */
+		if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
+			state = &cpudata->save_state;
+			write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
+			write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
+			write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+			set_trbe_enabled(cpudata, state->trblimitr);
+		}
+		cpudata->state_needs_restore = false;
+	}
+}
+
 static const struct coresight_ops_sink arm_trbe_sink_ops = {
 	.enable		= arm_trbe_enable,
 	.disable	= arm_trbe_disable,
 	.alloc_buffer	= arm_trbe_alloc_buffer,
 	.free_buffer	= arm_trbe_free_buffer,
 	.update_buffer	= arm_trbe_update_buffer,
+	.percpu_save	= arm_trbe_cpu_save,
+	.percpu_restore	= arm_trbe_cpu_restore,
 };
 
 static const struct coresight_ops arm_trbe_cs_ops = {
@@ -1358,6 +1415,7 @@ static void arm_trbe_probe_cpu(void *info)
 	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
 	cpudata->cpu = cpu;
 	cpudata->drvdata = drvdata;
+	cpudata->state_needs_restore = false;
 	return;
 cpu_clear:
 	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index cfcf6e4707ed..098c04c4a59d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -362,6 +362,10 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @percpu_save:	saves state when CPU enters idle state.
+ *			Only set for percpu sink.
+ * @percpu_restore:	restores state when CPU exits idle state.
+ *			only set for percpu sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -374,6 +378,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	void (*percpu_save)(struct coresight_device *csdev);
+	void (*percpu_restore)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.49.0.967.g6a0df3ecc3-goog

