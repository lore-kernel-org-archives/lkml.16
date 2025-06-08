Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209914A4DB;
	Sun,  8 Jun 2025 01:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749345945; cv=none; b=cNFh0V/L5LmHZPqsLv4OVtbbSFpxaNkCTFTmu4+DGBFVv4z5ItsC8HD6Iup6OM8fLy0+JKAKXfIKdq8q9ifQkimj6g010UNifaYk63tjd9x6iYZbKRwY0f8WNHqxLn9ylUdY9fLX4p1P9OdSZfrzq2wtF+k7AHyKZgElYGp6rkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749345945; c=relaxed/simple;
	bh=WDvi1Nk2ofBFZ+/NbQBR4i23wemBFLZjDHsRCoqd5YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+J6oUq9c/Z/1AFLQISpYeRE10FC88ScM9oZF6TIByxfmPa/KvSv1v6sPlH8nd8JLd+31xYHFOKTU/chzKhm2f1VvA8+EW7NyBuJZwbUw3SEM8RZ7g0hmp95pk5s8BZympsgEcToG0HCBAT68IKYSAbPx/lTDgXI8AB56xcqV18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=EnKF2vvj; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="EnKF2vvj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=WJr0cQUh1oIwxftMhGSaCHbcPtUcQVmiJZW2pTFZvBM=; b=EnKF2vvjMTXmLHMN
	hFzat2kgj/GHwyKt6kJxo8j+thAB4rQaFAo0UUKBIAZgBXV/GcNFs0iWlR4s9QoVJh/vLVgu+s4w1
	jY5OY+5XXB+HRZeDS0oQxiQxk9rjr+arQ6VuKZONG9QwGOnXEZKaIehwFJl9UdGLVx58d+qilvU7d
	pZkxvNOg1/W718S3R56zinRIIqwSbqeKws5/FwC2Vc6NWWAxiNJ2BwD57/CKNiGObtZPz48Y3cjx0
	dMG/Q1HPwcYtQEhgT983PE7XqHOVVE7g3nU0IvIWFbTRfWyCkBIQDYlBTdSYXlf/6xT8MSccdELqf
	etoWsBQl7M7cDo7t+w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uO4mg-008Dyl-0h;
	Sun, 08 Jun 2025 01:25:14 +0000
From: linux@treblig.org
To: irenic.rajneesh@gmail.com,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	platform-driver-x86@vger.kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] platform/x86: intel_telemetry: Remove unused [gs]et_sampling_period
Date: Sun,  8 Jun 2025 02:25:11 +0100
Message-ID: <20250608012512.377134-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608012512.377134-1-linux@treblig.org>
References: <20250608012512.377134-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The functions:
  get_sampling_period() and
  set_sampling_period()

were both added in 2016's
commit 378f956e3f93 ("platform/x86: Add Intel Telemetry Core Driver")
but have remained unused.

They're each a tiny wrapper that is the only caller through
a similarly named function pointer, and for each function pointer
there's a 'def' empty implementation and a plt implementation.

Remove all of those components for each function.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/intel_telemetry.h        |  10 --
 drivers/platform/x86/intel/telemetry/core.c   |  57 ---------
 drivers/platform/x86/intel/telemetry/pltdrv.c | 117 ------------------
 3 files changed, 184 deletions(-)

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index 3d7e0b922341..e7fb005ac8d8 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -59,11 +59,6 @@ struct telemetry_plt_config {
 };
 
 struct telemetry_core_ops {
-	int (*get_sampling_period)(u8 *pss_min_period, u8 *pss_max_period,
-				   u8 *ioss_min_period, u8 *ioss_max_period);
-
-	int (*set_sampling_period)(u8 pss_period, u8 ioss_period);
-
 	int (*get_trace_verbosity)(enum telemetry_unit telem_unit,
 				   u32 *verbosity);
 
@@ -101,11 +96,6 @@ int telemetry_read_eventlog(enum telemetry_unit telem_unit,
 int telemetry_raw_read_eventlog(enum telemetry_unit telem_unit,
 				struct telemetry_evtlog *evtlog, int len);
 
-int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
-				  u8 *ioss_min_period, u8 *ioss_max_period);
-
-int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period);
-
 int telemetry_set_trace_verbosity(enum telemetry_unit telem_unit,
 				  u32 verbosity);
 
diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
index 229e59c64af7..fe9e8580a8f5 100644
--- a/drivers/platform/x86/intel/telemetry/core.c
+++ b/drivers/platform/x86/intel/telemetry/core.c
@@ -21,19 +21,6 @@ struct telemetry_core_config {
 
 static struct telemetry_core_config telm_core_conf;
 
-static int telemetry_def_set_sampling_period(u8 pss_period, u8 ioss_period)
-{
-	return 0;
-}
-
-static int telemetry_def_get_sampling_period(u8 *pss_min_period,
-					     u8 *pss_max_period,
-					     u8 *ioss_min_period,
-					     u8 *ioss_max_period)
-{
-	return 0;
-}
-
 static int telemetry_def_get_trace_verbosity(enum telemetry_unit telem_unit,
 					     u32 *verbosity)
 {
@@ -62,56 +49,12 @@ static int telemetry_def_read_eventlog(enum telemetry_unit telem_unit,
 }
 
 static const struct telemetry_core_ops telm_defpltops = {
-	.set_sampling_period = telemetry_def_set_sampling_period,
-	.get_sampling_period = telemetry_def_get_sampling_period,
 	.get_trace_verbosity = telemetry_def_get_trace_verbosity,
 	.set_trace_verbosity = telemetry_def_set_trace_verbosity,
 	.raw_read_eventlog = telemetry_def_raw_read_eventlog,
 	.read_eventlog = telemetry_def_read_eventlog,
 };
 
-/**
- * telemetry_set_sampling_period() - Sets the IOSS & PSS sampling period
- * @pss_period:  placeholder for PSS Period to be set.
- *		 Set to 0 if not required to be updated
- * @ioss_period: placeholder for IOSS Period to be set
- *		 Set to 0 if not required to be updated
- *
- * All values should be in the form of:
- * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period)
-{
-	return telm_core_conf.telem_ops->set_sampling_period(pss_period,
-							     ioss_period);
-}
-EXPORT_SYMBOL_GPL(telemetry_set_sampling_period);
-
-/**
- * telemetry_get_sampling_period() - Get IOSS & PSS min & max sampling period
- * @pss_min_period:  placeholder for PSS Min Period supported
- * @pss_max_period:  placeholder for PSS Max Period supported
- * @ioss_min_period: placeholder for IOSS Min Period supported
- * @ioss_max_period: placeholder for IOSS Max Period supported
- *
- * All values should be in the form of:
- * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
-				  u8 *ioss_min_period, u8 *ioss_max_period)
-{
-	return telm_core_conf.telem_ops->get_sampling_period(pss_min_period,
-							     pss_max_period,
-							     ioss_min_period,
-							     ioss_max_period);
-}
-EXPORT_SYMBOL_GPL(telemetry_get_sampling_period);
-
-
 /**
  * telemetry_read_events() - Fetches samples as specified by evtlog.telem_evt_id
  * @telem_unit: Specify whether IOSS or PSS Read
diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index 60d3783de7ef..f23c170a55dc 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -639,121 +639,6 @@ static int telemetry_setup(struct platform_device *pdev)
 	return 0;
 }
 
-static int telemetry_plt_set_sampling_period(u8 pss_period, u8 ioss_period)
-{
-	u32 telem_ctrl = 0;
-	int ret = 0;
-
-	mutex_lock(&(telm_conf->telem_lock));
-	if (ioss_period) {
-		struct intel_scu_ipc_dev *scu = telm_conf->scu;
-
-		if (TELEM_SAMPLE_PERIOD_INVALID(ioss_period)) {
-			pr_err("IOSS Sampling Period Out of Range\n");
-			ret = -EINVAL;
-			goto out;
-		}
-
-		/* Get telemetry EVENT CTL */
-		ret = intel_scu_ipc_dev_command(scu, IOSS_TELEM,
-					    IOSS_TELEM_EVENT_CTL_READ, NULL, 0,
-					    &telem_ctrl, sizeof(telem_ctrl));
-		if (ret) {
-			pr_err("IOSS TELEM_CTRL Read Failed\n");
-			goto out;
-		}
-
-		/* Disable Telemetry */
-		TELEM_DISABLE(telem_ctrl);
-
-		ret = intel_scu_ipc_dev_command(scu, IOSS_TELEM,
-						IOSS_TELEM_EVENT_CTL_WRITE,
-						&telem_ctrl, sizeof(telem_ctrl),
-						NULL, 0);
-		if (ret) {
-			pr_err("IOSS TELEM_CTRL Event Disable Write Failed\n");
-			goto out;
-		}
-
-		/* Enable Periodic Telemetry Events and enable SRAM trace */
-		TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
-		TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
-		TELEM_ENABLE_PERIODIC(telem_ctrl);
-		telem_ctrl |= ioss_period;
-
-		ret = intel_scu_ipc_dev_command(scu, IOSS_TELEM,
-						IOSS_TELEM_EVENT_CTL_WRITE,
-						&telem_ctrl, sizeof(telem_ctrl),
-						NULL, 0);
-		if (ret) {
-			pr_err("IOSS TELEM_CTRL Event Enable Write Failed\n");
-			goto out;
-		}
-		telm_conf->ioss_config.curr_period = ioss_period;
-	}
-
-	if (pss_period) {
-		if (TELEM_SAMPLE_PERIOD_INVALID(pss_period)) {
-			pr_err("PSS Sampling Period Out of Range\n");
-			ret = -EINVAL;
-			goto out;
-		}
-
-		/* Get telemetry EVENT CTL */
-		ret = intel_punit_ipc_command(
-				IPC_PUNIT_BIOS_READ_TELE_EVENT_CTRL,
-				0, 0, NULL, &telem_ctrl);
-		if (ret) {
-			pr_err("PSS TELEM_CTRL Read Failed\n");
-			goto out;
-		}
-
-		/* Disable Telemetry */
-		TELEM_DISABLE(telem_ctrl);
-		ret = intel_punit_ipc_command(
-				IPC_PUNIT_BIOS_WRITE_TELE_EVENT_CTRL,
-				0, 0, &telem_ctrl, NULL);
-		if (ret) {
-			pr_err("PSS TELEM_CTRL Event Disable Write Failed\n");
-			goto out;
-		}
-
-		/* Enable Periodic Telemetry Events and enable SRAM trace */
-		TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
-		TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
-		TELEM_ENABLE_PERIODIC(telem_ctrl);
-		telem_ctrl |= pss_period;
-
-		ret = intel_punit_ipc_command(
-				IPC_PUNIT_BIOS_WRITE_TELE_EVENT_CTRL,
-				0, 0, &telem_ctrl, NULL);
-		if (ret) {
-			pr_err("PSS TELEM_CTRL Event Enable Write Failed\n");
-			goto out;
-		}
-		telm_conf->pss_config.curr_period = pss_period;
-	}
-
-out:
-	mutex_unlock(&(telm_conf->telem_lock));
-	return ret;
-}
-
-
-static int telemetry_plt_get_sampling_period(u8 *pss_min_period,
-					     u8 *pss_max_period,
-					     u8 *ioss_min_period,
-					     u8 *ioss_max_period)
-{
-	*pss_min_period = telm_conf->pss_config.min_period;
-	*pss_max_period = telm_conf->pss_config.max_period;
-	*ioss_min_period = telm_conf->ioss_config.min_period;
-	*ioss_max_period = telm_conf->ioss_config.max_period;
-
-	return 0;
-}
-
-
 static int telem_evtlog_read(enum telemetry_unit telem_unit,
 			     struct telem_ssram_region *ssram_region, u8 len)
 {
@@ -983,8 +868,6 @@ static int telemetry_plt_set_trace_verbosity(enum telemetry_unit telem_unit,
 static const struct telemetry_core_ops telm_pltops = {
 	.get_trace_verbosity = telemetry_plt_get_trace_verbosity,
 	.set_trace_verbosity = telemetry_plt_set_trace_verbosity,
-	.set_sampling_period = telemetry_plt_set_sampling_period,
-	.get_sampling_period = telemetry_plt_get_sampling_period,
 	.raw_read_eventlog = telemetry_plt_raw_read_eventlog,
 	.read_eventlog = telemetry_plt_read_eventlog,
 };
-- 
2.49.0

