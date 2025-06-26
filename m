Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4412EF9A5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956614; cv=none; b=J1dMO2J9AehR2TUrCtKJbUNzl5KvzzKsRqYGQVKMDNiCtP73JYJCyFtS1usPS8XHqNTjEv/X4fpQCO2GaFbsxkxph2zX69W4Od4MZuxUKyjuNizxhqK68lI1Q2XjqM/VKr9Q7r0vfTw/fqNFv3895uuxNEyaQ5iKDOmZPWtXqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956614; c=relaxed/simple;
	bh=RpYFUy2O9CGMMJDf9l9spIDCvPqctTPV+Vyp3ypoL80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBcUoWvh/pAcEEilhgwRz5vJwF0JUVmO+q/1DGMZXQmMoOLsgsMptV7JEIdejZ6g9kQFrqssXeTk77MTtYR+aF5P5cR/wkoTIYXPsubHeBNlcXR3rpUiX627kOG6BgoPz5pAo4/FwgqPtbLWa2vlNFp1wl5yX9NgIMcaT//e9S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZsbGXOm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZsbGXOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750956613; x=1782492613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpYFUy2O9CGMMJDf9l9spIDCvPqctTPV+Vyp3ypoL80=;
  b=DZsbGXOmgDdd+1YVRss8XBxQxX0DO2fTR4vwt2jSANl4Qya+702w5I5s
   JrOxoMEL0EIBr6jf2ojS3eUpR32+bP0isyraDzBGM9NcNKe5jQXdof1BG
   AaS1u4NNgaHbsfK7vO47zKuiQCuP3GASMvc1NATPc3EuEgktGe3KD/9h4
   qTFbeLfAexPjqeUgzQDLbDOIoZAuRRSOWgfUYhqXDfwudOFSyXKVC4y5F
   KrkQKdGYQ173iaojVOdQ5rqiJ0bsbjMKUJAtjxn6Hqufqbu01inf1XzZB
   3Dspq9oCWem7zbKC97n8AVv7AUnIn1UDjANxFvcmCzLecWgaJh+qpeoYJ
   g==;
X-CSE-ConnectionGUID: UUtmmh6eTNaFsW3olY+zbQ==
X-CSE-MsgGUID: vK9aZF0ZQ/C4rQyS55jo1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53136543"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53136543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:50:04 -0700
X-CSE-ConnectionGUID: VIcc13G9SyeXMliNZ47Q3A==
X-CSE-MsgGUID: XVtOF16vS16FlBjxUm27gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153069351"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:50:03 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 28/30] fs/resctrl: Provide interface to create a debugfs info directory
Date: Thu, 26 Jun 2025 09:49:37 -0700
Message-ID: <20250626164941.106341-29-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626164941.106341-1-tony.luck@intel.com>
References: <20250626164941.106341-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures are constrained to just the file interfaces provided by
the file system for each resource. This does not allow for architecture
specific debug interfaces.

Add resctrl_debugfs_mon_info_mkdir() which creates a directory in the
debugfs file system for a resource. Naming follows the layout of the
main resctrl hierarchy:

	/sys/kernel/debug/resctrl/info/{resource}_MON

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h |  6 ++++++
 fs/resctrl/rdtgroup.c   | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 35ae24822493..a8ffd9f61c46 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -569,6 +569,12 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
+/**
+ * resctrl_debugfs_mon_info_arch_mkdir() - Create a debugfs info directory.
+ * @r:	Resource (must be mon_capable).
+ */
+struct dentry *resctrl_debugfs_mon_info_arch_mkdir(struct rdt_resource *r);
+
 int resctrl_init(void);
 void resctrl_exit(void);
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3d87e6c4c600..511362a67532 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -24,6 +24,7 @@
 #include <linux/sched/task.h>
 #include <linux/slab.h>
 #include <linux/user_namespace.h>
+#include <linux/utsname.h>
 
 #include <uapi/linux/magic.h>
 
@@ -4350,6 +4351,29 @@ int resctrl_init(void)
 	return ret;
 }
 
+/*
+ * Create /sys/kernel/debug/resctrl/info/{r->name}_MON/arch directory
+ * by request for architecture to use.
+ */
+struct dentry *resctrl_debugfs_mon_info_arch_mkdir(struct rdt_resource *r)
+{
+	static struct dentry *debugfs_resctrl_info;
+	struct dentry *moninfodir;
+	char name[32];
+
+	if (!r->mon_capable)
+		return NULL;
+
+	if (!debugfs_resctrl_info)
+		debugfs_resctrl_info = debugfs_create_dir("info", debugfs_resctrl);
+
+	sprintf(name, "%s_MON", r->name);
+
+	moninfodir =  debugfs_create_dir(name, debugfs_resctrl_info);
+
+	return debugfs_create_dir(utsname()->machine, moninfodir);
+}
+
 static bool resctrl_online_domains_exist(void)
 {
 	struct rdt_resource *r;
-- 
2.49.0

