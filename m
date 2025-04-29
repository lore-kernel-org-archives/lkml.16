Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C39C20299C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886866; cv=none; b=WB8yTK2VhC3OblpYnqZMyT7ekZtfI9gYEs44lbEXzSIP8k4QtJhMhDIQePx6qtjJfmCK46HlQcsw+0R78rnXw1BnWePDNcH+LvaE7Ja93Wc+yhuPTcbjfdkcSgIzqNvqto3e057AKYdBKHEieiK/atV90SPtBg6I4hl6aFp4V+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886866; c=relaxed/simple;
	bh=Tu5h7IDoxLqfzl78oPg61l89Ts4MzhC18FCRBVL5q00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/6mHsjce+7AF963MdZ+eDX0PRFQ+tT0nqNoENWmbKwPTf6v8FROoX/HT9TSNISWwBrgQKryOyT8ECJRoxvhft+vsr3g3me8u3REcSuuVQxiD+3sGJ/yzJa957CxQfHc006f40GL6oSfVO0Krgqm6SbslCnjFihD6BNRWEwBOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEwJ9a+Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEwJ9a+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745886864; x=1777422864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tu5h7IDoxLqfzl78oPg61l89Ts4MzhC18FCRBVL5q00=;
  b=ZEwJ9a+QZCPzdo/m6OMDixsgompzk/V2aQvyrBYSl271GpHsswAckEtK
   clrgQL8gK5gUq5nl7Qsbk+1gW5HKMChwm17wPx8tySw1RJJtXfZfxjtMN
   xug16Pt1ssxzd5BJkSKfDlrB1ErOCAYKUSDUweL86iws7PnPzfWLYHHYZ
   wuVFO9DIIG28mxc+j4uQd0S5/jqUsU8gtC6asLBtEweCQUlvWMtL07910
   O5ToQQygQz8h38uHU3rcId5TOcJUSQXYHOT47TdPWY4xyYYqAc4LLnNzG
   Ii5HCaR+XphrNal09/LQXbWE75MVYtB9H0al1yiJ9x2OZ1k3SCr2GsJjI
   A==;
X-CSE-ConnectionGUID: 39s8CVXFTnKRpVxvI4XWcQ==
X-CSE-MsgGUID: bWqSOzc7TO+0QPEF/RmZVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58148213"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="58148213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:18 -0700
X-CSE-ConnectionGUID: 1s0gbHq8ScuDwc89e4Fc4w==
X-CSE-MsgGUID: 3FxbaTNZTCe+yXz+XkFWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133394032"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:18 -0700
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
Subject: [PATCH v4 19/31] x86,fs/resctrl: Fill in details of Clearwater Forest events
Date: Mon, 28 Apr 2025 17:33:45 -0700
Message-ID: <20250429003359.375508-20-tony.luck@intel.com>
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

Clearwater Forest supports two energy related telemetry events
and seven perf style events.

Define these events in the file system code and add the events
to the event_group structures.

PMT_EVENT_ENERGY and PMT_EVENT_ACTIVITY are produced in fixed point
format. File system code must output as floating point values.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl_types.h           | 11 +++++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 31 ++++++++++++++
 fs/resctrl/monitor.c                    | 54 +++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 6245034f6c76..39de5451cff8 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -43,6 +43,17 @@ enum resctrl_event_id {
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 
+	/* Intel Telemetry Events */
+	PMT_EVENT_ENERGY,
+	PMT_EVENT_ACTIVITY,
+	PMT_EVENT_STALLS_LLC_HIT,
+	PMT_EVENT_C1_RES,
+	PMT_EVENT_UNHALTED_CORE_CYCLES,
+	PMT_EVENT_STALLS_LLC_MISS,
+	PMT_EVENT_AUTO_C6_RES,
+	PMT_EVENT_UNHALTED_REF_CYCLES,
+	PMT_EVENT_UOPS_RETIRED,
+
 	/* Must be the last */
 	QOS_NUM_EVENTS,
 };
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 03839d5c369b..7e4f6a6672d4 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -30,6 +30,18 @@ struct mmio_info {
 	void __iomem	*addrs[] __counted_by(count);
 };
 
+/**
+ * struct pmt_event - Telemetry event.
+ * @evtid:	Resctrl event id
+ * @evt_idx:	Counter index within each per-RMID block of counters
+ */
+struct pmt_event {
+	enum resctrl_event_id	evtid;
+	int			evt_idx;
+};
+
+#define EVT(id, idx) { .evtid = id, .evt_idx = idx }
+
 /**
  * struct event_group - All information about a group of telemetry events.
  *                      Some fields initialized with MMIO layout information
@@ -38,21 +50,40 @@ struct mmio_info {
  * @pfg:		The pmt_feature_group for this event group
  * @guid:		Unique number per XML description file
  * @pkginfo:		Per-package MMIO addresses
+ * @num_events:		Number of events in this group
+ * @evts:		Array of event descriptors
  */
 struct event_group {
 	struct pmt_feature_group	*pfg;
 	int				guid;
 	struct mmio_info		**pkginfo;
+	int				num_events;
+	struct pmt_event		evts[] __counted_by(num_events);
 };
 
 /* Link: https://github.com/intel/Intel-PMT xml/CWF/OOBMSM/RMID-ENERGY *.xml */
 static struct event_group energy_0x26696143 = {
 	.guid		= 0x26696143,
+	.num_events	= 2,
+	.evts				= {
+		EVT(PMT_EVENT_ENERGY, 0),
+		EVT(PMT_EVENT_ACTIVITY, 1),
+	}
 };
 
 /* Link: https://github.com/intel/Intel-PMT xml/CWF/OOBMSM/RMID-PERF *.xml */
 static struct event_group perf_0x26557651 = {
 	.guid		= 0x26557651,
+	.num_events	= 7,
+	.evts				= {
+		EVT(PMT_EVENT_STALLS_LLC_HIT, 0),
+		EVT(PMT_EVENT_C1_RES, 1),
+		EVT(PMT_EVENT_UNHALTED_CORE_CYCLES, 2),
+		EVT(PMT_EVENT_STALLS_LLC_MISS, 3),
+		EVT(PMT_EVENT_AUTO_C6_RES, 4),
+		EVT(PMT_EVENT_UNHALTED_REF_CYCLES, 5),
+		EVT(PMT_EVENT_UOPS_RETIRED, 6),
+	}
 };
 
 static struct event_group *known_event_groups[] = {
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index be78488a15e5..f848325591b4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -861,6 +861,60 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 		.rid		= RDT_RESOURCE_L3,
 		.display_format	= EVT_FORMAT_U64,
 	},
+	[PMT_EVENT_ENERGY] = {
+		.name		= "core_energy",
+		.evtid		= PMT_EVENT_ENERGY,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U46_18,
+	},
+	[PMT_EVENT_ACTIVITY] = {
+		.name		= "activity",
+		.evtid		= PMT_EVENT_ACTIVITY,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U46_18,
+	},
+	[PMT_EVENT_STALLS_LLC_HIT] = {
+		.name		= "stalls_llc_hit",
+		.evtid		= PMT_EVENT_STALLS_LLC_HIT,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_C1_RES] = {
+		.name		= "c1_res",
+		.evtid		= PMT_EVENT_C1_RES,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_UNHALTED_CORE_CYCLES] = {
+		.name		= "unhalted_core_cycles",
+		.evtid		= PMT_EVENT_UNHALTED_CORE_CYCLES,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_STALLS_LLC_MISS] = {
+		.name		= "stalls_llc_miss",
+		.evtid		= PMT_EVENT_STALLS_LLC_MISS,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_AUTO_C6_RES] = {
+		.name		= "c6_res",
+		.evtid		= PMT_EVENT_AUTO_C6_RES,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_UNHALTED_REF_CYCLES] = {
+		.name		= "unhalted_ref_cycles",
+		.evtid		= PMT_EVENT_UNHALTED_REF_CYCLES,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
+	[PMT_EVENT_UOPS_RETIRED] = {
+		.name		= "uops_retired",
+		.evtid		= PMT_EVENT_UOPS_RETIRED,
+		.rid		= RDT_RESOURCE_PERF_PKG,
+		.display_format	= EVT_FORMAT_U64,
+	},
 };
 
 void resctrl_enable_mon_event(enum resctrl_event_id evtid, bool any_cpu)
-- 
2.48.1

