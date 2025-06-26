Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD12EBDFF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956597; cv=none; b=ELXrkGa4kKHLz0dlLHW5/RP/3PE9sik333/EoLVybtqeC10WZ8xAr3EuRSwVyQxec5BmT4ZAYSWj5Zp0f7UokDrXwayGhzWA6n8jE6FNqmj61sZj4gMvlrYlqsa1d0iJewIewgJ5PRkgRrtE9LJ7qdNB0CEXHNxKB0lDpq385Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956597; c=relaxed/simple;
	bh=fpNYlYp4P970kfOQQ5H3EWQ5bRaaco6gyifMD5aw5Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayXyT7Tgc/6WjfVyakEacirinrt1IFq9AywE7wuYWq8SsjHAaqv2Pp6ZWxgZGAs1y75Bki1PFcIijzAgvx85JKRx+7HDI5C8tzmNuwni7+ZNSdLO7xc4tHF2F0+hra7RaAswamnGS9MGkp7GZTHj+Ph8MWekGljEwW8fLAg2d1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl8g6w+g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl8g6w+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750956597; x=1782492597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpNYlYp4P970kfOQQ5H3EWQ5bRaaco6gyifMD5aw5Lo=;
  b=Fl8g6w+gw4agkmPj4cp1c4YVd1DqP7+aImwG7yO5UlaW3k/9j3vrg2Hq
   qb/07FasQDoI4IJNudopD/LhQeF7nYMguThyvSZGc2t1lJYvg6Es2MtT3
   +msyI9PhL/7ukoiKcTNU0CAd68AnJk5CDZK/vyfeAccQxObGQdgsDFaDs
   EsqEkY0zAeTf0uOu+Mb8XG8AUpOsc3Jy7gGQKUf6pPAbiHcAPovxmljeI
   HkPg9D/RAhqaFEkbph3UDaF+7+oti+lua8DJ0m5OUN4JaF+YyA/xl37l+
   NcquSGmpC4AVhdP/wBmha7ZJOBc5knHzO5UoOvsFPx+cajPrpaNOsirae
   g==;
X-CSE-ConnectionGUID: /ilZ+c86QoeCaav1NcF+GA==
X-CSE-MsgGUID: l561hvM1TXKyt/jUTb0uEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53136365"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53136365"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:54 -0700
X-CSE-ConnectionGUID: UUja31bLRIy10xts4DlssA==
X-CSE-MsgGUID: TI02uNfOTgSPmgv5DP7N3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153069184"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:53 -0700
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
Subject: [PATCH v6 07/30] x86,fs/resctrl: Refactor domain_remove_cpu_mon() ready for new domain types
Date: Thu, 26 Jun 2025 09:49:16 -0700
Message-ID: <20250626164941.106341-8-tony.luck@intel.com>
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

Historically all monitoring events have been associated with the L3
resource. This will change when support for telemetry events is added.

The RDT_RESOURCE_L3 resource carries a lot of state in the domain
structures which needs to be dealt with when a domain is taken offline
by removing the last CPU in the domain.

Refactor domain_remove_cpu_mon() so all the L3 processing is separated
from general actions of clearing the CPU bit in the mask and removing
directories from mon_data.

resctrl_offline_mon_domain() will still need to remove domain specific
directories and files from the "mon_data" directories, but can skip the
L3 resource specific cleanup when called for other resource types.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 17 +++++++++++------
 fs/resctrl/rdtgroup.c              |  5 ++++-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 20b6f2bbf858..4bf264b6a333 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -648,17 +648,22 @@ static void domain_remove_cpu_mon(int cpu, struct rdt_resource *r)
 	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		return;
 
-	d = container_of(hdr, struct rdt_mon_domain, hdr);
-	hw_dom = resctrl_to_arch_mon_dom(d);
-
 	cpumask_clear_cpu(cpu, &d->hdr.cpu_mask);
-	if (cpumask_empty(&d->hdr.cpu_mask)) {
+	if (!cpumask_empty(&d->hdr.cpu_mask))
+		return;
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L3:
+		d = container_of(hdr, struct rdt_mon_domain, hdr);
+		hw_dom = resctrl_to_arch_mon_dom(d);
 		resctrl_offline_mon_domain(r, d);
 		list_del_rcu(&d->hdr.list);
 		synchronize_rcu();
 		mon_domain_free(hw_dom);
-
-		return;
+		break;
+	default:
+		pr_warn_once("Unknown resource rid=%d\n", r->rid);
+		break;
 	}
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 77336d5e4915..05438e15e2ca 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4047,6 +4047,9 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, d);
 
+	if (r->rid != RDT_RESOURCE_L3)
+		goto out_unlock;
+
 	if (resctrl_is_mbm_enabled())
 		cancel_delayed_work(&d->mbm_over);
 	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
@@ -4063,7 +4066,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 	}
 
 	domain_destroy_mon_state(d);
-
+out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.49.0

