Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805CF6A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432470; cv=none; b=XqPhuN/c0MCfyvv8G2QiGl2Lvc2a6moq6rPJyFKPjvq7A8eMfLEsUW2DuMy0FBUxaAow+F/3DVnr0dsWoZZ1z8TGpzyG08kFAwwbEYS1KiDJGSjJtQfyzjE9+Z4KQO8/f0wF81Sx8beaioFVQXPFTsUMlcJy/fDNVu+a9/VULkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432470; c=relaxed/simple;
	bh=bOZFzxbQtHkb0r7mcnhiWLBBm6/fYdfcyRz1ryVlMeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbazd0hg5juR/Nu/Kv3TT9ino61wFwXY16jkZNest/pl0Mikgwno0FuAM0ZcSKlsfEyvxj5vEbr3iZtKAOhKMalR1xNC0n9FUPdeUkQmBS3GN0xu9N6XAvHLlXJSOO/4tkv504jY9pRtNQjD0SImoYLDS+mvblTCynROadjRpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h40vWP+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h40vWP+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB645C4CEEB;
	Wed, 28 May 2025 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748432469;
	bh=bOZFzxbQtHkb0r7mcnhiWLBBm6/fYdfcyRz1ryVlMeg=;
	h=Date:From:To:Cc:Subject:From;
	b=h40vWP+3tqVYFh//QWZrsNBeSrBoVaYL3wWWIQoPqd4N68bY7PsIm9BB3+lDnyRsa
	 uEKBJEM6z1dG0dpZkH44E05W7r09wTX9ZZLeOeiOEBL6o+r4Dlxy0O6OhbLWfXcwnG
	 MWeD5Zi3uDQ4D6RH56aP65Z2CHts0+PTRfrP6zeKKpnfJR/gYgIxcBthc7BjXnNmJP
	 4cBhUraMCOpNBAbTi6Y5SqO6imyW+f+aZlsj60JFT+I5PZ/RtZFu1Z5+oeOG0NwatO
	 Hr5MC70jKnAcj2P6Q3JyrQo95c6dlhVkD0TYi8RVB5bisdXlApnKwtF94OcJw4ep8V
	 J5NQZHxQGdw0A==
Date: Wed, 28 May 2025 12:41:04 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 updates for 6.16
Message-ID: <20250528114103.GA27965@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Linus,

Please pull these arm64 changes for 6.16. As per usual, the summary is
included in the tag, but the headline feature is the re-enablement of
support for Arm's Scalable Matrix Extension (SME) thanks to a bumper
crop of fixes from Mark Rutland. If matrices aren't your thing, then
Ryan's page-table optimisation work is much more interesting.

There are two logistical things to be aware of:

  1. I've merged in for-next/fixes because the work to prevent BSS
     exports being used in the PI code depended on it. The branch
     appears as the base commit since you've pulled it already in 6.15.

  2. There's a trivial conflict in arch/arm64/kernel/image-vars.h with
     your tree due to a fix that landed in 6.15 via the KVM tree. The
     resolution is to take the new hunk, dropping the part guarded by
     CONFIG_CAVIUM_ERRATUM_27456. My resolution is below.

Any problems, please yell.

Cheers,

Will

--->8

diff --cc arch/arm64/kernel/image-vars.h
index 2004b4f41ade,c5266430284b..000000000000
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@@ -36,37 -42,34 +42,30 @@@ PROVIDE(__pi___memcpy			= __pi_memcpy)
  PROVIDE(__pi___memmove			= __pi_memmove);
  PROVIDE(__pi___memset			= __pi_memset);
  
- PROVIDE(__pi_id_aa64isar1_override	= id_aa64isar1_override);
- PROVIDE(__pi_id_aa64isar2_override	= id_aa64isar2_override);
- PROVIDE(__pi_id_aa64mmfr0_override	= id_aa64mmfr0_override);
- PROVIDE(__pi_id_aa64mmfr1_override	= id_aa64mmfr1_override);
- PROVIDE(__pi_id_aa64mmfr2_override	= id_aa64mmfr2_override);
- PROVIDE(__pi_id_aa64pfr0_override	= id_aa64pfr0_override);
- PROVIDE(__pi_id_aa64pfr1_override	= id_aa64pfr1_override);
- PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
- PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
- PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
- PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
- PROVIDE(__pi__ctype			= _ctype);
- PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
+ PI_EXPORT_SYM(id_aa64isar1_override);
+ PI_EXPORT_SYM(id_aa64isar2_override);
+ PI_EXPORT_SYM(id_aa64mmfr0_override);
+ PI_EXPORT_SYM(id_aa64mmfr1_override);
+ PI_EXPORT_SYM(id_aa64mmfr2_override);
+ PI_EXPORT_SYM(id_aa64pfr0_override);
+ PI_EXPORT_SYM(id_aa64pfr1_override);
+ PI_EXPORT_SYM(id_aa64smfr0_override);
+ PI_EXPORT_SYM(id_aa64zfr0_override);
+ PI_EXPORT_SYM(arm64_sw_feature_override);
+ PI_EXPORT_SYM(arm64_use_ng_mappings);
 -#ifdef CONFIG_CAVIUM_ERRATUM_27456
 -PI_EXPORT_SYM(cavium_erratum_27456_cpus);
 -PI_EXPORT_SYM(is_midr_in_range_list);
 -#endif
+ PI_EXPORT_SYM(_ctype);
  
- PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
- PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
- PROVIDE(__pi_init_pg_dir		= init_pg_dir);
- PROVIDE(__pi_init_pg_end		= init_pg_end);
- PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
+ PI_EXPORT_SYM(swapper_pg_dir);
  
- PROVIDE(__pi__text			= _text);
- PROVIDE(__pi__stext               	= _stext);
- PROVIDE(__pi__etext               	= _etext);
- PROVIDE(__pi___start_rodata       	= __start_rodata);
- PROVIDE(__pi___inittext_begin     	= __inittext_begin);
- PROVIDE(__pi___inittext_end       	= __inittext_end);
- PROVIDE(__pi___initdata_begin     	= __initdata_begin);
- PROVIDE(__pi___initdata_end       	= __initdata_end);
- PROVIDE(__pi__data                	= _data);
- PROVIDE(__pi___bss_start		= __bss_start);
- PROVIDE(__pi__end			= _end);
+ PI_EXPORT_SYM(_text);
+ PI_EXPORT_SYM(_stext);
+ PI_EXPORT_SYM(_etext);
+ PI_EXPORT_SYM(__start_rodata);
+ PI_EXPORT_SYM(__inittext_begin);
+ PI_EXPORT_SYM(__inittext_end);
+ PI_EXPORT_SYM(__initdata_begin);
+ PI_EXPORT_SYM(__initdata_end);
+ PI_EXPORT_SYM(_data);
  
  #ifdef CONFIG_KVM
  
--->8

The following changes since commit 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552:

  arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation (2025-05-06 11:43:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 217e3cbba3d6613bee9ac33ddc330f8676eb9eca:

  Merge branch 'for-next/vdso' into for-next/core (2025-05-27 12:26:54 +0100)

----------------------------------------------------------------
arm64 updates for 6.16

ACPI, EFI and PSCI:
 - Decouple Arm's "Software Delegated Exception Interface" (SDEI)
   support from the ACPI GHES code so that it can be used by platforms
   booted with device-tree.

 - Remove unnecessary per-CPU tracking of the FPSIMD state across EFI
   runtime calls.

 - Fix a node refcount imbalance in the PSCI device-tree code.

CPU Features:
 - Ensure register sanitisation is applied to fields in ID_AA64MMFR4.

 - Expose AIDR_EL1 to userspace via sysfs, primarily so that KVM guests
   can reliably query the underlying CPU types from the VMM.

 - Re-enabling of SME support (CONFIG_ARM64_SME) as a result of fixes
   to our context-switching, signal handling and ptrace code.

Entry code:
 - Hook up TIF_NEED_RESCHED_LAZY so that CONFIG_PREEMPT_LAZY can be
   selected.

Memory management:
 - Prevent BSS exports from being used by the early PI code.

 - Propagate level and stride information to the low-level TLB
   invalidation routines when operating on hugetlb entries.

 - Use the page-table contiguous hint for vmap() mappings with
   VM_ALLOW_HUGE_VMAP where possible.

 - Optimise vmalloc()/vmap() page-table updates to use "lazy MMU mode"
   and hook this up on arm64 so that the trailing DSB (used to publish
   the updates to the hardware walker) can be deferred until the end of
   the mapping operation.

 - Extend mmap() randomisation for 52-bit virtual addresses (on par with
   48-bit addressing) and remove limited support for randomisation of
   the linear map.

Perf and PMUs:
 - Add support for probing the CMN-S3 driver using ACPI.

 - Minor driver fixes to the CMN, Arm-NI and amlogic PMU drivers.

Selftests:
 - Fix FPSIMD and SME tests to align with the freshly re-enabled SME
   support.

 - Fix default setting of the OUTPUT variable so that tests are
   installed in the right location.

vDSO:
 - Replace raw counter access from inline assembly code with a call to
   the the __arch_counter_get_cntvct() helper function.

Miscellaneous:
 - Add some missing header inclusions to the CCA headers.

 - Rework rendering of /proc/cpuinfo to follow the x86-approach and
   avoid repeated buffer expansion (the user-visible format remains
   identical).

 - Remove redundant selection of CONFIG_CRC32

 - Extend early error message when failing to map the device-tree blob.

----------------------------------------------------------------
Anand Moon (1):
      perf/amlogic: Replace smp_processor_id() with raw_smp_processor_id() in meson_ddr_pmu_create()

Anshuman Khandual (1):
      arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1

Ard Biesheuvel (5):
      arm64/fpsimd: Avoid unnecessary per-CPU buffers for EFI runtime calls
      arm64/mm: Remove randomization of the linear map
      arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_ namespace
      arm64/boot: Move global CPU override variables out of BSS
      arm64/boot: Disallow BSS exports to startup code

Bartosz Szczepanek (1):
      arm64: Extend pr_crit message on invalid FDT

Ben Horgan (1):
      arm64: Update comment regarding values in __boot_cpu_mode

Breno Leitao (1):
      arm64: vdso: Use __arch_counter_get_cntvct()

Dev Jain (1):
      arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings

Eric Biggers (1):
      arm64: Kconfig: remove unnecessary selection of CRC32

Gavin Shan (1):
      arm64: mm: Drop redundant check in pmd_trans_huge()

Hongbo Yao (2):
      perf: arm-ni: Unregister PMUs on probe failure
      perf: arm-ni: Fix missing platform_set_drvdata()

Huang Yiwei (1):
      firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES

Jason Gunthorpe (1):
      arm64: Add missing includes for mem_encrypt

Kornel Dulęba (1):
      arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX

Krzysztof Kozlowski (1):
      perf: Do not enable by default during compile testing

Mark Brown (2):
      arm64/fpsimd: Discard stale CPU state when handling SME traps
      arm64/fpsimd: Don't corrupt FPMR when streaming mode changes

Mark Rutland (38):
      arm64/fpsimd: Avoid RES0 bits in the SME trap handler
      arm64/fpsimd: Remove unused fpsimd_force_sync_to_sve()
      arm64/fpsimd: Remove redundant SVE trap manipulation
      arm64/fpsimd: Remove opportunistic freeing of SME state
      arm64/fpsimd: Avoid clobbering kernel FPSIMD state with SMSTOP
      arm64/fpsimd: Reset FPMR upon exec()
      arm64/fpsimd: Fix merging of FPSIMD state during signal return
      arm64/fpsimd: Add fpsimd_save_and_flush_current_state()
      arm64/fpsimd: signal32: Always save+flush state early
      arm64/fpsimd: signal: Always save+flush state early
      arm64/fpsimd: signal: Simplify preserve_tpidr2_context()
      arm64/fpsimd: signal: Clear TPIDR2 when delivering signals
      arm64: enable PREEMPT_LAZY
      arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
      arm64/fpsimd: Do not discard modified SVE state
      arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
      arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
      arm64/fpsimd: signal: Consistently read FPSIMD context
      arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE
      arm64/fpsimd: Clarify sve_sync_*() functions
      arm64/fpsimd: Factor out {sve,sme}_state_size() helpers
      arm64/fpsimd: Add task_smstop_sm()
      arm64/fpsimd: signal: Use SMSTOP behaviour in setup_return()
      arm64/fpsimd: Remove redundant task->mm check
      arm64/fpsimd: Consistently preserve FPSIMD state during clone()
      arm64/fpsimd: Clear PSTATE.SM during clone()
      arm64/fpsimd: Make clone() compatible with ZA lazy saving
      arm64/fpsimd: ptrace/prctl: Ensure VL changes do not resurrect stale data
      arm64/fpsimd: ptrace/prctl: Ensure VL changes leave task in a valid state
      arm64/fpsimd: ptrace: Save task state before generating SVE header
      arm64/fpsimd: ptrace: Do not present register data for inactive mode
      arm64/fpsimd: ptrace: Mandate SVE payload for streaming-mode state
      arm64/fpsimd: ptrace: Gracefully handle errors
      arm64/fpsimd: Allow CONFIG_ARM64_SME to be selected
      kselftest/arm64: fp-ptrace: Fix expected FPMR value when PSTATE.SM is changed
      kselftest/arm64: tpidr2: Adjust to new clone() behaviour
      kselftest/arm64: fp-ptrace: Adjust to new VL change behaviour
      kselftest/arm64: fp-ptrace: Adjust to new inactive mode behaviour

Miaoqian Lin (1):
      firmware: psci: Fix refcount leak in psci_dt_init

Oliver Upton (1):
      arm64: Expose AIDR_EL1 via sysfs

Rob Herring (Arm) (1):
      arm64: el2_setup.h: Make __init_el2_fgt labels consistent, again

Robin Murphy (4):
      perf/arm-cmn: Remove CMN-600 DTC domain special case
      perf/arm-cmn: Fix REQ2/SNP2 mixup
      perf/arm-cmn: Initialise cmn->cpu earlier
      perf/arm-cmn: Add CMN S3 ACPI binding

Ryan Roberts (13):
      arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
      arm64: hugetlb: Refine tlb maintenance scope
      mm/page_table_check: Batch-check pmds/puds just like ptes
      arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
      arm64: hugetlb: Use __set_ptes_anysz() and __ptep_get_and_clear_anysz()
      arm64/mm: Hoist barriers out of set_ptes_anysz() loop
      mm/vmalloc: Warn on improper use of vunmap_range()
      mm/vmalloc: Gracefully unmap huge ptes
      arm64/mm: Support huge pte-mapped pages in vmap
      mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
      arm64/mm: Batch barriers when updating kernel mappings
      arm64/mm: Disable barrier batching in interrupt contexts
      arm64/mm: Permit lazy_mmu_mode to be nested

Will Deacon (12):
      Merge branch 'for-next/acpi' into for-next/core
      Merge branch 'for-next/cpufeature' into for-next/core
      Merge branch 'for-next/efi' into for-next/core
      Merge branch 'for-next/entry' into for-next/core
      Merge branch 'for-next/fixes' into for-next/core
      Merge branch 'for-next/misc' into for-next/core
      Merge branch 'for-next/mm' into for-next/core
      Merge branch 'for-next/perf' into for-next/core
      Merge branch 'for-next/psci' into for-next/core
      Merge branch 'for-next/selftests' into for-next/core
      Merge branch 'for-next/sme-fixes' into for-next/core
      Merge branch 'for-next/vdso' into for-next/core

Ye Bin (1):
      arm64/cpuinfo: only show one cpu's info in c_show()

Yicong Yang (2):
      arm64/cpufeature: Add missing id_aa64mmfr4 feature reg update
      arm64: cputype: Add cputype definition for HIP12

tanze (1):
      kselftest/arm64: Set default OUTPUT path when undefined

 Documentation/ABI/testing/sysfs-devices-system-cpu |   1 +
 Documentation/arch/arm64/cpu-feature-registers.rst |  13 +-
 Documentation/arch/arm64/sme.rst                   |   8 +-
 arch/arm64/Kconfig                                 |   9 +-
 arch/arm64/include/asm/cpu.h                       |   1 +
 arch/arm64/include/asm/cputype.h                   |   2 +
 arch/arm64/include/asm/el2_setup.h                 |  10 +-
 arch/arm64/include/asm/esr.h                       |  12 +-
 arch/arm64/include/asm/fpsimd.h                    |  64 +++-
 arch/arm64/include/asm/hugetlb.h                   |  41 ++-
 arch/arm64/include/asm/mem_encrypt.h               |   2 +
 arch/arm64/include/asm/pgtable.h                   | 238 +++++++++----
 arch/arm64/include/asm/rsi_cmds.h                  |   2 +
 arch/arm64/include/asm/thread_info.h               |  18 +-
 arch/arm64/include/asm/vdso/gettimeofday.h         |  22 +-
 arch/arm64/include/asm/virt.h                      |   3 +-
 arch/arm64/include/asm/vmalloc.h                   |  45 +++
 arch/arm64/kernel/asm-offsets.c                    |   2 +
 arch/arm64/kernel/cpufeature.c                     |  22 +-
 arch/arm64/kernel/cpuinfo.c                        | 108 +++---
 arch/arm64/kernel/efi.c                            |   4 +-
 arch/arm64/kernel/entry-common.c                   |  48 ++-
 arch/arm64/kernel/fpsimd.c                         | 380 +++++++++------------
 arch/arm64/kernel/head.S                           |   6 +-
 arch/arm64/kernel/image-vars.h                     |  61 ++--
 arch/arm64/kernel/kaslr.c                          |   2 -
 arch/arm64/kernel/pi/kaslr_early.c                 |   4 -
 arch/arm64/kernel/pi/pi.h                          |   1 +
 arch/arm64/kernel/process.c                        | 126 ++++---
 arch/arm64/kernel/ptrace.c                         | 137 ++++----
 arch/arm64/kernel/setup.c                          |  10 +-
 arch/arm64/kernel/signal.c                         | 149 +++-----
 arch/arm64/kernel/signal32.c                       |  11 +-
 arch/arm64/kernel/vmlinux.lds.S                    |  10 +-
 arch/arm64/mm/hugetlbpage.c                        |  73 ++--
 arch/arm64/mm/init.c                               |  20 --
 arch/arm64/mm/pageattr.c                           |   6 +-
 arch/arm64/mm/proc.S                               |  19 +-
 drivers/acpi/apei/Kconfig                          |   1 +
 drivers/acpi/apei/ghes.c                           |   2 +-
 drivers/firmware/Kconfig                           |   1 -
 drivers/firmware/arm_sdei.c                        |  11 +-
 drivers/firmware/psci/psci.c                       |   4 +-
 drivers/perf/Kconfig                               |   2 +-
 drivers/perf/amlogic/meson_ddr_pmu_core.c          |   2 +-
 drivers/perf/arm-cmn.c                             |  18 +-
 drivers/perf/arm-ni.c                              |  40 ++-
 include/linux/arm_sdei.h                           |   4 +-
 include/linux/page_table_check.h                   |  30 +-
 include/linux/vmalloc.h                            |   8 +
 mm/page_table_check.c                              |  34 +-
 mm/vmalloc.c                                       |  40 ++-
 tools/testing/selftests/arm64/Makefile             |   2 +
 tools/testing/selftests/arm64/abi/tpidr2.c         |  14 +-
 tools/testing/selftests/arm64/fp/fp-ptrace.c       |  62 ++--
 55 files changed, 1067 insertions(+), 898 deletions(-)
