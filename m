Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B543FD4
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 01:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066062; cv=none; b=UKa8SkurXe1duzqmpgpZPwDp3/tnSm+XICm1YFalGnRSOCLG2Lqu1+OTZPvBfeV5ORd96VjEkJrH+wQZEo+5Yah0JeKHxTO0qyrYkGwUWnNDnL40l43vo5/0Fp1bbUvYh3SgV2Du4cNRkYGm8yCz+XuW3ngUtgCWLnPBC3FkwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066062; c=relaxed/simple;
	bh=IMBK/aa4YBKxPkjPQoNVYOsD5WKxCOJaFhR/G73o5Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IE3vwem4gkwywC7MzZWLwAHtJ9619oBSb/k7Q1obzqJnO+JDb20YlxiqcTwmh8rmOrSzCs5PdE5GvVFWnfro87jeHS6/T2LFULxi2cDAuaxyEOvrqQEqYFERno/vjfDQx/NurncJfqnmlhFvQpzx1qvv2PiE9osC0KGk7kNw/Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sx27YApZ; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sx27YApZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YdPNJ0a0NLftFD462uDFcfiILOofHUE3j8QugkO8dqc=; b=sx27YApZSDvkFbByyjV5lbjtBs
	ASs4GwwHmoVSJd9beMnJNU4ADc1E/NLxaPGFfqTSiRZhtgEQK7RWset7JkMr3oS04uBZVdjrEJQly
	5xhGLdwxCE3k4oMl7o0Jvx7IV8S/v3HJaajlj5ximkiT8Ip+CcBdnn7OnHur1+VJzqPqa6S7qH/2X
	QkFYnJo7GL/MWLpNK7yVnBqCTqsXvRps/i4GWzucRT5G/wuo0XfG4Z4gkcovxQ8gK6meNb+HQaufY
	8nprxRlshRSoy+4njMqnOssDW3UwfbfMmgx8PlZYs9B7vVWzf+c+PNl2T9gZa+EJqooW0sWrDrgyP
	R7Yf6LrQ==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgwWH-006d67-VX; Sun, 09 Feb 2025 02:54:08 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v2] tools/sched_ext: Compatible testing of SCX_ENQ_CPU_SELECTED
Date: Sun,  9 Feb 2025 10:53:53 +0900
Message-ID: <20250209015353.11172-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides compatible testing of SCX_ENQ_CPU_SELECTED.
More specifically, it handles two cases:

  1. a BPF scheduler is compiled against vmlinux.h where
  SCX_ENQ_CPU_SELECTED is defined, but it runs on a kernel that does not
  have SCX_ENQ_CPU_SELECTED. In this case, the test result of
  'enq_flags & SCX_ENQ_CPU_SELECTED' will always be false. That test result
  is semantically incorrect because the kernel before SCX_ENQ_CPU_SELECTED
  has never skipped select_task_rq_scx(), so the result should be true.

  2. a BPF scheduler is compiling against vmlinux.h where
  SCX_ENQ_CPU_SELECTED is not defined. In this case, directly using
  SCX_ENQ_CPU_SELECTED causes compilation errors.

To hide such complexity, introduce __COMPAT_is_enq_cpu_selected(),
which checks if SCX_ENQ_CPU_SELECTED exists in runtime using BPF CO-RE.
This consists of three parts:

  1. Add enum_defs.autogen.h, which has macros (HAVE_{enum name}) denoting
  whether SCX enums are defined in the vmlinux.h or not.

  2. Implement __COMPAT_is_enq_cpu_selected(), which provide the test of
  SCX_ENQ_CPU_SELECTED in a compatible way.

  3. Use  __COMPAT_is_enq_cpu_selected() in scx_qmap.

Note that this is a sync of the relevant PR [1] in the scx repo.

  [1] https://github.com/sched-ext/scx/pull/1314

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---

ChangeLog v1 -> v2:
  - Squash four commits into one, and revise the commit message.

 tools/sched_ext/include/scx/common.bpf.h      |   1 +
 tools/sched_ext/include/scx/common.h          |   1 +
 tools/sched_ext/include/scx/compat.bpf.h      |  52 ++++++++
 .../sched_ext/include/scx/enum_defs.autogen.h | 120 ++++++++++++++++++
 tools/sched_ext/scx_qmap.bpf.c                |   2 +-
 5 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 tools/sched_ext/include/scx/enum_defs.autogen.h

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index ae717f4d6ede..f1caf9fc8f8c 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -18,6 +18,7 @@
 #include <bpf/bpf_tracing.h>
 #include <asm-generic/errno.h>
 #include "user_exit_info.h"
+#include "enum_defs.autogen.h"
 
 #define PF_WQ_WORKER			0x00000020	/* I'm a workqueue worker */
 #define PF_KTHREAD			0x00200000	/* I am a kernel thread */
diff --git a/tools/sched_ext/include/scx/common.h b/tools/sched_ext/include/scx/common.h
index dc18b99e55cd..1dc76bd84296 100644
--- a/tools/sched_ext/include/scx/common.h
+++ b/tools/sched_ext/include/scx/common.h
@@ -16,6 +16,7 @@
 #include <stdlib.h>
 #include <stdint.h>
 #include <errno.h>
+#include "enum_defs.autogen.h"
 
 typedef uint8_t u8;
 typedef uint16_t u16;
diff --git a/tools/sched_ext/include/scx/compat.bpf.h b/tools/sched_ext/include/scx/compat.bpf.h
index 50e1499ae093..e5fa72f9bf22 100644
--- a/tools/sched_ext/include/scx/compat.bpf.h
+++ b/tools/sched_ext/include/scx/compat.bpf.h
@@ -125,6 +125,58 @@ bool scx_bpf_dispatch_vtime_from_dsq___compat(struct bpf_iter_scx_dsq *it__iter,
 	false;									\
 })
 
+/**
+ * __COMPAT_is_enq_cpu_selected - Test if SCX_ENQ_CPU_SELECTED is on
+ * in a compatible way. We will preserve this __COMPAT helper until v6.16.
+ *
+ * @enq_flags: enqueue flags from ops.enqueue()
+ *
+ * Return: True if SCX_ENQ_CPU_SELECTED is turned on in @enq_flags
+ */
+static inline bool __COMPAT_is_enq_cpu_selected(u64 enq_flags)
+{
+#ifdef HAVE_SCX_ENQ_CPU_SELECTED
+	/*
+	 * This is the case that a BPF code compiled against vmlinux.h
+	 * where the enum SCX_ENQ_CPU_SELECTED exists.
+	 */
+
+	/*
+	 * We should temporarily suspend the macro expansion of
+	 * 'SCX_ENQ_CPU_SELECTED'. This avoids 'SCX_ENQ_CPU_SELECTED' being
+	 * rewritten to '__SCX_ENQ_CPU_SELECTED' when 'SCX_ENQ_CPU_SELECTED'
+	 * is defined in 'scripts/gen_enums.py'.
+	 */
+#pragma push_macro("SCX_ENQ_CPU_SELECTED")
+#undef SCX_ENQ_CPU_SELECTED
+	u64 flag;
+
+	/*
+	 * When the kernel did not have SCX_ENQ_CPU_SELECTED,
+	 * select_task_rq_scx() has never been skipped. Thus, this case
+	 * should be considered that the CPU has already been selected.
+	 */
+	if (!bpf_core_enum_value_exists(enum scx_enq_flags,
+					SCX_ENQ_CPU_SELECTED))
+		return true;
+
+	flag = bpf_core_enum_value(enum scx_enq_flags, SCX_ENQ_CPU_SELECTED);
+	return enq_flags & flag;
+
+	/*
+	 * Once done, resume the macro expansion of 'SCX_ENQ_CPU_SELECTED'.
+	 */
+#pragma pop_macro("SCX_ENQ_CPU_SELECTED")
+#else
+	/*
+	 * This is the case that a BPF code compiled against vmlinux.h
+	 * where the enum SCX_ENQ_CPU_SELECTED does NOT exist.
+	 */
+	return true;
+#endif /* HAVE_SCX_ENQ_CPU_SELECTED */
+}
+
+
 #define scx_bpf_now()								\
 	(bpf_ksym_exists(scx_bpf_now) ?						\
 	 scx_bpf_now() :							\
diff --git a/tools/sched_ext/include/scx/enum_defs.autogen.h b/tools/sched_ext/include/scx/enum_defs.autogen.h
new file mode 100644
index 000000000000..a32e534a4012
--- /dev/null
+++ b/tools/sched_ext/include/scx/enum_defs.autogen.h
@@ -0,0 +1,120 @@
+/*
+ * WARNING: This file is autogenerated from scripts/gen_enum_defs.py.
+ */
+
+#ifndef __ENUM_DEFS_AUTOGEN_H__
+#define __ENUM_DEFS_AUTOGEN_H__
+
+
+#define HAVE_SCX_DSP_DFL_MAX_BATCH
+#define HAVE_SCX_DSP_MAX_LOOPS
+#define HAVE_SCX_WATCHDOG_MAX_TIMEOUT
+#define HAVE_SCX_EXIT_BT_LEN
+#define HAVE_SCX_EXIT_MSG_LEN
+#define HAVE_SCX_EXIT_DUMP_DFL_LEN
+#define HAVE_SCX_CPUPERF_ONE
+#define HAVE_SCX_OPS_TASK_ITER_BATCH
+#define HAVE_SCX_CPU_PREEMPT_RT
+#define HAVE_SCX_CPU_PREEMPT_DL
+#define HAVE_SCX_CPU_PREEMPT_STOP
+#define HAVE_SCX_CPU_PREEMPT_UNKNOWN
+#define HAVE_SCX_DEQ_SLEEP
+#define HAVE_SCX_DEQ_CORE_SCHED_EXEC
+#define HAVE_SCX_DSQ_FLAG_BUILTIN
+#define HAVE_SCX_DSQ_FLAG_LOCAL_ON
+#define HAVE_SCX_DSQ_INVALID
+#define HAVE_SCX_DSQ_GLOBAL
+#define HAVE_SCX_DSQ_LOCAL
+#define HAVE_SCX_DSQ_LOCAL_ON
+#define HAVE_SCX_DSQ_LOCAL_CPU_MASK
+#define HAVE_SCX_DSQ_ITER_REV
+#define HAVE___SCX_DSQ_ITER_HAS_SLICE
+#define HAVE___SCX_DSQ_ITER_HAS_VTIME
+#define HAVE___SCX_DSQ_ITER_USER_FLAGS
+#define HAVE___SCX_DSQ_ITER_ALL_FLAGS
+#define HAVE_SCX_DSQ_LNODE_ITER_CURSOR
+#define HAVE___SCX_DSQ_LNODE_PRIV_SHIFT
+#define HAVE_SCX_ENQ_WAKEUP
+#define HAVE_SCX_ENQ_HEAD
+#define HAVE_SCX_ENQ_CPU_SELECTED
+#define HAVE_SCX_ENQ_PREEMPT
+#define HAVE_SCX_ENQ_REENQ
+#define HAVE_SCX_ENQ_LAST
+#define HAVE___SCX_ENQ_INTERNAL_MASK
+#define HAVE_SCX_ENQ_CLEAR_OPSS
+#define HAVE_SCX_ENQ_DSQ_PRIQ
+#define HAVE_SCX_TASK_DSQ_ON_PRIQ
+#define HAVE_SCX_TASK_QUEUED
+#define HAVE_SCX_TASK_RESET_RUNNABLE_AT
+#define HAVE_SCX_TASK_DEQD_FOR_SLEEP
+#define HAVE_SCX_TASK_STATE_SHIFT
+#define HAVE_SCX_TASK_STATE_BITS
+#define HAVE_SCX_TASK_STATE_MASK
+#define HAVE_SCX_TASK_CURSOR
+#define HAVE_SCX_ECODE_RSN_HOTPLUG
+#define HAVE_SCX_ECODE_ACT_RESTART
+#define HAVE_SCX_EXIT_NONE
+#define HAVE_SCX_EXIT_DONE
+#define HAVE_SCX_EXIT_UNREG
+#define HAVE_SCX_EXIT_UNREG_BPF
+#define HAVE_SCX_EXIT_UNREG_KERN
+#define HAVE_SCX_EXIT_SYSRQ
+#define HAVE_SCX_EXIT_ERROR
+#define HAVE_SCX_EXIT_ERROR_BPF
+#define HAVE_SCX_EXIT_ERROR_STALL
+#define HAVE_SCX_KF_UNLOCKED
+#define HAVE_SCX_KF_CPU_RELEASE
+#define HAVE_SCX_KF_DISPATCH
+#define HAVE_SCX_KF_ENQUEUE
+#define HAVE_SCX_KF_SELECT_CPU
+#define HAVE_SCX_KF_REST
+#define HAVE___SCX_KF_RQ_LOCKED
+#define HAVE___SCX_KF_TERMINAL
+#define HAVE_SCX_KICK_IDLE
+#define HAVE_SCX_KICK_PREEMPT
+#define HAVE_SCX_KICK_WAIT
+#define HAVE_SCX_OPI_BEGIN
+#define HAVE_SCX_OPI_NORMAL_BEGIN
+#define HAVE_SCX_OPI_NORMAL_END
+#define HAVE_SCX_OPI_CPU_HOTPLUG_BEGIN
+#define HAVE_SCX_OPI_CPU_HOTPLUG_END
+#define HAVE_SCX_OPI_END
+#define HAVE_SCX_OPS_ENABLING
+#define HAVE_SCX_OPS_ENABLED
+#define HAVE_SCX_OPS_DISABLING
+#define HAVE_SCX_OPS_DISABLED
+#define HAVE_SCX_OPS_KEEP_BUILTIN_IDLE
+#define HAVE_SCX_OPS_ENQ_LAST
+#define HAVE_SCX_OPS_ENQ_EXITING
+#define HAVE_SCX_OPS_SWITCH_PARTIAL
+#define HAVE_SCX_OPS_HAS_CGROUP_WEIGHT
+#define HAVE_SCX_OPS_ALL_FLAGS
+#define HAVE_SCX_OPSS_NONE
+#define HAVE_SCX_OPSS_QUEUEING
+#define HAVE_SCX_OPSS_QUEUED
+#define HAVE_SCX_OPSS_DISPATCHING
+#define HAVE_SCX_OPSS_QSEQ_SHIFT
+#define HAVE_SCX_PICK_IDLE_CORE
+#define HAVE_SCX_OPS_NAME_LEN
+#define HAVE_SCX_SLICE_DFL
+#define HAVE_SCX_SLICE_INF
+#define HAVE_SCX_RQ_ONLINE
+#define HAVE_SCX_RQ_CAN_STOP_TICK
+#define HAVE_SCX_RQ_BAL_PENDING
+#define HAVE_SCX_RQ_BAL_KEEP
+#define HAVE_SCX_RQ_BYPASSING
+#define HAVE_SCX_RQ_IN_WAKEUP
+#define HAVE_SCX_RQ_IN_BALANCE
+#define HAVE_SCX_TASK_NONE
+#define HAVE_SCX_TASK_INIT
+#define HAVE_SCX_TASK_READY
+#define HAVE_SCX_TASK_ENABLED
+#define HAVE_SCX_TASK_NR_STATES
+#define HAVE_SCX_TG_ONLINE
+#define HAVE_SCX_TG_INITED
+#define HAVE_SCX_WAKE_FORK
+#define HAVE_SCX_WAKE_TTWU
+#define HAVE_SCX_WAKE_SYNC
+
+#endif /* __ENUM_DEFS_AUTOGEN_H__ */
+
diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 5edb79742e37..267fe15d934a 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -231,7 +231,7 @@ void BPF_STRUCT_OPS(qmap_enqueue, struct task_struct *p, u64 enq_flags)
 	}
 
 	/* if select_cpu() wasn't called, try direct dispatch */
-	if (!(enq_flags & SCX_ENQ_CPU_SELECTED) &&
+	if (!__COMPAT_is_enq_cpu_selected(enq_flags) &&
 	    (cpu = pick_direct_dispatch_cpu(p, scx_bpf_task_cpu(p))) >= 0) {
 		__sync_fetch_and_add(&nr_ddsp_from_enq, 1);
 		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL_ON | cpu, slice_ns, enq_flags);
-- 
2.48.1

