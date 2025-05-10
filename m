Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A83F18DF8D
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876333; cv=none; b=WvAoA4dSTzYeuuYNjY7cWsk7EFlH41DsVWl262nU2AiVEw61xG8G1SayEBFBABbPG+3uxPN9MQzQXxVmk2qtQDdcxe30JlknYlZvM5JazEHs+uulpqZtfKOVNU4fMupdQVpViPtzuhpb6BLNIu3pWMKSgnMF+hhYXMWdGL1zfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876333; c=relaxed/simple;
	bh=/vKRVyfvOeUPzYAMtsVCUqffk7c7fNOltLr+SXqJArs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFrkjJ12++e8mo7J34C/6ocLV+fUN2aJ0hdwZqWC2QGcFgZ3SWuj42eTAnGW8sb7gQpz/qCGev4yobOCCG2up1WEqFDJjqdLfr8yBJQ7J31woTDfvmddEVpc4D8jscK6zllVmO50Cd91GkIvBimigLJZjVc92bE9mhnvPVECFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wakb6tgr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wakb6tgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876331; x=1778412331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vKRVyfvOeUPzYAMtsVCUqffk7c7fNOltLr+SXqJArs=;
  b=Wakb6tgrp2C7S4Cs0+KG2JxXj4yJlvtwaYzoK1uV29Z+qLSvOESMN3F8
   OWq+rQxD+vsDMw5qH6YzduxhdnxUG4/hUQDRu22GEpoL2ehr2AWJ7M7+7
   rwwq5uwibXuxra/GNbr2+9R4HZCGkTEqLAzWFExERvX4PP+v21xJBp1Zp
   GKCUlkX298lvCdgamVpr2K4J7R6HsHGRzgrxL4dNHGNCjhND25O0A5xeZ
   vdrRZEEUMBrl6r8MiE8c1Hfa5WYVN0amvPNqJkZgDgc4p+RrkV9E7uRBg
   QhDN3r7GPyI1g/ThfgV/m7Jw5EUz6i6u9ZcUmtsrEvk69+0yfzKRzLzcM
   w==;
X-CSE-ConnectionGUID: W8qGulr7Tw2va8agn8rIZw==
X-CSE-MsgGUID: 9YpK+SirSlWVkwOKw9QcEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52513540"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="52513540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:25:31 -0700
X-CSE-ConnectionGUID: BqX36pTxTYy/znOtZL4J1A==
X-CSE-MsgGUID: xcUbVL7fSOiJnmV8HtP8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141976287"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:25:27 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org,
	mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	isaku.yamahata@intel.com,
	reinette.chatre@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [RFC PATCH v2 6/5] KVM: TDX: Explicitly do WBINVD upon reboot notifier
Date: Sat, 10 May 2025 11:25:03 +0000
Message-ID: <20250510112503.23497-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746874095.git.kai.huang@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On TDX platforms, during kexec, the kernel needs to make sure there's no
dirty cachelines of TDX private memory before booting to the new kernel
to avoid silent memory corruption to the new kernel.

During kexec, the kexec-ing CPU firstly invokes native_stop_other_cpus()
to stop all remote CPUs before booting to the new kernel.  The remote
CPUs will then execute stop_this_cpu() to stop themselves.

The kernel has a percpu boolean to indicate whether the cache of a CPU
may be in incoherent state.  In stop_this_cpu(), the kernel does WBINVD
if that percpu boolean is true.

TDX turns on that percpu boolean on a CPU when the kernel does SEAMCALL.
This makes sure the cahces will be flushed during kexec.

However, the native_stop_other_cpus() and stop_this_cpu() have a "race"
which is extremely rare to happen but if did could cause system to hang.
Specifically, the native_stop_other_cpus() firstly sends normal reboot
IPI to remote CPUs and wait one second for them to stop.  If that times
out, native_stop_other_cpus() then sends NMIs to remote CPUs to stop
them.

The aforementioned race happens when NMIs are sent.  Doing WBINVD in
stop_this_cpu() makes each CPU take longer time to stop and increases
the chance of the race to happen.

Register reboot notifier in KVM to explcitly flush caches upon reboot
for TDX.  This brings doing WBINVD at earlier stage and aovids the
WBINVD in stop_this_cpu(), eliminating the possibility of increasing the
chance of the aforementioned race.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/include/asm/tdx.h  |  3 +++
 arch/x86/kvm/vmx/tdx.c      | 45 +++++++++++++++++++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c |  9 ++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 91dc6e6bdd97..d0156bf0b966 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -221,6 +221,8 @@ u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u6
 u64 tdh_phymem_cache_wb(bool resume);
 u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
 u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page);
+
+void tdx_cpu_flush_cache(void);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_cpu_enable(void) { return -ENODEV; }
@@ -228,6 +230,7 @@ static inline int tdx_enable(void)  { return -ENODEV; }
 static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
 static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
 static inline const struct tdx_sys_info *tdx_get_sysinfo(void) { return NULL; }
+static inline void tdx_cpu_flush_cache(void) { }
 #endif	/* CONFIG_INTEL_TDX_HOST */
 
 #endif /* !__ASSEMBLER__ */
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b952bc673271..3b92b3999855 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -5,7 +5,9 @@
 #include <asm/fpu/xcr.h>
 #include <linux/misc_cgroup.h>
 #include <linux/mmu_context.h>
+#include <linux/reboot.h>
 #include <asm/tdx.h>
+#include <asm/processor.h>
 #include "capabilities.h"
 #include "mmu.h"
 #include "x86_ops.h"
@@ -3278,6 +3280,33 @@ static int tdx_offline_cpu(unsigned int cpu)
 	return -EBUSY;
 }
 
+static void smp_func_cpu_flush_cache(void *unused)
+{
+	tdx_cpu_flush_cache();
+}
+
+static int tdx_reboot_notify(struct notifier_block *nb, unsigned long code,
+			     void *unused)
+{
+	/*
+	 * Flush cache for all CPUs upon the reboot notifier.  This
+	 * avoids having to do WBINVD in stop_this_cpu() during kexec.
+	 *
+	 * Kexec calls native_stop_other_cpus() to stop remote CPUs
+	 * before booting to new kernel, but that code has a "race"
+	 * when the normal REBOOT IPI timesout and NMIs are sent to
+	 * remote CPUs to stop them.  Doing WBINVD in stop_this_cpu()
+	 * could potentially increase the posibility of the "race".
+	 */
+	if (code == SYS_RESTART)
+		on_each_cpu(smp_func_cpu_flush_cache, NULL, 1);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block tdx_reboot_nb = {
+	.notifier_call = tdx_reboot_notify,
+};
+
 static void __do_tdx_cleanup(void)
 {
 	/*
@@ -3435,6 +3464,11 @@ void tdx_cleanup(void)
 {
 	if (enable_tdx) {
 		misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
+		/*
+		 * Ignore the return value.  See the comment in
+		 * tdx_bringup().
+		 */
+		unregister_reboot_notifier(&tdx_reboot_nb);
 		__tdx_cleanup();
 		kvm_disable_virtualization();
 	}
@@ -3518,6 +3552,17 @@ int __init tdx_bringup(void)
 		enable_tdx = 0;
 	}
 
+	if (enable_tdx)
+		/*
+		 * Ignore the return value.  @tdx_reboot_nb is used to flush
+		 * cache for all CPUs upon rebooting to avoid having to do
+		 * WBINVD in kexec while the kexec-ing CPU stops all remote
+		 * CPUs.  Failure to register isn't fatal, because if KVM
+		 * doesn't flush cache explicitly upon rebooting the kexec
+		 * will do it anyway.
+		 */
+		register_reboot_notifier(&tdx_reboot_nb);
+
 	return r;
 
 success_disable_tdx:
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index af8798bc62ed..7478230cdc33 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1890,3 +1890,12 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
 	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
 }
 EXPORT_SYMBOL_GPL(tdh_phymem_page_wbinvd_hkid);
+
+void tdx_cpu_flush_cache(void)
+{
+	lockdep_assert_preemption_disabled();
+
+	wbinvd();
+	this_cpu_write(cache_state_incoherent, false);
+}
+EXPORT_SYMBOL_GPL(tdx_cpu_flush_cache);
-- 
2.43.0

