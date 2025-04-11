Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12BC22A4F1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389834; cv=none; b=OUQPyYxT9/rr5pIVpJB/UwFEajhp28nSfhe88RkAZ6tClyMqllkjajFdFsgzCOvrFy6Bo1fR2OVKmjvgP/io3zc97j8SeHPpZ8x8GGUNRjzw+yfv8LnCzdtxCQhc+cWOgy6XvWxvqFhCghxzOfLfs6cEz+K48zHzQ3B8pNCpgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389834; c=relaxed/simple;
	bh=h069pNxr040GiBdRD8EQXNPBBJTUq3huOMyz+egNCXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XVUaqM2oQqJJZ/0XcjHFJmgIzx0K3kictjazKu7K2Qp6u2RlGKUo90AQgSTwp+UEkaXHVomlmRzYZWLJvk83kixua4wBmkeVzFB/OxvCoHxfdhL6MudviqUYKShowXiRs/2xAks0Q1bd/qis3+EtqDEYByOWUIuBv433tk1xZac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11308201B;
	Fri, 11 Apr 2025 09:43:52 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB58C3F694;
	Fri, 11 Apr 2025 09:43:48 -0700 (PDT)
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
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>
Subject: [PATCH v8 11/21] fs/resctrl: Add boiler plate for external resctrl code
Date: Fri, 11 Apr 2025 16:42:19 +0000
Message-Id: <20250411164229.23413-12-james.morse@arm.com>
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

Add Makefile and Kconfig for fs/resctrl. Add ARCH_HAS_CPU_RESCTRL
for the common parts of the resctrl interface and make X86_CPU_RESCTRL
select this.

Adding an include of asm/resctrl.h to linux/resctrl.h allows the
/fs/resctrl files to switch over to using this header instead.

Co-developed-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v6:
 * Added 'depends on RESCTRL_FS' to the hidden kconfig options.

Changes since v5:
 * Removed double include.
 * Removed duplicate pseudo lock Kconfig define
 * Grammar fix and closid capitalisation change.

Changes since v4:
 * Tweaking of the commit message.

Changes since v3:
 * Reworded 'if unsure say N' from the Kconfig text, the user doesn't have
   the choice anyway at this point.
 * Added PWD to monitor.o's CFLAGS for the ftrace rube-goldberg build machine.
 * Added split trace files.

Changes since v2:
 * Dropped KERNFS dependency from arch side Kconfig.
 * Added empty trace.h file.
 * Merged asm->linux includes from Dave's patch to decouple those
   patches from this series.

Changes since v1:
 * Rename new file psuedo_lock.c to pseudo_lock.c, to match the name
   of the original file (and to be less surprising).

 * [Whitespace only] Under RESCTRL_FS in fs/resctrl/Kconfig, delete
   alignment space in orphaned select ... if (which has nothing to line
   up with any more).

 * [Whitespace only] Reflow and re-tab Kconfig additions.
---
 MAINTAINERS                               |  1 +
 arch/Kconfig                              |  8 +++++
 arch/x86/Kconfig                          | 11 ++-----
 arch/x86/kernel/cpu/resctrl/internal.h    |  2 --
 arch/x86/kernel/cpu/resctrl/monitor.c     |  2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  2 +-
 fs/Kconfig                                |  1 +
 fs/Makefile                               |  1 +
 fs/resctrl/Kconfig                        | 39 +++++++++++++++++++++++
 fs/resctrl/Makefile                       |  6 ++++
 fs/resctrl/ctrlmondata.c                  |  0
 fs/resctrl/internal.h                     |  0
 fs/resctrl/monitor.c                      |  0
 fs/resctrl/monitor_trace.h                |  0
 fs/resctrl/pseudo_lock.c                  |  0
 fs/resctrl/pseudo_lock_trace.h            |  0
 fs/resctrl/rdtgroup.c                     |  0
 include/linux/resctrl.h                   |  4 +++
 19 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 fs/resctrl/Kconfig
 create mode 100644 fs/resctrl/Makefile
 create mode 100644 fs/resctrl/ctrlmondata.c
 create mode 100644 fs/resctrl/internal.h
 create mode 100644 fs/resctrl/monitor.c
 create mode 100644 fs/resctrl/monitor_trace.h
 create mode 100644 fs/resctrl/pseudo_lock.c
 create mode 100644 fs/resctrl/pseudo_lock_trace.h
 create mode 100644 fs/resctrl/rdtgroup.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..c30c6fbd1f7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20284,6 +20284,7 @@ S:	Supported
 F:	Documentation/arch/x86/resctrl*
 F:	arch/x86/include/asm/resctrl.h
 F:	arch/x86/kernel/cpu/resctrl/
+F:	fs/resctrl/
 F:	include/linux/resctrl*.h
 F:	tools/testing/selftests/resctrl/
 
diff --git a/arch/Kconfig b/arch/Kconfig
index b0adb665041f..a3308a220f86 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1518,6 +1518,14 @@ config STRICT_MODULE_RWX
 config ARCH_HAS_PHYS_TO_DMA
 	bool
 
+config ARCH_HAS_CPU_RESCTRL
+	bool
+	help
+	  An architecture selects this option to indicate that the necessary
+	  hooks are provided to support the common memory system usage
+	  monitoring and control interfaces provided by the 'resctrl'
+	  filesystem (see RESCTRL_FS).
+
 config HAVE_ARCH_COMPILER_H
 	bool
 	help
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6..5a09acf41c8e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -507,8 +507,9 @@ config X86_MPPARSE
 config X86_CPU_RESCTRL
 	bool "x86 CPU resource control support"
 	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
-	select KERNFS
-	select PROC_CPU_RESCTRL		if PROC_FS
+	depends on MISC_FILESYSTEMS
+	select ARCH_HAS_CPU_RESCTRL
+	select RESCTRL_FS
 	select RESCTRL_FS_PSEUDO_LOCK
 	help
 	  Enable x86 CPU resource control support.
@@ -526,12 +527,6 @@ config X86_CPU_RESCTRL
 
 	  Say N if unsure.
 
-config RESCTRL_FS_PSEUDO_LOCK
-	bool
-	help
-	  Software mechanism to pin data in a cache portion using
-	  micro-architecture specific knowledge.
-
 config X86_FRED
 	bool "Flexible Return and Event Delivery"
 	depends on X86_64
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index d932dd1eaa74..365d5697a6ae 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -9,8 +9,6 @@
 #include <linux/jump_label.h>
 #include <linux/tick.h>
 
-#include <asm/resctrl.h>
-
 #define L3_QOS_CDP_ENABLE		0x01ULL
 
 #define L2_QOS_CDP_ENABLE		0x01ULL
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 99de915a6f69..a9e1116f5ccc 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -19,11 +19,11 @@
 
 #include <linux/cpu.h>
 #include <linux/module.h>
+#include <linux/resctrl.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 
 #include <asm/cpu_device_id.h>
-#include <asm/resctrl.h>
 
 #include "internal.h"
 
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index f7bb586a83f9..db0b75b45fe4 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -18,12 +18,12 @@
 #include <linux/mman.h>
 #include <linux/perf_event.h>
 #include <linux/pm_qos.h>
+#include <linux/resctrl.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpu_device_id.h>
-#include <asm/resctrl.h>
 #include <asm/perf_event.h>
 
 #include "../../events/perf_event.h" /* For X86_CONFIG() */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index d61b7137f443..23fd92cc0c56 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -18,6 +18,7 @@
 #include <linux/fs_parser.h>
 #include <linux/sysfs.h>
 #include <linux/kernfs.h>
+#include <linux/resctrl.h>
 #include <linux/seq_buf.h>
 #include <linux/seq_file.h>
 #include <linux/sched/signal.h>
@@ -28,7 +29,6 @@
 
 #include <uapi/linux/magic.h>
 
-#include <asm/resctrl.h>
 #include "internal.h"
 
 DEFINE_STATIC_KEY_FALSE(rdt_enable_key);
diff --git a/fs/Kconfig b/fs/Kconfig
index c718b2e2de0e..53c9273e34b9 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -335,6 +335,7 @@ source "fs/omfs/Kconfig"
 source "fs/hpfs/Kconfig"
 source "fs/qnx4/Kconfig"
 source "fs/qnx6/Kconfig"
+source "fs/resctrl/Kconfig"
 source "fs/romfs/Kconfig"
 source "fs/pstore/Kconfig"
 source "fs/ufs/Kconfig"
diff --git a/fs/Makefile b/fs/Makefile
index 77fd7f7b5d02..79c08b914c47 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -128,3 +128,4 @@ obj-$(CONFIG_EROFS_FS)		+= erofs/
 obj-$(CONFIG_VBOXSF_FS)		+= vboxsf/
 obj-$(CONFIG_ZONEFS_FS)		+= zonefs/
 obj-$(CONFIG_BPF_LSM)		+= bpf_fs_kfuncs.o
+obj-$(CONFIG_RESCTRL_FS)	+= resctrl/
diff --git a/fs/resctrl/Kconfig b/fs/resctrl/Kconfig
new file mode 100644
index 000000000000..478a8e2ad99f
--- /dev/null
+++ b/fs/resctrl/Kconfig
@@ -0,0 +1,39 @@
+config RESCTRL_FS
+	bool "CPU Resource Control Filesystem (resctrl)"
+	depends on ARCH_HAS_CPU_RESCTRL
+	select KERNFS
+	select PROC_CPU_RESCTRL if PROC_FS
+	help
+	  Some architectures provide hardware facilities to group tasks and
+	  monitor and control their usage of memory system resources such as
+	  caches and memory bandwidth.  Examples of such facilities include
+	  Intel's Resource Director Technology (Intel(R) RDT) and AMD's
+	  Platform Quality of Service (AMD QoS).
+
+	  If your system has the necessary support and you want to be able to
+	  assign tasks to groups and manipulate the associated resource
+	  monitors and controls from userspace, say Y here to get a mountable
+	  'resctrl' filesystem that lets you do just that.
+
+	  If nothing mounts or prods the 'resctrl' filesystem, resource
+	  controls and monitors are left in a quiescent, permissive state.
+
+	  On architectures where this can be disabled independently, it is
+	  safe to say N.
+
+	  See <file:Documentation/arch/x86/resctrl.rst> for more information.
+
+config RESCTRL_FS_PSEUDO_LOCK
+	bool
+	depends on RESCTRL_FS
+	help
+	  Software mechanism to pin data in a cache portion using
+	  micro-architecture specific knowledge.
+
+config RESCTRL_RMID_DEPENDS_ON_CLOSID
+	bool
+	depends on RESCTRL_FS
+	help
+	  Enabled by the architecture when the RMID values depend on the CLOSID.
+	  This causes the CLOSID allocator to search for CLOSID with clean
+	  RMID.
diff --git a/fs/resctrl/Makefile b/fs/resctrl/Makefile
new file mode 100644
index 000000000000..e67f34d2236a
--- /dev/null
+++ b/fs/resctrl/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESCTRL_FS)		+= rdtgroup.o ctrlmondata.o monitor.o
+obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
+
+# To allow define_trace.h's recursive include:
+CFLAGS_monitor.o = -I$(src)
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/monitor_trace.h b/fs/resctrl/monitor_trace.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b8f8240050b4..5c7c8bf2c47f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -8,6 +8,10 @@
 #include <linux/pid.h>
 #include <linux/resctrl_types.h>
 
+#ifdef CONFIG_ARCH_HAS_CPU_RESCTRL
+#include <asm/resctrl.h>
+#endif
+
 /* CLOSID, RMID value used by the default control group */
 #define RESCTRL_RESERVED_CLOSID		0
 #define RESCTRL_RESERVED_RMID		0
-- 
2.20.1

