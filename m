Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1B2459F3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867873; cv=none; b=m/mWiZRmYqbKCt75DA8WDTRLlv4gSI1L/7uy4LUn3mtED9CRYAROs9PNGjaF6TBXsvczzjWBei69YieLxXuouMGaouto+uPT+lOIkOva1kQ8yChcD09kUW2jXy0f/CyUykInO7t3GqreOln3OKjMjtYPgX1xu/AT4O5LoYlFNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867873; c=relaxed/simple;
	bh=tFZIOgmF1yBHMePyVDJXVVS9f4ngI3WXCqT1ILeychM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqgnIjatD6YK/DHwWBAVYvC4Uu7KtoriGREBQ2nXVP+3jlFr9MQInN/18ugQB6ocNKXLGQ5GjJM1F9IfPJUoXvt+PfXTd1if1U6WmWvDC1akEoAgLsdI9qWJZSfEUR9B07L5Hya8X1EFfVnwD1qR2QlTDViZyehAj6MCaI15FUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKH9A6YE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKH9A6YE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867871; x=1779403871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tFZIOgmF1yBHMePyVDJXVVS9f4ngI3WXCqT1ILeychM=;
  b=JKH9A6YEYZpwmJIA+v5tf0aVUtXEf0o6Br758hQ4onY4yjVMYZ21K6Gu
   dFPvgToeIV7WEess179b3fJjFWMqfwl/SyaU9NPG0GqGdm15k4u8JSlrm
   /Z2TRjcTHjicsuCtZib+lSAnK910owbjrZj0Seqzc7mI+W1dVzJDsnB5X
   0hIQOAoNSHRymjxaH6a7RVBDWX5WIANuupxbpVxK7wxLQ9+hN9LoyDcDa
   dRa+oHMGMbUNbiCmYpvCcDzgGf0JYjcdXvVexrLEOmnFkNIpoagamHR+S
   zjW0+9f/GUyKabshvTSQ8IXVlLZCZ2i/krDhvoTHTZP/85gTTRicNcC/l
   w==;
X-CSE-ConnectionGUID: i4JHuDsbSpyHOIRu96O9rQ==
X-CSE-MsgGUID: hYoUU38SQpOJfelW7q4Ttw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53677823"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53677823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:51:00 -0700
X-CSE-ConnectionGUID: UCwfJBwyQdy9Xpy3VZxTQg==
X-CSE-MsgGUID: BLn1/SjZTgaA+zcfYnixXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141352197"
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
Subject: [PATCH v5 24/29] x86/resctrl: Add energy/perf choices to rdt boot option
Date: Wed, 21 May 2025 15:50:42 -0700
Message-ID: <20250521225049.132551-25-tony.luck@intel.com>
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

Users may want to force either of the telemetry features on
(in the case where they are disabled due to erratum) or off
(in the case that a limited number of RMIDs for a telemetry
feature reduces the number of monitor groups that can be
created.)

Unlike other options that are tied to X86_FEATURE_* flags,
these must be queried by name. Add a function to do that.

Add checks for users who forced either feature off.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  4 +++
 arch/x86/kernel/cpu/resctrl/core.c            | 28 +++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/intel_aet.c       |  6 ++++
 4 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..4811bc812f0f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5988,7 +5988,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, energy, perf.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 42da0a222c7c..524f3c183900 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -167,6 +167,10 @@ void __init intel_rdt_mbm_apply_quirk(void);
 
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 
+bool rdt_is_option_force_enabled(char *option);
+
+bool rdt_is_option_force_disabled(char *option);
+
 bool intel_aet_get_events(void);
 void __exit intel_aet_exit(void);
 int intel_aet_read_event(int domid, int rmid, enum resctrl_event_id evtid, u64 *val);
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f07f5b58639a..b23309566500 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -797,6 +797,8 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_ENERGY,
+	RDT_FLAG_PERF,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -822,6 +824,8 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ENERGY,    "energy",	0),
+	RDT_OPT(RDT_FLAG_PERF,	    "perf",	0),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
@@ -871,6 +875,30 @@ bool rdt_cpu_has(int flag)
 	return ret;
 }
 
+bool rdt_is_option_force_enabled(char *name)
+{
+	struct rdt_options *o;
+
+	for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
+		if (!strcmp(name, o->name))
+			return o->force_on;
+	}
+
+	return false;
+}
+
+bool rdt_is_option_force_disabled(char *name)
+{
+	struct rdt_options *o;
+
+	for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
+		if (!strcmp(name, o->name))
+			return o->force_off;
+	}
+
+	return false;
+}
+
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 {
 	if (!rdt_cpu_has(X86_FEATURE_BMEC))
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index be52c9302a80..c1fc85dbf0d8 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -51,6 +51,7 @@ struct pmt_event {
 
 /**
  * struct event_group - All information about a group of telemetry events.
+ * @name:		Name for this group (used by boot rdt= option)
  * @pfg:		Points to the aggregated telemetry space information
  *			within the OOBMSM driver that contains data for all
  *			telemetry regions.
@@ -62,6 +63,7 @@ struct pmt_event {
  */
 struct event_group {
 	/* Data fields used by this code. */
+	char				*name;
 	struct pmt_feature_group	*pfg;
 	struct mmio_info		**pkginfo;
 
@@ -77,6 +79,7 @@ struct event_group {
  * File: xml/CWF/OOBMSM/RMID-ENERGY/cwf_aggregator.xml
  */
 static struct event_group energy_0x26696143 = {
+	.name		= "energy",
 	.guid		= 0x26696143,
 	.mmio_size	= (576 * 2 + 3) * 8,
 	.num_events	= 2,
@@ -91,6 +94,7 @@ static struct event_group energy_0x26696143 = {
  * File: xml/CWF/OOBMSM/RMID-PERF/cwf_aggregator.xml
  */
 static struct event_group perf_0x26557651 = {
+	.name		= "perf",
 	.guid		= 0x26557651,
 	.mmio_size	= (576 * 7 + 3) * 8,
 	.num_events	= 7,
@@ -247,6 +251,8 @@ static bool get_pmt_feature(enum pmt_feature_id feature)
 	for (peg = &known_event_groups[0]; peg < &known_event_groups[NUM_KNOWN_GROUPS]; peg++) {
 		for (int i = 0; i < p->count; i++) {
 			if ((*peg)->guid == p->regions[i].guid) {
+				if (rdt_is_option_force_disabled((*peg)->name))
+					return false;
 				ret = configure_events(*peg, p);
 				if (!ret) {
 					(*peg)->pfg = no_free_ptr(p);
-- 
2.49.0

