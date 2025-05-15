Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CEF254849
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328376; cv=none; b=UD6g3KRxTAHeD47Oh2mF/wAaTBVDdKZWFxpc7ZcjiTqHFBLhPORAbbzRJkeDBNmKkdMQHHSNPKh5bj/xekMNmO+4S8VsfK519fXtVVcOmQEojCrI472kbxpg0POTpw7ZMpj2VPdFOtvQA4dEybUD+KIbhL8fXfLhgu/3S3i7/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328376; c=relaxed/simple;
	bh=7NXzJhDoVLS49aE4Fl4vJn/8Rg6TXVsJmws3aIrFqvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ld/G3DaVzYunr+zHpmLAjsug/BYIAe9gXTdtc3+4DnuZqw0MPEMZX6TW9qi/g90XvRdURsgmngJpxi1ZjV+ul1Rla/E8cXDJR9rZPn+tLGdjqH5mGxhoI6MN+Mf00/elc6QScAF172yYj0QUINSDUHYKsaDnvjhvkJdP7se8Ybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7832122FA;
	Thu, 15 May 2025 09:59:22 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69FB43F63F;
	Thu, 15 May 2025 09:59:30 -0700 (PDT)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 06/25] x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
Date: Thu, 15 May 2025 16:58:36 +0000
Message-Id: <20250515165855.31452-7-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250515165855.31452-1-james.morse@arm.com>
References: <20250515165855.31452-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl_sched_in() loads the architecture specific CPU MSRs with the
CLOSID and RMID values. This function was named before resctrl was
split to have architecture specific code, and generic filesystem code.

This function is obviously architecture specific, but does not begin
with 'resctrl_arch_', making it the odd one out in the functions an
architecture needs to support to enable resctrl.

Rename it for consistency. This is purely cosmetic.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
 arch/x86/include/asm/resctrl.h         |  4 ++--
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 12 ++++++------
 arch/x86/kernel/process_32.c           |  2 +-
 arch/x86/kernel/process_64.c           |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 011bf67a1866..7a39728b0743 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -175,7 +175,7 @@ static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
 	return READ_ONCE(tsk->rmid) == rmid;
 }
 
-static inline void resctrl_sched_in(struct task_struct *tsk)
+static inline void resctrl_arch_sched_in(struct task_struct *tsk)
 {
 	if (static_branch_likely(&rdt_enable_key))
 		__resctrl_sched_in(tsk);
@@ -212,7 +212,7 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c);
 
 #else
 
-static inline void resctrl_sched_in(struct task_struct *tsk) {}
+static inline void resctrl_arch_sched_in(struct task_struct *tsk) {}
 static inline void resctrl_cpu_detect(struct cpuinfo_x86 *c) {}
 
 #endif /* CONFIG_X86_CPU_RESCTRL */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 53213cae30ec..88197afbbb8a 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -376,7 +376,7 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 }
 
 /*
- * This is safe against resctrl_sched_in() called from __switch_to()
+ * This is safe against resctrl_arch_sched_in() called from __switch_to()
  * because __switch_to() is executed with interrupts disabled. A local call
  * from update_closid_rmid() is protected against __switch_to() because
  * preemption is disabled.
@@ -395,7 +395,7 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 	 * executing task might have its own closid selected. Just reuse
 	 * the context switch code.
 	 */
-	resctrl_sched_in(current);
+	resctrl_arch_sched_in(current);
 }
 
 /*
@@ -620,7 +620,7 @@ static void _update_task_closid_rmid(void *task)
 	 * Otherwise, the MSR is updated when the task is scheduled in.
 	 */
 	if (task == current)
-		resctrl_sched_in(task);
+		resctrl_arch_sched_in(task);
 }
 
 static void update_task_closid_rmid(struct task_struct *t)
@@ -678,7 +678,7 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
 	 * Ensure the task's closid and rmid are written before determining if
 	 * the task is current that will decide if it will be interrupted.
 	 * This pairs with the full barrier between the rq->curr update and
-	 * resctrl_sched_in() during context switch.
+	 * resctrl_arch_sched_in() during context switch.
 	 */
 	smp_mb();
 
@@ -2994,8 +2994,8 @@ static void rdt_move_group_tasks(struct rdtgroup *from, struct rdtgroup *to,
 			/*
 			 * Order the closid/rmid stores above before the loads
 			 * in task_curr(). This pairs with the full barrier
-			 * between the rq->curr update and resctrl_sched_in()
-			 * during context switch.
+			 * between the rq->curr update and
+			 * resctrl_arch_sched_in() during context switch.
 			 */
 			smp_mb();
 
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 4636ef359973..f1429fdac11c 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -211,7 +211,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	switch_fpu_finish(next_p);
 
 	/* Load the Intel cache allocation PQR MSR. */
-	resctrl_sched_in(next_p);
+	resctrl_arch_sched_in(next_p);
 
 	return prev_p;
 }
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 7196ca7048be..642fc3232cec 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -707,7 +707,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	}
 
 	/* Load the Intel cache allocation PQR MSR. */
-	resctrl_sched_in(next_p);
+	resctrl_arch_sched_in(next_p);
 
 	return prev_p;
 }
-- 
2.39.5

