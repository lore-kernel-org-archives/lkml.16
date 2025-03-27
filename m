Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA83190678
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119345; cv=none; b=fv7EaOQIMPDUJngG9Tr5MuXL6NMfSPQfGiC1nF+lBNHfkH441jX6nRCVNnp4jp+7ISsMPkEaqf/Gi2o+2FZg5wWa0wc8Rxjwn/8+GBl/n7evGPgWKP1sbrXlkStkBrZQ7n/aiwgtdL4A3pOf0VRn0PiOLE+iDOgCz+6Dw24ZMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119345; c=relaxed/simple;
	bh=uepe58rlJokDRKPexFwxVylPyUYlgTKWcHSYAsLyv24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1/jLxYwQPZGr8EJuEkfzA4bttILe285SCuPy2czU4dZpV54GFDYUAZXLAcXPBlEYvvB0XBt3O1I8FLRxyeeG6cH/2EcajWIbmzgQVLGCSojj72lh+vG6h7HC8UbYt9w2Pw5/E4xlU8qNT+rAzVrX+5+JViiRp2Rsp7pvHbEYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GE4LxAET; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GE4LxAET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119344; x=1774655344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uepe58rlJokDRKPexFwxVylPyUYlgTKWcHSYAsLyv24=;
  b=GE4LxAETAu1H+y0VEwqJ62C/5ZD6HXSErrRh3aqwc+KhCPXtEJwPlcQw
   JpEVR8lqyWa52igaXJKtKlm1bNqYV/XxLTjh2KPw70rP/8NvROw4GgEYk
   bCcdHFSN/tFkuZhz9RGe+B4NvWJ+y9yr4IXUm/I1SuwvnT1fMVBOKwnqP
   0qeA/du8F2wVJbKsINEnQ4xkFuP488rR9w2Mtyma2/HfyNbahN/3bOCHB
   LbKtcHy+i9fLhKaWMNB/gfp80puE2YPl/c+d+bT4/2gilqiGW6qPi36Xg
   Qf5EA6OLVpV7MLkX1Qxb39lCLZCYI77xq2gB9U0XNTgqwoA4MTQSLtfJ5
   A==;
X-CSE-ConnectionGUID: vKzR8HSiTHCjeFB4Rnwssg==
X-CSE-MsgGUID: kdWr7J3eR+6/bipe2PpT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627935"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:03 -0700
X-CSE-ConnectionGUID: 2r9u8XkwTKOCT9WHr/C2FQ==
X-CSE-MsgGUID: h9Y2L34+QNWIajNAsy+3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150470"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:02 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
Date: Thu, 27 Mar 2025 23:46:21 +0000
Message-ID: <20250327234629.3953536-2-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The unknown_nmi_panic variable is used to control whether the kernel
should panic on unknown NMIs. There is a sysctl entry for the same, which
can be used to change the behavior at runtime.

However, it seems that in some places, the option unnecessarily depends
on CONFIG_X86_LOCAL_APIC. Other code in nmi.c uses unknown_nmi_panic
without such a dependency. This results in a few messy #ifdefs
splattered across the code. The dependency was likely introduce due to a
potential compile issue [1] reported a long time ago. Such an issue no
longer exists.

Also, similar NMI panic options, such as panic_on_unrecovered_nmi and
panic_on_io_nmi, do not have an explicit dependency on the local APIC.
Though, it's hard to imagine a production system without the local APIC
configuration, making a specific NMI sysctl option dependent on it
doesn't make sense.

Remove the explicit dependency between unknown NMI handling and the
local APIC to make the code cleaner and more consistent.

While at it, reorder the header includes to maintain alphabetical order.

[1]: https://lore.kernel.org/lkml/40BC67F9.3000609@myrealbox.com/

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/include/asm/nmi.h |  4 ++--
 arch/x86/kernel/setup.c    | 37 ++++++++++++++++---------------------
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index f677382093f3..9cf96cce02fc 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -14,10 +14,10 @@ extern void release_perfctr_nmi(unsigned int);
 extern int reserve_evntsel_nmi(unsigned int);
 extern void release_evntsel_nmi(unsigned int);
 
-extern int unknown_nmi_panic;
-
 #endif /* CONFIG_X86_LOCAL_APIC */
 
+extern int unknown_nmi_panic;
+
 #define NMI_FLAG_FIRST	1
 
 enum {
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index c7164a8de983..c3e1ae7373e9 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -7,10 +7,11 @@
  */
 #include <linux/acpi.h>
 #include <linux/console.h>
-#include <linux/cpu.h>
 #include <linux/crash_dump.h>
+#include <linux/cpu.h>
 #include <linux/dma-map-ops.h>
 #include <linux/efi.h>
+#include <linux/hugetlb.h>
 #include <linux/ima.h>
 #include <linux/init_ohci1394_dma.h>
 #include <linux/initrd.h>
@@ -18,21 +19,19 @@
 #include <linux/memblock.h>
 #include <linux/panic_notifier.h>
 #include <linux/pci.h>
+#include <linux/random.h>
 #include <linux/root_dev.h>
-#include <linux/hugetlb.h>
-#include <linux/tboot.h>
-#include <linux/usb/xhci-dbgp.h>
 #include <linux/static_call.h>
 #include <linux/swiotlb.h>
-#include <linux/random.h>
+#include <linux/tboot.h>
+#include <linux/usb/xhci-dbgp.h>
+#include <linux/vmalloc.h>
 
 #include <uapi/linux/mount.h>
 
 #include <xen/xen.h>
 
 #include <asm/apic.h>
-#include <asm/efi.h>
-#include <asm/numa.h>
 #include <asm/bios_ebda.h>
 #include <asm/bugs.h>
 #include <asm/cacheinfo.h>
@@ -47,18 +46,16 @@
 #include <asm/mce.h>
 #include <asm/memtype.h>
 #include <asm/mtrr.h>
-#include <asm/realmode.h>
+#include <asm/nmi.h>
+#include <asm/numa.h>
 #include <asm/olpc_ofw.h>
 #include <asm/pci-direct.h>
 #include <asm/prom.h>
 #include <asm/proto.h>
+#include <asm/realmode.h>
 #include <asm/thermal.h>
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
-#include <linux/vmalloc.h>
-#if defined(CONFIG_X86_LOCAL_APIC)
-#include <asm/nmi.h>
-#endif
 
 /*
  * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
@@ -150,6 +147,13 @@ static size_t ima_kexec_buffer_size;
 int bootloader_type, bootloader_version;
 
 static const struct ctl_table x86_sysctl_table[] = {
+	{
+		.procname       = "unknown_nmi_panic",
+		.data           = &unknown_nmi_panic,
+		.maxlen         = sizeof(int),
+		.mode           = 0644,
+		.proc_handler   = proc_dointvec,
+	},
 	{
 		.procname	= "panic_on_unrecovered_nmi",
 		.data		= &panic_on_unrecovered_nmi,
@@ -185,15 +189,6 @@ static const struct ctl_table x86_sysctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
 	},
-#if defined(CONFIG_X86_LOCAL_APIC)
-	{
-		.procname       = "unknown_nmi_panic",
-		.data           = &unknown_nmi_panic,
-		.maxlen         = sizeof(int),
-		.mode           = 0644,
-		.proc_handler   = proc_dointvec,
-	},
-#endif
 #if defined(CONFIG_ACPI_SLEEP)
 	{
 		.procname	= "acpi_video_flags",
-- 
2.43.0

