Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0022EF656
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956604; cv=none; b=iS5UMTHZ7AxncqgUS1Oeq17ezl/HHEJFKW5ThIwXzcYgqx+8XlSh4cTbSC3uMh3gUZqYhmHwhBsz/ivx8dx4+Cx0Im6tOchu6i6v//sJIzCtBo5bQDgQMpuHMyeHI1TIrS/DFT4+vtcQIVuiRbUHvP1V3ypiz3ZdQpZvynV09wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956604; c=relaxed/simple;
	bh=A+84H7qMiaJDlRP4pKwCfRgA6C9VaLkHrvJnhcPosTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzg8Tg+FQWwjmZp7JMEka3quWkn/LzU7kiHHriNlBXS3hTVGaZ1+LjW05Ztmb4hxEkYsTp7LYg2JLpiWufvhfVAugKNaRlQiiTpUBKmbBth9TziAAig+UTzuONeGCm9Rj7L+6Ml+o3Y//zLT46IPiskUXdOOt9jMdBJmFvyrHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEFaweKt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEFaweKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750956603; x=1782492603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+84H7qMiaJDlRP4pKwCfRgA6C9VaLkHrvJnhcPosTw=;
  b=jEFaweKtQG1FfjJca7kHyjuupNG63smGkzna+n4B4R+fgjwUESN1WM5D
   cVhcoHP/vEDW1LHhfbKIE1hyp2HBT9HYywkGUJOgZF8wmgV4xG7AFn+g2
   rwnRN94VQ666hW70Pgs9O7Gv+F/nBDhH8/QtXh5BZqlvawILLBYo+7BJq
   X+QvxxEO+Ikmgn0WKUfraCjRLcldbdLd7MyOiw8PACpJ68REq5k9m5a7A
   2zz/UXDcclCuonCmzH1VBILBtNuX/0Mk9RoZeeiTIGGQqdcncMuvdtlzG
   3UdyXSNGravOs1sLg00IDvbJoV2Nw6CjD6pr1SeiG5RBnPMGIo8HuGcv6
   w==;
X-CSE-ConnectionGUID: 7v3pX9K/QoaTMlotwKaa3Q==
X-CSE-MsgGUID: 4RDy3wXSQCSYCT79x/P/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53136437"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53136437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:58 -0700
X-CSE-ConnectionGUID: NEcVaPI+RL6abibx6kNfkQ==
X-CSE-MsgGUID: lO2SRBZPSha9W/MnvK0r5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153069242"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:57 -0700
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
Subject: [PATCH v6 15/30] x86,fs/resctrl: Add an architectural hook called for each mount
Date: Thu, 26 Jun 2025 09:49:24 -0700
Message-ID: <20250626164941.106341-16-tony.luck@intel.com>
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

Enumeration of Intel telemetry events is not complete when the
resctrl "late_init" code is executed.

Add a hook at the beginning of the mount code that will be used
to check for telemetry events and initialize if any are found.

The hook is called on every attempted mount. But expectations are that
most actions (like enumeration) will only need to be performed
on the first call.

The call is made with no locks held. Architecture code is responsible
for any required locking.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            | 6 ++++++
 arch/x86/kernel/cpu/resctrl/core.c | 9 +++++++++
 fs/resctrl/rdtgroup.c              | 2 ++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 1060a54cc9fa..23e2874105e3 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -460,6 +460,12 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 void resctrl_online_cpu(unsigned int cpu);
 void resctrl_offline_cpu(unsigned int cpu);
 
+/*
+ * Architecture hook called for each attempted file system mount.
+ * No locks are held.
+ */
+void resctrl_arch_pre_mount(void);
+
 /**
  * resctrl_arch_rmid_read() - Read the eventid counter corresponding to rmid
  *			      for this resource and domain.
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 2b6c6b61707d..03c481725fdb 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -717,6 +717,15 @@ static int resctrl_arch_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
+void resctrl_arch_pre_mount(void)
+{
+	static atomic_t only_once = ATOMIC_INIT(0);
+	int old = 0;
+
+	if (!atomic_try_cmpxchg(&only_once, &old, 1))
+		return;
+}
+
 enum {
 	RDT_FLAG_CMT,
 	RDT_FLAG_MBM_TOTAL,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a10f2f6825fc..9dac8017a2f8 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2585,6 +2585,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	struct rdt_resource *r;
 	int ret;
 
+	resctrl_arch_pre_mount();
+
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 	/*
-- 
2.49.0

