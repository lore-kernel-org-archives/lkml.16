Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F7922F39C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069259; cv=none; b=XaafO8uczMSX9IrgmdzI81RdXhxD8YXGQfvA+HTzOONxnE1kxu+cnTnZ7LAkRgUjb05nXhwoU+3oXGHp8spEA3yolOy1wx9pko/udkfr6aoJ6kCK76+5oy8GK1OXDBTz6tM7TJqx2uO58Lv9DfU1fg71fxdupjBRfEVmzKaID7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069259; c=relaxed/simple;
	bh=cCoPp+BXCw1rV6uzrlZHHakPTSCFwZaMenLMYXftMaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD5VhezEuMV6N/7HZ6BOOPPm4N6dneSC8i7J1FDfDBJ/gWm76E/DAy8Hd4qwq9DDx/qDE74ZHUsLOxL6X7FlYLWIE4ZEyRZ+6hZ8cBPk+webFXAVdxskvMQ8JzL2X5NH1mEQWKTjiZY0qIP/4cnYJ7UM+vBJfGidMt3/zVyzecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmHCRFpo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmHCRFpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069257; x=1775605257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cCoPp+BXCw1rV6uzrlZHHakPTSCFwZaMenLMYXftMaA=;
  b=bmHCRFpoO/TOfPL1B1cLCFj2vlN1YqYdYVB+8OqqXw3pMYs/FodEEK8i
   VXSUpbtSo/lFUpvQml0UUMgjAAu5mFEZB5SpGGem+BINyFGXgWGKquC5X
   APRl17Amubrh6T//WfvACdvF76wK9qCqgl3zbBqq9I9nVJDXsEu47FZWc
   cH6RAsroe5nXF+D92+ei/EETl86WcrUtSGiO2vcx59v/cX6rhTABvO5gY
   8XohSAsY0PhiUxni+pvUikEQUDkLNtY8TZnbe79ZpOvLjPQ4cqaS7PVv6
   Q2AgbwaE9t+BJR9ewyE9SOP9+0hmWIGDwHv+b8KFgzGFteCXr+fjYxtlr
   g==;
X-CSE-ConnectionGUID: cNEEmVeRQCWbqVP9+Zx9Jg==
X-CSE-MsgGUID: Agt5xV2gSYijhk+mvcWLGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193226"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:52 -0700
X-CSE-ConnectionGUID: h2S8Z0sPQc+X5rjt84lfpA==
X-CSE-MsgGUID: jD4a5KxpSoCSJWO9N8IiVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315495"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:52 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v3 15/26] x86/resctrl: Second stage of telemetry event enumeration
Date: Mon,  7 Apr 2025 16:40:17 -0700
Message-ID: <20250407234032.241215-16-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407234032.241215-1-tony.luck@intel.com>
References: <20250407234032.241215-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Scan the telemetry_region structures looking for recognised guid
values. Count how many are found in each package.

Note that telemetry support depends on at least one of the
original RDT monitoring features being enabled (so that the
CPU hotplug notifiers for resctrl are running).

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 112 +++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 8e531ad279b5..9d414dd40f8b 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -23,10 +23,100 @@
 static struct pmt_feature_group *feat_energy;
 static struct pmt_feature_group *feat_perf;
 
+/* Per-package event groups active on this machine */
+static struct pkg_info {
+	int			count;
+	struct telemetry_region	*regions;
+} *pkg_info;
+
+/**
+ * struct pmt_event - Telemetry event.
+ * @evtid:	Resctrl event id
+ * @evt_offset:	MMIO offset of counter
+ * @type:	Type for format user display of event value
+ */
+struct pmt_event {
+	enum resctrl_event_id	evtid;
+	int			evt_offset;
+	enum resctrl_event_type	type;
+};
+
+/**
+ * struct telem_entry - Summarized form from XML telemetry description
+ * @name:			Name for this group of events
+ * @guid:			Unique ID for this group
+ * @size:			Size of MMIO mapped counter registers
+ * @num_rmids:			Number of RMIDS supported
+ * @overflow_counter_off:	Offset of overflow count
+ * @last_overflow_tstamp_off:	Offset of overflow timestamp
+ * @last_update_tstamp_off:	Offset of last update timestamp
+ * @active:			Marks this group as active on this system
+ * @num_events:			Size of @evts array
+ * @evts:			Telemetry events in this group
+ */
+struct telem_entry {
+	char	*name;
+	int	guid;
+	int	size;
+	int	num_rmids;
+	int	overflow_counter_off;
+	int	last_overflow_tstamp_off;
+	int	last_update_tstamp_off;
+	bool	active;
+	int	num_events;
+	struct pmt_event evts[];
+};
+
+/* All known telemetry event groups */
+static struct telem_entry *telem_entry[] = {
+	NULL
+};
+
+/*
+ * Scan a feature group looking for guids recognized
+ * and update the per-package counts of known groups.
+ */
+static bool count_events(struct pkg_info *pkg, int max_pkgs, struct pmt_feature_group *p)
+{
+	struct telem_entry **tentry;
+	bool found = false;
+
+	if (IS_ERR_OR_NULL(p))
+		return false;
+
+	for (int i = 0; i < p->count; i++) {
+		struct telemetry_region *tr = &p->regions[i];
+
+		for (tentry = telem_entry; *tentry; tentry++) {
+			if (tr->guid == (*tentry)->guid) {
+				if (tr->plat_info.package_id > max_pkgs) {
+					pr_warn_once("Bad package %d\n", tr->plat_info.package_id);
+					continue;
+				}
+				if (tr->size > (*tentry)->size) {
+					pr_warn_once("MMIO region for guid 0x%x too small\n", tr->guid);
+					continue;
+				}
+				found = true;
+				(*tentry)->active = true;
+				pkg[tr->plat_info.package_id].count++;
+				break;
+			}
+		}
+	}
+
+	return found;
+}
+
 DEFINE_FREE(intel_pmt_put_feature_group, struct pmt_feature_group *,	\
 	if (!IS_ERR_OR_NULL(_T))					\
 		intel_pmt_put_feature_group(_T))
 
+DEFINE_FREE(free_pkg_info, struct pkg_info *,				\
+	if (_T)								\
+		for (int i = 0; i < topology_max_packages(); i++)	\
+			kfree(_T[i].regions);				\
+	kfree(_T))
 /*
  * Ask OOBMSM discovery driver for all the RMID based telemetry groups
  * that it supports.
@@ -35,20 +125,32 @@ bool intel_aet_get_events(void)
 {
 	struct pmt_feature_group *p1 __free(intel_pmt_put_feature_group) = NULL;
 	struct pmt_feature_group *p2 __free(intel_pmt_put_feature_group) = NULL;
+	struct pkg_info *pkg __free(free_pkg_info) = NULL;
+	int num_pkgs = topology_max_packages();
 	bool use_p1, use_p2;
 
+	pkg = kcalloc(num_pkgs, sizeof(*pkg_info), GFP_KERNEL);
+	if (!pkg)
+		return false;
+
 	p1 = intel_pmt_get_regions_by_feature(FEATURE_PER_RMID_ENERGY_TELEM);
 	p2 = intel_pmt_get_regions_by_feature(FEATURE_PER_RMID_PERF_TELEM);
-	use_p1 = !IS_ERR_OR_NULL(p1);
-	use_p2 = !IS_ERR_OR_NULL(p2);
+	use_p1 = count_events(pkg, num_pkgs, p1);
+	use_p2 = count_events(pkg, num_pkgs, p2);
 
 	if (!use_p1 && !use_p2)
 		return false;
 
+	if (!resctrl_arch_mon_capable()) {
+		pr_info("Telemetry available but monitor support disabled\n");
+		return false;
+	}
+
 	if (use_p1)
 		feat_energy = no_free_ptr(p1);
 	if (use_p2)
 		feat_perf = no_free_ptr(p2);
+	pkg_info = no_free_ptr(pkg);
 
 	return true;
 }
@@ -59,4 +161,10 @@ void __exit intel_aet_exit(void)
 		intel_pmt_put_feature_group(feat_energy);
 	if (feat_perf)
 		intel_pmt_put_feature_group(feat_perf);
+
+	if (pkg_info) {
+		for (int i = 0; i < topology_max_packages(); i++)
+			kfree(pkg_info[i].regions);
+	}
+	kfree(pkg_info);
 }
-- 
2.48.1

