Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A224679C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867877; cv=none; b=TbDdmSEjZq6plAAXYTodZykwWU+p2K6mAqIh4I90ZqFFGNjoD/52HCZ1bbxSPT0yXei9FClpwCC1NWcb1A+/rH9MP+jr3e48Kyttx8DLHFkOz0wdKuf9/kxkw3Ir+4dWgikQ0R8BUExl7jYQzXX6ZLop0hzTRZgU+34WTq6axtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867877; c=relaxed/simple;
	bh=nTKGW0I+DoGgJM+8xAB2cEl0yFDD+Y66fzXvGw9DxBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tb6T+POSilaExWP1l0xToWMyfUU3qW5HGg6qtasfmWaRfbNsVWH0gaem6jDNw1riWPr3htjDpNoY7MRq+FO/mqUjQUS2+Q1k0y8sYQooFT8unL4XA1PXxvdk2Lef4czPnx6YlW3CyYWi2zoT3Lx1ezdauI86FXXJzdbHg5tnfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIGAMQVl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIGAMQVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867875; x=1779403875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nTKGW0I+DoGgJM+8xAB2cEl0yFDD+Y66fzXvGw9DxBk=;
  b=gIGAMQVl4dbfcHP7IGuRgmKGBgPjc9IwCAOei1FWcDJ62/dyOhRfB7p4
   6OHtQ290/bmjOR22m1J6uyoRlQ9rC83xycn+G5w+9TPNHY3m9USJ7DqKE
   p153sYXMX4zsmZcylytBJowLlV7gNJQVC78Uai47nU7n0QCHX4iFtUo9n
   bIa1FxEnkhdXQQLIsaPU1EditFHRaZrtcGRnStio35s61L616wugiS/80
   zfzSy4Z3cuLlZuO+Cd6cEDOuELFwXzBodb5DOZ5V1kjO1e7TeEIAw7i88
   0dMDby4EHsFuOPM7UTPADz5D3H//lgrscbwzfIUghaL1JasoBh/N+PHJO
   w==;
X-CSE-ConnectionGUID: fNOY9KN6QBeDOk+FcyW1iQ==
X-CSE-MsgGUID: 3A++0sT+QKe+BD/r4gBJCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53677839"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53677839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:51:00 -0700
X-CSE-ConnectionGUID: sAqNBOaLS1yAwHJlCHn5Mg==
X-CSE-MsgGUID: LqS3nE6ET5q2MpXEJN56uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141352209"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:59 -0700
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
Subject: [PATCH v5 28/29] x86/resctrl: Add info/PERF_PKG_MON/status file
Date: Wed, 21 May 2025 15:50:46 -0700
Message-ID: <20250521225049.132551-29-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521225049.132551-1-tony.luck@intel.com>
References: <20250521225049.132551-1-tony.luck@intel.com>
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
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 1b41167ad976..459e42459178 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/resctrl.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 
 /* Temporary - delete from final version */
@@ -282,6 +283,35 @@ static bool get_pmt_feature(enum pmt_feature_id feature)
 	return false;
 }
 
+static void show_debug(struct seq_file *s, struct event_group *e, int pkg, int instance)
+{
+	void __iomem *info = e->pkginfo[pkg]->addrs[instance] + e->mmio_size;
+
+	/* Information registers are the last three qwords in MMIO space */
+	seq_printf(s, "%s %d:%d agg_data_loss_count = %llu\n", e->name, pkg, instance,
+		   readq(info - 24));
+	seq_printf(s, "%s %d:%d agg_data_loss_timestamp = %llu\n", e->name, pkg, instance,
+		   readq(info - 16));
+	seq_printf(s, "%s %d:%d last_update_timestamp = %llu\n", e->name, pkg, instance,
+		   readq(info - 8));
+}
+
+static int info_status(struct kernfs_open_file *of, struct seq_file *s, void *v)
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
+
+	return 0;
+}
+
 /*
  * Ask OOBMSM discovery driver for all the RMID based telemetry groups
  * that it supports.
@@ -304,6 +334,10 @@ bool intel_aet_get_events(void)
 			r->num_rmid = (*eg)->num_rmids;
 	}
 
+	r->info_file.name = "status";
+	r->info_file.seq_show = info_status;
+	r->info_file.flags = RFTYPE_DEBUG;
+
 	return ret1 || ret2;
 }
 
-- 
2.49.0

