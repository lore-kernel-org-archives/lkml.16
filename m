Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76F244685
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867872; cv=none; b=ATBUflYJ5eZim5AsyB5KpZpADkTURiR59+d/2/9u6a/eUfKgsGi486qLg9Pc9LWozp0o8hGXFATWTn0Edgoy+UTUK3V/Llec686r1vJN+Ys/LttmRaYixKfemYoHAJdT5V6aBFuz3umzDa7ka05ez6mC3DpvQh6zpE+6vR/1uNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867872; c=relaxed/simple;
	bh=2MysUjKQnyqtaSPcf1h7ioPaq/BxZtCdUKufIMkwxg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0WABYQu4uQJfuMPw2uZ4kcBDZImS9VgNChRqT5HZAAZnfHN6b6TG6iC1vtIKmJmnuBwFXeQ3D2JpZbW7isQ7P4+fW4OIW+B4XmBTTiZlvMx5McP0vNe4Qmo5MGq41nTqlvqMyL7Yy4qm1eEdL60xDzl7yfzf804SnI1J+iNZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2VhshKN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2VhshKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867870; x=1779403870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MysUjKQnyqtaSPcf1h7ioPaq/BxZtCdUKufIMkwxg4=;
  b=P2VhshKNceNhu8Q5bnG4SsQGkXD6qOvtTIOhbWNHzl0RrfrnZm1CCj7u
   k74pz8lfYkecMCukT6DVektjAotqqz5pmvYIbbKZlpg5fy5ErYk3QAJjA
   1JxXW1q7xnllYgVLCm17P4Y6N1mqO9mJinyF758PIclTn65gNvZbIjiPa
   uEB+/mp0triv7ycKQLGB16CLiTl7BOfpy12CR2BE8zLJlvbhOtEoLks2C
   7oNKGT312FUERjP/kraDPCjcMAdFDHjWZGsT3ButYHyR/dWPaS3+Jm5SN
   /VAzeQwvGrmlkMWOULEN0FMyTZbwy11sMUbo/rVY9SJoTNKtUUBGda8ET
   Q==;
X-CSE-ConnectionGUID: p7Gp1oQ6TG+HlweaN7mH/w==
X-CSE-MsgGUID: HYNqjypSQPOT+1HTPcbZGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53677796"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53677796"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:59 -0700
X-CSE-ConnectionGUID: MOlEEor5SH2ym2TBCiMzpA==
X-CSE-MsgGUID: 8OPnoIgkRAK7NyXqbeDKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141352179"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:58 -0700
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
Subject: [PATCH v5 19/29] x86/resctrl: Complete telemetry event enumeration
Date: Wed, 21 May 2025 15:50:37 -0700
Message-ID: <20250521225049.132551-20-tony.luck@intel.com>
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

Counters for telemetry events are in MMIO space. Each telemetry_region
structure returned in the pmt_feature_group returned from OOBMSM
contains the base MMIO address for the counters.

Scan all the telemetry_region structures again and gather these
addresses into a more convenient structure with addresses for
each aggregator indexed by package id. Note that there may be
multiple aggregators per package.

Completed structure for each event group looks like this:

             +---------------------+---------------------+
pkginfo** -->|   pkginfo[0]         |    pkginfo[1]      |
             +---------------------+---------------------+
                        |                     |
                        v                     v
                +----------------+    +----------------+
                |struct mmio_info|    |struct mmio_info|
                +----------------+    +----------------+
                |   count = N    |    |   count = N    |
                |  addrs[0]      |    |  addrs[0]      |
                |  addrs[0]      |    |  addrs[0]      |
                |    ...         |    |    ...         |
                |  addrs[N-1]    |    |  addrs[N-1]    |
                +----------------+    +----------------+

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 65 ++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index ffcb54be54ea..2316198eb69e 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -21,17 +21,32 @@
 
 #include "internal.h"
 
+/**
+ * struct mmio_info - Array of MMIO addresses for one event group for a package
+ * @count:		Number of addresses on this package
+ * @addrs:		The MMIO addresses
+ *
+ * Provides convenient access to all MMIO addresses of one event group
+ * for one package. Used when reading event data on a package.
+ */
+struct mmio_info {
+	int		count;
+	void __iomem	*addrs[] __counted_by(count);
+};
+
 /**
  * struct event_group - All information about a group of telemetry events.
  * @pfg:		Points to the aggregated telemetry space information
  *			within the OOBMSM driver that contains data for all
  *			telemetry regions.
+ * @pkginfo:		Per-package MMIO addresses of telemetry regions belonging to this group
  * @guid:		Unique number per XML description file.
  * @mmio_size:		Number of bytes of MMIO registers for this group.
  */
 struct event_group {
 	/* Data fields used by this code. */
 	struct pmt_feature_group	*pfg;
+	struct mmio_info		**pkginfo;
 
 	/* Remaining fields initialized from XML file. */
 	u32				guid;
@@ -80,6 +95,20 @@ static bool skip_this_region(struct telemetry_region *tr, struct event_group *e)
 	return false;
 }
 
+static void free_mmio_info(struct mmio_info **mmi)
+{
+	int num_pkgs = topology_max_packages();
+
+	if (!mmi)
+		return;
+
+	for (int i = 0; i < num_pkgs; i++)
+		kfree(mmi[i]);
+	kfree(mmi);
+}
+
+DEFINE_FREE(mmio_info, struct mmio_info **, free_mmio_info(_T))
+
 /*
  * Configure events from one pmt_feature_group.
  * 1) Count how many per package.
@@ -87,10 +116,17 @@ static bool skip_this_region(struct telemetry_region *tr, struct event_group *e)
  */
 static int configure_events(struct event_group *e, struct pmt_feature_group *p)
 {
+	struct mmio_info __free(mmio_info) **pkginfo = NULL;
 	int *pkgcounts __free(kfree) = NULL;
 	struct telemetry_region *tr;
+	struct mmio_info *mmi;
 	int num_pkgs;
 
+	if (e->pkginfo) {
+		pr_warn("Duplicate telemetry information for guid 0x%x\n", e->guid);
+		return -EINVAL;
+	}
+
 	num_pkgs = topology_max_packages();
 	pkgcounts = kcalloc(num_pkgs, sizeof(*pkgcounts), GFP_KERNEL);
 	if (!pkgcounts)
@@ -104,7 +140,33 @@ static int configure_events(struct event_group *e, struct pmt_feature_group *p)
 		pkgcounts[tr->plat_info.package_id]++;
 	}
 
-	return -EINVAL;
+	/* Allocate array for per-package struct mmio_info data */
+	pkginfo = kcalloc(num_pkgs, sizeof(*pkginfo), GFP_KERNEL);
+	if (!pkginfo)
+		return -ENOMEM;
+
+	/*
+	 * Allocate per-package mmio_info structures and initialize
+	 * count of telemetry_regions in each one.
+	 */
+	for (int i = 0; i < num_pkgs; i++) {
+		pkginfo[i] = kzalloc(struct_size(pkginfo[i], addrs, pkgcounts[i]), GFP_KERNEL);
+		if (!pkginfo[i])
+			return -ENOMEM;
+		pkginfo[i]->count = pkgcounts[i];
+	}
+
+	/* Save MMIO address(es) for each telemetry region in per-package structures */
+	for (int i = 0; i < p->count; i++) {
+		tr = &p->regions[i];
+		if (skip_this_region(tr, e))
+			continue;
+		mmi = pkginfo[tr->plat_info.package_id];
+		mmi->addrs[--pkgcounts[tr->plat_info.package_id]] = tr->addr;
+	}
+	e->pkginfo = no_free_ptr(pkginfo);
+
+	return 0;
 }
 
 DEFINE_FREE(intel_pmt_put_feature_group, struct pmt_feature_group *,	\
@@ -168,5 +230,6 @@ void __exit intel_aet_exit(void)
 			intel_pmt_put_feature_group((*peg)->pfg);
 			(*peg)->pfg = NULL;
 		}
+		free_mmio_info((*peg)->pkginfo);
 	}
 }
-- 
2.49.0

