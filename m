Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEBE21ABB4;
	Mon,  9 Jun 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486114; cv=none; b=KzXS3lsdcZKOqUDhk6f2p13W8R7DpOWfofVe6lIw6TKNb6dfCz3LRQgoElaKINJ48341OI7C3egIf40nz2ENDGf0+6emk9VvucM4j006Ho6CRhcHdJdT+gPlPrgHworp9ArgRkWvQoEE4bg0uNhwqZSyyiUNyqnv9HZMengMbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486114; c=relaxed/simple;
	bh=ohU9oFXgklw2CWCxEtCjAVewl1W1kGyl4PI2z+dhjBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRHrcsmc/8v718jdPhdhluLXjqC16306KBZFtk1bdfWi3CW09v+/dC+zNu97BI6A6eDHkFRQ7KxAlpIsp4ANnERj4w1swfKRaOBAq5tDhIoZUSxeVmge+FkjefipTGHHjGbVN9PntTD/fNmEJAJDF4WcYCfbdSJNaq0R8zU7+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0g34HVF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0g34HVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749486113; x=1781022113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ohU9oFXgklw2CWCxEtCjAVewl1W1kGyl4PI2z+dhjBI=;
  b=J0g34HVFD9Iqk7vsD0OyVd+6Rq0SIpeVdonrS8qzS8cpWmQLra2GjBw2
   RwHQsRKBit2cvP6xcPrWXThDPs6t75c1CkFGpVWuod7tsz0wX2AHoZcT5
   lp7pwQ4mNFiGcHvCcjQg+H/Lg9iwCKsI8BX7RdGDI7Q9LrlG1W+IhGft9
   l686PRZPKv6/8XiAK42dY/5EHUxtYmKSSMiOQPybkaGIwey/lv+FK0zNL
   vvLaHWJaIIchH5C611tZfxVty4I3c5YcRekX8UBy0rif3Pw4XZCN9FljX
   onIw5e016dOBCp/WO5jjYpoNjx1qCDHpDeiVDLIvsGdvXl8av6pmjZBNs
   w==;
X-CSE-ConnectionGUID: SiZgm4HURVSr4/rd+2QPog==
X-CSE-MsgGUID: hJkW96u9Q8+I7hbkO0MF+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55234409"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55234409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:49 -0700
X-CSE-ConnectionGUID: QoQApnVHSsiS6vpGnbZOmQ==
X-CSE-MsgGUID: ZaKeieYjQMaFXv/EzR0vfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177465802"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:48 -0700
From: Tony Luck <tony.luck@intel.com>
To: babu.moger@amd.com
Cc: Xiaojian.Du@amd.com,
	akpm@linux-foundation.org,
	alexandre.chartre@oracle.com,
	andrew.cooper3@citrix.com,
	ardb@kernel.org,
	bmoger@amd.com,
	bp@alien8.de,
	corbet@lwn.net,
	daniel.sneddon@linux.intel.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	ebiggers@google.com,
	eranian@google.com,
	fenghuay@nvidia.com,
	gautham.shenoy@amd.com,
	gregkh@linuxfoundation.org,
	hpa@zytor.com,
	james.morse@arm.com,
	jpoimboe@kernel.org,
	kai.huang@intel.com,
	kan.liang@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maciej.wieczor-retman@intel.com,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	perry.yuan@amd.com,
	peternewman@google.com,
	reinette.chatre@intel.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	sohil.mehta@intel.com,
	tglx@linutronix.de,
	thomas.lendacky@amd.com,
	thuth@redhat.com,
	tony.luck@intel.com,
	x86@kernel.org,
	xiaoyao.li@intel.com,
	xin3.li@intel.com,
	xin@zytor.com
Subject: [PATCH 4/5] x86/resctrl: Remove 'rdt_mon_features' global variable
Date: Mon,  9 Jun 2025 09:21:38 -0700
Message-ID: <20250609162139.91651-5-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609162139.91651-1-tony.luck@intel.com>
References: <20250609162139.91651-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rdt_mon_features is used as a bitmask of enabled monitor events. A monitor
event's status is now maintained in mon_evt::enabled with all monitor
events' mon_evt structures found in the filesystem's mon_event_all[] array.

Remove the remaining uses of rdt_mon_features.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/resctrl.h        | 1 -
 arch/x86/kernel/cpu/resctrl/core.c    | 9 +++++----
 arch/x86/kernel/cpu/resctrl/monitor.c | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index b1dd5d6b87db..575f8408a9e7 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -44,7 +44,6 @@ DECLARE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
 extern bool rdt_alloc_capable;
 extern bool rdt_mon_capable;
-extern unsigned int rdt_mon_features;
 
 DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 1a319ce9328c..5d14f9a14eda 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -863,21 +863,22 @@ static __init bool get_rdt_alloc_resources(void)
 static __init bool get_rdt_mon_resources(void)
 {
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_OCCUP_EVENT_ID);
+		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_MBM_TOTAL_EVENT_ID);
+		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_MBM_LOCAL_EVENT_ID);
+		ret = true;
 	}
 
-	if (!rdt_mon_features)
+	if (!ret)
 		return false;
 
 	return !rdt_get_mon_l3_config(r);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 61d38517e2bf..07f8ab097cbe 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -31,11 +31,6 @@
  */
 bool rdt_mon_capable;
 
-/*
- * Global to indicate which monitoring events are enabled.
- */
-unsigned int rdt_mon_features;
-
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
 static int snc_nodes_per_l3_cache = 1;
-- 
2.49.0

