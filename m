Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA9134AC;
	Sun,  8 Jun 2025 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749345941; cv=none; b=fW5Og9vlaJJu9I5aTzTkb5vnNrADWo5l54WNshEN4NCZwjk/kSCN6B2t3NgxaAYTnBgobf9x6GONDwHW2nu5dmil76rU+DXnw0yKPe58REaAcukN2au5Q7NOGubQRfdwRUV6PRU4r9Bd35GyPl6gDrQGcqot+MEGCvcQ0pb0WkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749345941; c=relaxed/simple;
	bh=Xz38wUv+zqJF7aTbshqy2ZY4ajvu964Nft4yUVM5mxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdB6CM7pE6xW+BbTm8DYlxu5wtkufQ5VpJQIX8vjZnOt2bE9zbQbMTL+kXr0AdnmQfPheq6qLRRcFQzRQRcBgvccTdwTALaRJsT60mD4B9xGARUnUyXxyGU+Hf9gy1g4QKYeMp6IBQy/z9n1hS/QuKYE+SpwAKdPfSrT+guh6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=lksI5ELD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="lksI5ELD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=M7VKH/G4cHDJoSEyw+bSJC3widT/3FG08VGcYcgkato=; b=lksI5ELDDoWPZ72/
	/loiQVcj+hCPXrVXOXw5jY0fl6lgnwDKbBVFmrYJ5fjTByZDI8Rl5KBFxARNS4/Ee6aty7EshkJo3
	ad1T0kDbvr0J6mzzvIyMaXdeJVeEtF/q3l4HEobd2BpEUJGaOaW/o7C+oYPos7MSGanChQfyH2/fF
	TzGMB8n9rc7gtUxx1FZJtYgta7+F5wfwGY3YaaBIpDPsvRU4gl8LKVZoGAlcqqyfMSDmsjJBz8Lau
	l2j9ol1EvlA0TIszgeqXc59kU/P5mRMuBcXiHeqqeAMWuvP78EH02kMItvZIEdxnzumqG5ydX1dN7
	OlwmTsZuFwlkI5ut4A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uO4mf-008Dyl-2N;
	Sun, 08 Jun 2025 01:25:13 +0000
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
Subject: [PATCH 1/3] platform/x86: intel_telemetry: Remove unused telemetry_*_events
Date: Sun,  8 Jun 2025 02:25:10 +0100
Message-ID: <20250608012512.377134-2-linux@treblig.org>
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
  telemetry_add_events(), telemetry_update_events(),
telemetry_reset_events(), telemetry_get_eventconfig()
were all added in 2016's
commit 378f956e3f93 ("platform/x86: Add Intel Telemetry Core Driver")
but have remained unused.

They're each a tiny wrapper that is the only caller through
a similarly named function pointer, and for each function pointer
there's a 'def' empty implementation and a plt implementation.

Remove all of those components for each function.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/intel_telemetry.h        |  24 ----
 drivers/platform/x86/intel/telemetry/core.c   | 101 ----------------
 drivers/platform/x86/intel/telemetry/pltdrv.c | 114 ------------------
 3 files changed, 239 deletions(-)

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index 43b7657febca..3d7e0b922341 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -62,13 +62,6 @@ struct telemetry_core_ops {
 	int (*get_sampling_period)(u8 *pss_min_period, u8 *pss_max_period,
 				   u8 *ioss_min_period, u8 *ioss_max_period);
 
-	int (*get_eventconfig)(struct telemetry_evtconfig *pss_evtconfig,
-			       struct telemetry_evtconfig *ioss_evtconfig,
-			       int pss_len, int ioss_len);
-
-	int (*update_events)(struct telemetry_evtconfig pss_evtconfig,
-			     struct telemetry_evtconfig ioss_evtconfig);
-
 	int (*set_sampling_period)(u8 pss_period, u8 ioss_period);
 
 	int (*get_trace_verbosity)(enum telemetry_unit telem_unit,
@@ -84,11 +77,6 @@ struct telemetry_core_ops {
 	int (*read_eventlog)(enum telemetry_unit telem_unit,
 			     struct telemetry_evtlog *evtlog,
 			     int len, int log_all_evts);
-
-	int (*add_events)(u8 num_pss_evts, u8 num_ioss_evts,
-			  u32 *pss_evtmap, u32 *ioss_evtmap);
-
-	int (*reset_events)(void);
 };
 
 int telemetry_set_pltdata(const struct telemetry_core_ops *ops,
@@ -101,18 +89,6 @@ struct telemetry_plt_config *telemetry_get_pltdata(void);
 int telemetry_get_evtname(enum telemetry_unit telem_unit,
 			  const char **name, int len);
 
-int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
-			    struct telemetry_evtconfig ioss_evtconfig);
-
-int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
-			 u32 *pss_evtmap, u32 *ioss_evtmap);
-
-int telemetry_reset_events(void);
-
-int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_config,
-			      struct telemetry_evtconfig *ioss_config,
-			      int pss_len, int ioss_len);
-
 int telemetry_read_events(enum telemetry_unit telem_unit,
 			  struct telemetry_evtlog *evtlog, int len);
 
diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
index e4be40f73eeb..229e59c64af7 100644
--- a/drivers/platform/x86/intel/telemetry/core.c
+++ b/drivers/platform/x86/intel/telemetry/core.c
@@ -21,12 +21,6 @@ struct telemetry_core_config {
 
 static struct telemetry_core_config telm_core_conf;
 
-static int telemetry_def_update_events(struct telemetry_evtconfig pss_evtconfig,
-				      struct telemetry_evtconfig ioss_evtconfig)
-{
-	return 0;
-}
-
 static int telemetry_def_set_sampling_period(u8 pss_period, u8 ioss_period)
 {
 	return 0;
@@ -40,14 +34,6 @@ static int telemetry_def_get_sampling_period(u8 *pss_min_period,
 	return 0;
 }
 
-static int telemetry_def_get_eventconfig(
-			struct telemetry_evtconfig *pss_evtconfig,
-			struct telemetry_evtconfig *ioss_evtconfig,
-			int pss_len, int ioss_len)
-{
-	return 0;
-}
-
 static int telemetry_def_get_trace_verbosity(enum telemetry_unit telem_unit,
 					     u32 *verbosity)
 {
@@ -75,51 +61,15 @@ static int telemetry_def_read_eventlog(enum telemetry_unit telem_unit,
 	return 0;
 }
 
-static int telemetry_def_add_events(u8 num_pss_evts, u8 num_ioss_evts,
-				    u32 *pss_evtmap, u32 *ioss_evtmap)
-{
-	return 0;
-}
-
-static int telemetry_def_reset_events(void)
-{
-	return 0;
-}
-
 static const struct telemetry_core_ops telm_defpltops = {
 	.set_sampling_period = telemetry_def_set_sampling_period,
 	.get_sampling_period = telemetry_def_get_sampling_period,
 	.get_trace_verbosity = telemetry_def_get_trace_verbosity,
 	.set_trace_verbosity = telemetry_def_set_trace_verbosity,
 	.raw_read_eventlog = telemetry_def_raw_read_eventlog,
-	.get_eventconfig = telemetry_def_get_eventconfig,
 	.read_eventlog = telemetry_def_read_eventlog,
-	.update_events = telemetry_def_update_events,
-	.reset_events = telemetry_def_reset_events,
-	.add_events = telemetry_def_add_events,
 };
 
-/**
- * telemetry_update_events() - Update telemetry Configuration
- * @pss_evtconfig: PSS related config. No change if num_evts = 0.
- * @ioss_evtconfig: IOSS related config. No change if num_evts = 0.
- *
- * This API updates the IOSS & PSS Telemetry configuration. Old config
- * is overwritten. Call telemetry_reset_events when logging is over
- * All sample period values should be in the form of:
- * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
-			    struct telemetry_evtconfig ioss_evtconfig)
-{
-	return telm_core_conf.telem_ops->update_events(pss_evtconfig,
-						       ioss_evtconfig);
-}
-EXPORT_SYMBOL_GPL(telemetry_update_events);
-
-
 /**
  * telemetry_set_sampling_period() - Sets the IOSS & PSS sampling period
  * @pss_period:  placeholder for PSS Period to be set.
@@ -162,57 +112,6 @@ int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
 EXPORT_SYMBOL_GPL(telemetry_get_sampling_period);
 
 
-/**
- * telemetry_reset_events() - Restore the IOSS & PSS configuration to default
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_reset_events(void)
-{
-	return telm_core_conf.telem_ops->reset_events();
-}
-EXPORT_SYMBOL_GPL(telemetry_reset_events);
-
-/**
- * telemetry_get_eventconfig() - Returns the pss and ioss events enabled
- * @pss_evtconfig: Pointer to PSS related configuration.
- * @ioss_evtconfig: Pointer to IOSS related configuration.
- * @pss_len:	   Number of u32 elements allocated for pss_evtconfig array
- * @ioss_len:	   Number of u32 elements allocated for ioss_evtconfig array
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_evtconfig,
-			      struct telemetry_evtconfig *ioss_evtconfig,
-			      int pss_len, int ioss_len)
-{
-	return telm_core_conf.telem_ops->get_eventconfig(pss_evtconfig,
-							 ioss_evtconfig,
-							 pss_len, ioss_len);
-}
-EXPORT_SYMBOL_GPL(telemetry_get_eventconfig);
-
-/**
- * telemetry_add_events() - Add IOSS & PSS configuration to existing settings.
- * @num_pss_evts:  Number of PSS Events (<29) in pss_evtmap. Can be 0.
- * @num_ioss_evts: Number of IOSS Events (<29) in ioss_evtmap. Can be 0.
- * @pss_evtmap:    Array of PSS Event-IDs to Enable
- * @ioss_evtmap:   Array of PSS Event-IDs to Enable
- *
- * Events are appended to Old Configuration. In case of total events > 28, it
- * returns error. Call telemetry_reset_events to reset after eventlog done
- *
- * Return: 0 success, < 0 for failure
- */
-int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
-			 u32 *pss_evtmap, u32 *ioss_evtmap)
-{
-	return telm_core_conf.telem_ops->add_events(num_pss_evts,
-						    num_ioss_evts, pss_evtmap,
-						    ioss_evtmap);
-}
-EXPORT_SYMBOL_GPL(telemetry_add_events);
-
 /**
  * telemetry_read_events() - Fetches samples as specified by evtlog.telem_evt_id
  * @telem_unit: Specify whether IOSS or PSS Read
diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index 9a499efa1e4d..60d3783de7ef 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -639,32 +639,6 @@ static int telemetry_setup(struct platform_device *pdev)
 	return 0;
 }
 
-static int telemetry_plt_update_events(struct telemetry_evtconfig pss_evtconfig,
-				struct telemetry_evtconfig ioss_evtconfig)
-{
-	int ret;
-
-	if ((pss_evtconfig.num_evts > 0) &&
-	    (TELEM_SAMPLE_PERIOD_INVALID(pss_evtconfig.period))) {
-		pr_err("PSS Sampling Period Out of Range\n");
-		return -EINVAL;
-	}
-
-	if ((ioss_evtconfig.num_evts > 0) &&
-	    (TELEM_SAMPLE_PERIOD_INVALID(ioss_evtconfig.period))) {
-		pr_err("IOSS Sampling Period Out of Range\n");
-		return -EINVAL;
-	}
-
-	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
-					TELEM_UPDATE);
-	if (ret)
-		pr_err("TELEMETRY Config Failed\n");
-
-	return ret;
-}
-
-
 static int telemetry_plt_set_sampling_period(u8 pss_period, u8 ioss_period)
 {
 	u32 telem_ctrl = 0;
@@ -780,90 +754,6 @@ static int telemetry_plt_get_sampling_period(u8 *pss_min_period,
 }
 
 
-static int telemetry_plt_reset_events(void)
-{
-	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
-	int ret;
-
-	pss_evtconfig.evtmap = NULL;
-	pss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
-	pss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
-
-	ioss_evtconfig.evtmap = NULL;
-	ioss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
-	ioss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
-
-	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
-					TELEM_RESET);
-	if (ret)
-		pr_err("TELEMETRY Reset Failed\n");
-
-	return ret;
-}
-
-
-static int telemetry_plt_get_eventconfig(struct telemetry_evtconfig *pss_config,
-					struct telemetry_evtconfig *ioss_config,
-					int pss_len, int ioss_len)
-{
-	u32 *pss_evtmap, *ioss_evtmap;
-	u32 index;
-
-	pss_evtmap = pss_config->evtmap;
-	ioss_evtmap = ioss_config->evtmap;
-
-	mutex_lock(&(telm_conf->telem_lock));
-	pss_config->num_evts = telm_conf->pss_config.ssram_evts_used;
-	ioss_config->num_evts = telm_conf->ioss_config.ssram_evts_used;
-
-	pss_config->period = telm_conf->pss_config.curr_period;
-	ioss_config->period = telm_conf->ioss_config.curr_period;
-
-	if ((pss_len < telm_conf->pss_config.ssram_evts_used) ||
-	    (ioss_len < telm_conf->ioss_config.ssram_evts_used)) {
-		mutex_unlock(&(telm_conf->telem_lock));
-		return -EINVAL;
-	}
-
-	for (index = 0; index < telm_conf->pss_config.ssram_evts_used;
-	     index++) {
-		pss_evtmap[index] =
-		telm_conf->pss_config.telem_evts[index].evt_id;
-	}
-
-	for (index = 0; index < telm_conf->ioss_config.ssram_evts_used;
-	     index++) {
-		ioss_evtmap[index] =
-		telm_conf->ioss_config.telem_evts[index].evt_id;
-	}
-
-	mutex_unlock(&(telm_conf->telem_lock));
-	return 0;
-}
-
-
-static int telemetry_plt_add_events(u8 num_pss_evts, u8 num_ioss_evts,
-				    u32 *pss_evtmap, u32 *ioss_evtmap)
-{
-	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
-	int ret;
-
-	pss_evtconfig.evtmap = pss_evtmap;
-	pss_evtconfig.num_evts = num_pss_evts;
-	pss_evtconfig.period = telm_conf->pss_config.curr_period;
-
-	ioss_evtconfig.evtmap = ioss_evtmap;
-	ioss_evtconfig.num_evts = num_ioss_evts;
-	ioss_evtconfig.period = telm_conf->ioss_config.curr_period;
-
-	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
-					TELEM_ADD);
-	if (ret)
-		pr_err("TELEMETRY ADD Failed\n");
-
-	return ret;
-}
-
 static int telem_evtlog_read(enum telemetry_unit telem_unit,
 			     struct telem_ssram_region *ssram_region, u8 len)
 {
@@ -1096,11 +986,7 @@ static const struct telemetry_core_ops telm_pltops = {
 	.set_sampling_period = telemetry_plt_set_sampling_period,
 	.get_sampling_period = telemetry_plt_get_sampling_period,
 	.raw_read_eventlog = telemetry_plt_raw_read_eventlog,
-	.get_eventconfig = telemetry_plt_get_eventconfig,
-	.update_events = telemetry_plt_update_events,
 	.read_eventlog = telemetry_plt_read_eventlog,
-	.reset_events = telemetry_plt_reset_events,
-	.add_events = telemetry_plt_add_events,
 };
 
 static int telemetry_pltdrv_probe(struct platform_device *pdev)
-- 
2.49.0

