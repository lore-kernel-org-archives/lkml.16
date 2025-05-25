Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1079F5
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748170730; cv=none; b=myWgcvesHRvtvbX6Jmy8WrpZ2+Y3ZckxJxu5Pb2xLQv7w7hhZpRujUTfrN+fuPeyN8oku+iWHSZGdF9juaz+vS9jHVUakkL1XkKKlBaxLi8sV1lTfkBuOCu0KAIBPoJ4ErWZwbSxQtR6fb8jN962IAdjEcY12vhvPWFgqzd9htQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748170730; c=relaxed/simple;
	bh=NcQEfefNHgVNA+m8+mEYhA9B+2aiDdX9b9AHK8SBZmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8V9evCZ0yT/3csdTp38XrETV695JAD6J+8X9vGC6ATZx7h25GtGWRg3zxVGDlqDda64l+O0K9YrMuthKopwwOBJ4D6ILBdcMKbVEmwliBGlVGYY73ajz5PcgmtIs35fTGGV1AGuk01S6T/O/Qzk3hGte6RPeLmTS+vN1CpwJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLGeH+lA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLGeH+lA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C50C4CEEA;
	Sun, 25 May 2025 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748170729;
	bh=NcQEfefNHgVNA+m8+mEYhA9B+2aiDdX9b9AHK8SBZmE=;
	h=Date:From:To:Cc:Subject:From;
	b=vLGeH+lA8wX4cJc7j5k+ULQNeJU8bdlpvJxmJkVNeXKgqJfWkceJx5442QtecpZEI
	 4sGpW6lQx9lx14+ZTBv5bNgP/0zyA5OofaHtrvc6I+VWlGKMT0NuM/xycjn6H1+yxU
	 +jHkAQ+mX2kTSqZ0uhFugedjgtxqfkxcN6hkAaSEESyxwnpiAUEOk72Szo80CLCfPE
	 qzb9zmq4hLmKimF2ialE2J6Wrebotg9hvL3YNh19otyK4d7kb+Q87a8G2GPa30FdoG
	 lCmycdG2arvaa5iF1La1Zhj/bvPzUNjLfPnLyMFdcIOGc6MGWVI+QvQMJW4b3d/kUU
	 HcvVwe7l+22XQ==
Date: Sun, 25 May 2025 12:58:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave@sr71.net>
Subject: [GIT PULL] x86 core updates for v6.16
Message-ID: <aDL35MA4vH0wQ6Gb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2025-05-25

   # HEAD: 6a7c3c2606105a41dde81002c0037420bc1ddf00 x86/bugs: Fix spectre_v2 mitigation default on Intel

Merge note: There's a large number of changes outside of arch/x86/, 
            most of which relate to mechanic changes to the x86 MSR 
            APIs that do not change semantics. Compatibility wrappers 
            were added for the most commonly used APIs to reduce/avoid 
            the pain of merge conflicts & build failures with in-flight 
            changes in this merge window. In a later stage we'll send 
            changes to remove the compatibility wrappers and any 
            leftover uses of the old API names.

Core x86 updates for v6.16:

Boot code changes:

 - A large series of changes to reorganize the x86 boot code into a better isolated
   and easier to maintain base of PIC early startup code in arch/x86/boot/startup/,
   by Ard Biesheuvel.

   Motivation & background:

	| Since commit
	|
	|    c88d71508e36 ("x86/boot/64: Rewrite startup_64() in C")
	|
	| dated Jun 6 2017, we have been using C code on the boot path in a way
	| that is not supported by the toolchain, i.e., to execute non-PIC C
	| code from a mapping of memory that is different from the one provided
	| to the linker. It should have been obvious at the time that this was a
	| bad idea, given the need to sprinkle fixup_pointer() calls left and
	| right to manipulate global variables (including non-pointer variables)
	| without crashing.
	|
	| This C startup code has been expanding, and in particular, the SEV-SNP
	| startup code has been expanding over the past couple of years, and
	| grown many of these warts, where the C code needs to use special
	| annotations or helpers to access global objects.

   This tree includes the first phase of this work-in-progress x86 boot code
   reorganization.

Scalability enhancements and micro-optimizations:

 - Improve code-patching scalability (Eric Dumazet)
 - Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR (Andrew Cooper)

CPU features enumeration updates:

 - Thorough reorganization and cleanup of CPUID parsing APIs (Ahmed S. Darwish)
 - Fix, refactor and clean up the cacheinfo code (Ahmed S. Darwish, Thomas Gleixner)
 - Update CPUID bitfields to x86-cpuid-db v2.3 (Ahmed S. Darwish)

Memory management changes:

 - Allow temporary MMs when IRQs are on (Andy Lutomirski)
 - Opt-in to IRQs-off activate_mm() (Andy Lutomirski)
 - Simplify choose_new_asid() and generate better code (Borislav Petkov)
 - Simplify 32-bit PAE page table handling (Dave Hansen)
 - Always use dynamic memory layout (Kirill A. Shutemov)
 - Make SPARSEMEM_VMEMMAP the only memory model (Kirill A. Shutemov)
 - Make 5-level paging support unconditional (Kirill A. Shutemov)
 - Stop prefetching current->mm->mmap_lock on page faults (Mateusz Guzik)
 - Predict valid_user_address() returning true (Mateusz Guzik)
 - Consolidate initmem_init() (Mike Rapoport)

FPU support and vector computing:

 - Enable Intel APX support (Chang S. Bae)
 - Reorgnize and clean up the xstate code (Chang S. Bae)
 - Make task_struct::thread constant size (Ingo Molnar)
 - Restore fpu_thread_struct_whitelist() to fix CONFIG_HARDENED_USERCOPY=y
   (Kees Cook)
 - Simplify the switch_fpu_prepare() + switch_fpu_finish() logic (Oleg Nesterov)
 - Always preserve non-user xfeatures/flags in __state_perm (Sean Christopherson)

Microcode loader changes:

 - Help users notice when running old Intel microcode (Dave Hansen)
 - AMD: Do not return error when microcode update is not necessary (Annie Li)
 - AMD: Clean the cache if update did not load microcode (Boris Ostrovsky)

Code patching (alternatives) changes:

 - Simplify, reorganize and clean up the x86 text-patching code (Ingo Molnar)
 - Make smp_text_poke_batch_process() subsume smp_text_poke_batch_finish()
   (Nikolay Borisov)
 - Refactor the {,un}use_temporary_mm() code (Peter Zijlstra)

Debugging support:

 - Add early IDT and GDT loading to debug relocate_kernel() bugs (David Woodhouse)
 - Print the reason for the last reset on modern AMD CPUs (Yazen Ghannam)
 - Add AMD Zen debugging document (Mario Limonciello)
 - Fix opcode map (!REX2) superscript tags (Masami Hiramatsu)
 - Stop decoding i64 instructions in x86-64 mode at opcode (Masami Hiramatsu)

CPU bugs and bug mitigations:

 - Remove X86_BUG_MMIO_UNKNOWN (Borislav Petkov)
 - Fix SRSO reporting on Zen1/2 with SMT disabled (Borislav Petkov)
 - Restructure and harmonize the various CPU bug mitigation methods
   (David Kaplan)
 - Fix spectre_v2 mitigation default on Intel (Pawan Gupta)

MSR API:

 - Large MSR code and API cleanup (Xin Li)
 - In-kernel MSR API type cleanups and renames (Ingo Molnar)

PKEYS:

 - Simplify PKRU update in signal frame (Chang S. Bae)

NMI handling code:

 - Clean up, refactor and simplify the NMI handling code (Sohil Mehta)
 - Improve NMI duration console printouts (Sohil Mehta)

Paravirt guests interface:

 - Restrict PARAVIRT_XXL to 64-bit only (Kirill A. Shutemov)

SEV support:

 - Share the sev_secrets_pa value again (Tom Lendacky)

x86 platform changes:

 - Introduce the <asm/amd/> header namespace (Ingo Molnar)
 - i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>
   (Mario Limonciello)

Fixes and cleanups:

 - x86 assembly code cleanups and fixes (Uros Bizjak)

 - Misc fixes and cleanups (Andi Kleen, Andy Lutomirski, Andy Shevchenko,
   Ard Biesheuvel, Bagas Sanjaya, Baoquan He, Borislav Petkov, Chang S. Bae,
   Chao Gao, Dan Williams, Dave Hansen, David Kaplan, David Woodhouse,
   Eric Biggers, Ingo Molnar, Josh Poimboeuf, Juergen Gross, Malaya Kumar Rout,
   Mario Limonciello, Nathan Chancellor, Oleg Nesterov, Pawan Gupta,
   Peter Zijlstra, Shivank Garg, Sohil Mehta, Thomas Gleixner, Uros Bizjak,
   Xin Li)

 Thanks,

	Ingo

------------------>
Ahmed S. Darwish (58):
      tools/x86/kcpuid: Fix error handling
      tools/x86/kcpuid: Exit the program on invalid parameters
      tools/x86/kcpuid: Simplify usage() handling
      tools/x86/kcpuid: Save CPUID output in an array
      tools/x86/kcpuid: Print correct CPUID output register names
      tools/x86/kcpuid: Remove unused local variable
      tools/x86/kcpuid: Remove unused global variable
      tools/x86/kcpuid: Set parse_line() return type to void
      tools/x86/kcpuid: Use C99-style for loops
      tools/x86/kcpuid: Use <cpuid.h> intrinsics
      tools/x86/kcpuid: Refactor CPUID range handling for future expansion
      tools/x86/kcpuid: Extend CPUID index mask macro
      tools/x86/kcpuid: Consolidate index validity checks
      tools/x86/kcpuid: Filter valid CPUID ranges
      tools/x86/kcpuid: Define Transmeta and Centaur index ranges
      tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.0
      tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.1
      tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.2
      tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
      MAINTAINERS: Include the entire kcpuid/ directory under the X86 CPUID DATABASE entry
      x86/cpu: Remove CPUID leaf 0x2 parsing loop
      x86/cacheinfo: Remove CPUID leaf 0x2 parsing loop
      x86/cpu: Introduce and use CPUID leaf 0x2 parsing helpers
      x86/cacheinfo: Use CPUID leaf 0x2 parsing helpers
      x86/cacheinfo: Constify _cpuid4_info_regs instances
      x86/cacheinfo: Align ci_info_init() assignment expressions
      x86/cacheinfo: Standardize _cpuid4_info_regs instance naming
      x86/cacheinfo: Consolidate AMD/Hygon leaf 0x8000001d calls
      x86/cacheinfo: Separate amd_northbridge from _cpuid4_info_regs
      x86/cacheinfo: Move AMD cache_disable_0/1 handling to separate file
      x86/cacheinfo: Use sysfs_emit() for sysfs attributes show()
      x86/cacheinfo: Separate Intel and AMD CPUID leaf 0x4 code paths
      x86/cacheinfo: Rename 'struct _cpuid4_info_regs' to 'struct _cpuid4_info'
      x86/cacheinfo: Clarify type markers for CPUID leaf 0x2 cache descriptors
      x86/cacheinfo: Use enums for cache descriptor types
      x86/cpu: Use enums for TLB descriptor types
      x86/cacheinfo: Use consolidated CPUID leaf 0x2 descriptor table
      x86/cpu: Use consolidated CPUID leaf 0x2 descriptor table
      x86/cacheinfo: Separate CPUID leaf 0x2 handling and post-processing logic
      x86/cacheinfo: Separate Intel CPUID leaf 0x4 handling
      x86/cacheinfo: Extract out cache level topology ID calculation
      x86/cacheinfo: Extract out cache self-snoop checks
      x86/cacheinfo: Relocate CPUID leaf 0x4 cache_type mapping
      x86/cacheinfo: Introduce cpuid_amd_hygon_has_l3_cache()
      x86/cacheinfo: Apply maintainer-tip coding style fixes
      x86/cacheinfo: Properly parse CPUID(0x80000005) L1d/L1i associativity
      x86/cacheinfo: Properly parse CPUID(0x80000006) L2/L3 associativity
      x86/cpuid: Remove obsolete CPUID(0x2) iteration macro
      x86/cacheinfo: Standardize header files and CPUID references
      tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
      x86/cpu: Sanitize CPUID(0x80000000) output
      x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
      x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
      x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
      x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
      x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
      x86/cpu/intel: Rename CPUID(0x2) descriptors iterator parameter
      x86/cpuid: Rename hypervisor_cpuid_base()/for_each_possible_hypervisor_cpuid_base() to cpuid_base_hypervisor()/for_each_possible_cpuid_base_hypervisor()

Andi Kleen (1):
      x86/cpuid: Add AMX and SPEC_CTRL dependencies

Andrew Cooper (1):
      x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR in mwait_idle_with_hints() and prefer_mwait_c1_over_halt()

Andy Lutomirski (5):
      x86/events, x86/insn-eval: Remove incorrect current->active_mm references
      x86/mm: Make use_/unuse_temporary_mm() non-static
      x86/mm: Allow temporary MMs when IRQs are on
      x86/efi: Make efi_enter/leave_mm() use the use_/unuse_temporary_mm() machinery
      x86/mm: Opt-in to IRQs-off activate_mm()

Andy Shevchenko (1):
      x86/boot: Use __ALIGN_KERNEL_MASK() instead of open coded analogue

Annie Li (1):
      x86/microcode/AMD: Do not return error when microcode update is not necessary

Ard Biesheuvel (28):
      x86/boot/compressed: Merge the local pgtable.h include into <asm/boot.h>
      x86/boot: Move the 5-level paging trampoline into /startup
      x86/boot: Move the EFI mixed mode startup code back under arch/x86, into startup/
      x86/boot/startup: Disable objtool validation for library code
      x86/asm: Make rip_rel_ptr() usable from fPIC code
      x86/boot: Move the early GDT/IDT setup code into startup/
      x86/boot: Move early kernel mapping code into startup/
      x86/boot: Drop RIP_REL_REF() uses from early mapping code
      x86/boot: Move early SME init code into startup/
      x86/boot: Drop RIP_REL_REF() uses from SME startup code
      x86/sev: Prepare for splitting off early SEV code
      vmlinux.lds: Include .data.rel[.local] into .data section
      x86/sev: Move noinstr NMI handling code into separate source file
      x86/sev: Split off startup code from core code
      x86/boot: Move SEV startup code into startup/
      x86/boot: Drop RIP_REL_REF() uses from early SEV code
      x86/asm: Retire RIP_REL_REF()
      x86/boot: Disable jump tables in PIC code
      x86/boot: Move early_setup_gdt() back into head64.c
      x86/boot: Disregard __supported_pte_mask in __startup_64()
      x86/sev: Make sev_snp_enabled() a static function
      x86/sev: Move instruction decoder into separate source file
      x86/linkage: Add SYM_PIC_ALIAS() macro helper to emit symbol aliases
      x86/boot: Add a bunch of PIC aliases
      x86/boot: Provide __pti_set_user_pgtbl() to startup code
      x86/sev: Disentangle #VC handling code from startup code
      x86/boot: Defer initialization of VM space related global variables
      x86/asm-offsets: Export certain 'struct cpuinfo_x86' fields for 64-bit asm use too

Bagas Sanjaya (1):
      x86/cpu: Add "Old Microcode" docs to hw-vuln toctree

Baoquan He (3):
      x86/mm: Remove the arch-specific pgd_leaf() definition
      x86/mm: Remove the arch-specific p4d_leaf() definition
      x86/mm: Simplify the pgd_leaf() and p4d_leaf() checks a bit

Boris Ostrovsky (1):
      x86/microcode/AMD: Clean the cache if update did not load microcode

Borislav Petkov (AMD) (6):
      x86/tlb: Simplify choose_new_asid() and generate better code
      x86/cpuid: Align macro linebreaks vertically
      x86/bugs: Remove X86_BUG_MMIO_UNKNOWN
      x86/cpufeatures: Clean up formatting
      x86/bugs: Fix SRSO reporting on Zen1/2 with SMT disabled
      x86/bugs: Fix indentation due to ITS merge

Chang S. Bae (14):
      x86/fpu/xstate: Remove xstate offset check
      x86/fpu/xstate: Introduce xfeature order table and accessor macro
      x86/fpu/xstate: Adjust XSAVE buffer size calculation
      x86/fpu/xstate: Adjust xstate copying logic for user ABI
      x86/cpufeatures: Add X86_FEATURE_APX
      x86/fpu/apx: Define APX state component
      x86/fpu/apx: Disallow conflicting MPX presence
      x86/fpu/apx: Enable APX state support
      selftests/x86/apx: Add APX test
      x86/fpu: Log XSAVE disablement consistently
      x86/fpu: Refactor xfeature bitmask update code for sigframe XSAVE
      x86/pkeys: Simplify PKRU update in signal frame
      x86/fpu: Remove export of mxcsr_feature_mask
      x86/fpu: Rename fpu_reset_fpregs() to fpu_reset_fpstate_regs()

Chao Gao (1):
      x86/fpu: Drop @perm from guest pseudo FPU container

Dan Williams (1):
      x86/devmem: Remove duplicate range_is_allowed() definition

Dave Hansen (9):
      x86/mm: Always allocate a whole page for PAE PGDs
      x86/mm: Always "broadcast" PMD setting operations
      x86/mm: Always tell core mm to sync kernel mappings
      x86/mm: Simplify PAE PGD sharing macros
      x86/mm: Fix up comments around PMD preallocation
      x86/mm: Preallocate all PAE page tables
      x86/mm: Remove duplicated PMD preallocation macro
      x86/mm: Remove now unused SHARED_KERNEL_PMD
      x86/cpu: Help users notice when running old Intel microcode

David Kaplan (17):
      x86/bugs: Restructure MDS mitigation
      x86/bugs: Restructure TAA mitigation
      x86/bugs: Restructure MMIO mitigation
      x86/bugs: Restructure RFDS mitigation
      x86/bugs: Remove md_clear_*_mitigation()
      x86/bugs: Restructure SRBDS mitigation
      x86/bugs: Restructure GDS mitigation
      x86/bugs: Restructure spectre_v1 mitigation
      x86/bugs: Allow retbleed=stuff only on Intel
      x86/bugs: Restructure retbleed mitigation
      x86/bugs: Restructure spectre_v2_user mitigation
      x86/bugs: Restructure BHI mitigation
      x86/bugs: Restructure spectre_v2 mitigation
      x86/bugs: Restructure SSB mitigation
      x86/bugs: Restructure L1TF mitigation
      x86/bugs: Restructure SRSO mitigation
      x86/bugs: Restructure ITS mitigation

David Woodhouse (6):
      x86/kexec: Debugging support: Load an IDT and basic exception entry points
      x86/kexec: Debugging support: Dump registers on exception
      x86/kexec: Add 8250 serial port output
      x86/kexec: Add 8250 MMIO serial port output
      x86/kexec: Invalidate GDT/IDT from relocate_kernel() instead of earlier
      selftests/kexec: Add x86_64 selftest for kexec-jump and exception handling

Eric Biggers (1):
      x86/microcode/AMD: Use sha256() instead of init/update/final

Eric Dumazet (1):
      x86/alternatives: Improve code-patching scalability by removing false sharing in poke_int3_handler()

Ingo Molnar (91):
      x86/msr: Standardize on u64 in <asm/msr.h>
      x86/msr: Standardize on u64 in <asm/msr-index.h>
      x86/msr: Use u64 in rdmsrl_amd_safe() and wrmsrl_amd_safe()
      x86/msr: Use u64 in rdmsrl_safe() and paravirt_read_pmc()
      x86/msr: Harmonize the prototype and definition of do_trace_rdpmc()
      x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>
      x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'
      x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'
      x86/msr: Rename 'rdmsrl_safe()' to 'rdmsrq_safe()'
      x86/msr: Rename 'wrmsrl_safe()' to 'wrmsrq_safe()'
      x86/msr: Rename 'rdmsrl_safe_on_cpu()' to 'rdmsrq_safe_on_cpu()'
      x86/msr: Rename 'wrmsrl_safe_on_cpu()' to 'wrmsrq_safe_on_cpu()'
      x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'
      x86/msr: Rename 'wrmsrl_on_cpu()' to 'wrmsrq_on_cpu()'
      x86/msr: Rename 'mce_rdmsrl()' to 'mce_rdmsrq()'
      x86/msr: Rename 'mce_wrmsrl()' to 'mce_wrmsrq()'
      x86/msr: Rename 'rdmsrl_amd_safe()' to 'rdmsrq_amd_safe()'
      x86/msr: Rename 'wrmsrl_amd_safe()' to 'wrmsrq_amd_safe()'
      x86/msr: Rename 'native_wrmsrl()' to 'native_wrmsrq()'
      x86/msr: Rename 'wrmsrl_cstar()' to 'wrmsrq_cstar()'
      x86/alternatives: Rename 'struct bp_patching_desc' to 'struct text_poke_int3_vec'
      x86/alternatives: Rename 'bp_refs' to 'text_poke_array_refs'
      x86/alternatives: Rename 'text_poke_bp_batch()' to 'smp_text_poke_batch_process()'
      x86/alternatives: Rename 'text_poke_bp()' to 'smp_text_poke_single()'
      x86/alternatives: Rename 'poke_int3_handler()' to 'smp_text_poke_int3_handler()'
      x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
      x86/alternatives: Rename 'poking_addr' to 'text_poke_mm_addr'
      x86/alternatives: Rename 'bp_desc' to 'int3_desc'
      x86/alternatives: Remove duplicate 'text_poke_early()' prototype
      x86/alternatives: Update comments in int3_emulate_push()
      x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
      x86/alternatives: Rename 'text_poke_flush()' to 'smp_text_poke_batch_flush()'
      x86/alternatives: Rename 'text_poke_finish()' to 'smp_text_poke_batch_finish()'
      x86/alternatives: Rename 'text_poke_queue()' to 'smp_text_poke_batch_add()'
      x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
      x86/alternatives: Rename 'struct text_poke_loc' to 'struct smp_text_poke_loc'
      x86/alternatives: Rename 'int3_desc' to 'int3_vec'
      x86/alternatives: Add text_mutex) assert to smp_text_poke_batch_flush()
      x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
      x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from smp_text_poke_batch_finish()/smp_text_poke_batch_flush()/text_poke_addr_ordered()
      x86/alternatives: Simplify smp_text_poke_single() by using tp_vec and existing APIs
      x86/alternatives: Assert that smp_text_poke_int3_handler() can only ever handle 'tp_vec[]' based requests
      x86/alternatives: Assert input parameters in smp_text_poke_batch_process()
      x86/alternatives: Introduce 'struct smp_text_poke_array' and move tp_vec and tp_vec_nr to it
      x86/alternatives: Remove the tp_vec indirection
      x86/alternatives: Rename 'try_get_desc()' to 'try_get_text_poke_array()'
      x86/alternatives: Rename 'put_desc()' to 'put_text_poke_array()'
      x86/alternatives: Simplify try_get_text_poke_array()
      x86/alternatives: Simplify smp_text_poke_int3_handler()
      x86/alternatives: Simplify smp_text_poke_batch_process()
      x86/alternatives: Move the text_poke_array manipulation into text_poke_int3_loc_init() and rename it to __smp_text_poke_batch_add()
      x86/alternatives: Remove the mixed-patching restriction on smp_text_poke_single()
      x86/alternatives: Document 'smp_text_poke_single()'
      x86/alternatives: Add documentation for smp_text_poke_batch_add()
      x86/alternatives: Move text_poke_array completion from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to smp_text_poke_batch_process()
      x86/alternatives: Rename 'text_poke_sync()' to 'smp_text_poke_sync_each_cpu()'
      x86/alternatives: Simplify text_poke_addr_ordered()
      x86/alternatives: Constify text_poke_addr()
      x86/alternatives: Simplify and clean up patch_cmp()
      x86/alternatives: Standardize on 'tpl' local variable names for 'struct smp_text_poke_loc *'
      x86/alternatives: Rename 'TP_ARRAY_NR_ENTRIES_MAX' to 'TEXT_POKE_ARRAY_MAX'
      x86/alternatives: Rename 'POKE_MAX_OPCODE_SIZE' to 'TEXT_POKE_MAX_OPCODE_SIZE'
      x86/alternatives: Simplify the #include section
      x86/alternatives: Move declarations of vmlinux.lds.S defined section symbols to <asm/alternative.h>
      x86/alternatives: Remove 'smp_text_poke_batch_flush()'
      x86/alternatives: Update the comments in smp_text_poke_batch_process()
      x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'
      x86/alternatives: Add comment about noinstr expectations
      x86/msr: Add compatibility wrappers for rdmsrl()/wrmsrl()
      x86/fpu: Introduce the x86_task_fpu() helper method
      x86/fpu: Convert task_struct::thread.fpu accesses to use x86_task_fpu()
      x86/fpu: Make task_struct::thread constant size
      x86/fpu: Remove the thread::fpu pointer
      x86/fpu: Push 'fpu' pointer calculation into the fpu__drop() call
      x86/fpu: Make sure x86_task_fpu() doesn't get called for PF_KTHREAD|PF_USER_WORKER tasks during exit
      x86/fpu: Remove init_task FPU state dependencies, add debugging warning for PF_KTHREAD tasks
      x86/fpu: Use 'fpstate' variable names consistently
      x86/fpu: Clarify FPU context cacheline alignment
      x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
      x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>
      x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>
      x86/platform/amd: Move the <asm/amd_hsmp.h> header to <asm/amd/hsmp.h>
      x86/platform/amd: Clean up the <asm/amd/hsmp.h> header guards a bit
      x86/platform/amd: Move the <asm/amd_node.h> header to <asm/amd/node.h>
      x86/alternatives, um: Rename UML's text_poke_sync() wrapper to smp_text_poke_sync_each_cpu()
      x86/msr: Improve the comments of the DECLARE_ARGS()/EAX_EDX_VAL()/EAX_EDX_RET() facility
      x86/msr: Rename DECLARE_ARGS() to EAX_EDX_DECLARE_ARGS
      x86/msr: Move the EAX_EDX_*() methods from <asm/msr.h> to <asm/asm.h>
      tools/arch/x86: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
      accel/habanalabs: Don't build the driver on UML
      x86/msr: Add rdmsrl_on_cpu() compatibility wrapper

Josh Poimboeuf (1):
      objtool, x86/hweight: Remove ANNOTATE_IGNORE_ALTERNATIVE

Juergen Gross (1):
      x86/alternative: Remove unused header #defines

Kees Cook (1):
      x86/fpu: Restore fpu_thread_struct_whitelist() to fix CONFIG_HARDENED_USERCOPY=y crash

Kirill A. Shutemov (4):
      x86/mm/64: Always use dynamic memory layout
      x86/mm/64: Make SPARSEMEM_VMEMMAP the only memory model
      x86/mm/64: Make 5-level paging support unconditional
      x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only

Malaya Kumar Rout (1):
      selftests/x86/lam: Fix clean up fds in do_uring() and allocate_dsa_pasid()

Mario Limonciello (4):
      i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86
      i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>
      platform/x86/amd/pmc: Use FCH_PM_BASE definition
      Documentation: Add AMD Zen debugging document

Masami Hiramatsu (Google) (2):
      x86/insn: Fix opcode map (!REX2) superscript tags
      x86/insn: Stop decoding i64 instructions in x86-64 mode at opcode

Mateusz Guzik (2):
      x86/mm: Stop prefetching current->mm->mmap_lock on page faults
      x86/uaccess: Predict valid_user_address() returning true

Mike Rapoport (Microsoft) (1):
      x86/mm: Consolidate initmem_init()

Nathan Chancellor (1):
      x86/boot/startup: Disable LTO for the startup code

Nikolay Borisov (1):
      x86/alternatives: Make smp_text_poke_batch_process() subsume smp_text_poke_batch_finish()

Oleg Nesterov (6):
      x86/fpu: Simplify the switch_fpu_prepare() + switch_fpu_finish() logic
      x86/fpu: Remove x86_init_fpu
      x86/fpu: Remove DEFINE_EVENT(x86_fpu, x86_fpu_copy_src)
      x86/fpu: Always use memcpy_and_pad() in arch_dup_task_struct()
      x86/fpu: Check TIF_NEED_FPU_LOAD instead of PF_KTHREAD|PF_USER_WORKER in fpu__drop()
      x86/fpu: Shift fpregs_assert_state_consistent() from arch_exit_work() to its caller

Pawan Gupta (2):
      x86/bugs: Rename mmio_stale_data_clear to cpu_buf_vm_clear
      x86/bugs: Fix spectre_v2 mitigation default on Intel

Peter Zijlstra (6):
      x86/alternatives: Document the text_poke_bp_batch() synchronization rules a bit more
      x86/mm: Add 'mm' argument to unuse_temporary_mm()
      x86/mm: Remove 'mm' argument from unuse_temporary_mm() again
      x86/mm: Remove the mm_cpumask(prev) warning from switch_mm_irqs_off()
      x86/mm: Fix {,un}use_temporary_mm() IRQ state
      x86/mm: Fix false positive warning in switch_mm_irqs_off()

Sean Christopherson (1):
      x86/fpu/xstate: Always preserve non-user xfeatures/flags in __state_perm

Shivank Garg (1):
      x86/mm: Fix kernel-doc descriptions of various pgtable methods

Sohil Mehta (10):
      x86/nmi: Simplify unknown NMI panic handling
      x86/nmi: Consolidate NMI panic variables
      x86/nmi: Use a macro to initialize NMI descriptors
      x86/nmi: Remove export of local_touch_nmi()
      x86/nmi: Fix comment in unknown_nmi_error()
      x86/nmi: Improve and relocate NMI handler comments
      x86/nmi: Improve <asm/nmi.h> documentation
      x86/nmi: Add missing description x86_platform_ops::get_nmi_reason to <asm/x86_init.h>
      x86/nmi: Clean up NMI selftest
      x86/nmi: Improve NMI duration console printouts

Thomas Gleixner (4):
      x86/cacheinfo: Refactor CPUID leaf 0x2 cache descriptor lookup
      x86/cacheinfo: Properly name amd_cpuid4()'s first parameter
      x86/cacheinfo: Use proper name for cacheinfo instances
      x86/cpu: Consolidate CPUID leaf 0x2 tables

Tom Lendacky (1):
      x86/sev: Share the sev_secrets_pa value again

Uros Bizjak (14):
      x86/bitops: Use TZCNT mnemonic in <asm/bitops.h>
      x86/bitops: Simplify variable_ffz() as variable__ffs(~word)
      x86/idle: Standardize argument types for MONITOR{,X} and MWAIT{,X} instruction wrappers on 'u32'
      x86/idle: Remove .s output beautifying delimiters from simpler asm() templates
      x86/idle: Remove CONFIG_AS_TPAUSE
      x86/idle: Change arguments of mwait_idle_with_hints() to u32
      x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>
      x86: Remove __FORCE_ORDER workaround
      x86/percpu: Refer __percpu_prefix to __force_percpu_prefix
      x86/uaccess: Use asm_inline() instead of asm() in __untagged_addr()
      x86/boot: Remove semicolon from "rep" prefixes
      x86/asm: Remove semicolon from "rep" prefixes
      x86/asm: Replace "REP; NOP" with PAUSE mnemonic
      x86/asm: Rename rep_nop() to native_pause()

Xin Li (Intel) (19):
      x86/cpufeatures: Shorten X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT
      x86/cpufeatures: Shorten X86_FEATURE_AMD_HETEROGENEOUS_CORES
      x86/msr: Add explicit includes of <asm/msr.h>
      x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
      x86/msr: Remove the unused rdpmc() method
      x86/msr: Rename rdpmcl() to rdpmc()
      x86/msr: Convert the rdpmc() macro to an __always_inline function
      x86/xen/msr: Return u64 consistently in Xen PMC xen_*_read functions
      x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
      x86/msr: Add the native_rdmsrq() helper
      x86/msr: Convert __rdmsr() uses to native_rdmsrq() uses
      x86/xen/msr: Remove calling native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
      x86/xen/msr: Remove pmu_msr_{read,write}()
      x86/xen/msr: Remove the error pointer argument from set_seg()
      x86/pvops/msr: Refactor pv_cpu_ops.write_msr{,_safe}()
      x86/msr: Replace wrmsr(msr, low, 0) with wrmsrq(msr, low)
      x86/msr: Change the function type of native_read_msr_safe()
      x86/msr: Remove a superfluous inclusion of <asm/asm.h>
      x86/xen/msr: Fix uninitialized variable 'err'

Yazen Ghannam (1):
      x86/CPU/AMD: Print the reason for the last reset


 Documentation/ABI/testing/sysfs-devices-system-cpu |    1 +
 Documentation/admin-guide/hw-vuln/index.rst        |    1 +
 .../admin-guide/hw-vuln/old_microcode.rst          |   21 +
 Documentation/arch/x86/amd-debugging.rst           |  368 ++++
 Documentation/arch/x86/cpuinfo.rst                 |    8 +-
 Documentation/arch/x86/index.rst                   |    1 +
 Documentation/arch/x86/resume.svg                  |    4 +
 Documentation/arch/x86/suspend.svg                 |    4 +
 Documentation/arch/x86/x86_64/5level-paging.rst    |    9 -
 MAINTAINERS                                        |    6 +-
 arch/um/kernel/um_arch.c                           |    2 +-
 arch/x86/Kconfig                                   |   34 +-
 arch/x86/Kconfig.assembler                         |    4 -
 arch/x86/Kconfig.cpufeatures                       |    4 -
 arch/x86/Makefile                                  |    1 +
 arch/x86/boot/bioscall.S                           |    4 +-
 arch/x86/boot/boot.h                               |    6 +-
 arch/x86/boot/compressed/Makefile                  |   10 +-
 arch/x86/boot/compressed/head_64.S                 |    1 -
 arch/x86/boot/compressed/misc.c                    |    1 -
 arch/x86/boot/compressed/misc.h                    |    8 +
 arch/x86/boot/compressed/pgtable.h                 |   18 -
 arch/x86/boot/compressed/pgtable_64.c              |   12 +-
 arch/x86/boot/compressed/sev-handle-vc.c           |  134 ++
 arch/x86/boot/compressed/sev.c                     |  156 +-
 arch/x86/boot/compressed/sev.h                     |   21 +-
 arch/x86/boot/compressed/string.c                  |    8 +-
 arch/x86/boot/copy.S                               |    8 +-
 arch/x86/boot/header.S                             |    6 +-
 arch/x86/boot/startup/Makefile                     |   30 +
 .../x86/boot/startup/efi-mixed.S                   |    0
 arch/x86/boot/startup/gdt_idt.c                    |   71 +
 arch/x86/boot/{compressed => startup}/la57toggle.S |    1 -
 arch/x86/boot/startup/map_kernel.c                 |  217 +++
 .../sev/shared.c => boot/startup/sev-shared.c}     |  894 +---------
 arch/x86/boot/startup/sev-startup.c                |  368 ++++
 .../mem_encrypt_identity.c => boot/startup/sme.c}  |   30 +-
 arch/x86/boot/string.c                             |    2 +-
 arch/x86/boot/video.c                              |    2 +-
 arch/x86/coco/core.c                               |    2 +
 arch/x86/coco/sev/Makefile                         |   23 +-
 arch/x86/coco/sev/core.c                           | 1808 +++-----------------
 arch/x86/coco/sev/sev-nmi.c                        |  108 ++
 arch/x86/coco/sev/vc-handle.c                      | 1061 ++++++++++++
 arch/x86/coco/sev/vc-shared.c                      |  504 ++++++
 arch/x86/entry/vsyscall/vsyscall_64.c              |    2 -
 arch/x86/events/amd/brs.c                          |   12 +-
 arch/x86/events/amd/core.c                         |   13 +-
 arch/x86/events/amd/ibs.c                          |   29 +-
 arch/x86/events/amd/iommu.c                        |    2 +
 arch/x86/events/amd/lbr.c                          |   21 +-
 arch/x86/events/amd/power.c                        |   11 +-
 arch/x86/events/amd/uncore.c                       |   14 +-
 arch/x86/events/core.c                             |   54 +-
 arch/x86/events/intel/bts.c                        |    1 +
 arch/x86/events/intel/core.c                       |   71 +-
 arch/x86/events/intel/cstate.c                     |    3 +-
 arch/x86/events/intel/ds.c                         |   13 +-
 arch/x86/events/intel/knc.c                        |   17 +-
 arch/x86/events/intel/lbr.c                        |   44 +-
 arch/x86/events/intel/p4.c                         |   25 +-
 arch/x86/events/intel/p6.c                         |   13 +-
 arch/x86/events/intel/pt.c                         |   35 +-
 arch/x86/events/intel/uncore.c                     |    3 +-
 arch/x86/events/intel/uncore_discovery.c           |   11 +-
 arch/x86/events/intel/uncore_nhmex.c               |   71 +-
 arch/x86/events/intel/uncore_snb.c                 |   43 +-
 arch/x86/events/intel/uncore_snbep.c               |   51 +-
 arch/x86/events/msr.c                              |    4 +-
 arch/x86/events/perf_event.h                       |   27 +-
 arch/x86/events/probe.c                            |    4 +-
 arch/x86/events/rapl.c                             |    9 +-
 arch/x86/events/utils.c                            |    1 +
 arch/x86/events/zhaoxin/core.c                     |   17 +-
 arch/x86/hyperv/hv_apic.c                          |   11 +-
 arch/x86/hyperv/hv_init.c                          |   67 +-
 arch/x86/hyperv/hv_spinlock.c                      |    7 +-
 arch/x86/hyperv/hv_vtl.c                           |    5 +-
 arch/x86/hyperv/ivm.c                              |    5 +-
 arch/x86/include/asm/acrn.h                        |    2 +-
 arch/x86/include/asm/alternative.h                 |   11 +-
 arch/x86/include/asm/amd/fch.h                     |   13 +
 arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}    |    2 +-
 arch/x86/include/asm/{amd-ibs.h => amd/ibs.h}      |    5 +
 arch/x86/include/asm/{amd_nb.h => amd/nb.h}        |    2 +-
 arch/x86/include/asm/{amd_node.h => amd/node.h}    |    0
 arch/x86/include/asm/apic.h                        |   12 +-
 arch/x86/include/asm/arch_hweight.h                |    6 +-
 arch/x86/include/asm/asm.h                         |   24 +-
 arch/x86/include/asm/bitops.h                      |    7 +-
 arch/x86/include/asm/boot.h                        |   10 +
 arch/x86/include/asm/coco.h                        |    2 +-
 arch/x86/include/asm/cpufeatures.h                 |   33 +-
 arch/x86/include/asm/cpuid/api.h                   |   96 +-
 arch/x86/include/asm/cpuid/types.h                 |   95 +
 arch/x86/include/asm/debugreg.h                    |   16 +-
 arch/x86/include/asm/entry-common.h                |    5 +-
 arch/x86/include/asm/fpu/api.h                     |    2 +-
 arch/x86/include/asm/fpu/sched.h                   |   38 +-
 arch/x86/include/asm/fpu/types.h                   |   24 +-
 arch/x86/include/asm/fpu/xstate.h                  |    3 +-
 arch/x86/include/asm/fred.h                        |    1 +
 arch/x86/include/asm/fsgsbase.h                    |    4 +-
 arch/x86/include/asm/inat.h                        |    6 +
 arch/x86/include/asm/io.h                          |    6 +-
 arch/x86/include/asm/kexec.h                       |    7 +
 arch/x86/include/asm/kvm_host.h                    |    3 +-
 arch/x86/include/asm/linkage.h                     |   10 +
 arch/x86/include/asm/mem_encrypt.h                 |    2 +-
 arch/x86/include/asm/microcode.h                   |    4 +-
 arch/x86/include/asm/mmu.h                         |    4 +-
 arch/x86/include/asm/mmu_context.h                 |   15 +-
 arch/x86/include/asm/mshyperv.h                    |    3 +-
 arch/x86/include/asm/msr-index.h                   |   12 +-
 arch/x86/include/asm/msr.h                         |  214 +--
 arch/x86/include/asm/mwait.h                       |   66 +-
 arch/x86/include/asm/nmi.h                         |   49 +-
 arch/x86/include/asm/nospec-branch.h               |    4 +-
 arch/x86/include/asm/page_32_types.h               |    1 -
 arch/x86/include/asm/page_64.h                     |    2 -
 arch/x86/include/asm/page_64_types.h               |   11 -
 arch/x86/include/asm/page_types.h                  |    4 +-
 arch/x86/include/asm/paravirt.h                    |   63 +-
 arch/x86/include/asm/paravirt_types.h              |   12 +-
 arch/x86/include/asm/percpu.h                      |   20 +-
 arch/x86/include/asm/pgtable-2level_types.h        |    2 -
 arch/x86/include/asm/pgtable-3level_types.h        |    4 +-
 arch/x86/include/asm/pgtable.h                     |   10 -
 arch/x86/include/asm/pgtable_64.h                  |    2 -
 arch/x86/include/asm/pgtable_64_types.h            |   26 -
 arch/x86/include/asm/processor.h                   |   16 +-
 arch/x86/include/asm/resctrl.h                     |    2 +
 arch/x86/include/asm/setup.h                       |    1 +
 arch/x86/include/asm/sev-internal.h                |  105 ++
 arch/x86/include/asm/sev.h                         |   59 +
 arch/x86/include/asm/spec-ctrl.h                   |    2 +-
 arch/x86/include/asm/special_insns.h               |   21 +-
 arch/x86/include/asm/string_32.h                   |   15 +-
 arch/x86/include/asm/suspend_32.h                  |    1 +
 arch/x86/include/asm/suspend_64.h                  |    1 +
 arch/x86/include/asm/switch_to.h                   |    4 +-
 arch/x86/include/asm/text-patching.h               |   29 +-
 arch/x86/include/asm/trace/fpu.h                   |    5 -
 arch/x86/include/asm/tsc.h                         |   55 +
 arch/x86/include/asm/uaccess_64.h                  |    6 +-
 arch/x86/include/asm/vdso/processor.h              |    8 +-
 arch/x86/include/asm/x86_init.h                    |    1 +
 arch/x86/include/asm/xen/hypervisor.h              |    2 +-
 arch/x86/kernel/acpi/cppc.c                        |   10 +-
 arch/x86/kernel/acpi/cstate.c                      |    2 +-
 arch/x86/kernel/acpi/sleep.c                       |    1 +
 arch/x86/kernel/alternative.c                      |  441 ++---
 arch/x86/kernel/amd_gart_64.c                      |    2 +-
 arch/x86/kernel/amd_nb.c                           |   11 +-
 arch/x86/kernel/amd_node.c                         |    2 +-
 arch/x86/kernel/aperture_64.c                      |    2 +-
 arch/x86/kernel/apic/apic.c                        |   17 +-
 arch/x86/kernel/apic/apic_numachip.c               |    7 +-
 arch/x86/kernel/apic/io_apic.c                     |    2 +-
 arch/x86/kernel/asm-offsets.c                      |    8 +
 arch/x86/kernel/asm-offsets_32.c                   |    9 -
 arch/x86/kernel/callthunks.c                       |    6 +-
 arch/x86/kernel/cet.c                              |    3 +-
 arch/x86/kernel/cpu/Makefile                       |    5 +-
 arch/x86/kernel/cpu/amd.c                          |   85 +-
 arch/x86/kernel/cpu/amd_cache_disable.c            |  301 ++++
 arch/x86/kernel/cpu/aperfmperf.c                   |   29 +-
 arch/x86/kernel/cpu/bugs.c                         | 1407 ++++++++-------
 arch/x86/kernel/cpu/bus_lock.c                     |   19 +-
 arch/x86/kernel/cpu/cacheinfo.c                    | 1059 ++++--------
 arch/x86/kernel/cpu/common.c                       |  155 +-
 arch/x86/kernel/cpu/cpu.h                          |    9 +
 arch/x86/kernel/cpu/cpuid-deps.c                   |    5 +
 arch/x86/kernel/cpu/cpuid_0x2_table.c              |  128 ++
 arch/x86/kernel/cpu/feat_ctl.c                     |    5 +-
 arch/x86/kernel/cpu/hygon.c                        |    7 +-
 arch/x86/kernel/cpu/intel.c                        |  134 +-
 arch/x86/kernel/cpu/intel_epb.c                    |   12 +-
 arch/x86/kernel/cpu/mce/amd.c                      |   22 +-
 arch/x86/kernel/cpu/mce/core.c                     |   66 +-
 arch/x86/kernel/cpu/mce/inject.c                   |   35 +-
 arch/x86/kernel/cpu/mce/intel.c                    |   32 +-
 arch/x86/kernel/cpu/mce/internal.h                 |    2 +-
 arch/x86/kernel/cpu/microcode/amd.c                |   14 +-
 arch/x86/kernel/cpu/microcode/core.c               |    5 +-
 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h   |  150 ++
 arch/x86/kernel/cpu/microcode/intel.c              |    2 +-
 arch/x86/kernel/cpu/mshyperv.c                     |   13 +-
 arch/x86/kernel/cpu/resctrl/core.c                 |   11 +-
 arch/x86/kernel/cpu/resctrl/monitor.c              |    3 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c          |   27 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             |    9 +-
 arch/x86/kernel/cpu/scattered.c                    |    3 +-
 arch/x86/kernel/cpu/sgx/main.c                     |    3 +-
 arch/x86/kernel/cpu/topology.c                     |    3 +-
 arch/x86/kernel/cpu/topology_amd.c                 |    7 +-
 arch/x86/kernel/cpu/tsx.c                          |   21 +-
 arch/x86/kernel/cpu/umwait.c                       |    6 +-
 arch/x86/kernel/cpu/zhaoxin.c                      |    1 +
 arch/x86/kernel/dumpstack.c                        |    2 -
 arch/x86/kernel/early_printk.c                     |    9 +
 arch/x86/kernel/fpu/context.h                      |    4 +-
 arch/x86/kernel/fpu/core.c                         |   94 +-
 arch/x86/kernel/fpu/init.c                         |   18 +-
 arch/x86/kernel/fpu/regset.c                       |   22 +-
 arch/x86/kernel/fpu/signal.c                       |   29 +-
 arch/x86/kernel/fpu/xstate.c                       |  177 +-
 arch/x86/kernel/fpu/xstate.h                       |   31 +-
 arch/x86/kernel/fred.c                             |   21 +-
 arch/x86/kernel/ftrace.c                           |   18 +-
 arch/x86/kernel/head64.c                           |  284 +--
 arch/x86/kernel/head_32.S                          |    8 +-
 arch/x86/kernel/head_64.S                          |   10 +-
 arch/x86/kernel/hpet.c                             |    5 +-
 arch/x86/kernel/jailhouse.c                        |    2 +-
 arch/x86/kernel/jump_label.c                       |    6 +-
 arch/x86/kernel/kprobes/core.c                     |    4 +-
 arch/x86/kernel/kprobes/opt.c                      |    6 +-
 arch/x86/kernel/kvm.c                              |   33 +-
 arch/x86/kernel/kvmclock.c                         |    6 +-
 arch/x86/kernel/machine_kexec_64.c                 |   48 +-
 arch/x86/kernel/mmconf-fam10h_64.c                 |    8 +-
 arch/x86/kernel/module.c                           |    2 +-
 arch/x86/kernel/nmi.c                              |   87 +-
 arch/x86/kernel/nmi_selftest.c                     |   52 +-
 arch/x86/kernel/paravirt.c                         |    3 +-
 arch/x86/kernel/process.c                          |   44 +-
 arch/x86/kernel/process_32.c                       |    5 +-
 arch/x86/kernel/process_64.c                       |   26 +-
 arch/x86/kernel/reboot_fixups_32.c                 |    2 +-
 arch/x86/kernel/relocate_kernel_32.S               |    6 +-
 arch/x86/kernel/relocate_kernel_64.S               |  250 ++-
 arch/x86/kernel/setup.c                            |   36 +-
 arch/x86/kernel/shstk.c                            |   18 +-
 arch/x86/kernel/signal.c                           |    6 +-
 arch/x86/kernel/smpboot.c                          |    2 +-
 arch/x86/kernel/static_call.c                      |    2 +-
 arch/x86/kernel/trace_clock.c                      |    2 +-
 arch/x86/kernel/traps.c                            |   19 +-
 arch/x86/kernel/tsc.c                              |    5 +-
 arch/x86/kernel/tsc_sync.c                         |   15 +-
 arch/x86/kernel/vmlinux.lds.S                      |    4 +
 arch/x86/kvm/cpuid.c                               |    4 +-
 arch/x86/kvm/svm/avic.c                            |    3 +-
 arch/x86/kvm/svm/sev.c                             |    3 +-
 arch/x86/kvm/svm/svm.c                             |   51 +-
 arch/x86/kvm/vmx/nested.c                          |    5 +-
 arch/x86/kvm/vmx/pmu_intel.c                       |    5 +-
 arch/x86/kvm/vmx/sgx.c                             |    9 +-
 arch/x86/kvm/vmx/vmx.c                             |   79 +-
 arch/x86/kvm/x86.c                                 |   38 +-
 arch/x86/lib/delay.c                               |    2 +-
 arch/x86/lib/insn-eval.c                           |   20 +-
 arch/x86/lib/insn.c                                |    7 +-
 arch/x86/lib/iomem.c                               |    2 +-
 arch/x86/lib/kaslr.c                               |    2 +-
 arch/x86/lib/memcpy_64.S                           |    1 +
 arch/x86/lib/memset_64.S                           |    1 +
 arch/x86/lib/msr-smp.c                             |   16 +-
 arch/x86/lib/msr.c                                 |   12 +-
 arch/x86/lib/retpoline.S                           |    2 +
 arch/x86/lib/string_32.c                           |   17 +-
 arch/x86/lib/strstr_32.c                           |    6 +-
 arch/x86/lib/usercopy_32.c                         |   18 +-
 arch/x86/lib/x86-opcode-map.txt                    |   56 +-
 arch/x86/math-emu/fpu_aux.c                        |    2 +-
 arch/x86/math-emu/fpu_entry.c                      |    4 +-
 arch/x86/math-emu/fpu_system.h                     |    2 +-
 arch/x86/mm/Makefile                               |    8 +-
 arch/x86/mm/amdtopology.c                          |    2 +-
 arch/x86/mm/extable.c                              |    2 +-
 arch/x86/mm/fault.c                                |    3 -
 arch/x86/mm/init.c                                 |   23 +-
 arch/x86/mm/init_32.c                              |    7 -
 arch/x86/mm/init_64.c                              |   16 +-
 arch/x86/mm/mem_encrypt_amd.c                      |    2 +
 arch/x86/mm/mm_internal.h                          |    4 +
 arch/x86/mm/numa.c                                 |    5 +-
 arch/x86/mm/numa_32.c                              |   61 -
 arch/x86/mm/numa_64.c                              |   13 -
 arch/x86/mm/numa_internal.h                        |   10 -
 arch/x86/mm/pat/memtype.c                          |   35 +-
 arch/x86/mm/pat/set_memory.c                       |    4 +-
 arch/x86/mm/pgtable.c                              |  156 +-
 arch/x86/mm/pti.c                                  |    4 +-
 arch/x86/mm/tlb.c                                  |  148 +-
 arch/x86/net/bpf_jit_comp.c                        |    2 +-
 arch/x86/pci/amd_bus.c                             |   12 +-
 arch/x86/pci/fixup.c                               |    2 +-
 arch/x86/pci/mmconfig-shared.c                     |    3 +-
 arch/x86/platform/efi/efi_64.c                     |    8 +-
 arch/x86/platform/olpc/olpc-xo1-rtc.c              |    6 +-
 arch/x86/platform/olpc/olpc-xo1-sci.c              |    2 +-
 arch/x86/platform/pvh/head.S                       |    3 +-
 arch/x86/power/cpu.c                               |   27 +-
 arch/x86/power/hibernate_asm_32.S                  |    3 +-
 arch/x86/power/hibernate_asm_64.S                  |    3 +-
 arch/x86/realmode/init.c                           |    3 +-
 arch/x86/tools/gen-insn-attr-x86.awk               |    7 +
 arch/x86/virt/svm/sev.c                            |   23 +-
 arch/x86/xen/enlighten_pv.c                        |   63 +-
 arch/x86/xen/mmu_pv.c                              |    4 -
 arch/x86/xen/pmu.c                                 |   73 +-
 arch/x86/xen/suspend.c                             |    7 +-
 arch/x86/xen/xen-ops.h                             |    5 +-
 drivers/accel/habanalabs/Kconfig                   |    2 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |    2 -
 drivers/acpi/acpi_extlog.c                         |    3 +-
 drivers/acpi/acpi_lpit.c                           |    2 +-
 drivers/acpi/acpi_pad.c                            |    2 +-
 drivers/acpi/processor_perflib.c                   |    1 +
 drivers/acpi/processor_throttling.c                |    5 +-
 drivers/base/cpu.c                                 |    3 +
 drivers/char/agp/amd64-agp.c                       |    2 +-
 drivers/char/agp/nvidia-agp.c                      |    1 +
 drivers/char/mem.c                                 |   18 -
 drivers/cpufreq/acpi-cpufreq.c                     |    8 +-
 drivers/cpufreq/amd-pstate-ut.c                    |    8 +-
 drivers/cpufreq/amd-pstate.c                       |   22 +-
 drivers/cpufreq/amd_freq_sensitivity.c             |    2 +-
 drivers/cpufreq/e_powersaver.c                     |    6 +-
 drivers/cpufreq/elanfreq.c                         |    1 -
 drivers/cpufreq/intel_pstate.c                     |  108 +-
 drivers/cpufreq/longhaul.c                         |   24 +-
 drivers/cpufreq/powernow-k7.c                      |   14 +-
 drivers/cpufreq/sc520_freq.c                       |    1 -
 drivers/crypto/ccp/sev-dev.c                       |    3 +-
 drivers/dma/ioat/dca.c                             |    2 +-
 drivers/edac/amd64_edac.c                          |   10 +-
 drivers/edac/ie31200_edac.c                        |    1 +
 drivers/edac/mce_amd.c                             |    1 +
 drivers/firmware/efi/libstub/Makefile              |    1 -
 drivers/firmware/efi/libstub/x86-5lvl.c            |    2 +-
 drivers/gpu/drm/i915/selftests/librapl.c           |    4 +-
 drivers/hwmon/fam15h_power.c                       |    6 +-
 drivers/hwmon/hwmon-vid.c                          |    4 +
 drivers/hwmon/k10temp.c                            |    2 +-
 drivers/i2c/busses/Kconfig                         |    2 +-
 drivers/i2c/busses/i2c-piix4.c                     |   18 +-
 drivers/idle/intel_idle.c                          |   37 +-
 drivers/misc/cs5535-mfgpt.c                        |    1 +
 drivers/mtd/nand/raw/cs553x_nand.c                 |    6 +-
 drivers/net/vmxnet3/vmxnet3_drv.c                  |    4 +
 drivers/platform/x86/amd/hsmp/acpi.c               |    4 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               |    2 +-
 drivers/platform/x86/amd/hsmp/plat.c               |    4 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c             |    2 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |    3 +-
 drivers/platform/x86/amd/pmc/pmc.c                 |    2 +-
 drivers/platform/x86/amd/pmf/core.c                |    2 +-
 drivers/platform/x86/intel/ifs/core.c              |    5 +-
 drivers/platform/x86/intel/ifs/load.c              |   21 +-
 drivers/platform/x86/intel/ifs/runtest.c           |   17 +-
 drivers/platform/x86/intel/pmc/cnp.c               |    7 +-
 drivers/platform/x86/intel/pmc/core.c              |   10 +-
 .../x86/intel/speed_select_if/isst_if_common.c     |   19 +-
 .../x86/intel/speed_select_if/isst_if_mbox_msr.c   |   15 +-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |    3 +-
 drivers/platform/x86/intel/tpmi_power_domains.c    |    4 +-
 drivers/platform/x86/intel/turbo_max_3.c           |    5 +-
 .../x86/intel/uncore-frequency/uncore-frequency.c  |   11 +-
 drivers/platform/x86/intel_ips.c                   |   36 +-
 drivers/pnp/quirks.c                               |    2 +-
 drivers/powercap/intel_rapl_common.c               |    1 +
 drivers/powercap/intel_rapl_msr.c                  |    7 +-
 drivers/ras/amd/atl/internal.h                     |    4 +-
 .../int340x_thermal/processor_thermal_device.c     |    3 +-
 drivers/thermal/intel/intel_hfi.c                  |   14 +-
 drivers/thermal/intel/intel_powerclamp.c           |    4 +-
 drivers/thermal/intel/intel_tcc_cooling.c          |    5 +-
 drivers/thermal/intel/therm_throt.c                |   10 +-
 drivers/thermal/intel/x86_pkg_temp_thermal.c       |    1 +
 drivers/video/fbdev/geode/display_gx.c             |    1 +
 drivers/video/fbdev/geode/gxfb_core.c              |    3 +-
 drivers/video/fbdev/geode/lxfb_ops.c               |   23 +-
 drivers/video/fbdev/geode/suspend_gx.c             |   10 +-
 drivers/video/fbdev/geode/video_gx.c               |   16 +-
 include/asm-generic/vmlinux.lds.h                  |    4 +-
 include/hyperv/hvgdk_mini.h                        |    2 +-
 include/linux/cpu.h                                |    2 +
 include/linux/io.h                                 |   21 +
 include/linux/panic.h                              |    2 -
 include/linux/sched.h                              |   15 +-
 scripts/gdb/linux/pgtable.py                       |    4 +-
 sound/soc/amd/acp/acp-rembrandt.c                  |    2 +-
 sound/soc/amd/acp/acp63.c                          |    2 +-
 sound/soc/amd/acp/acp70.c                          |    2 +-
 sound/soc/intel/avs/tgl.c                          |    2 +-
 sound/soc/sof/amd/acp.c                            |    2 +-
 .../arch/x86/include/asm/{amd-ibs.h => amd/ibs.h}  |    2 +-
 tools/arch/x86/include/asm/cpufeatures.h           |   24 +-
 tools/arch/x86/include/asm/inat.h                  |    6 +
 tools/arch/x86/kcpuid/cpuid.csv                    |  791 +++++----
 tools/arch/x86/kcpuid/kcpuid.c                     |  375 ++--
 tools/arch/x86/lib/insn.c                          |    7 +-
 tools/arch/x86/lib/x86-opcode-map.txt              |   56 +-
 tools/arch/x86/tools/gen-insn-attr-x86.awk         |    7 +
 tools/objtool/arch/x86/decode.c                    |    6 +-
 tools/perf/check-headers.sh                        |    2 +-
 tools/perf/util/amd-sample-raw.c                   |    2 +-
 tools/testing/selftests/kexec/Makefile             |    7 +
 tools/testing/selftests/kexec/test_kexec_jump.c    |   72 +
 tools/testing/selftests/kexec/test_kexec_jump.sh   |   42 +
 tools/testing/selftests/x86/Makefile               |    3 +-
 tools/testing/selftests/x86/apx.c                  |   10 +
 tools/testing/selftests/x86/lam.c                  |    9 +-
 tools/testing/selftests/x86/xstate.c               |    3 +-
 tools/testing/selftests/x86/xstate.h               |    2 +
 408 files changed, 9285 insertions(+), 7697 deletions(-)
 create mode 100644 Documentation/admin-guide/hw-vuln/old_microcode.rst
 create mode 100644 Documentation/arch/x86/amd-debugging.rst
 create mode 100644 Documentation/arch/x86/resume.svg
 create mode 100644 Documentation/arch/x86/suspend.svg
 delete mode 100644 arch/x86/boot/compressed/pgtable.h
 create mode 100644 arch/x86/boot/compressed/sev-handle-vc.c
 create mode 100644 arch/x86/boot/startup/Makefile
 rename drivers/firmware/efi/libstub/x86-mixed.S => arch/x86/boot/startup/efi-mixed.S (100%)
 create mode 100644 arch/x86/boot/startup/gdt_idt.c
 rename arch/x86/boot/{compressed => startup}/la57toggle.S (99%)
 create mode 100644 arch/x86/boot/startup/map_kernel.c
 rename arch/x86/{coco/sev/shared.c => boot/startup/sev-shared.c} (52%)
 create mode 100644 arch/x86/boot/startup/sev-startup.c
 rename arch/x86/{mm/mem_encrypt_identity.c => boot/startup/sme.c} (96%)
 create mode 100644 arch/x86/coco/sev/sev-nmi.c
 create mode 100644 arch/x86/coco/sev/vc-handle.c
 create mode 100644 arch/x86/coco/sev/vc-shared.c
 create mode 100644 arch/x86/include/asm/amd/fch.h
 rename arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h} (100%)
 rename arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} (98%)
 rename arch/x86/include/asm/{amd_nb.h => amd/nb.h} (98%)
 rename arch/x86/include/asm/{amd_node.h => amd/node.h} (100%)
 create mode 100644 arch/x86/include/asm/sev-internal.h
 create mode 100644 arch/x86/kernel/cpu/amd_cache_disable.c
 create mode 100644 arch/x86/kernel/cpu/cpuid_0x2_table.c
 create mode 100644 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
 delete mode 100644 arch/x86/mm/numa_32.c
 delete mode 100644 arch/x86/mm/numa_64.c
 delete mode 100644 arch/x86/mm/numa_internal.h
 rename tools/arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} (99%)
 create mode 100644 tools/testing/selftests/kexec/test_kexec_jump.c
 create mode 100755 tools/testing/selftests/kexec/test_kexec_jump.sh
 create mode 100644 tools/testing/selftests/x86/apx.c
