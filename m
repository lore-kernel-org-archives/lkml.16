Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32A521D5AA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389860; cv=none; b=ia9MaS2DtjEspyE0jy9jv6f+ntT6GzPrWTH/Unlwz7wonVC1XwlavrCsLinnhmwvqhehTQHoG6gLSccxYrQtUSjsibpjDtuYBEAw+rsY5MN+QGV1M8uJOjHKS/8HGwbWcq2LdgfRvMq05AoRWbQwG6SzvDVOCSRhcQLoFxD7N2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389860; c=relaxed/simple;
	bh=VJ2TFBFlDmqkaw/5UIr4ubt+NFBR1fjRYsGifkhg2ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MlLDV9sT+cYOmgNt9xmj5H3DSVZBzGd1SpiG8vfiDrMO7CpdbLf//i2TY+/29VO6bJ0fQzhND0mP/LkHLYooW/qoybeGcgKPK2wTDLOMt03N/w0pMRY2QJxpaVO4zOY2AKkY5ZUcrVEmtCsY4O8kIlUltZxqEOcw2zEHunadekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2730A2403;
	Fri, 11 Apr 2025 09:44:18 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AEEB3F694;
	Fri, 11 Apr 2025 09:44:15 -0700 (PDT)
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
	Babu Moger <babu.moger@amd.com>
Subject: [PATCH v8 18/21] x86,fs/resctrl: Remove duplicated trace header files
Date: Fri, 11 Apr 2025 16:42:26 +0000
Message-Id: <20250411164229.23413-19-james.morse@arm.com>
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

The copy-pasting python script harmlessly creates some empty trace
point header files. Remove them.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
---
 arch/x86/kernel/cpu/resctrl/monitor.c       |  4 ----
 arch/x86/kernel/cpu/resctrl/monitor_trace.h | 17 -----------------
 fs/resctrl/pseudo_lock.c                    |  4 ----
 fs/resctrl/pseudo_lock_trace.h              | 17 -----------------
 4 files changed, 42 deletions(-)
 delete mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
 delete mode 100644 fs/resctrl/pseudo_lock_trace.h

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 1809e3fe6ef3..800e52845b1d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -27,10 +27,6 @@
 
 #include "internal.h"
 
-#define CREATE_TRACE_POINTS
-
-#include "monitor_trace.h"
-
 /*
  * Global boolean for rdt_monitor which is true if any
  * resource monitoring is enabled.
diff --git a/arch/x86/kernel/cpu/resctrl/monitor_trace.h b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
deleted file mode 100644
index b5a142dd0f0e..000000000000
--- a/arch/x86/kernel/cpu/resctrl/monitor_trace.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM resctrl
-
-#if !defined(_FS_RESCTRL_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _FS_RESCTRL_MONITOR_TRACE_H
-
-#include <linux/tracepoint.h>
-
-#endif /* _FS_RESCTRL_MONITOR_TRACE_H */
-
-#undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH .
-
-#define TRACE_INCLUDE_FILE monitor_trace
-
-#include <trace/define_trace.h>
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 29682dd46871..7305b232384e 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -30,10 +30,6 @@
 #include "../../events/perf_event.h" /* For X86_CONFIG() */
 #include "internal.h"
 
-#define CREATE_TRACE_POINTS
-
-#include "pseudo_lock_trace.h"
-
 /*
  * Major number assigned to and shared by all devices exposing
  * pseudo-locked regions.
diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
deleted file mode 100644
index 7a6a1983953a..000000000000
--- a/fs/resctrl/pseudo_lock_trace.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM resctrl
-
-#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
-
-#include <linux/tracepoint.h>
-
-#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
-
-#undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH .
-
-#define TRACE_INCLUDE_FILE pseudo_lock_trace
-
-#include <trace/define_trace.h>
-- 
2.20.1

