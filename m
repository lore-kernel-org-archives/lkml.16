Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBED71AF4E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952472; cv=none; b=PFrOGcCGM+MjrdBzD6HmKJG/UiOsBugPbKMsqC2F57JloaI12vsfJ6MvmkRWrY6qiP/OJUu0TOyQpGWHpn5aRfBOYww5b+87lSnRBQRdrF+KXxLTyqMVd1nH4aZdUDrvcaZ6VG7GPcBcDERY8rqliD0ML1je6nefzSBMGoE0+DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952472; c=relaxed/simple;
	bh=34UocWVSN3dGfK9ddb8MDRo3AU4bVW3Pvwz5MGjnN30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=edzmQCT8CRaz1N9z0j5OnDawAxdTiDx7vz1PxIqaf5ANscFYEuEcKlijvFuk1ENpYAU9jyXuAwVX4dQlp2AMWVwCTWurQln2bvF/4lWLn82uB1BR2FokzzzUo8n5w4Dyn8koLUwzNlk9a3U0TjKO23gs1LFoqLoOlDqXLQHleeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 829C71F37;
	Fri,  7 Feb 2025 10:21:23 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64EA33F63F;
	Fri,  7 Feb 2025 10:20:57 -0800 (PST)
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
Subject: [PATCH v6 39/42] x86/resctrl: Split trace.h
Date: Fri,  7 Feb 2025 18:18:20 +0000
Message-Id: <20250207181823.6378-40-james.morse@arm.com>
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

trace.h contains all the tracepoints. After the move to /fs/resctrl, some
of these will be left behind. All the pseudo_lock tracepoints remain part
of the architecture. The lone tracepoint in monitor.c moves to /fs/resctrl.

Split trace.h so that each C file includes a different trace header file.
This means the trace header files are not modified when they are moved.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/Makefile          |  3 ++
 arch/x86/kernel/cpu/resctrl/monitor.c         |  4 ++-
 arch/x86/kernel/cpu/resctrl/monitor_trace.h   | 31 +++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  2 +-
 .../resctrl/{trace.h => pseudo_lock_trace.h}  | 24 +++-----------
 5 files changed, 42 insertions(+), 22 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
 rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)

diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 0c13b0befd8a..909be78ec6da 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -2,4 +2,7 @@
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
+
+# To allow define_trace.h's recursive include:
 CFLAGS_pseudo_lock.o = -I$(src)
+CFLAGS_monitor.o = -I$(src)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a9168913c153..6acfbd3ad007 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -26,7 +26,9 @@
 #include <asm/resctrl.h>
 
 #include "internal.h"
-#include "trace.h"
+
+#define CREATE_TRACE_POINTS
+#include "monitor_trace.h"
 
 /**
  * struct rmid_entry - dirty tracking for all RMID.
diff --git a/arch/x86/kernel/cpu/resctrl/monitor_trace.h b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
new file mode 100644
index 000000000000..ade67daf42c2
--- /dev/null
+++ b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM resctrl
+
+#if !defined(_FS_RESCTRL_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _FS_RESCTRL_MONITOR_TRACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(mon_llc_occupancy_limbo,
+	    TP_PROTO(u32 ctrl_hw_id, u32 mon_hw_id, int domain_id, u64 llc_occupancy_bytes),
+	    TP_ARGS(ctrl_hw_id, mon_hw_id, domain_id, llc_occupancy_bytes),
+	    TP_STRUCT__entry(__field(u32, ctrl_hw_id)
+			     __field(u32, mon_hw_id)
+			     __field(int, domain_id)
+			     __field(u64, llc_occupancy_bytes)),
+	    TP_fast_assign(__entry->ctrl_hw_id = ctrl_hw_id;
+			   __entry->mon_hw_id = mon_hw_id;
+			   __entry->domain_id = domain_id;
+			   __entry->llc_occupancy_bytes = llc_occupancy_bytes;),
+	    TP_printk("ctrl_hw_id=%u mon_hw_id=%u domain_id=%d llc_occupancy_bytes=%llu",
+		      __entry->ctrl_hw_id, __entry->mon_hw_id, __entry->domain_id,
+		      __entry->llc_occupancy_bytes)
+	   );
+
+#endif /* _FS_RESCTRL_MONITOR_TRACE_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE monitor_trace
+#include <trace/define_trace.h>
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index e7f713eb4490..9eda0abbd29d 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -30,7 +30,7 @@
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
-#include "trace.h"
+#include "pseudo_lock_trace.h"
 
 /*
  * The bits needed to disable hardware prefetching varies based on the
diff --git a/arch/x86/kernel/cpu/resctrl/trace.h b/arch/x86/kernel/cpu/resctrl/pseudo_lock_trace.h
similarity index 56%
rename from arch/x86/kernel/cpu/resctrl/trace.h
rename to arch/x86/kernel/cpu/resctrl/pseudo_lock_trace.h
index 2a506316b303..5a0fae61d3ee 100644
--- a/arch/x86/kernel/cpu/resctrl/trace.h
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock_trace.h
@@ -2,8 +2,8 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM resctrl
 
-#if !defined(_TRACE_RESCTRL_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_RESCTRL_H
+#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
 
 #include <linux/tracepoint.h>
 
@@ -35,25 +35,9 @@ TRACE_EVENT(pseudo_lock_l3,
 	    TP_printk("hits=%llu miss=%llu",
 		      __entry->l3_hits, __entry->l3_miss));
 
-TRACE_EVENT(mon_llc_occupancy_limbo,
-	    TP_PROTO(u32 ctrl_hw_id, u32 mon_hw_id, int domain_id, u64 llc_occupancy_bytes),
-	    TP_ARGS(ctrl_hw_id, mon_hw_id, domain_id, llc_occupancy_bytes),
-	    TP_STRUCT__entry(__field(u32, ctrl_hw_id)
-			     __field(u32, mon_hw_id)
-			     __field(int, domain_id)
-			     __field(u64, llc_occupancy_bytes)),
-	    TP_fast_assign(__entry->ctrl_hw_id = ctrl_hw_id;
-			   __entry->mon_hw_id = mon_hw_id;
-			   __entry->domain_id = domain_id;
-			   __entry->llc_occupancy_bytes = llc_occupancy_bytes;),
-	    TP_printk("ctrl_hw_id=%u mon_hw_id=%u domain_id=%d llc_occupancy_bytes=%llu",
-		      __entry->ctrl_hw_id, __entry->mon_hw_id, __entry->domain_id,
-		      __entry->llc_occupancy_bytes)
-	   );
-
-#endif /* _TRACE_RESCTRL_H */
+#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
 
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
-#define TRACE_INCLUDE_FILE trace
+#define TRACE_INCLUDE_FILE pseudo_lock_trace
 #include <trace/define_trace.h>
-- 
2.39.2

