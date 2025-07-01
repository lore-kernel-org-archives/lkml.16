Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E6E27815E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381655; cv=none; b=bsL4P2lTSfx0HP2bMXc3kY1QTcg8yZDaidKuHmtShy0MNOJi+zzQsNnOy6T0F37aWH/MjpMJgeJjI8fksRQ0eTD/8wEfDhvzW5SM0DzxBcFGoDAkXPIpDu5N7TU5Rj0MGpH9ID8KH/OIkUU/VvotfD4iSPSxuH/oluslFyWnlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381655; c=relaxed/simple;
	bh=ehZsp7BPCBj8P3yPkhk9XTKRfV+mpzmepg8eKDuZeEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDyaa7EWbtQmAVYmjsD5Oy149Ebl9hnZb58yL3ussmArimqH7raDrmCAtxAVgKRB+psBhy9PNh5lNa5aJGRiaimtwaEWwtSaBqKKIvEkjrE+ZBNXJGINUseKAXVpFVDtqQHtzQ4t49dcUfEu5aXNMMuqFMreHyJMnI64cMblYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02D14236D;
	Tue,  1 Jul 2025 07:53:58 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487283F66E;
	Tue,  1 Jul 2025 07:54:11 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:35 +0100
Subject: [PATCH v2 10/28] coresight: etm4x: Reuse normal enable and disable
 logic in CPU idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-10-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=14259;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ehZsp7BPCBj8P3yPkhk9XTKRfV+mpzmepg8eKDuZeEc=;
 b=GdaahXTvLGPUpCnzu9Qq0omk9dhYf8h7UMihpV/osPITl4y1ra+mu9dvdbYs64c6PvYsslbXY
 0qRAGo1dpD1A0hVw2e7hjhbJSI19CQOmpu2xKpIDoQaL25IpqIKfox7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The etm4_enable_trace_unit() function is almost identical to the restore
flow, with a few differences listed below:

1) TRCQCTLR register

   The TRCQCTLR register is saved and restored during CPU idle, but it
   is never touched in the normal flow. Given the Q element is not
   enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
   restoring this register during idle.

2) TRCSSCSRn.STATUS bit

   The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
   but instead directly loads the saved value. In contrast, the normal
   flow clears this bit to 0 when re-enabling single-shot control.

   Therefore, the restore function passes the restart_ss argument as
   false to etm4_enable_hw() to avoid re-enabling single-shot mode.

3) Claim Tag Handling

   The claim tag is acquired and released in normal flow, on the other
   hand, the claim protocol is not applied in CPU idle flow - it simply
   restores the saved value.

   The claim bits serve two purpose:

   * Exclusive access between the kernel driver and an external
     debugger. During CPU idle, the kernel driver locks the OS Lock,
     ensuring that the external debugger cannot access the trace unit.
     Therefore, it is safe to release the claim tag during idle.

   * Notification to supervisory software to save/restore context for
     external debuggers. The kernel driver does not touch the external
     debugger's claim bit (ETMCLAIM[0]).

   Based on this, it is safe to acquire and release claim tag in the
   idle sequence.

4) OS Lock Behavior

   The OS Lock should be locked during CPU idle states. This differs
   from the normal flow, which unlock it. This special handling remains
   in the CPU save path.

This commit reuses the normal enable and disable logic in the CPU idle
path. The only addition is locking the OS Lock upon entering idle to
ensure exclusive access.

The save context in the driver data is no longer needed and has been
removed.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 212 +--------------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  57 ------
 2 files changed, 5 insertions(+), 264 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7bbdee92859cd227fd4077df6ff25470b9d76950..6ef1f2ea1a805b07bcac70b6034bab85cec604be 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1851,8 +1851,7 @@ static int etm4_dying_cpu(unsigned int cpu)
 
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
-	int i, ret = 0;
-	struct etmv4_save_state *state;
+	int ret = 0;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa;
 	struct device *etm_dev;
@@ -1882,98 +1881,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		ret = -EBUSY;
 		goto out;
 	}
+	etm4_cs_lock(drvdata, csa);
 
-	if (!drvdata->paused)
-		etm4_disable_trace_unit(drvdata);
-
-	/*
-	 * As recommended by section 4.3.7 (Synchronization of register updates)
-	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
-	 * ISB instruction after programming the trace unit registers.
-	 */
-	isb();
-
-	state = drvdata->save_state;
-
-	if (drvdata->nr_pe)
-		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
-	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
-	state->trcauxctlr = etm4x_read32(csa, TRCAUXCTLR);
-	state->trceventctl0r = etm4x_read32(csa, TRCEVENTCTL0R);
-	state->trceventctl1r = etm4x_read32(csa, TRCEVENTCTL1R);
-	if (drvdata->stallctl)
-		state->trcstallctlr = etm4x_read32(csa, TRCSTALLCTLR);
-	state->trctsctlr = etm4x_read32(csa, TRCTSCTLR);
-	state->trcsyncpr = etm4x_read32(csa, TRCSYNCPR);
-	state->trcccctlr = etm4x_read32(csa, TRCCCCTLR);
-	state->trcbbctlr = etm4x_read32(csa, TRCBBCTLR);
-	state->trctraceidr = etm4x_read32(csa, TRCTRACEIDR);
-	if (drvdata->q_filt)
-		state->trcqctlr = etm4x_read32(csa, TRCQCTLR);
-
-	state->trcvictlr = etm4x_read32(csa, TRCVICTLR);
-	state->trcviiectlr = etm4x_read32(csa, TRCVIIECTLR);
-	state->trcvissctlr = etm4x_read32(csa, TRCVISSCTLR);
-	if (drvdata->nr_pe_cmp)
-		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
-
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
-
-	if (drvdata->nrseqstate) {
-		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
-		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
-	}
-	state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
-		state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
-		state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
-	}
-
-	/* Resource selector pair 0 is reserved */
-	for (i = 2; i < drvdata->nr_resource * 2; i++)
-		state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
-
-	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
-		state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
-		if (etm4x_sspcicrn_present(drvdata, i))
-			state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
-	}
-
-	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
-		state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
-	}
-
-	/*
-	 * Data trace stream is architecturally prohibited for A profile cores
-	 * so we don't save (or later restore) trcdvcvr and trcdvcmr - As per
-	 * section 1.3.4 ("Possible functional configurations of an ETMv4 trace
-	 * unit") of ARM IHI 0064D.
-	 */
-
-	for (i = 0; i < drvdata->numcidc; i++)
-		state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
-
-	for (i = 0; i < drvdata->numvmidc; i++)
-		state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
-
-	state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
-	if (drvdata->numcidc > 4)
-		state->trccidcctlr1 = etm4x_read32(csa, TRCCIDCCTLR1);
-
-	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
-	if (drvdata->numvmidc > 4)
-		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
-
-	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
-
-	if (!drvdata->skip_power_up)
-		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
+	etm4_disable_hw(drvdata);
 
+	etm4_cs_unlock(drvdata, csa);
 	/* wait for TRCSTATR.IDLE to go up */
 	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
 		dev_err(etm_dev,
@@ -1983,14 +1895,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
-	/*
-	 * Power can be removed from the trace unit now. We do this to
-	 * potentially save power on systems that respect the TRCPDCR_PU
-	 * despite requesting software to save/restore state.
-	 */
-	if (!drvdata->skip_power_up)
-		etm4x_relaxed_write32(csa, (state->trcpdcr & ~TRCPDCR_PU),
-				      TRCPDCR);
 out:
 	etm4_cs_lock(drvdata, csa);
 	return ret;
@@ -2014,109 +1918,10 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 
 static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	int i;
-	struct etmv4_save_state *state = drvdata->save_state;
-	struct csdev_access *csa = &drvdata->csdev->access;
-
 	if (WARN_ON(!drvdata->csdev))
 		return;
 
-	etm4_cs_unlock(drvdata, csa);
-	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
-
-	if (drvdata->nr_pe)
-		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
-	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
-	etm4x_relaxed_write32(csa, state->trcauxctlr, TRCAUXCTLR);
-	etm4x_relaxed_write32(csa, state->trceventctl0r, TRCEVENTCTL0R);
-	etm4x_relaxed_write32(csa, state->trceventctl1r, TRCEVENTCTL1R);
-	if (drvdata->stallctl)
-		etm4x_relaxed_write32(csa, state->trcstallctlr, TRCSTALLCTLR);
-	etm4x_relaxed_write32(csa, state->trctsctlr, TRCTSCTLR);
-	etm4x_relaxed_write32(csa, state->trcsyncpr, TRCSYNCPR);
-	etm4x_relaxed_write32(csa, state->trcccctlr, TRCCCCTLR);
-	etm4x_relaxed_write32(csa, state->trcbbctlr, TRCBBCTLR);
-	etm4x_relaxed_write32(csa, state->trctraceidr, TRCTRACEIDR);
-	if (drvdata->q_filt)
-		etm4x_relaxed_write32(csa, state->trcqctlr, TRCQCTLR);
-
-	etm4x_relaxed_write32(csa, state->trcvictlr, TRCVICTLR);
-	etm4x_relaxed_write32(csa, state->trcviiectlr, TRCVIIECTLR);
-	etm4x_relaxed_write32(csa, state->trcvissctlr, TRCVISSCTLR);
-	if (drvdata->nr_pe_cmp)
-		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
-
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
-
-	if (drvdata->nrseqstate) {
-		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
-		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
-	}
-	etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
-		etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
-		etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
-	}
-
-	/* Resource selector pair 0 is reserved */
-	for (i = 2; i < drvdata->nr_resource * 2; i++)
-		etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
-
-	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
-		if (etm4x_sspcicrn_present(drvdata, i))
-			etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
-	}
-
-	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
-		etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
-	}
-
-	for (i = 0; i < drvdata->numcidc; i++)
-		etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
-
-	for (i = 0; i < drvdata->numvmidc; i++)
-		etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
-
-	etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
-	if (drvdata->numcidc > 4)
-		etm4x_relaxed_write32(csa, state->trccidcctlr1, TRCCIDCCTLR1);
-
-	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
-	if (drvdata->numvmidc > 4)
-		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
-
-	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
-
-	if (!drvdata->skip_power_up)
-		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
-
-	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-
-	/* Unlock the OS lock to re-enable trace and external debug access */
-	etm4_os_unlock(drvdata);
-
-	if (!drvdata->paused)
-		etm4_enable_trace_unit(drvdata);
-
-	/*
-	 * As recommended by section 4.3.7 (Synchronization of register updates)
-	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
-	 * ISB instruction after programming the trace unit registers.
-	 */
-	isb();
-
-	etm4_cs_lock(drvdata, csa);
+	etm4_enable_hw(drvdata, false);
 }
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
@@ -2298,13 +2103,6 @@ static int etm4_probe(struct device *dev)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
 
-	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
-		drvdata->save_state = devm_kmalloc(dev,
-				sizeof(struct etmv4_save_state), GFP_KERNEL);
-		if (!drvdata->save_state)
-			return -ENOMEM;
-	}
-
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	drvdata->cpu = coresight_get_cpu(dev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 06438ed1071478cd5c1a143c6ef58a926d6992fb..f361ae62b122d84b5126fca6f8ba93d99dc2f992 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -861,61 +861,6 @@ struct etmv4_config {
 	u8				s_ex_level;
 };
 
-/**
- * struct etm4_save_state - state to be preserved when ETM is without power
- */
-struct etmv4_save_state {
-	u32	trcprocselr;
-	u32	trcconfigr;
-	u32	trcauxctlr;
-	u32	trceventctl0r;
-	u32	trceventctl1r;
-	u32	trcstallctlr;
-	u32	trctsctlr;
-	u32	trcsyncpr;
-	u32	trcccctlr;
-	u32	trcbbctlr;
-	u32	trctraceidr;
-	u32	trcqctlr;
-
-	u32	trcvictlr;
-	u32	trcviiectlr;
-	u32	trcvissctlr;
-	u32	trcvipcssctlr;
-
-	u32	trcseqevr[ETM_MAX_SEQ_STATES];
-	u32	trcseqrstevr;
-	u32	trcseqstr;
-	u32	trcextinselr;
-	u32	trccntrldvr[ETMv4_MAX_CNTR];
-	u32	trccntctlr[ETMv4_MAX_CNTR];
-	u32	trccntvr[ETMv4_MAX_CNTR];
-
-	u32	trcrsctlr[ETM_MAX_RES_SEL];
-
-	u32	trcssccr[ETM_MAX_SS_CMP];
-	u32	trcsscsr[ETM_MAX_SS_CMP];
-	u32	trcsspcicr[ETM_MAX_SS_CMP];
-
-	u64	trcacvr[ETM_MAX_SINGLE_ADDR_CMP];
-	u64	trcacatr[ETM_MAX_SINGLE_ADDR_CMP];
-	u64	trccidcvr[ETMv4_MAX_CTXID_CMP];
-	u64	trcvmidcvr[ETM_MAX_VMID_CMP];
-	u32	trccidcctlr0;
-	u32	trccidcctlr1;
-	u32	trcvmidcctlr0;
-	u32	trcvmidcctlr1;
-
-	u32	trcclaimset;
-
-	u32	cntr_val[ETMv4_MAX_CNTR];
-	u32	seq_state;
-	u32	vinst_ctrl;
-	u32	ss_status[ETM_MAX_SS_CMP];
-
-	u32	trcpdcr;
-};
-
 /**
  * struct etm4_drvdata - specifics associated to an ETM component
  * @pclk        APB clock if present, otherwise NULL
@@ -977,7 +922,6 @@ struct etmv4_save_state {
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
- * @save_state:	State to be preserved across power loss
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
  * @paused:	Indicates if the trace unit is paused.
@@ -1030,7 +974,6 @@ struct etmv4_drvdata {
 	bool				lpoverride;
 	u64				trfcr;
 	struct etmv4_config		config;
-	struct etmv4_save_state		*save_state;
 	bool				skip_power_up;
 	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);

-- 
2.34.1

