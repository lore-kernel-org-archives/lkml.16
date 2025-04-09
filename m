Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF1143748
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230558; cv=none; b=L7jphDNnkOd/QIBTEPTJgnplFBeTMyTS4g8X5mPKECvmFIqBsbcufkoswv2ni3arD4+npMpjBOTXPZ+6iUaQycnkaGZXKlM/cdkT6fQmo9oOWNj36IRKHxYOO9LaJQAq0v32+orHx1BIOMNsD60X2s8ex9t3MI4rI63OCpFmHMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230558; c=relaxed/simple;
	bh=F8Wb/KsqiSNZjGWf7HosHWFlgdoJ5MpFGfZ9wtQul00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWkfgtEh7AIU5Z/JXLA1bxDdOCE9ABukdlYIiw3nrj6EYo5xOhQtJaOWcp18xdE7oxUFqFpMpqEb+honS5WEZZrfFK1e4x3IAMxUDP2bafSijuRNfVIW6clokNjZ6C253CNnXBqR/kfjvaBrqFAWphP7orFKI8Bf0lq6WNh2wco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLXHZYLF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLXHZYLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81942C4CEE2;
	Wed,  9 Apr 2025 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230556;
	bh=F8Wb/KsqiSNZjGWf7HosHWFlgdoJ5MpFGfZ9wtQul00=;
	h=From:To:Cc:Subject:Date:From;
	b=aLXHZYLFmabsNs8cQdnHsn/2rb39iKqIrgRSgcd3h9vz6NtcFyQX9guzrboYY7e0D
	 FbcdfND5VhZZH1B8CJwVtV3iwTSBKw09ZTk3XEFCAhTfsTSdyAYGl0OrVmQXAvW+di
	 sUExRu3LkYr/7CUSUBbucqnblQe2UGEZfq49CtDa6YyTTKvGJaJXbr9ub7GTK569cq
	 Q/V7QTEHzZ+MhglFbCppkJVkv/LCHSHzHa//gqfX02WlFAr84QHHyA9xTgyNlUdLYK
	 ZZ73eOF29FuGieyW93RkHN8AGFbnvsf0vkS9hQuEEvr/u69VjinlyipJ6m4ESl/uZU
	 eyQ/DOcp0iLMA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 00/20] x86 MSR in-kernel API type cleanup and rename
Date: Wed,  9 Apr 2025 22:28:47 +0200
Message-ID: <20250409202907.3419480-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H. Peter Anvin recently observed that the rdmsrl*()/wrmsrl*() APIs
are historic misnomers and are actively misleading: the 'l' suffix
suggests a 32-bit nature, while all these APIs are fixed 64-bit,
for which we use the 'q' suffix.

Make the names reflect that, by renaming them to rdmsrq*()/wrmsrq*().

Also clean up the types to u32 and u64 in <asm/msr.h> and affected code,
from a hodgepodge of equivalent integer types, to indicate that these
are all hardware ABI derived types.

The Git tree with these commits can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/msr

Thanks,

	Ingo

==================>
Ingo Molnar (20):
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

 arch/x86/coco/sev/core.c                           |   2 +-
 arch/x86/events/amd/brs.c                          |   8 +-
 arch/x86/events/amd/core.c                         |  12 +--
 arch/x86/events/amd/ibs.c                          |  26 ++---
 arch/x86/events/amd/lbr.c                          |  20 ++--
 arch/x86/events/amd/power.c                        |  10 +-
 arch/x86/events/amd/uncore.c                       |  12 +--
 arch/x86/events/core.c                             |  42 ++++----
 arch/x86/events/intel/core.c                       |  66 ++++++-------
 arch/x86/events/intel/cstate.c                     |   2 +-
 arch/x86/events/intel/ds.c                         |  10 +-
 arch/x86/events/intel/knc.c                        |  16 +--
 arch/x86/events/intel/lbr.c                        |  44 ++++-----
 arch/x86/events/intel/p4.c                         |  24 ++---
 arch/x86/events/intel/p6.c                         |  12 +--
 arch/x86/events/intel/pt.c                         |  32 +++---
 arch/x86/events/intel/uncore.c                     |   2 +-
 arch/x86/events/intel/uncore_discovery.c           |  10 +-
 arch/x86/events/intel/uncore_nhmex.c               |  70 ++++++-------
 arch/x86/events/intel/uncore_snb.c                 |  42 ++++----
 arch/x86/events/intel/uncore_snbep.c               |  50 +++++-----
 arch/x86/events/msr.c                              |   2 +-
 arch/x86/events/perf_event.h                       |  26 ++---
 arch/x86/events/probe.c                            |   2 +-
 arch/x86/events/rapl.c                             |   8 +-
 arch/x86/events/zhaoxin/core.c                     |  16 +--
 arch/x86/hyperv/hv_apic.c                          |   4 +-
 arch/x86/hyperv/hv_init.c                          |  66 ++++++-------
 arch/x86/hyperv/hv_spinlock.c                      |   6 +-
 arch/x86/hyperv/ivm.c                              |   2 +-
 arch/x86/include/asm/apic.h                        |   8 +-
 arch/x86/include/asm/debugreg.h                    |   4 +-
 arch/x86/include/asm/fsgsbase.h                    |   4 +-
 arch/x86/include/asm/kvm_host.h                    |   2 +-
 arch/x86/include/asm/microcode.h                   |   2 +-
 arch/x86/include/asm/msr-index.h                   |  12 +--
 arch/x86/include/asm/msr.h                         |  73 +++++++-------
 arch/x86/include/asm/paravirt.h                    |   8 +-
 arch/x86/include/asm/spec-ctrl.h                   |   2 +-
 arch/x86/kernel/acpi/cppc.c                        |   8 +-
 arch/x86/kernel/amd_nb.c                           |   2 +-
 arch/x86/kernel/apic/apic.c                        |  16 +--
 arch/x86/kernel/apic/apic_numachip.c               |   6 +-
 arch/x86/kernel/cet.c                              |   2 +-
 arch/x86/kernel/cpu/amd.c                          |  28 +++---
 arch/x86/kernel/cpu/aperfmperf.c                   |  28 +++---
 arch/x86/kernel/cpu/bugs.c                         |  24 ++---
 arch/x86/kernel/cpu/bus_lock.c                     |  18 ++--
 arch/x86/kernel/cpu/common.c                       |  68 ++++++-------
 arch/x86/kernel/cpu/feat_ctl.c                     |   4 +-
 arch/x86/kernel/cpu/hygon.c                        |   6 +-
 arch/x86/kernel/cpu/intel.c                        |  10 +-
 arch/x86/kernel/cpu/intel_epb.c                    |  12 +--
 arch/x86/kernel/cpu/mce/amd.c                      |  22 ++---
 arch/x86/kernel/cpu/mce/core.c                     |  58 +++++------
 arch/x86/kernel/cpu/mce/inject.c                   |  32 +++---
 arch/x86/kernel/cpu/mce/intel.c                    |  32 +++---
 arch/x86/kernel/cpu/mce/internal.h                 |   2 +-
 arch/x86/kernel/cpu/microcode/amd.c                |   2 +-
 arch/x86/kernel/cpu/microcode/intel.c              |   2 +-
 arch/x86/kernel/cpu/mshyperv.c                     |  12 +--
 arch/x86/kernel/cpu/resctrl/core.c                 |  10 +-
 arch/x86/kernel/cpu/resctrl/monitor.c              |   2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c          |   2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             |   6 +-
 arch/x86/kernel/cpu/sgx/main.c                     |   2 +-
 arch/x86/kernel/cpu/topology.c                     |   2 +-
 arch/x86/kernel/cpu/topology_amd.c                 |   4 +-
 arch/x86/kernel/cpu/tsx.c                          |  20 ++--
 arch/x86/kernel/cpu/umwait.c                       |   2 +-
 arch/x86/kernel/fpu/core.c                         |   2 +-
 arch/x86/kernel/fpu/xstate.c                       |  10 +-
 arch/x86/kernel/fpu/xstate.h                       |   2 +-
 arch/x86/kernel/fred.c                             |  20 ++--
 arch/x86/kernel/hpet.c                             |   2 +-
 arch/x86/kernel/kvm.c                              |  28 +++---
 arch/x86/kernel/kvmclock.c                         |   4 +-
 arch/x86/kernel/mmconf-fam10h_64.c                 |   8 +-
 arch/x86/kernel/process.c                          |  16 +--
 arch/x86/kernel/process_64.c                       |  20 ++--
 arch/x86/kernel/reboot_fixups_32.c                 |   2 +-
 arch/x86/kernel/shstk.c                            |  18 ++--
 arch/x86/kernel/traps.c                            |  10 +-
 arch/x86/kernel/tsc.c                              |   2 +-
 arch/x86/kernel/tsc_sync.c                         |  14 +--
 arch/x86/kvm/svm/avic.c                            |   2 +-
 arch/x86/kvm/svm/sev.c                             |   2 +-
 arch/x86/kvm/svm/svm.c                             |  16 +--
 arch/x86/kvm/vmx/nested.c                          |   4 +-
 arch/x86/kvm/vmx/pmu_intel.c                       |   4 +-
 arch/x86/kvm/vmx/sgx.c                             |   8 +-
 arch/x86/kvm/vmx/vmx.c                             |  66 ++++++-------
 arch/x86/kvm/x86.c                                 |  38 ++++----
 arch/x86/lib/insn-eval.c                           |   6 +-
 arch/x86/lib/msr-smp.c                             |  16 +--
 arch/x86/lib/msr.c                                 |  12 +--
 arch/x86/mm/pat/memtype.c                          |   4 +-
 arch/x86/mm/tlb.c                                  |   2 +-
 arch/x86/pci/amd_bus.c                             |  10 +-
 arch/x86/platform/olpc/olpc-xo1-rtc.c              |   6 +-
 arch/x86/platform/olpc/olpc-xo1-sci.c              |   2 +-
 arch/x86/power/cpu.c                               |  26 ++---
 arch/x86/realmode/init.c                           |   2 +-
 arch/x86/virt/svm/sev.c                            |  20 ++--
 arch/x86/xen/suspend.c                             |   6 +-
 drivers/acpi/acpi_extlog.c                         |   2 +-
 drivers/acpi/acpi_lpit.c                           |   2 +-
 drivers/cpufreq/acpi-cpufreq.c                     |   8 +-
 drivers/cpufreq/amd-pstate-ut.c                    |   6 +-
 drivers/cpufreq/amd-pstate.c                       |  22 ++---
 drivers/cpufreq/amd_freq_sensitivity.c             |   2 +-
 drivers/cpufreq/e_powersaver.c                     |   6 +-
 drivers/cpufreq/intel_pstate.c                     | 108 ++++++++++-----------
 drivers/cpufreq/longhaul.c                         |  24 ++---
 drivers/cpufreq/powernow-k7.c                      |  14 +--
 drivers/crypto/ccp/sev-dev.c                       |   2 +-
 drivers/edac/amd64_edac.c                          |   6 +-
 drivers/gpu/drm/i915/selftests/librapl.c           |   4 +-
 drivers/hwmon/fam15h_power.c                       |   6 +-
 drivers/idle/intel_idle.c                          |  34 +++----
 drivers/mtd/nand/raw/cs553x_nand.c                 |   6 +-
 drivers/platform/x86/intel/ifs/core.c              |   4 +-
 drivers/platform/x86/intel/ifs/load.c              |  20 ++--
 drivers/platform/x86/intel/ifs/runtest.c           |  16 +--
 drivers/platform/x86/intel/pmc/cnp.c               |   6 +-
 drivers/platform/x86/intel/pmc/core.c              |   8 +-
 .../x86/intel/speed_select_if/isst_if_common.c     |  18 ++--
 .../x86/intel/speed_select_if/isst_if_mbox_msr.c   |  14 +--
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |   2 +-
 drivers/platform/x86/intel/tpmi_power_domains.c    |   4 +-
 drivers/platform/x86/intel/turbo_max_3.c           |   4 +-
 .../x86/intel/uncore-frequency/uncore-frequency.c  |  10 +-
 drivers/platform/x86/intel_ips.c                   |  36 +++----
 drivers/powercap/intel_rapl_msr.c                  |   6 +-
 .../int340x_thermal/processor_thermal_device.c     |   2 +-
 drivers/thermal/intel/intel_hfi.c                  |  14 +--
 drivers/thermal/intel/intel_powerclamp.c           |   4 +-
 drivers/thermal/intel/intel_tcc_cooling.c          |   4 +-
 drivers/thermal/intel/therm_throt.c                |  10 +-
 drivers/video/fbdev/geode/gxfb_core.c              |   2 +-
 drivers/video/fbdev/geode/lxfb_ops.c               |  22 ++---
 drivers/video/fbdev/geode/suspend_gx.c             |  10 +-
 drivers/video/fbdev/geode/video_gx.c               |  16 +--
 include/hyperv/hvgdk_mini.h                        |   2 +-
 144 files changed, 1049 insertions(+), 1050 deletions(-)

-- 
2.45.2

