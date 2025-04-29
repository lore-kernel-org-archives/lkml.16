Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5920D4E7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886868; cv=none; b=q2xBRAhKiyBbv5/Ek1ssEbkG1CKBTq4ZLBy1Ujx5JzOgM4EgWFlr4B4tIEajhOsIpFphG2sljTZkbuCzh3Fv4cbHNyzxvwk1Cs1Vwp0LXloUxg3gNi8W3ebaX8qL7Bpt+nRShiLcSbtNFaBOp4Yc0dZ5vOiVqXMvVjn0IUtdZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886868; c=relaxed/simple;
	bh=8U+X+AdbxvgBo9oLxgDF886iRXiEr6TfU7ORbMoBQ1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqOV7/pq5noyRLF4WWyeARF1Qf7nWVYuqbPz0ATDkLM8P92dkKoZTUa8sf6FD7wQXIGc48sPxP9Mdb3xbHf0lLwP5agtenilaZibFQkNEoJwHaFYUE0MYNvWW3UffuaOdOxIDRVF5aVkp7nlSgXI2dy0O8Yz8Q9Jz96qivVArCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRw1+nZ6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRw1+nZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745886866; x=1777422866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8U+X+AdbxvgBo9oLxgDF886iRXiEr6TfU7ORbMoBQ1Y=;
  b=PRw1+nZ6iBhhDiHaW2Qnx8uqZb/w6djBaMX3WR3xkIpAH4kur5wPCGjs
   p1WZZr9IZshZv8Gu5c/FEVD89Nzu3eapRN7AqgvJMZv/b2pCiOm2+VteS
   zcUzCgN8Sk49xKMGsh/8q0Ov4VXdJndHkW7te/D5fiftnDYNmBZ9WHo4Y
   bH5tfrBMNCK0Y303dw9d2R5qOuOSG+aOite5BGIlu+5y0w56scXSAcbLO
   9nqaAAogCr7CwM/EagDMSQeRReC33mhMo0n5uxGCgjKlrPjQDGx81fh0/
   NCqRfPZu54qyb/ZZV65J3SNN0IFuKthGYtcwkeG7Rr8dXfhkVsFNGzZUA
   g==;
X-CSE-ConnectionGUID: HvSa0QlSSIqZD0tUSSf3Vg==
X-CSE-MsgGUID: MDWzU8XPQGenY1facbPDiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58148235"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="58148235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:19 -0700
X-CSE-ConnectionGUID: NmOB4kMNSv2CB59XVCKEkQ==
X-CSE-MsgGUID: cTtCIv9xTvWV7XZ7G9inEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133394040"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:19 -0700
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
Subject: [PATCH v4 21/31] x86/resctrl: Add fourth part of telemetry event enumeration
Date: Mon, 28 Apr 2025 17:33:47 -0700
Message-ID: <20250429003359.375508-22-tony.luck@intel.com>
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

At run time when a user reads an event file the file system code
provides the enum resctrl_event_id for the event.

Create a lookup table indexed by event id to provide the telem_entry
structure and the event index into MMIO space.

Enable the events marked as readable from any CPU.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 37dd493df250..e1cb6bd4788d 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -97,6 +97,16 @@ static struct event_group *known_event_groups[] = {
 
 #define NUM_KNOWN_GROUPS ARRAY_SIZE(known_event_groups)
 
+/**
+ * struct evtinfo - lookup table from resctrl_event_id to useful information
+ * @event_group:	Pointer to the telem_entry structure for this event
+ * @idx:		Counter index within each per-RMID block of counters
+ */
+static struct evtinfo {
+	struct event_group	*event_group;
+	int			idx;
+} evtinfo[QOS_NUM_EVENTS];
+
 static void free_mmio_info(struct mmio_info **mmi)
 {
 	int num_pkgs = topology_max_packages();
@@ -167,7 +177,16 @@ static bool configure_events(struct event_group *e, struct pmt_feature_group *p)
 	}
 	e->pkginfo = no_free_ptr(pkginfo);
 
-	return false;
+	for (int i = 0; i < e->num_events; i++) {
+		enum resctrl_event_id evt;
+
+		evt = e->evts[i].evtid;
+		evtinfo[evt].event_group = e;
+		evtinfo[evt].idx = e->evts[i].evt_idx;
+		resctrl_enable_mon_event(evt, true);
+	}
+
+	return true;
 }
 
 DEFINE_FREE(intel_pmt_put_feature_group, struct pmt_feature_group *,	\
-- 
2.48.1

