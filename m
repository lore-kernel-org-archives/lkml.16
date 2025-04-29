Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C152192E1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886875; cv=none; b=n/arscvU2L3Z9gPiHh/ZxrlomIt8hxJlIGp+HTVZBG6zSgyEqaiOw3qxo25GIzMhWPBYlghbld6guDAiQkYg8dxId0wDOtXfJq0QH1G+71aqIepNg5nLkI+U1e8o5zGfGevmDAWcvhfPZzrT4lsLR9Q2qoj65+QwU8XxDyP3mt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886875; c=relaxed/simple;
	bh=NlNHfrc2wwtjmk4C/GF1Qzcg97B066KGqDpMx3SpahE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A24jGsQcHgiHWHwe5jafgr1Bfa5GCjH9I0SHBa75ezcn59diOEJ6yIp7AnqUW90q1NTow2k6mQyVNt5B8zEjEfhY5kGki9w+tYxQtziWtmHROvtVMFT/DYcpyPLNrH+b2ncahSNy5n4tSA76D2+YNoE0Z2LeXgFQSca/Esp1zPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxRmhrAa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxRmhrAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745886873; x=1777422873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NlNHfrc2wwtjmk4C/GF1Qzcg97B066KGqDpMx3SpahE=;
  b=FxRmhrAacMFZ1t+lvfU/UMR6QgUXTMvBN4vF152liDmVarABU8TS3SGD
   zKT86hlwsk+oxuy98PnatFVtKZLlYpkKIMjgUG20WBLS2Ei1iV+tCm7cG
   HbFVMdnYGlE5JnqNjX33gYjgVAvlY9W2k+HypGIQPUgbHSpR4k7edtR5q
   v21dJ5MqQOofcppaNw23lDfU00QU+l7LiMmwu6CAw4D72tzz2iV7xqvpK
   34So8gk4CuZDMUmnhnm91eFL1gwseX88dWv/6QX+yIkhFjr3ktEpQFvZS
   SNFziWB0aNO5gHZcbCn7leND3I3FGn+WtEpAqwaYxzvAMdZHqwhkbX6tH
   w==;
X-CSE-ConnectionGUID: Ngu22ZLzQu+NER1/Sd581Q==
X-CSE-MsgGUID: kDZOid8HQmqCzqmFVim9UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58148325"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="58148325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:25 -0700
X-CSE-ConnectionGUID: BbRAxVpCQiOwZ+GE78soDA==
X-CSE-MsgGUID: abSf4hMMQOiC8TP6ltieMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133394091"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:24 -0700
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
Subject: [PATCH v4 30/31] x86/resctrl: Add info/PERF_PKG_MON/status file
Date: Mon, 28 Apr 2025 17:33:56 -0700
Message-ID: <20250429003359.375508-31-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429003359.375508-1-tony.luck@intel.com>
References: <20250429003359.375508-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each telemetry aggregator provides three status registers at the top
end of MMIO space after all the per-RMID per-event counters:

  agg_data_loss_count: This counts the number of times that this aggregator
  failed to accumulate a counter value supplied by a CPU core.

  agg_data_loss_timestamp: This is a "timestamp" from a free running
  25MHz uncore timer indicating when the most recent data loss occurred.

  last_update_timestamp: Another 25MHz timestamp indicating when the
  most recent counter update was successfully applied.

When the resctrl file system is mounted with the "-o debug" option
display the values of each of these status registers for each aggregator
in each enabled event group.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index eec5eb625f13..80a8af3c4711 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/resctrl.h>
+#include <linux/seq_file.h>
 
 /* Temporary - delete from final version */
 #include "fake_intel_aet_features.h"
@@ -241,6 +242,33 @@ static bool get_pmt_feature(enum pmt_feature_id feature)
 	return false;
 }
 
+static void show_debug(struct seq_file *s, struct event_group *e, int pkg, int instance)
+{
+	u64 *info __iomem = e->pkginfo[pkg]->addrs[instance] + e->mmio_size;
+
+	/* Information registers are the last three qwords in MMIO space */
+	seq_printf(s, "%s %d:%d agg_data_loss_count = %llu\n", e->name, pkg, instance,
+		   readq(&info[-3]));
+	seq_printf(s, "%s %d:%d agg_data_loss_timestamp = %llu\n", e->name, pkg, instance,
+		   readq(&info[-2]));
+	seq_printf(s, "%s %d:%d last_update_timestamp = %llu\n", e->name, pkg, instance,
+		   readq(&info[-1]));
+}
+
+static void info_debug(struct seq_file *s)
+{
+	int num_pkgs = topology_max_packages();
+	struct event_group **eg;
+
+	for (eg = &known_event_groups[0]; eg < &known_event_groups[NUM_KNOWN_GROUPS]; eg++) {
+		if (!(*eg)->pfg)
+			continue;
+		for (int i = 0; i < num_pkgs; i++)
+			for (int j = 0; j < (*eg)->pkginfo[i]->count; j++)
+				show_debug(s, *eg, i, j);
+	}
+}
+
 /*
  * Ask OOBMSM discovery driver for all the RMID based telemetry groups
  * that it supports.
@@ -263,6 +291,8 @@ bool intel_aet_get_events(void)
 			r->num_rmid = (*eg)->num_rmids;
 	}
 
+	r->info_debug = info_debug;
+
 	return ret1 || ret2;
 }
 
-- 
2.48.1

