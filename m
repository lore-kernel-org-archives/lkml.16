Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4021A45A;
	Mon,  9 Jun 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486114; cv=none; b=vALbtFuVywqBsW2mrB3Fceyrn5Mb6FTJ1bRgYKpIC1Va9pjBuaG/Wa5RiDB5CMjnVRcUbS5x4sXXyc5zLL/6RYRdRuhoK1bFZBAYEnu6LJEDRCoW0rgysDJR12qIiVkSn6oJ2NhljGQbZqeqX8eohvIIxfAdSm1FcYjftJDfRUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486114; c=relaxed/simple;
	bh=Di0O582DV34RYsm0viS90DongGnmXJ7ifCrJQ2xhKLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzHQJXvZVg/CG3FPXG96H4+DpvoHyUiTJjNCwx9SJajYMzddV2PXCOO9NKvAAJu6c7FhMzVO5FKiSAV6XkwMHRHC9rRcFEf5kEZbH/yffEmB5gpN+g79dHW+bu1+lSSrb1L1rP+eLVgseethSip09KVtvOr4hxc/PS1OuGbFNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLal03nn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLal03nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749486113; x=1781022113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Di0O582DV34RYsm0viS90DongGnmXJ7ifCrJQ2xhKLU=;
  b=BLal03nnMa1J7YVpYfyByA2Yl5msx7hiU4FDP7kMi+FwAw2zw6BeWog0
   B7OVAj6jhjTxB7lfAB1mDuATAye34wkkG00ig5EGrbkaJTBGbXI3uKxDW
   g7JoZYdN/+shvwbvjSLwFTsQY58AQ63RiyoniC1P8wyfrc1zxwE9B8PRV
   kn4RSHlwWEvehBRXv0rAN1no68MPpgYdQMNo+061+KeyZ+KcXycs4lGq4
   5mCUGa46QTAHoYAZ1LQC7rgFBjMcnsAQb5C2ibu0B9YAD/2/ZMcwwwgvS
   jcfckuH6U6wkkX+jU+gjTfysuvcUseAQFqtx4/uU6dMLURSXbJneyiHcr
   Q==;
X-CSE-ConnectionGUID: 9xmtAFcOQ/itpEgA0vtACQ==
X-CSE-MsgGUID: UjY94KIBQv+gttg9aTgYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55234430"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55234430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:50 -0700
X-CSE-ConnectionGUID: QOh0hJwOQwWXnl78A5O+lw==
X-CSE-MsgGUID: qOTooSKHQoKF08Ep1iqKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177465805"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:49 -0700
From: Tony Luck <tony.luck@intel.com>
To: babu.moger@amd.com
Cc: Xiaojian.Du@amd.com,
	akpm@linux-foundation.org,
	alexandre.chartre@oracle.com,
	andrew.cooper3@citrix.com,
	ardb@kernel.org,
	bmoger@amd.com,
	bp@alien8.de,
	corbet@lwn.net,
	daniel.sneddon@linux.intel.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	ebiggers@google.com,
	eranian@google.com,
	fenghuay@nvidia.com,
	gautham.shenoy@amd.com,
	gregkh@linuxfoundation.org,
	hpa@zytor.com,
	james.morse@arm.com,
	jpoimboe@kernel.org,
	kai.huang@intel.com,
	kan.liang@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maciej.wieczor-retman@intel.com,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	perry.yuan@amd.com,
	peternewman@google.com,
	reinette.chatre@intel.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	sohil.mehta@intel.com,
	tglx@linutronix.de,
	thomas.lendacky@amd.com,
	thuth@redhat.com,
	tony.luck@intel.com,
	x86@kernel.org,
	xiaoyao.li@intel.com,
	xin3.li@intel.com,
	xin@zytor.com
Subject: [PATCH 5/5] x86,fs/resctrl: Prepare for more monitor events
Date: Mon,  9 Jun 2025 09:21:39 -0700
Message-ID: <20250609162139.91651-6-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609162139.91651-1-tony.luck@intel.com>
References: <20250609162139.91651-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a rule in computer programming that objects appear zero,
once, or many times. So code accordingly.

There are two MBM events and resctrl is coded with a lot of

        if (local)
                do one thing
        if (total)
                do a different thing

Change the rdt_mon_domain and rdt_hw_mon_domain structures to hold arrays
of pointers to per event data instead of explicit fields for total and
local bandwidth.

Simplify by coding for many events using loops on which are enabled.

Move resctrl_is_mbm_event() to <linux/resctrl.h> so it can be used more
widely. Also provide a for_each_mbm_event_id() helper macro.

Cleanup variable names in functions touched to consistently use
"eventid" for those with type enum resctrl_event_id.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h                | 18 +++++++---
 include/linux/resctrl_types.h          |  3 ++
 arch/x86/kernel/cpu/resctrl/internal.h |  9 ++---
 arch/x86/kernel/cpu/resctrl/core.c     | 38 ++++++++++----------
 arch/x86/kernel/cpu/resctrl/monitor.c  | 36 +++++++++----------
 fs/resctrl/monitor.c                   | 13 ++++---
 fs/resctrl/rdtgroup.c                  | 48 ++++++++++++--------------
 7 files changed, 88 insertions(+), 77 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 40aba6b5d4f0..bbe57eff962b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -161,8 +161,9 @@ struct rdt_ctrl_domain {
  * @hdr:		common header for different domain types
  * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
- * @mbm_total:		saved state for MBM total bandwidth
- * @mbm_local:		saved state for MBM local bandwidth
+ * @mbm_states:		Per-event pointer to the MBM event's saved state.
+ *			An MBM event's state is an array of struct mbm_state
+ *			indexed by RMID on x86 or combined CLOSID, RMID on Arm.
  * @mbm_over:		worker to periodically read MBM h/w counters
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
@@ -172,8 +173,7 @@ struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
 	unsigned int			ci_id;
 	unsigned long			*rmid_busy_llc;
-	struct mbm_state		*mbm_total;
-	struct mbm_state		*mbm_local;
+	struct mbm_state		*mbm_states[QOS_NUM_L3_MBM_EVENTS];
 	struct delayed_work		mbm_over;
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
@@ -376,6 +376,16 @@ bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
+static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
+{
+	return (eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
+		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
+#define for_each_mbm_event_id(eventid)				\
+	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
+	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
+
 /**
  * resctrl_arch_mon_event_config_write() - Write the config for an event.
  * @config_info: struct resctrl_mon_config_info describing the resource, domain
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 2dadbc54e4b3..d98351663c2c 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -51,4 +51,7 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
+#define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
+#define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 5e3c41b36437..44ef0d94131e 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -54,15 +54,16 @@ struct rdt_hw_ctrl_domain {
  * struct rdt_hw_mon_domain - Arch private attributes of a set of CPUs that share
  *			      a resource for a monitor function
  * @d_resctrl:	Properties exposed to the resctrl file system
- * @arch_mbm_total:	arch private state for MBM total bandwidth
- * @arch_mbm_local:	arch private state for MBM local bandwidth
+ * @arch_mbm_states:	arch private state for each MBM event
+ * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
+ *			An MBM event's state is an array of struct arch_mbm_state
+ *			indexed by RMID on x86 or combined CLOSID, RMID on Arm.
  *
  * Members of this structure are accessed via helpers that provide abstraction.
  */
 struct rdt_hw_mon_domain {
 	struct rdt_mon_domain		d_resctrl;
-	struct arch_mbm_state		*arch_mbm_total;
-	struct arch_mbm_state		*arch_mbm_local;
+	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 5d14f9a14eda..6bf2103aac27 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -365,8 +365,8 @@ static void ctrl_domain_free(struct rdt_hw_ctrl_domain *hw_dom)
 
 static void mon_domain_free(struct rdt_hw_mon_domain *hw_dom)
 {
-	kfree(hw_dom->arch_mbm_total);
-	kfree(hw_dom->arch_mbm_local);
+	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++)
+		kfree(hw_dom->arch_mbm_states[i]);
 	kfree(hw_dom);
 }
 
@@ -400,25 +400,27 @@ static int domain_setup_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *
  */
 static int arch_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_mon_domain *hw_dom)
 {
-	size_t tsize;
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		tsize = sizeof(*hw_dom->arch_mbm_total);
-		hw_dom->arch_mbm_total = kcalloc(num_rmid, tsize, GFP_KERNEL);
-		if (!hw_dom->arch_mbm_total)
-			return -ENOMEM;
-	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		tsize = sizeof(*hw_dom->arch_mbm_local);
-		hw_dom->arch_mbm_local = kcalloc(num_rmid, tsize, GFP_KERNEL);
-		if (!hw_dom->arch_mbm_local) {
-			kfree(hw_dom->arch_mbm_total);
-			hw_dom->arch_mbm_total = NULL;
-			return -ENOMEM;
-		}
+	size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
+	enum resctrl_event_id eventid;
+	int idx;
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		hw_dom->arch_mbm_states[idx] = kcalloc(num_rmid, tsize, GFP_KERNEL);
+		if (!hw_dom->arch_mbm_states[idx])
+			goto cleanup;
 	}
 
 	return 0;
+cleanup:
+	while (--idx >= 0) {
+		kfree(hw_dom->arch_mbm_states[idx]);
+		hw_dom->arch_mbm_states[idx] = NULL;
+	}
+
+	return -ENOMEM;
 }
 
 static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 07f8ab097cbe..0add57b29a4d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -161,18 +161,14 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 						 u32 rmid,
 						 enum resctrl_event_id eventid)
 {
-	switch (eventid) {
-	case QOS_L3_OCCUP_EVENT_ID:
-		return NULL;
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		return &hw_dom->arch_mbm_total[rmid];
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-		return &hw_dom->arch_mbm_local[rmid];
-	default:
-		/* Never expect to get here */
-		WARN_ON_ONCE(1);
+	struct arch_mbm_state *state;
+
+	if (!resctrl_is_mbm_event(eventid))
 		return NULL;
-	}
+
+	state = hw_dom->arch_mbm_states[MBM_STATE_IDX(eventid)];
+
+	return state ? &state[rmid] : NULL;
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
@@ -201,14 +197,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		memset(hw_dom->arch_mbm_total, 0,
-		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		memset(hw_dom->arch_mbm_local, 0,
-		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
+	enum resctrl_event_id eventid;
+	int idx;
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		memset(hw_dom->arch_mbm_states[idx], 0,
+		       sizeof(struct arch_mbm_state) * r->num_rmid);
+	}
 }
 
 static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 9e988b2c1a22..dcc6c00eb362 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -346,15 +346,14 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 				       u32 rmid, enum resctrl_event_id evtid)
 {
 	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+	struct mbm_state *state;
 
-	switch (evtid) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		return &d->mbm_total[idx];
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-		return &d->mbm_local[idx];
-	default:
+	if (!resctrl_is_mbm_event(evtid))
 		return NULL;
-	}
+
+	state = d->mbm_states[MBM_STATE_IDX(evtid)];
+
+	return state ? &state[idx] : NULL;
 }
 
 static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a7eeb33501da..bd6718f0ffd6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -127,12 +127,6 @@ static bool resctrl_is_mbm_enabled(void)
 		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
 }
 
-static bool resctrl_is_mbm_event(int e)
-{
-	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
-		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
-}
-
 /*
  * Trivial allocator for CLOSIDs. Use BITMAP APIs to manipulate a bitmap
  * of free CLOSIDs.
@@ -4024,8 +4018,10 @@ static void rdtgroup_setup_default(void)
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
 	bitmap_free(d->rmid_busy_llc);
-	kfree(d->mbm_total);
-	kfree(d->mbm_local);
+	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++) {
+		kfree(d->mbm_states[i]);
+		d->mbm_states[i] = NULL;
+	}
 }
 
 void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d)
@@ -4085,32 +4081,34 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain *d)
 {
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
-	size_t tsize;
+	size_t tsize = sizeof(*d->mbm_states[0]);
+	enum resctrl_event_id eventid;
+	int idx;
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		tsize = sizeof(*d->mbm_total);
-		d->mbm_total = kcalloc(idx_limit, tsize, GFP_KERNEL);
-		if (!d->mbm_total) {
-			bitmap_free(d->rmid_busy_llc);
-			return -ENOMEM;
-		}
-	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		tsize = sizeof(*d->mbm_local);
-		d->mbm_local = kcalloc(idx_limit, tsize, GFP_KERNEL);
-		if (!d->mbm_local) {
-			bitmap_free(d->rmid_busy_llc);
-			kfree(d->mbm_total);
-			return -ENOMEM;
-		}
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
+		if (!d->mbm_states[idx])
+			goto cleanup;
 	}
 
 	return 0;
+cleanup:
+	bitmap_free(d->rmid_busy_llc);
+	while (--idx >= 0) {
+		kfree(d->mbm_states[idx]);
+		d->mbm_states[idx] = NULL;
+	}
+
+	return -ENOMEM;
 }
 
 int resctrl_online_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d)
-- 
2.49.0

