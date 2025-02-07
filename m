Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0774D1A3141
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952396; cv=none; b=iYCDnNupLHcAAuTMLmGnUHywFitYq+zBhWbFiQQbCS94/4BPACRScXeWpsMu+aiZRyaLq1bP/wRWgczmfoMlN2mSTxzLLvGbuvdpcd1K5r2vtlBEyUF2Oweesu1Nj31FgcPI9bTsPOGKFXhXv+hRH0XaWTpsGHQTV2qOO4NpD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952396; c=relaxed/simple;
	bh=7lb9B4cUfQly6Q5LZTpA6Li2uiqAqQRnlpoVLnbAIDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HcGD43t7sVK0lxlHUBoB7XciFIHdvoCQYUHSLTtPvKqXgcE2SaCLgK5ee0lj7uCXD2mfHjs5nFtFfCcERfTOnE/hy9RJe+8begXcjHsKxvXvmuCT5arQVytzS+6XvYVmsEdsH6Ma+Hh4cxqXyLrHcJkGgY9Ea0DgYxuwlUr/d6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF42113E;
	Fri,  7 Feb 2025 10:20:17 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B21103F63F;
	Fri,  7 Feb 2025 10:19:50 -0800 (PST)
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
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 20/42] x86/resctrl: Change mon_event_config_{read,write}() to be arch helpers
Date: Fri,  7 Feb 2025 18:18:01 +0000
Message-Id: <20250207181823.6378-21-james.morse@arm.com>
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

mon_event_config_{read,write}() are called via IPI and access model
specific registers to do their work.

To support another architecture, this needs abstracting.

Rename mon_event_config_{read,write}() to have a "resctrl_arch_"
prefix, and move their struct mon_config_info parameter into
<linux/resctrl.h>.  This allows another architecture to supply an
implementation of these.

As struct mon_config_info is now exposed globally, give it a 'resctrl_'
prefix. MPAM systems need access to the domain to do this work, add
the resource and domain to struct resctrl_mon_config_info.

Co-developed-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v5:
 * Renamed info to config_info.
 * Added description of which fields are read and written in the structure.
 * Clarified comment about which CPU this is called on for both kinds of
   reader.

Changes since v3:
 * Added comments over the read/write helper to explain the type of the void
   pointer.

Changes since v1:
 * [Whitespace only] Re-tabbed struct resctrl_mon_config_info in
   <linux/resctrl.h> to fit the prevailing style.

   Non-functional change.

 * [Commit message only] Reword to align with the actual naming of the
   definitions and destination header file.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 46 +++++++++++++-------------
 include/linux/resctrl.h                | 31 +++++++++++++++++
 2 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index eb32fbc3abea..e7d1d8b6983d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1580,11 +1580,6 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 	return ret;
 }
 
-struct mon_config_info {
-	u32 evtid;
-	u32 mon_config;
-};
-
 #define INVALID_CONFIG_INDEX   UINT_MAX
 
 /**
@@ -1609,31 +1604,32 @@ static inline unsigned int mon_event_config_index_get(u32 evtid)
 	}
 }
 
-static void mon_event_config_read(void *info)
+void resctrl_arch_mon_event_config_read(void *_config_info)
 {
-	struct mon_config_info *mon_info = info;
+	struct resctrl_mon_config_info *config_info = _config_info;
 	unsigned int index;
 	u64 msrval;
 
-	index = mon_event_config_index_get(mon_info->evtid);
+	index = mon_event_config_index_get(config_info->evtid);
 	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
+		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
 	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
 
 	/* Report only the valid event configuration bits */
-	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
+	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
 }
 
-static void mondata_config_read(struct rdt_mon_domain *d, struct mon_config_info *mon_info)
+static void mondata_config_read(struct resctrl_mon_config_info *mon_info)
 {
-	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_read, mon_info, 1);
+	smp_call_function_any(&mon_info->d->hdr.cpu_mask,
+			      resctrl_arch_mon_event_config_read, mon_info, 1);
 }
 
 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
 {
-	struct mon_config_info mon_info;
+	struct resctrl_mon_config_info mon_info;
 	struct rdt_mon_domain *dom;
 	bool sep = false;
 
@@ -1644,9 +1640,11 @@ static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid
 		if (sep)
 			seq_puts(s, ";");
 
-		memset(&mon_info, 0, sizeof(struct mon_config_info));
+		memset(&mon_info, 0, sizeof(struct resctrl_mon_config_info));
+		mon_info.r = r;
+		mon_info.d = dom;
 		mon_info.evtid = evtid;
-		mondata_config_read(dom, &mon_info);
+		mondata_config_read(&mon_info);
 
 		seq_printf(s, "%d=0x%02x", dom->hdr.id, mon_info.mon_config);
 		sep = true;
@@ -1679,30 +1677,32 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
 	return 0;
 }
 
-static void mon_event_config_write(void *info)
+void resctrl_arch_mon_event_config_write(void *_config_info)
 {
-	struct mon_config_info *mon_info = info;
+	struct resctrl_mon_config_info *config_info = _config_info;
 	unsigned int index;
 
-	index = mon_event_config_index_get(mon_info->evtid);
+	index = mon_event_config_index_get(config_info->evtid);
 	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
+		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
+	wrmsr(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config, 0);
 }
 
 static void mbm_config_write_domain(struct rdt_resource *r,
 				    struct rdt_mon_domain *d, u32 evtid, u32 val)
 {
-	struct mon_config_info mon_info = {0};
+	struct resctrl_mon_config_info mon_info = {0};
 
 	/*
 	 * Read the current config value first. If both are the same then
 	 * no need to write it again.
 	 */
+	mon_info.r = r;
+	mon_info.d = d;
 	mon_info.evtid = evtid;
-	mondata_config_read(d, &mon_info);
+	mondata_config_read(&mon_info);
 	if (mon_info.mon_config == val)
 		return;
 
@@ -1714,7 +1714,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
-	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_write,
+	smp_call_function_any(&d->hdr.cpu_mask, resctrl_arch_mon_event_config_write,
 			      &mon_info, 1);
 
 	/*
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 5c7b9760b63a..59d944e139f8 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -270,6 +270,13 @@ struct resctrl_cpu_defaults {
 	u32 rmid;
 };
 
+struct resctrl_mon_config_info {
+	struct rdt_resource	*r;
+	struct rdt_mon_domain	*d;
+	u32			evtid;
+	u32			mon_config;
+};
+
 /**
  * resctrl_arch_sync_cpu_closid_rmid() - Refresh this CPU's CLOSID and RMID.
  *					 Call via IPI.
@@ -311,6 +318,30 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
 bool __init resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
+/**
+ * resctrl_arch_mon_event_config_write() - Write the config for an event.
+ * @config_info: struct resctrl_mon_config_info describing the resource, domain
+ *		 and event.
+ *
+ * Reads resource, domain and eventid from @config_info and writes the
+ * event config_info->mon_config into hardware.
+ *
+ * Called via IPI to reach a CPU that is a member of the specified domain.
+ */
+void resctrl_arch_mon_event_config_write(void *config_info);
+
+/**
+ * resctrl_arch_mon_event_config_read() - Read the config for an event.
+ * @config_info: struct resctrl_mon_config_info describing the resource, domain
+ *		 and event.
+ *
+ * Reads resource, domain and eventid from @config_info and reads the
+ * hardware config value into config_info->mon_config.
+ *
+ * Called via IPI to reach a CPU that is a member of the specified domain.
+ */
+void resctrl_arch_mon_event_config_read(void *config_info);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.39.2

