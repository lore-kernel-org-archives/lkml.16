Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DFA26AD9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389797; cv=none; b=kPiFJe1ScDgQJJvL6A0N7Kfs/8fqldQlZZDhAaqd/FP7eCMsVYCztOCppkuYvBlcQzEjpqjplwmgTdUGy/4O9kuQ6HqIPyCnerwgsiUyRFJeJ+o/VQPpDmUPqFipxxW9aPbifjHzcn1XjX+dWtJorE5D4PiSTWV9zCUwv4r6WPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389797; c=relaxed/simple;
	bh=CdTHi6eT1Kjgc4DY1oXdDwJVQJnxHAxgx9tkaj8ccyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MezjDiBDvI7StHLvx8oHpUZEnX27I4SGHCgUaoHBJj4r/gzjTw7pf3yGQseVLFPXrxRf0p+58b86nnv6qNJQe7ygzRSYejFzvbRR0erXUhjO2X6XauqCSAv2JTnG6jxD9cLd5Ipsor4c589tu075idUW4mQP3mt9Xv9mpOoWLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AB63106F;
	Fri, 11 Apr 2025 09:43:14 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80B6D3F694;
	Fri, 11 Apr 2025 09:43:11 -0700 (PDT)
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
	fenghuay@nvidia.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v8 01/21] x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name
Date: Fri, 11 Apr 2025 16:42:09 +0000
Message-Id: <20250411164229.23413-2-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250411164229.23413-1-james.morse@arm.com>
References: <20250411164229.23413-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name."),
a helper rdt_kn_name() that checks that rdtgroup_mutex is held has been
used for all accesses to the kernfs node name.

rdtgroup_mkdir() uses the name to determine if a valid monitor group is
being created by checking the parent name is "mon_groups". This is done
without holding rdtgroup_mutex, and now triggers the following warning:
| WARNING: suspicious RCU usage
| 6.15.0-rc1 #4465 Tainted: G            E
| -----------------------------
| arch/x86/kernel/cpu/resctrl/internal.h:408 suspicious rcu_dereference_check() usage!
[...]
| Call Trace:
|  <TASK>
|  dump_stack_lvl+0x6c/0xa0
|  lockdep_rcu_suspicious.cold+0x4e/0x96
|  is_mon_groups+0xba/0xd0
|  rdtgroup_mkdir+0x118/0x1970
|  kernfs_iop_mkdir+0xfa/0x1a0
|  vfs_mkdir+0x456/0x760
|  do_mkdirat+0x257/0x310
|  __x64_sys_mkdir+0xd4/0x120
|  do_syscall_64+0x6d/0x150
|  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Creating a control or monitor group calls mkdir_rdt_prepare(), which uses
rdtgroup_kn_lock_live() to take the rdtgroup_mutex.

To avoid taking and dropping the lock, move the check for the monitor group
name and position into mkdir_rdt_prepare() so that it occurs under
rdtgroup_mutex. Hoist is_mon_groups() earlier in the file.

CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
Signed-off-by: James Morse <james.morse@arm.com>
Acked-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

---
Changes since v1:
 * Add a word to a comment.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 48 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 93ec829015f1..776c8e347654 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -3553,6 +3553,22 @@ static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
 		free_rmid(rgrp->closid, rgrp->mon.rmid);
 }
 
+/*
+ * We allow creating mon groups only with in a directory called "mon_groups"
+ * which is present in every ctrl_mon group. Check if this is a valid
+ * "mon_groups" directory.
+ *
+ * 1. The directory should be named "mon_groups".
+ * 2. The mon group itself should "not" be named "mon_groups".
+ *   This makes sure "mon_groups" directory always has a ctrl_mon group
+ *   as parent.
+ */
+static bool is_mon_groups(struct kernfs_node *kn, const char *name)
+{
+	return (!strcmp(rdt_kn_name(kn), "mon_groups") &&
+		strcmp(name, "mon_groups"));
+}
+
 static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 			     const char *name, umode_t mode,
 			     enum rdt_group_type rtype, struct rdtgroup **r)
@@ -3568,6 +3584,15 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
+	/*
+	 * Check that the parent directory for a monitor group is a
+	 * "mon_groups" directory.
+	 */
+	if (rtype == RDTMON_GROUP && !is_mon_groups(parent_kn, name)) {
+		ret = -EPERM;
+		goto out_unlock;
+	}
+
 	if (rtype == RDTMON_GROUP &&
 	    (prdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
 	     prdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)) {
@@ -3751,22 +3776,6 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
 	return ret;
 }
 
-/*
- * We allow creating mon groups only with in a directory called "mon_groups"
- * which is present in every ctrl_mon group. Check if this is a valid
- * "mon_groups" directory.
- *
- * 1. The directory should be named "mon_groups".
- * 2. The mon group itself should "not" be named "mon_groups".
- *   This makes sure "mon_groups" directory always has a ctrl_mon group
- *   as parent.
- */
-static bool is_mon_groups(struct kernfs_node *kn, const char *name)
-{
-	return (!strcmp(rdt_kn_name(kn), "mon_groups") &&
-		strcmp(name, "mon_groups"));
-}
-
 static int rdtgroup_mkdir(struct kernfs_node *parent_kn, const char *name,
 			  umode_t mode)
 {
@@ -3782,11 +3791,8 @@ static int rdtgroup_mkdir(struct kernfs_node *parent_kn, const char *name,
 	if (resctrl_arch_alloc_capable() && parent_kn == rdtgroup_default.kn)
 		return rdtgroup_mkdir_ctrl_mon(parent_kn, name, mode);
 
-	/*
-	 * If RDT monitoring is supported and the parent directory is a valid
-	 * "mon_groups" directory, add a monitoring subdirectory.
-	 */
-	if (resctrl_arch_mon_capable() && is_mon_groups(parent_kn, name))
+	/* Else, attempt to add a monitoring subdirectory. */
+	if (resctrl_arch_mon_capable())
 		return rdtgroup_mkdir_mon(parent_kn, name, mode);
 
 	return -EPERM;
-- 
2.20.1

