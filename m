Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEFD255E4C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876049; cv=none; b=n+vR1Pk9S4wyZYDh580560PRFtav/KV/OKV2wfn6sj1CLqD32P6QDJy4/1yrMF50WjJXE3KcSUjNdtmQsQdlovbWe7WcAYrhdgO1oYNaRfpGQQJyAS3g5f6Ij25qriSPlTsBpiltDc4r4JfrcZfWqpfY4D9kFVQAvfN6MWNGOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876049; c=relaxed/simple;
	bh=uqDaNXDK/34r0A3U9ZQxANIryXh1JAuaizU7t/RZSxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hb/Vfx6we/6UrJ1DtGbvCU1mjTS4vQV4O6v2+aIoDqRi7XsTWKRYxAs6TWk+54pW8x3kbDVyBj5s9k8YQDtZtZ3+pxbKNz01ndu/Suju8pBqq3JHMblda60CS1D+MreSg6XjKftR+cw6Oulda1hTqgTU/uGdOGWgF2bnZR+HyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TShrMY32; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TShrMY32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876047; x=1778412047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uqDaNXDK/34r0A3U9ZQxANIryXh1JAuaizU7t/RZSxs=;
  b=TShrMY32dtqdYkkovU3erqSJ2OOlIBgIcqFZUd+DPdkwVpyBuAq8L/ci
   vG31c69eJq0M6CScVM20/t3qsRqeKTgJ1wrAy2G6/+xEC2IEjsh+UiS1E
   ZHZ9PuchZHSSOjynY6yjbHBSmQFNz6kORReUwkiyd7Zg5jnQkf9RyfZpt
   ZL2zWVtqoXpZnXesqH2LK6khxi/TTWqQdlu4JjjFk/mHX4heS3od5qeYT
   pL1hufvPts9cKtHqpl0xzCaP5+9cs95+ZnHhHaPGyTo4+n2l2thElLZE2
   7rY+m3w+SRCEeaAKyJgJmj0Wt5CsNwFToioSmHrA2n2DQaHcOMjSgn4qZ
   A==;
X-CSE-ConnectionGUID: E4mUuysRSc+ZI97uLgzSmw==
X-CSE-MsgGUID: kzo0MMyERaCWL/ZKM1STPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219290"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:47 -0700
X-CSE-ConnectionGUID: zb/UiLLRTECjYPtXcXO2dA==
X-CSE-MsgGUID: FNkELbisQdOntY/AvpU+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566473"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:43 -0700
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
Subject: [PATCH v2 1/5] x86/sme: Use percpu boolean to control wbinvd during kexec
Date: Sat, 10 May 2025 11:20:05 +0000
Message-ID: <3df2d2573957f13a1050ff2ff1bd76faddf53588.1746874095.git.kai.huang@intel.com>
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

On SME platforms, at hardware level dirty cachelines with and without
encryption bit of the same memory can coexist, and the CPU can flush
them back to memory in random order.  During kexec, the caches must be
flushed before jumping to the new kernel to avoid silent memory
corruption when a cacheline with a different encryption property is
written back over whatever encryption properties the new kernel is
using.

TDX also needs cache flush during kexec for the same reason.  It would
be good to implement a generic way to flush cache instead of scattering
checks for each feature all around.

During kexec, the kexec-ing CPU sends IPIs to all remote CPUs to stop
them before it boots to the new kernel.  For SME the kernel basically
encrypts all memory including the kernel itself by manipulating page
tables.  A simple memory write from the kernel could dirty cachelines.

Currently, the kernel uses WBINVD to flush cache for SME during kexec in
two places:

1) the one in stop_this_cpu() for all remote CPUs when the kexec-ing CPU
   stops them;
2) the one in the relocate_kernel() where the kexec-ing CPU jumps to the
   new kernel.

Unlike SME, TDX can only dirty cachelines when it is used (i.e., when
SEAMCALLs are performed).  Since there are no more SEAMCALLs after the
aforementioned WBINVDs, leverage this for TDX.

In order to have a generic way to cover both SME and TDX, use a percpu
boolean to indicate the cache may be in an incoherent state thus cache
flush is needed during kexec, and turn on the boolean for SME.  TDX can
then leverage it by also turning the boolean on.

A percpu boolean isn't strictly needed for SME since it is activated at
very early boot time and on all CPUs.  A global flag would be sufficient.

A percpu boolean isn't strictly needed for SME since it is activated at
very early boot time and on all CPUs.  A global flag would be
sufficient.  But using a percpu variable has two benefits.  Foremost,
the state that is being tracked here (percpu cache coherency situation
requiring a flush) is percpu, so a percpu state is a more direct and
natural fit.

Secondly, it will fit TDX's usage better since the percpu var can be set
when a CPU makes a SEAMCALL, and cleared when another WBINVD on the CPU
obviates the need for a kexec-time WBINVD.  Saving kexec-time WBINVD is
valuable, because there is an existing race[*] where kexec could proceed
while another CPU is active.  WBINVD could make this race worse, so it's
worth skipping it when possible.

Today the first WBINVD in the stop_this_cpu() is performed when SME is
*supported* by the platform, and the second WBINVD is done in
relocate_kernel() when SME is *activated* by the kernel.  Make things
simple by changing to do the second WBINVD when the platform supports
SME.  This allows the kernel to simply turn on this percpu boolean when
bringing up a CPU by checking whether the platform supports SME.

No other functional change intended.

Also, currently machine_check() has a comment to explain why no function
call is allowed after load_segments().  After changing to use the new
percpu boolean to control whether to perform WBINVD when calling the
relocate_kernel(), that comment isn't needed anymore.  But it is still a
useful comment, so expand the comment around load_segments() to mention
that due to depth tracking no function call can be made after
load_segments().

[*] The "race" in native_stop_other_cpus()

Commit

  1f5e7eb7868e: ("x86/smp: Make stop_other_cpus() more robust")

introduced a new 'cpus_stop_mask' to resolve an "intermittent lockups on
poweroff" issue which was caused by the WBINVD in stop_this_cpu().
Specifically, the new cpumask resolved the below problem mentioned in
that commit:

    CPU0                                    CPU1

     stop_other_cpus()
       send_IPIs(REBOOT);                   stop_this_cpu()
       while (num_online_cpus() > 1);         set_online(false);
       proceed... -> hang
                                              wbinvd()

While it fixed the reported issue, that commit explained the new cpumask
"cannot plug all holes either".

This is because it doesn't address the "race" mentioned in the #3 in the
comment in native_stop_other_cpus():

        /*
         * 1) Send an IPI on the reboot vector to all other CPUs.
         *
         *    The other CPUs should react on it after leaving critical
         *    sections and re-enabling interrupts. They might still hold
         *    locks, but there is nothing which can be done about that.
         *
         * 2) Wait for all other CPUs to report that they reached the
         *    HLT loop in stop_this_cpu()
         *
         * 3) If #2 timed out send an NMI to the CPUs which did not
         *    yet report
         *
         * 4) Wait for all other CPUs to report that they reached the
         *    HLT loop in stop_this_cpu()
         *
         * #3 can obviously race against a CPU reaching the HLT loop late.
         * That CPU will have reported already and the "have all CPUs
         * reached HLT" condition will be true despite the fact that the
         * other CPU is still handling the NMI. Again, there is no
         * protection against that as "disabled" APICs still respond to
         * NMIs.
         */

Consider below case:

    CPU 0					CPU 1

    native_stop_other_cpus()			stop_this_cpu()

	// sends REBOOT IPI to stop remote CPUs
						...
						wbinvd();

	// wait timesout, try NMI
	if (!cpumask_empty(&cpus_stop_mask)) {
		for_each_cpu(cpu, &cpus_stop_mask) {

						...
						cpumask_clear_cpu(cpu,
							&cpus_stop_mask);
						hlt;

			// send NMI 	--->
						wakeup from hlt and run
						stop_this_cpu():

			// WAIT CPUs TO STOP
			while (!cpumask_empty(
			    &cpus_stop_mask) &&
				...)
		}
						...
		proceed ...			wbinvd();
						...
						hlt;

The "WAIT CPUs TO STOP" is supposed to wait until all remote CPUs are
stopped, but actually it quits immediately because the remote CPUs have
been cleared in cpus_stop_mask when stop_this_cpu() is called from the
REBOOT IPI.

Doing WBINVD in stop_this_cpu() could potentially increase the chance to
trigger the above "race" despite it's still rare to happen.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/include/asm/kexec.h         |  2 +-
 arch/x86/include/asm/processor.h     |  2 ++
 arch/x86/kernel/cpu/amd.c            | 16 ++++++++++++++++
 arch/x86/kernel/machine_kexec_64.c   | 15 ++++++++++-----
 arch/x86/kernel/process.c            | 16 +++-------------
 arch/x86/kernel/relocate_kernel_64.S | 15 +++++++++++----
 6 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index f2ad77929d6e..d7e93522b93d 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -122,7 +122,7 @@ relocate_kernel_fn(unsigned long indirection_page,
 		   unsigned long pa_control_page,
 		   unsigned long start_address,
 		   unsigned int preserve_context,
-		   unsigned int host_mem_enc_active);
+		   unsigned int cache_incoherent);
 #endif
 extern relocate_kernel_fn relocate_kernel;
 #define ARCH_HAS_KIMAGE_ARCH
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 50d34698036d..da442ca6a2e9 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -731,6 +731,8 @@ void __noreturn stop_this_cpu(void *dummy);
 void microcode_check(struct cpuinfo_x86 *prev_info);
 void store_cpu_caps(struct cpuinfo_x86 *info);
 
+DECLARE_PER_CPU(bool, cache_state_incoherent);
+
 enum l1tf_mitigations {
 	L1TF_MITIGATION_OFF,
 	L1TF_MITIGATION_AUTO,
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 13a48ec28f32..7918561f9382 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -494,6 +494,22 @@ static void early_detect_mem_encrypt(struct cpuinfo_x86 *c)
 {
 	u64 msr;
 
+	/*
+	 * Mark using wbinvd is needed during kexec on processors that
+	 * support SME. This provides support for performing a successful
+	 * kexec when going from SME inactive to SME active (or vice-versa).
+	 *
+	 * The cache must be cleared so that if there are entries with the
+	 * same physical address, both with and without the encryption bit,
+	 * they don't race each other when flushed and potentially end up
+	 * with the wrong entry being committed to memory.
+	 *
+	 * Test the CPUID bit directly because the machine might've cleared
+	 * X86_FEATURE_SME due to cmdline options.
+	 */
+	if (c->extended_cpuid_level >= 0x8000001f && (cpuid_eax(0x8000001f) & BIT(0)))
+		__this_cpu_write(cache_state_incoherent, true);
+
 	/*
 	 * BIOS support is required for SME and SEV.
 	 *   For SME: If BIOS has enabled SME then adjust x86_phys_bits by
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 949c9e4bfad2..f5a7b1894fcf 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -29,6 +29,7 @@
 #include <asm/set_memory.h>
 #include <asm/cpu.h>
 #include <asm/efi.h>
+#include <asm/processor.h>
 
 #ifdef CONFIG_ACPI
 /*
@@ -384,15 +385,15 @@ void __nocfi machine_kexec(struct kimage *image)
 {
 	unsigned long reloc_start = (unsigned long)__relocate_kernel_start;
 	relocate_kernel_fn *relocate_kernel_ptr;
-	unsigned int host_mem_enc_active;
+	unsigned int cache_incoherent;
 	int save_ftrace_enabled;
 	void *control_page;
 
 	/*
-	 * This must be done before load_segments() since if call depth tracking
-	 * is used then GS must be valid to make any function calls.
+	 * This must be done before load_segments(), since it resets
+	 * GS to 0 and percpu data needs the correct GS to work.
 	 */
-	host_mem_enc_active = cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT);
+	cache_incoherent = this_cpu_read(cache_state_incoherent);
 
 #ifdef CONFIG_KEXEC_JUMP
 	if (image->preserve_context)
@@ -436,6 +437,10 @@ void __nocfi machine_kexec(struct kimage *image)
 	 *
 	 * Take advantage of this here by force loading the segments,
 	 * before the GDT is zapped with an invalid value.
+	 *
+	 * load_segments() resets GS to 0.  Don't make any function call
+	 * after here since call depth tracking uses percpu variables to
+	 * operate (relocate_kernel() is explicitly ignored by call depth
 	 */
 	load_segments();
 
@@ -444,7 +449,7 @@ void __nocfi machine_kexec(struct kimage *image)
 					   virt_to_phys(control_page),
 					   image->start,
 					   image->preserve_context,
-					   host_mem_enc_active);
+					   cache_incoherent);
 
 #ifdef CONFIG_KEXEC_JUMP
 	if (image->preserve_context)
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 4b668bc683c4..908e4c0a3453 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -88,6 +88,8 @@ EXPORT_PER_CPU_SYMBOL(cpu_tss_rw);
 DEFINE_PER_CPU(bool, __tss_limit_invalid);
 EXPORT_PER_CPU_SYMBOL_GPL(__tss_limit_invalid);
 
+DEFINE_PER_CPU(bool, cache_state_incoherent);
+
 /*
  * this gets called so that we can store lazy state into memory and copy the
  * current task into the new thread.
@@ -813,19 +815,7 @@ void __noreturn stop_this_cpu(void *dummy)
 	disable_local_APIC();
 	mcheck_cpu_clear(c);
 
-	/*
-	 * Use wbinvd on processors that support SME. This provides support
-	 * for performing a successful kexec when going from SME inactive
-	 * to SME active (or vice-versa). The cache must be cleared so that
-	 * if there are entries with the same physical address, both with and
-	 * without the encryption bit, they don't race each other when flushed
-	 * and potentially end up with the wrong entry being committed to
-	 * memory.
-	 *
-	 * Test the CPUID bit directly because the machine might've cleared
-	 * X86_FEATURE_SME due to cmdline options.
-	 */
-	if (c->extended_cpuid_level >= 0x8000001f && (cpuid_eax(0x8000001f) & BIT(0)))
+	if (this_cpu_read(cache_state_incoherent))
 		wbinvd();
 
 	/*
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index ea604f4d0b52..34b3a5e4fe49 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -67,7 +67,7 @@ SYM_CODE_START_NOALIGN(relocate_kernel)
 	 * %rsi pa_control_page
 	 * %rdx start address
 	 * %rcx preserve_context
-	 * %r8  host_mem_enc_active
+	 * %r8  cache_incoherent
 	 */
 
 	/* Save the CPU context, used for jumping back */
@@ -129,7 +129,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	/*
 	 * %rdi	indirection page
 	 * %rdx start address
-	 * %r8 host_mem_enc_active
+	 * %r8 cache_incoherent
 	 * %r9 page table page
 	 * %r11 preserve_context
 	 * %r13 original CR4 when relocate_kernel() was invoked
@@ -200,14 +200,21 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	movq	%r9, %cr3
 
 	/*
+	 * If the memory cache is in incoherent state, e.g., due to
+	 * memory encryption, do wbinvd to flush cache.
+	 *
 	 * If SME is active, there could be old encrypted cache line
 	 * entries that will conflict with the now unencrypted memory
 	 * used by kexec. Flush the caches before copying the kernel.
+	 *
+	 * Note SME sets this flag to true when the platform supports
+	 * SME, so the wbinvd is performed even SME is not activated
+	 * by the kernel.  But this has no harm.
 	 */
 	testq	%r8, %r8
-	jz .Lsme_off
+	jz .Lnowbinvd
 	wbinvd
-.Lsme_off:
+.Lnowbinvd:
 
 	call	swap_pages
 
-- 
2.43.0

