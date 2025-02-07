Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07391C1F08
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952392; cv=none; b=uINtZX6Cx2HsL4NmfDO67OMK5Ywyt56afO3atK5NLysy9nBWfhkmeeQORewaVILR3Pl1/+OX8LD58oReRziAjSIBJY1zZ2vHCOBfqVuNGJs44Nph7VrCecyaJi2cYzUVVyaGuCd+nSdz9PKGWLucDzC1EbwgmqJK03g1WVOU98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952392; c=relaxed/simple;
	bh=nJmIsd81U4JQVDWN02zu99vaiSmoOx2YVDiopFFx/+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sNkX2j0Q9eU2g5P1Gng2x1I+Nu1Y/BzXfve5z+B7WEHY1+GFVcirTc/NvhaZrzb6S+FNa7hK/qNaDhUgqJw6elzGabinyMwiRkXM0FTq9is167xunUm0R9ZeQdGyrcdtgr8ntRxYTh8nfbehceEXnvy79osVmBvkujPomKKC78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4955812FC;
	Fri,  7 Feb 2025 10:20:13 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B5223F63F;
	Fri,  7 Feb 2025 10:19:47 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 19/42] x86/resctrl: Add resctrl_arch_is_evt_configurable() to abstract BMEC
Date: Fri,  7 Feb 2025 18:18:00 +0000
Message-Id: <20250207181823.6378-20-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
References: <20250207181823.6378-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When BMEC is supported the resctrl event can be configured in a number
of ways. This depends on architecture support. rdt_get_mon_l3_config()
modifies the struct mon_evt and calls mbm_config_rftype_init() to create
the files that allow the configuration.

Splitting this into separate architecture and filesystem parts would
require the struct mon_evt and mbm_config_rftype_init() to be exposed.

Instead, add resctrl_arch_is_evt_configurable(), and use this from
resctrl_mon_resource_init() to initialise struct mon_evt and call
mbm_config_rftype_init().
resctrl_arch_is_evt_configurable() calls rdt_cpu_has() so it doesn't
obviously benefit from being inlined. Putting it in core.c will allow
rdt_cpu_has() to eventually become static.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v4:
 * Moved all the __init changes to a later patch now that the exit gubbins
   comes first.
---
 arch/x86/kernel/cpu/resctrl/core.c    | 15 +++++++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c | 22 +++++++++++-----------
 include/linux/resctrl.h               |  2 ++
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7d14d80b3f94..43a9291988d3 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -831,6 +831,21 @@ bool __init rdt_cpu_has(int flag)
 	return ret;
 }
 
+bool __init resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
+{
+	if (!rdt_cpu_has(X86_FEATURE_BMEC))
+		return false;
+
+	switch (evt) {
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		return rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL);
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+		return rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL);
+	default:
+		return false;
+	}
+}
+
 static __init bool get_mem_config(void)
 {
 	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_MBA];
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index b7d93670ed94..ab8f33f2277e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1205,6 +1205,17 @@ int __init resctrl_mon_resource_init(void)
 
 	l3_mon_evt_init(r);
 
+	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
+		mbm_total_event.configurable = true;
+		resctrl_file_fflags_init("mbm_total_bytes_config",
+					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+	}
+	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
+		mbm_local_event.configurable = true;
+		resctrl_file_fflags_init("mbm_local_bytes_config",
+					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+	}
+
 	return 0;
 }
 
@@ -1248,17 +1259,6 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
 		hw_res->mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
-
-		if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
-			mbm_total_event.configurable = true;
-			resctrl_file_fflags_init("mbm_total_bytes_config",
-						 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
-		}
-		if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
-			mbm_local_event.configurable = true;
-			resctrl_file_fflags_init("mbm_local_bytes_config",
-						 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
-		}
 	}
 
 	r->mon_capable = true;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 686d33d67456..5c7b9760b63a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -309,6 +309,8 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
+bool __init resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.39.2

