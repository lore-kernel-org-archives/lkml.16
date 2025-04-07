Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE7022D787
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030022; cv=none; b=eZtARhbDTWCYTCWHdOqYB6X37W1TclkMjv6r3haDlmxM8g0nXAuSz3s5Pmc/S95tpq2iwTAEKXqaSy/pptQzKUQ/xmHDmmUmdRhxiT/kz1ORRk0T/OK+kHSTb64TdG1PTZYeqPBWnD9Pl9b1qa9wRgGSCVTTUq5hSVnFmOF32hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030022; c=relaxed/simple;
	bh=1OzazdeudmntwLk2IoCfuNvNbvQNsvI07peAdfRkaKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTpSceF9TB7TVSbzrhBohxmuUYdZh4Nx++5eBZ2oBT1LKxQn8MUP/yhZY5c8LDOCfd60XP27z3Opr6UEl0iBPS98FTEPGBLN1k4ORh6XsxbiXaQXBkzeSxhC0gu2pkSTbrX2nZhVk6W5sPkUKVGT85JbD+h4mbkYXxl3WlrMQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86404106F;
	Mon,  7 Apr 2025 05:47:01 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B90DF3F694;
	Mon,  7 Apr 2025 05:46:58 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	babu.moger@amd.com,
	James Morse <james.morse@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name
Date: Mon,  7 Apr 2025 13:46:37 +0100
Message-Id: <20250407124637.2433230-1-james.morse@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213145023.2820193-7-bigeasy@linutronix.de>
References: <20250213145023.2820193-7-bigeasy@linutronix.de>
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
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 48 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 93ec829015f1..a81a42cf6656 100644
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
+	 * Check the parent directory for a monitor group is a "mon_groups"
+	 * directory.
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
2.39.5

