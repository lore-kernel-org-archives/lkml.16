Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F523312E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069260; cv=none; b=QYamop0zBv6Z3NloO40svBu2HGuV5ccd/7bS1esw8OXgFPONJZVynlw8+HWMlYKgc8D+44MAcwL3jv/rlWpAa30gxAVwI6TdrZxJiQyRGaaHTnPKBC9qP17ezRpmXi8/Ryd4Wk8+yaIWIkWdW+J4PV5YSH8mArcrqxfGMxTmZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069260; c=relaxed/simple;
	bh=Ge3dAPdKQ80XMbZaHlF/lf+oTDnmbQ7mOPJgItNLlTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHEuKzFldlimHqPebqqGV28B6vLOpj2sgRZ+sM6wh9cCwV0PSNG+mjOvkZQ4GZhuvODt7W4h2joIAvAC5PMp8o8eDy0dfX5bC2VXJFVEwY2U8ngf9Mj+8pZNYN+9aFFh12CzJVD1UQPe8IukzDLE4mT12n40ZMppVvEmhty9XIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=di492s1K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="di492s1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069258; x=1775605258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ge3dAPdKQ80XMbZaHlF/lf+oTDnmbQ7mOPJgItNLlTQ=;
  b=di492s1KF65nnm+W7PZcmHehMIcfpWyFavQwczEfB96LDY3E2woFSkE3
   YNhpBmmPFGyMHUY1ep1MHOXm8YDblxhJXY08VBbd9NnIuRIh97ZfH6uO6
   ZqAZZX2yfb1xuxB1ewv/Waq0rz8Y4GPSN1q2MorPXpFyJ6VWhR5hflely
   2qtkkk3KqmPrvqyX8vlUv+Yqa1kXQVwVrs1DrZsMTfa0yViGbcXdvKWwQ
   n+EHcfjG32cpqK0pEB8CaV5wces1w35OJ96TxQ5OiYdLrHlC8Si1yJn9U
   S+oWbz89UCWG/TQox2N6eB1zDc+v8lHV7qPrUTVDPEfWYOKrJSmnDsq+d
   Q==;
X-CSE-ConnectionGUID: PswtBe7jTDKVB31LQITMVA==
X-CSE-MsgGUID: QwloflYVSBinDK00FbpiQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193241"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:54 -0700
X-CSE-ConnectionGUID: GB3ui4QQSAOgny1ciOx4oQ==
X-CSE-MsgGUID: Yc2M/RnoR8C6OkVQKSvKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315501"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:53 -0700
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
Subject: [PATCH v3 17/26] x86/resctrl: Build a lookup table for each resctrl event id
Date: Mon,  7 Apr 2025 16:40:19 -0700
Message-ID: <20250407234032.241215-18-tony.luck@intel.com>
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

User requests to read events arrive from the file system layer
with a domain id, RMID, and resctrl event id. Responding to
those requests needs information from various structures.

Build a quick lookup table indexed by resctrl event id.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index fb03f2e76306..44d2fe747ed8 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -67,6 +67,12 @@ struct telem_entry {
 	struct pmt_event evts[];
 };
 
+/* Lookup table to get from resctrl event id to useful structures */
+static struct evtinfo {
+	struct telem_entry	*telem_entry;
+	struct pmt_event	*pmt_event;
+} evtinfo[QOS_NUM_EVENTS];
+
 /* All known telemetry event groups */
 static struct telem_entry *telem_entry[] = {
 	NULL
@@ -151,6 +157,7 @@ bool intel_aet_get_events(void)
 	struct pmt_feature_group *p2 __free(intel_pmt_put_feature_group) = NULL;
 	struct pkg_info *pkg __free(free_pkg_info) = NULL;
 	int num_pkgs = topology_max_packages();
+	struct telem_entry **tentry;
 	bool use_p1, use_p2;
 	int slot;
 
@@ -184,6 +191,17 @@ bool intel_aet_get_events(void)
 			slot = setup(pkg, i, p2, slot);
 	}
 
+	for (tentry = telem_entry; *tentry; tentry++) {
+		if (!(*tentry)->active)
+			continue;
+		for (int i = 0; i < (*tentry)->num_events; i++) {
+			enum resctrl_event_id evtid = (*tentry)->evts[i].evtid;
+
+			evtinfo[evtid].telem_entry = *tentry;
+			evtinfo[evtid].pmt_event = &(*tentry)->evts[i];
+		}
+	}
+
 	if (use_p1)
 		feat_energy = no_free_ptr(p1);
 	if (use_p2)
-- 
2.48.1

