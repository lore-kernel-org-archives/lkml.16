Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CFA215760
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602835; cv=none; b=JckPmFB3d+ax03ZYI5yHEOfyN2VBhE/iPQxS8JH5nVuFXvIY7ebEbA71pucbTrrpxbXdVF7pN4kShiVPZXjiy2xqvOcZhr7FsHxdxc4rU27fvmw62nXlutvqo0msgIueJhYmm6PSu4xZClyqjZgqjI7UqMPjm8qjTWHIamSa8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602835; c=relaxed/simple;
	bh=YG3IJ0pr2YK1vpBhILPp6xAT9mzDFnHcLo5bnq08t+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nD2odS/26etefPYoU62alyhMpjnMTdpFYzmt1BKVjCqvxI1jeoqfSGiIEWnqaRSpW1CyEyZV8bCtk/UU3R0kc3g2bqnklYB2b8krhuZeC/x9yO0BwGNIRBdXjeQvAQ85ZeowxKf1910zYvWrua8PA3WqCBmrA1N2pk8B7SYypC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D0C522FA;
	Fri, 25 Apr 2025 10:40:27 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1643F762;
	Fri, 25 Apr 2025 10:40:28 -0700 (PDT)
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
Subject: [PATCH v9 23/27] x86,fs/resctrl: Remove duplicated trace header files
Date: Fri, 25 Apr 2025 17:38:05 +0000
Message-Id: <20250425173809.5529-24-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
References: <20250425173809.5529-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The copy-pasting python script creates some empty trace point header
files. These can cause a build warning from ftrace.

Remove them.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
---
Changes since v8:
 * Removed stale CFLAGS_monitor.o for ftrace from arch/x86's Makefile.
---
 arch/x86/kernel/cpu/resctrl/Makefile        |  1 -
 arch/x86/kernel/cpu/resctrl/monitor.c       |  4 ----
 arch/x86/kernel/cpu/resctrl/monitor_trace.h | 17 -----------------
 fs/resctrl/pseudo_lock.c                    |  4 ----
 fs/resctrl/pseudo_lock_trace.h              | 17 -----------------
 5 files changed, 43 deletions(-)
 delete mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
 delete mode 100644 fs/resctrl/pseudo_lock_trace.h

diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 909be78ec6da..d8a04b195da2 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -5,4 +5,3 @@ obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
 # To allow define_trace.h's recursive include:
 CFLAGS_pseudo_lock.o = -I$(src)
-CFLAGS_monitor.o = -I$(src)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index bec251dcd581..c0a04fe2bcd9 100644
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
2.39.5

