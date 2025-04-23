Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB822701BC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745449251; cv=none; b=ZD0xw9oc0P0bIxJQgoOqwEjExiB0Y3P5t5gSir7pFu6Xe566WLOGLUZiYwh6OW5mtcfhVoftP7xEYeLhLqTVGGbppiBKRDd8YIF9HfC4EfKKtk77evTRKohohG0B3JlMcQ7yY3MDdSrBvSny5Tm7vBrpYiky2TZQ+LCVrvgU+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745449251; c=relaxed/simple;
	bh=FABkO5S3B0S0FOzteewA/ffMHAMzGeUc0WIR3RPT2XQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=u6urKLtnkyWMA5Bg25ZWHfu/xFwKcIWRwbeC0VnDOmW7C7HB0NCB4HtHIZ/zLrtxQL2qTEkdRAF/Ig3yC17OshibsKESrqbvi3FWQrGcny4EipUaiArTe8zePPTXxzgD13VjfcvYCwFohNMWpRsO2KTSHWHwr7aB/C9t2Kossy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6Yo0NPn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6Yo0NPn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c1ea954fso128486b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745449249; x=1746054049; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B5OuSnRYmxjKGp/xme4xK/kJBvItahOTY4ca9GtiV/U=;
        b=j6Yo0NPn6XYfNN6Ai5+TsDMrbDEYHuG2ysMZwCj2FuTM77flXxa51DPZqXiVfOpLN9
         I2+2+xqc+iBTi5Nrx4s0Iof73IDBqP/GkcikEJiCxqDf+RvqTJ4lh2qVgydi65jFgV3M
         pyQH3ymvIHKLIOseaTWS/Hkcpepr4rYDB3faTkfI4ZSR0+uD5sfavnWb4GFORBopSUz/
         JdC2Bn12CApTYTdASvjwahB0SbeXqvW/EU1hh+hZ9+N3/ijfoLrDm2TrE/7Jy3GD/ZN+
         K6NoxaQnHlJ5gn6Hrmtig00JxoZ4RRHte1OVfYGcP87Pn4718pf5PBkwlVFCUMqozsDG
         Q/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745449249; x=1746054049;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5OuSnRYmxjKGp/xme4xK/kJBvItahOTY4ca9GtiV/U=;
        b=Ze6dlw32CtWHms6c9nBEEp8xfl9bTLgq4/w1kjT+2rPgQQw8DsLIKew469G2iz5jja
         HkgUODh4OcyEyh7Fz24N5J7q7nX4X1no9PgxKD+GHaOmHA6WHnYB/Glvybxlxu9PXW5l
         CicHJefSOEvLtUpkdV0SGYvATKZDPSmdFjeDkOasqkhdHgVv9bKx2gF5RJKEhkzZUoTy
         a+crbDE5cpIzkiIG8qidDobzr3Hj7aVsHRxMR0A33PZLn/GnuoGEBUEaS+vjH4CSN+jT
         uIaoVj9z1/hcfvCur4c1dz/7FfXaDu189+/Hs07L1vY6Gx2C77QamQ483OcExIXO0Vas
         suHg==
X-Forwarded-Encrypted: i=1; AJvYcCWzfx7OoZHBDGuJPY+i1gT4kIQE6hrjSzQkEGfL+kUcorQDeJ6IBkwRmtolV3fmwuL4hR2TqVOkM0hyBug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYyk7qM81ej1zO+vvUSR+WRDqytWkAc1FwWG+0YHNJIq1eumeF
	AK+ew1RHAnMKk8NpdQojQnqCTGJHd3Zh1L0wopU+ZWgoNUJVuwxg/4nt1D0nKJelBqUBrk+UgJV
	J
X-Google-Smtp-Source: AGHT+IErwK2DT1KoeJM4yorZNa4fi9TPavX8qddUeghqZq9oScAgB1pOM+1uuM5QkwJ1g/JwW/wt1CJLkK8=
X-Received: from pgzz2.prod.google.com ([2002:a63:3302:0:b0:af0:e359:c50a])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:181a:b0:1f5:80a3:b006
 with SMTP id adf61e73a8af0-20444ebe0aamr449684637.21.1745449249463; Wed, 23
 Apr 2025 16:00:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:00:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250423230046.1134389-1-yabinc@google.com>
Subject: [PATCH] coresight: trbe: Save/restore state across CPU low power state
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

Similar to ETE, TRBE may lose its context when a CPU enters low
power state. To make things worse, if ETE state is restored without
restoring TRBE state, it can lead to a stuck CPU due to an enabled
source device with no enabled sink devices.

This patch introduces support for "arm,coresight-loses-context-with-cpu"
in the TRBE driver. When present, TRBE registers are saved before
and restored after CPU low power state. To prevent CPU hangs, TRBE
state is always saved after ETE state and restored after ETE state.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 .../coresight/coresight-etm4x-core.c          | 13 ++++-
 drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
 include/linux/coresight.h                     |  6 +++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e5972f16abff..1bbaa1249206 100644
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
index fff67aac8418..38bf46951a82 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
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
@@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] = {
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
  * @drvdata		- TRBE specific drvdata
+ * @state_needs_save	- Need to save trace registers when entering cpu idle
+ * @state_needs_restore	- Need to restore trace registers when exiting cpu idle
+ * @save_state		- Saved trace registers
  * @errata		- Bit map for the errata on this TRBE.
  */
 struct trbe_cpudata {
@@ -133,6 +143,9 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	bool state_needs_save;
+	bool state_needs_restore;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void arm_trbe_cpu_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED || !cpudata->state_needs_save)
+		return;
+
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
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->state_needs_restore) {
+		/*
+		 * To avoid disruption of normal tracing, restore trace
+		 * registers only when TRBE lost power (TRBLIMITR == 0).
+		 */
+		if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
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
@@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
 	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
 	cpudata->cpu = cpu;
 	cpudata->drvdata = drvdata;
+	cpudata->state_needs_save = coresight_loses_context_with_cpu(
+		&drvdata->pdev->dev);
+	cpudata->state_needs_restore = false;
 	return;
 cpu_clear:
 	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..fec375d02535 100644
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
2.49.0.901.g37484f566f-goog

