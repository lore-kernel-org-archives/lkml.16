Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD75212B28
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072139; cv=none; b=OjEV5/5I3IZMHnaRy45JIfGho+46HRp52vTAHEOesCOXK6cf2RG73lsGU/+iXw0pXjH5kjQytn+5ALofNPkKO7kc/G0l6y6b7m+LggOv2ZE/lh/hgxHhmjuxNES137zIFqvU3lxLADEMLHDigcmZoVQBv8l8Fuhx0Q2/xuv86Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072139; c=relaxed/simple;
	bh=mrfi1QYiWikbPQQ1lTr4igmz0kTS4BErTnR8Ei3X7Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs/dG/p9DV7mnGMkPxAxnDgrFM6OB5VG1zppqXyfOlCE6ue+HWFrCVYHiffk+Y2aC845pNrD6Mh9Xx+4wxGX7xQOZbgnHihnsGX8p65MsjFwFyfyQiPz0Rxcffs0vtlTwKFgXl8G7xxIqJImsDmyw44tzP2u1ka7G8IRqPa8j2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqVmR8DZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqVmR8DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749072138; x=1780608138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrfi1QYiWikbPQQ1lTr4igmz0kTS4BErTnR8Ei3X7Js=;
  b=EqVmR8DZbc6UnIwG6kUoXfFV0/TZwKUoNILSHVaRXBcokaHvehvUYeIG
   ngBbOh5UVdqrm+9RWqUmGFnIOLvz64xjyfEON6VUPWRqK0XawaHs4g0uU
   lbDsgwm1bNaF7O7UR0DgaIGSePoTQWY7NnzWiXwQ6zd/wYR7Si5IHpej9
   qefplj/LS8c5UdFdQL63FPCZ+gWTCuuYhibQVxYtvZQ6NXYI6OSOXaX6q
   Yl4NXuk8mC8Z6HZsNF+nuxR3KLXHWC2t/TbR2o4da5q2+hd+n/KoCGeF1
   8nhgmHCzb9/pcFPN79KQLi/ITdid7mZOamLCTF3BxcsXU0x1tUU25mIQM
   A==;
X-CSE-ConnectionGUID: csK81Z0VSPWXPYNxcgWdsQ==
X-CSE-MsgGUID: 9hSuTKp8Tl6jWjs7Y7QZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="76572770"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="76572770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:22:15 -0700
X-CSE-ConnectionGUID: VGnvCGlYRAa2HGL5rgkX+A==
X-CSE-MsgGUID: MymtO8YsTuyjVTtDC0am4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150094196"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:22:15 -0700
From: Tony Luck <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v5 3/4 UPDATED] x86/resctrl: Remove 'rdt_mon_features' global variable
Date: Wed,  4 Jun 2025 14:22:07 -0700
Message-ID: <20250604212208.49080-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604212208.49080-1-tony.luck@intel.com>
References: <20250604212208.49080-1-tony.luck@intel.com>
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
index f02095625043..8ff76b9bd09b 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -861,21 +861,22 @@ static __init bool get_rdt_alloc_resources(void)
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

