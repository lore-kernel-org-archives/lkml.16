Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327C228C5C3
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724862; cv=none; b=gzhtVxcJXqBdswH3VnpKvVveRcz40MpHs/sKq4Tgvn5mwdG5/nApbunP3Qizs+9AgmgpYCpPruGurHzPlLzehj/w33fY547RxY448KrTbtxy4ema/rlgc4887GWkeJTo6StLyHSeoJTrTYWYJgdyjRni7C5Bqy63BQexPlBUiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724862; c=relaxed/simple;
	bh=rGswDzSe5JGqnbD3yrim4qf81OAx0fUoFdSP4ZMfRHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NMcWLBCz9DWISgh5O6gzCsGtskdu5W0j9gmpfHeGjtimkgKUC8RniRdy0ZQRPBHsHkA9PwiVVLOcYfUmgCqsdLv/hxIGSQ0KI+gdvkYvbDWOOtYr0kWH7P1NxsyjXxElDLOtA8QQ91+QrVHkI4cLduf44DKo19+lNEk5U4/NWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B58225E9;
	Thu,  8 May 2025 10:20:50 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C1D73F58B;
	Thu,  8 May 2025 10:20:57 -0700 (PDT)
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
	Babu Moger <babu.moger@amd.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v10 27/30] fs/resctrl: Remove unnecessary includes
Date: Thu,  8 May 2025 17:18:55 +0000
Message-Id: <20250508171858.9197-28-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508171858.9197-1-james.morse@arm.com>
References: <20250508171858.9197-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When splitting and moving the resctrl code to live in fs/resctrl and
arch/x86, some code was duplicated. This was done to keep the parser
in the script that does the moving simple. This results in unnecessary
includes in the arch and filesystem code.

Remove them.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v7:
 * Expanded the scope, removed many more includes.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 4 ----
 arch/x86/kernel/cpu/resctrl/internal.h    | 5 -----
 arch/x86/kernel/cpu/resctrl/monitor.c     | 3 ---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 7 -------
 fs/resctrl/internal.h                     | 2 --
 fs/resctrl/monitor.c                      | 3 ---
 fs/resctrl/pseudo_lock.c                  | 6 ------
 fs/resctrl/rdtgroup.c                     | 2 --
 8 files changed, 32 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 0164d769aeca..1189c0df4ad7 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -16,10 +16,6 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cpu.h>
-#include <linux/kernfs.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-#include <linux/tick.h>
 
 #include "internal.h"
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 521db28efb3f..5e3c41b36437 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -3,11 +3,6 @@
 #define _ASM_X86_RESCTRL_INTERNAL_H
 
 #include <linux/resctrl.h>
-#include <linux/sched.h>
-#include <linux/kernfs.h>
-#include <linux/fs_context.h>
-#include <linux/jump_label.h>
-#include <linux/tick.h>
 
 #define L3_QOS_CDP_ENABLE		0x01ULL
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c0a04fe2bcd9..3936bab81411 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -18,10 +18,7 @@
 #define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
-#include <linux/module.h>
 #include <linux/resctrl.h>
-#include <linux/sizes.h>
-#include <linux/slab.h>
 
 #include <asm/cpu_device_id.h>
 
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 99c34a0610a4..241d0d7e1cb5 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -12,17 +12,10 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cacheflush.h>
-#include <linux/cacheinfo.h>
 #include <linux/cpu.h>
-#include <linux/cpumask.h>
-#include <linux/debugfs.h>
-#include <linux/kthread.h>
-#include <linux/mman.h>
 #include <linux/perf_event.h>
 #include <linux/pm_qos.h>
 #include <linux/resctrl.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/perf_event.h>
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index bfa9bfe070fe..ed7dfc071e6c 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -3,10 +3,8 @@
 #define _ASM_X86_RESCTRL_INTERNAL_H
 
 #include <linux/resctrl.h>
-#include <linux/sched.h>
 #include <linux/kernfs.h>
 #include <linux/fs_context.h>
-#include <linux/jump_label.h>
 #include <linux/tick.h>
 
 #define CQM_LIMBOCHECK_INTERVAL	1000
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index a76bfaa8d43e..bde2801289d3 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -18,13 +18,10 @@
 #define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
-#include <linux/module.h>
 #include <linux/resctrl.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 
-#include <asm/cpu_device_id.h>
-
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 7305b232384e..ccc2f9213b4b 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -11,23 +11,17 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
-#include <linux/cacheflush.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/kthread.h>
 #include <linux/mman.h>
-#include <linux/perf_event.h>
 #include <linux/pm_qos.h>
 #include <linux/resctrl.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
-#include <asm/cpu_device_id.h>
-#include <asm/perf_event.h>
-
-#include "../../events/perf_event.h" /* For X86_CONFIG() */
 #include "internal.h"
 
 /*
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b86309a9df8f..ec28228f6a8d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -21,10 +21,8 @@
 #include <linux/resctrl.h>
 #include <linux/seq_buf.h>
 #include <linux/seq_file.h>
-#include <linux/sched/signal.h>
 #include <linux/sched/task.h>
 #include <linux/slab.h>
-#include <linux/task_work.h>
 #include <linux/user_namespace.h>
 
 #include <uapi/linux/magic.h>
-- 
2.39.5

