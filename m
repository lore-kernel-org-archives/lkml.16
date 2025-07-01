Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8219283121
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381690; cv=none; b=hGcB97UrzmHsSCqmhohM5AShEBHfgLHA4VqYtc5ITA7krv+s0v4vSth8Nj3Cv5TaiMvWyN1hTBSVrHBr0BvAOby2uUS3lqpFL11boZnw57ypVeMq101wF/yMzGSvt5+BS2+H6atF/nxp2P/UJqdIG9FFR3fdHPFrq90DDlBnJik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381690; c=relaxed/simple;
	bh=VdplnvKfcFNnefZuf+63Pd62NnWgXswQOjSEJQvvTjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxn31xaCwK0TDZX4NNd7tZiIQY9XMQqSS2o7BKWfWLcE5vvVm+ub/aBEbG1lHWkvBFmKsyRhBe+XnbWhJoZclgAVwEOrEUKLo1yeRyUXCcAyTQQMq16EQQDFuGGyAJn6ut6dWzapqtflZCclPfgtMF3WoMsKDWZKsDVbnBz5HIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4853712FC;
	Tue,  1 Jul 2025 07:54:33 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E02C3F66E;
	Tue,  1 Jul 2025 07:54:46 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:50 +0100
Subject: [PATCH v2 25/28] coresight: trbe: Save and restore state across
 CPU low power state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-25-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4449;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xJ7Z4CLEYT1qYI84Vkfn+SCYcBSQ+SjFvXLs9JkHkZM=;
 b=Tz+fMfVmg4BYCGrU6YEGyTVpYLGwV2LIWp++XK2Nrl7shAGK4keQp6JM2n9ytaT18xqxQTjEr
 sq6ioYKhVOYDorm5QH4B67JPF0WXM9G8FD5JxC+By12FZWBrgUbgIL/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

From: Yabin Cui <yabinc@google.com>

Similar to ETE, TRBE may lose its context when a CPU enters low power
state. To make things worse, if ETE is restored without TRBE being
restored, an enabled source device with no enabled sink devices can
cause CPU hang on some devices (e.g., Pixel 9).

The save and restore flows are described in the section K5.5 "Context
switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
restore callbacks with following the software usages defined in the
architecture manual.

Signed-off-by: Yabin Cui <yabinc@google.com>
Co-developed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 84 ++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 28450447693147b9afd207679832ac83e2a5848a..7f3d233f70b33058bd235ea0b798ce3884788856 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,20 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
+/*
+ * struct trbe_save_state: Register values representing TRBE state
+ * @trblimitr		- Trace Buffer Limit Address Register value
+ * @trbbaser		- Trace Buffer Base Register value
+ * @trbptr		- Trace Buffer Write Pointer Register value
+ * @trbsr		- Trace Buffer Status Register value
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
@@ -133,6 +147,7 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1187,12 +1202,81 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int arm_trbe_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return 0;
+
+	/*
+	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
+	 * 0487 L.a), the software usage VKHHY requires a TSB CSYNC instruction
+	 * to ensure the program-flow trace is flushed, which has been executed
+	 * in ETM driver.
+	 */
+
+	/* Disable trace buffer unit */
+	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
+	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
+
+	/*
+	 * Execute a further Context synchronization event. Ensure the writes to
+	 * memory are complete.
+	 */
+	trbe_drain_buffer();
+
+	/* Synchronize the TRBE disabling */
+	isb();
+
+	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
+	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
+	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	return 0;
+}
+
+static int arm_trbe_restore(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return 0;
+
+	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
+	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
+	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
+
+	/*
+	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
+	 * 0487 L.a), the software usage PKLXF requires a Context
+	 * synchronization event to guarantee the Trace Buffer Unit will observe
+	 * the new values of the System registers.
+	 */
+	isb();
+
+	/* Enable the Trace Buffer Unit */
+	write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);
+
+	/* Synchronize the TRBE enable event */
+	isb();
+
+	if (trbe_needs_ctxt_sync_after_enable(cpudata))
+		isb();
+
+	return 0;
+}
+
 static const struct coresight_ops_sink arm_trbe_sink_ops = {
 	.enable		= arm_trbe_enable,
 	.disable	= arm_trbe_disable,
 	.alloc_buffer	= arm_trbe_alloc_buffer,
 	.free_buffer	= arm_trbe_free_buffer,
 	.update_buffer	= arm_trbe_update_buffer,
+	.save		= arm_trbe_save,
+	.restore	= arm_trbe_restore,
 };
 
 static const struct coresight_ops arm_trbe_cs_ops = {

-- 
2.34.1

