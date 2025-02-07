Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6791AC882
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952360; cv=none; b=T25bv2oNfRLwC8zjNYGfI9rCeOYgC33xZksTJ9KqSGWVI7dT3tWADnCOA2+j+WZXmBpkgfhhh2Joob+FaaqUuJua6w/1TQsmiv/xzGvqwPhjOpfmhLu3aXfzJjRZPPCAHusBareOK+HU3hPh9EjlLBm/Qo1rar0XMiUtNNyD07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952360; c=relaxed/simple;
	bh=7lgzfSf2A+6XQKrZqgc77g7KpSUFq5vLPtOq4VJzqas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gN6rFzEk+ytxObicFvWKXe+uQdn9SZR1eB0IEq8Wgzq/RHyxFw9dL4CAKD/GD1bCgv3+Y6fivx4/sKgqBZr2IXbwfxC1uf1F314k3FfN/CAKoMolRAigPlASoAxnpdRKuQW96+WrbbwJ4DH2HBuVZk3LMKlapX/9o1c1k1DzZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553E9113E;
	Fri,  7 Feb 2025 10:19:41 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D3E3F63F;
	Fri,  7 Feb 2025 10:19:14 -0800 (PST)
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
Subject: [PATCH v6 10/42] x86/resctrl: Remove rdtgroup from update_cpu_closid_rmid()
Date: Fri,  7 Feb 2025 18:17:51 +0000
Message-Id: <20250207181823.6378-11-james.morse@arm.com>
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

update_cpu_closid_rmid() takes a struct rdtgroup as an argument, which
it uses to update the local CPUs default pqr values. This is a problem
once the resctrl parts move out to /fs/, as the arch code cannot
poke around inside struct rdtgroup.

Rename update_cpu_closid_rmid() as resctrl_arch_sync_cpus_defaults()
to be used as the target of an IPI, and pass the effective CLOSID
and RMID in a new struct.

Co-developed-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v1:
 * To clarify the meanings of the new helper and struct:

   Rename resctrl_arch_sync_cpu_default() to
   resctrl_arch_sync_cpu_closid_rmid();

   Rename struct resctrl_cpu_sync to struct resctrl_cpu_defaults;

   Flesh out the comment block in <linux/resctrl.h>.

   No functional change.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 17 +++++++++++++----
 include/linux/resctrl.h                | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index f706e5a288b1..62d9a50c7bba 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -355,13 +355,13 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
  * from update_closid_rmid() is protected against __switch_to() because
  * preemption is disabled.
  */
-static void update_cpu_closid_rmid(void *info)
+void resctrl_arch_sync_cpu_closid_rmid(void *info)
 {
-	struct rdtgroup *r = info;
+	struct resctrl_cpu_defaults *r = info;
 
 	if (r) {
 		this_cpu_write(pqr_state.default_closid, r->closid);
-		this_cpu_write(pqr_state.default_rmid, r->mon.rmid);
+		this_cpu_write(pqr_state.default_rmid, r->rmid);
 	}
 
 	/*
@@ -376,11 +376,20 @@ static void update_cpu_closid_rmid(void *info)
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
  * Per task closids/rmids must have been set up before calling this function.
+ * @r may be NULL.
  */
 static void
 update_closid_rmid(const struct cpumask *cpu_mask, struct rdtgroup *r)
 {
-	on_each_cpu_mask(cpu_mask, update_cpu_closid_rmid, r, 1);
+	struct resctrl_cpu_defaults defaults, *p = NULL;
+
+	if (r) {
+		defaults.closid = r->closid;
+		defaults.rmid = r->mon.rmid;
+		p = &defaults;
+	}
+
+	on_each_cpu_mask(cpu_mask, resctrl_arch_sync_cpu_closid_rmid, p, 1);
 }
 
 static int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index a939c0cec7fe..da3b344d06d3 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -266,6 +266,28 @@ struct resctrl_schema {
 	u32				num_closid;
 };
 
+struct resctrl_cpu_defaults {
+	u32 closid;
+	u32 rmid;
+};
+
+/**
+ * resctrl_arch_sync_cpu_closid_rmid() - Refresh this CPU's CLOSID and RMID.
+ *					 Call via IPI.
+ * @info:	If non-NULL, a pointer to a struct resctrl_cpu_defaults
+ *		specifying the new CLOSID and RMID for tasks in the default
+ *		resctrl ctrl and mon group when running on this CPU.  If NULL,
+ *		this CPU is not re-assigned to a different default group.
+ *
+ * Propagates reassignment of CPUs and/or tasks to different resctrl groups
+ * when requested by the resctrl core code.
+ *
+ * This function records the per-cpu defaults specified by @info (if any),
+ * and then reconfigures the CPU's hardware CLOSID and RMID for subsequent
+ * execution based on @current, in the same way as during a task switch.
+ */
+void resctrl_arch_sync_cpu_closid_rmid(void *info);
+
 /**
  * resctrl_get_default_ctrl() - Return the default control value for this
  *                              resource.
-- 
2.39.2

