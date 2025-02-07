Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BCA1A2392
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952335; cv=none; b=j6QzO2/ED3pnKKQ8laQHCnSckAV1cCFMDiqXOOKmq2upV/sY7HcG3nXZ+7Y1Fxo9RJmAv00O1m7epWGX4K78paKi3kKjx4HldFhD1NEG9iVVka1o6/+JLn77WrtV21pp1zUObyOH4uisRVbZOke8IsRSvUYSI7HQNP39wx7vwXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952335; c=relaxed/simple;
	bh=JvjmFvpySVLTBbK1co5xknkgXeDJB0olJytTBxkBwa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X0lBDKHrISfaYiAqWBPEM2e3kWlij/eA8qAv12QMh1uyQGJk54w1crk5Z/0FPthxWRpCBqXGIPCPtGuT6YX/CO6QUK1ejT6c1G1pDvRwmS/hdH9UtOBTG7++ZqoEs7osGqA6uFAuYPqQHJQqFfWE0Fgcf3DD34Zht6Q6d8JEYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C08A1113E;
	Fri,  7 Feb 2025 10:19:15 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A34C83F63F;
	Fri,  7 Feb 2025 10:18:49 -0800 (PST)
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
Subject: [PATCH v6 03/42] x86/resctrl: Remove fflags from struct rdt_resource
Date: Fri,  7 Feb 2025 18:17:44 +0000
Message-Id: <20250207181823.6378-4-james.morse@arm.com>
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

The resctrl arch code specifies whether a resource controls a cache or
memory using the fflags field. This field is then used by resctrl to
determine which files should be exposed in the filesystem.

Allowing the architecture to pick this value means the RFTYPE_
flags have to be in a shared header, and allows an architecture
to create a combination that resctrl does not support.

Remove the fflags field, and pick the value based on the resource
id.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v5:
 * Made fflags_from_resource() return an unsigned long.
 * Removed a space.

Changes since v4:
 * Removed an extra space
 * Fixed a typo
---
 arch/x86/kernel/cpu/resctrl/core.c     |  4 ----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 18 ++++++++++++++++--
 include/linux/resctrl.h                |  2 --
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 12b41316d8f7..8ef2e449b465 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -74,7 +74,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.mon_domains		= mon_domain_init(RDT_RESOURCE_L3),
 			.parse_ctrlval		= parse_cbm,
 			.format_str		= "%d=%0*x",
-			.fflags			= RFTYPE_RES_CACHE,
 		},
 		.msr_base		= MSR_IA32_L3_CBM_BASE,
 		.msr_update		= cat_wrmsr,
@@ -88,7 +87,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_L2),
 			.parse_ctrlval		= parse_cbm,
 			.format_str		= "%d=%0*x",
-			.fflags			= RFTYPE_RES_CACHE,
 		},
 		.msr_base		= MSR_IA32_L2_CBM_BASE,
 		.msr_update		= cat_wrmsr,
@@ -102,7 +100,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_MBA),
 			.parse_ctrlval		= parse_bw,
 			.format_str		= "%d=%*u",
-			.fflags			= RFTYPE_RES_MB,
 		},
 	},
 	[RDT_RESOURCE_SMBA] =
@@ -114,7 +111,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_SMBA),
 			.parse_ctrlval		= parse_bw,
 			.format_str		= "%d=%*u",
-			.fflags			= RFTYPE_RES_MB,
 		},
 	},
 };
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 45093b9e8e63..3391ac8ecb2d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2165,6 +2165,20 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
 	return ret;
 }
 
+static unsigned long fflags_from_resource(struct rdt_resource *r)
+{
+	switch (r->rid) {
+	case RDT_RESOURCE_L3:
+	case RDT_RESOURCE_L2:
+		return RFTYPE_RES_CACHE;
+	case RDT_RESOURCE_MBA:
+	case RDT_RESOURCE_SMBA:
+		return RFTYPE_RES_MB;
+	}
+
+	return WARN_ON_ONCE(1);
+}
+
 static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 {
 	struct resctrl_schema *s;
@@ -2185,14 +2199,14 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 	/* loop over enabled controls, these are all alloc_capable */
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		fflags = r->fflags | RFTYPE_CTRL_INFO;
+		fflags = fflags_from_resource(r) | RFTYPE_CTRL_INFO;
 		ret = rdtgroup_mkdir_info_resdir(s, s->name, fflags);
 		if (ret)
 			goto out_destroy;
 	}
 
 	for_each_mon_capable_rdt_resource(r) {
-		fflags = r->fflags | RFTYPE_MON_INFO;
+		fflags = fflags_from_resource(r) | RFTYPE_MON_INFO;
 		sprintf(name, "%s_MON", r->name);
 		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
 		if (ret)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 37279e2a89da..496ddcaa4ecf 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -210,7 +210,6 @@ enum resctrl_scope {
  * @format_str:		Per resource format string to show domain value
  * @parse_ctrlval:	Per resource function pointer to parse control values
  * @evt_list:		List of monitoring events
- * @fflags:		flags to choose base and info files
  * @cdp_capable:	Is the CDP feature available on this resource
  */
 struct rdt_resource {
@@ -232,7 +231,6 @@ struct rdt_resource {
 						 struct resctrl_schema *s,
 						 struct rdt_ctrl_domain *d);
 	struct list_head	evt_list;
-	unsigned long		fflags;
 	bool			cdp_capable;
 };
 
-- 
2.39.2

