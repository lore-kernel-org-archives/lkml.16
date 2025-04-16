Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761EE23957D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844594; cv=none; b=mABDpTGZwhXDXe74HOPEFCD739KGepogcZDkzBhpFqi4uifl8kUbqrmy87gs1x7AVZ+CCYpeiApWvLpgM0TbVKPHnQr4pkalCVgdqFrndVb5OjPnlT0lQcnX5Z9YTr/c4PF4Er5k5/t9sH6mlWze6W3CHkD5Z+GqLhAlxXVaRuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844594; c=relaxed/simple;
	bh=CDaHkJWbcHlaEu6LaRkt23ndm2T752ww9iA7Ud9Q50k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piBUlT+8eE4C3tGHOmeg5r5RpvGKf4YzWy6YZlZyH+rsKNR9fRPLave1cX13LYyFE9KtjhVEfjKk7bVhd3aXCD/OKhXSZr0uzpaw15mCg1WX52x6810jYDx98CDp7FUjX0dMUskxkoqRcZKI14NddGXY5txEH2SRH5Pz1ztEChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epbaMj4i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epbaMj4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744844592; x=1776380592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CDaHkJWbcHlaEu6LaRkt23ndm2T752ww9iA7Ud9Q50k=;
  b=epbaMj4imKDbbHOgdfjQ8GBPrWMoh75mOkp8S5KcLgl+cETxWw873CiI
   jxOqTwwtT1gwKWvc61iw3LxfHD4o0RfxcQBD04LxWKdUMr0m2YOfuK0G/
   2F734PPVAwF0N+HdgmkCnDJ8qrtpNnlJU68pMG1VWAyOBV7kjK/vp1jji
   40IXFls8gQ3fa7xBr0dFz+gpD66Yxjz0Wg/DpURD2G3zPcbOiSgwwZYrP
   fmm4deK5Hs2qcCFV3DvCPh9PNjjBcZRP5/Ard7ocOis5qDuTtF5F6bCWz
   S2h9zl+hgoBJvqMkBEqDzEsd3cu1Kx2l8wZQzC7Yo7inuL0z+5blri+aO
   A==;
X-CSE-ConnectionGUID: Y5wI+uqqQFiD9DY6UMSuvw==
X-CSE-MsgGUID: NmZgp/BpT3OgwyMKqEA6IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56596540"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="56596540"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 16:03:12 -0700
X-CSE-ConnectionGUID: 5dRHfwF9Q/u+kp89jEC37Q==
X-CSE-MsgGUID: aGvPkOh1RZ6WJHOeNljoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="130384683"
Received: from gpacheco-mobl.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.223.98])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 16:03:07 -0700
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
	reinette.chatre@intel.com,
	isaku.yamahata@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at runtime
Date: Thu, 17 Apr 2025 11:02:59 +1200
Message-ID: <20250416230259.97989-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, kexec doesn't work well with TDX host support, and only one
of them can be enabled in Kconfig.  However, distributions typically
prefer to use a unified Kconfig with all features enabled.  Therefore,
it would be very useful if both TDX host and kexec could be enabled in
Kconfig simultaneously.

Full support for kexec on a TDX host would require complex work.  The
cache flushing required would need to happen while stopping remote CPUs,
which would require changes to a fragile area of the kernel.  It would
also require resetting TDX private pages, which is non-trivial since the
core kernel does not track them.  Lastly, it would have to rely on a
yet-to-be documented behavior around the TME key (KeyID 0).

Leave the full support and the documentation clarification for future
work, but start with a simple solution: change to make them mutually
exclusive at runtime so that they can be both enabled in the Kconfig.

While there is a little bit of TDX setup at boot, the kexec sensitive
parts of the initialization are enabled when KVM is loaded with a
specific non-default kernel parameter (kvm_intel.tdx=Y).  Use a simple
policy to decide which to run: whichever gets run first disables the
other.  This effectively makes kexec race with TDX when KVM module is
loaded.

Kexec has two phases: the kernel image loading phase and the actual
execution phase.  Specifically, try to disable TDX permanently during
the kernel image loading phase by leveraging the x86 version of
machine_kexec_prepare().  If TDX has already been enabled (thus cannot
be disabled), fail the kexec.

The lock that the TDX disabling operation takes is not held during the
TDX per-CPU initialization, which happens before the main TDX
initialization.  The consequence is that while kexec can't race with
TDX initialization in a way that would leave private memory in a state
that could corrupt the second kernel, it won't exclude the case of the
TDX module being partially initialized.  In this rare scenario, TDX
initialization would simply fail in the second kernel.  Keep the simple
solution simple, and just document the race.

Another option could be to handle this when the kernel actually does
kexec, but this would require adding an arch callout for the operation.
Don't pursue this option to avoid complicating the kexec code.

If TDX cannot be disabled, the users will get an error:

  kexec_load failed: Operation not supported

This could be confusing to the users, thus also tell the reason in the
dmesg:

  [..] kexec: Disabled: TDX is enabled

If TDX can be disabled, also print a message to let users know:

  [..] virt/tdx: explicitly disabled

The reason why this wasn't done earlier was the Kconfig option was just
a bit simpler and the TDX code was large.  Moving to mutual exclusion at
runtime is an incremental improvement that better meets the needs of
distributions.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---

Hi Dave,

So far there have been a couple of attempts to resolve the kexec/TDX
incompatibilities, but they have met complications.

The initial attempt was to support kexec on all TDX host platforms.
It had patches to reset TDX private pages on TDX "partial write #MC"
erratum platforms but they had complexity, especially since a KVM
patch was also needed.

The second attempt was to fail kexec on those erratum platforms to
remove the code to reset TDX private pages, but we found more general
issues that will take time to work through.

Next we looked at disabling kexec whenever TDX was supporting,
effectively making kexec or TDX dependent on the BIOS configuration.
But we thought better of this from a UX perspective, which led to the
solution in this patch.

In the meantime, I'd prefer to go with this simpler solution.  I think
this is a good first step. Please consider it for merging.


---
 Documentation/arch/x86/tdx.rst     | 10 ++++++++--
 arch/x86/Kconfig                   |  1 -
 arch/x86/include/asm/tdx.h         |  2 ++
 arch/x86/kernel/machine_kexec_64.c | 14 ++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c        | 26 ++++++++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h        |  3 ++-
 6 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 719043cd8b46..646b6475a90d 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -146,8 +146,14 @@ Kexec()
 ~~~~~~~
 
 TDX host support currently lacks the ability to handle kexec.  For
-simplicity only one of them can be enabled in the Kconfig.  This will be
-fixed in the future.
+simplicity, whichever gets run first disables the other.  I.e., loading
+kexec kernel image tries to disable TDX permanently, otherwise it fails
+due to that TDX has already been enabled.  This will be fixed in the
+future.
+
+It is possible that kexec can race with the per-cpu initialization of
+TDX.  In the case of losing this race, TDX will not be usable in the
+second kernel, but otherwise kexec will happen normally.
 
 Erratum
 ~~~~~~~
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index aeac63b11fc2..be0a41cfcf74 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1924,7 +1924,6 @@ config INTEL_TDX_HOST
 	depends on X86_X2APIC
 	select ARCH_KEEP_MEMBLOCK
 	depends on CONTIG_ALLOC
-	depends on !KEXEC_CORE
 	depends on X86_MCE
 	help
 	  Intel Trust Domain Extensions (TDX) protects guest VMs from malicious
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4a1922ec80cf..9f9df689506d 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -119,11 +119,13 @@ static inline u64 sc_retry(sc_func_t func, u64 fn,
 int tdx_cpu_enable(void);
 int tdx_enable(void);
 const char *tdx_dump_mce_info(struct mce *m);
+bool tdx_try_disable(void);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_cpu_enable(void) { return -ENODEV; }
 static inline int tdx_enable(void)  { return -ENODEV; }
 static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
+static inline bool tdx_try_disable(void) { return true; }
 #endif	/* CONFIG_INTEL_TDX_HOST */
 
 #endif /* !__ASSEMBLER__ */
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 949c9e4bfad2..2a66db8c7f94 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -29,6 +29,7 @@
 #include <asm/set_memory.h>
 #include <asm/cpu.h>
 #include <asm/efi.h>
+#include <asm/tdx.h>
 
 #ifdef CONFIG_ACPI
 /*
@@ -346,6 +347,19 @@ int machine_kexec_prepare(struct kimage *image)
 	unsigned long reloc_end = (unsigned long)__relocate_kernel_end;
 	int result;
 
+	/*
+	 * Kexec doesn't play nice with TDX because there are issues
+	 * like needing to flush cache and resetting TDX private memory.
+	 *
+	 * The kernel doesn't support those things for TDX.  Try to
+	 * disable TDX permanently so that kexec can move on.  If TDX
+	 * has already been enabled, fail kexec.
+	 */
+	if (!tdx_try_disable()) {
+		pr_info_once("Disabled: TDX is enabled");
+		return -EOPNOTSUPP;
+	}
+
 	/* Setup the identity mapped 64bit page table */
 	result = init_pgtable(image, __pa(control_page));
 	if (result)
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 7fdb37387886..bcb2ab7505b0 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1456,3 +1456,29 @@ void __init tdx_init(void)
 
 	check_tdx_erratum();
 }
+
+/*
+ * Disable TDX permanently if the module hasn't been initialized
+ * (otherwise does nothing).  Return whether TDX is disabled.
+ *
+ * This function only prevents running concurrently with tdx_enable().
+ * tdx_cpu_enable() can still run successfully even this function
+ * disables TDX successfully.
+ */
+bool tdx_try_disable(void)
+{
+	bool disabled;
+
+	mutex_lock(&tdx_module_lock);
+
+	if (tdx_module_status == TDX_MODULE_UNINITIALIZED) {
+		pr_info("explicitly disabled\n");
+		tdx_module_status = TDX_MODULE_DISABLED;
+	}
+
+	disabled = (tdx_module_status != TDX_MODULE_INITIALIZED);
+
+	mutex_unlock(&tdx_module_lock);
+
+	return disabled;
+}
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 4e3d533cdd61..83ec5fe59f22 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -64,7 +64,8 @@ struct tdmr_info {
 enum tdx_module_status_t {
 	TDX_MODULE_UNINITIALIZED,
 	TDX_MODULE_INITIALIZED,
-	TDX_MODULE_ERROR
+	TDX_MODULE_ERROR,
+	TDX_MODULE_DISABLED
 };
 
 struct tdx_memblock {
-- 
2.49.0

