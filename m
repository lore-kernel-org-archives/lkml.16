Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CC1279784
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716567; cv=none; b=CmuJ3LuPpFL53kaqbFu2kt7lSPKI5ELRWHz8boZd2IHfAyaovDDnQcyiwPVQN7P+Q+Q0hWdfRXOMipi0aW8TptArbfn3yP0RJrO79Vvt3x3aDJrtHjp8QK0p3Ulzgzhiu3VD8OQzXs0DHD8VtmIe+WdH5WEgXT2EF6WItxXmHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716567; c=relaxed/simple;
	bh=2mAnqkYc18lcfHBEKfiWQF6DjaHGoB11EEjw87oDQTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZLSnoVjstitDfm1mjsmAIbR/XLLTzyN9GnqDCu4FPnxB6ShcipRFyHWKrVThanPD5n+H/cJ0o82LFlLOe2iSxZglGhj2EVGizQbf+LGOEDl+Bqc2NAqycL/A5TWdKb9KDn29pCBUKWTBWFh//2+J5HEJqO7ymkQu3fOoMW5OB7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bk8RhHLd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qI+A0EvZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bk8RhHLd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qI+A0EvZ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2kf3EExoa/498HOrGmzKtVhO6kUQLl9SRNl4la3+N8=;
	b=bk8RhHLdGlDctAVslXoOwRg1FhbFzWYivhNt4cbrHqRLeRAOIRBYtb3yG5vUucUlBK0uHk
	duDqSFzKcyUn3YfGp6ZfkZ2dMh+60aLG+Fzz9cI/HoJykzHqw7YE3n4w2m7M+Re9aQi48J
	oTBwna2ixciE1Qz5ZR2ZoCFtrM7lKqJAEN2+F/V6B/1qhT7paSV5ZiX1Bykg+PrbSqSt5C
	3eh6/esiUmmjFfRQBVyvuR4aVwhLfECmM+iWrbSB4G05EmGwnzCkFCUTxuRERVBkEK+59S
	8jXZ24YDarCYPkkhuLv+GRLExxxtpLpswqoD9Df/JgLHuqmfhDlZrh+yK7Tf2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2kf3EExoa/498HOrGmzKtVhO6kUQLl9SRNl4la3+N8=;
	b=qI+A0EvZnUM3acoH3EustLRG7ldyjw+gxtNCwBrBbEatCGE4aWz+g+qz4RMqSwu2itJ7y/
	vmcOc8DZA/u46GCw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 0/9] x86/cpuid: Headers cleanup
Date: Thu,  8 May 2025 17:02:29 +0200
Message-ID: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This is a CPUID headers cleanup series, on top of tip:x86/cpu.  It is a
precursor for the upcoming v2 of the CPUID parser:

    [PATCH v1 00/26] x86: Introduce centralized CPUID model
    https://lore.kernel.org/lkml/20250506050437.10264-1-darwi@linutronix.de

as suggested by Ingo here:

    https://lore.kernel.org/lkml/aBnSgu_JyEi8fvog@gmail.com

* Summary:

The current CPUID header structure is:

    include/asm/
    ├── cpuid
    │   ├── api.h
    │   ├── leaf_0x2_api.h
    │   └── types.h
    └── cpuid.h

Simplify it into:

    include/asm/
    ├── api.h
    └── types.h

Standardize the CPUID header namespace by enforcing a "cpuid_" prefix for
all exported symbols.  That is:

    have_cpuid_p()		➤	cpuid_feature()
    hypervisor_cpuid_base()	➤	cpuid_hypervisor_base()
    native_cpuid()		➤	cpuid_native()
    native_cpuid_REG()		➤	cpuid_native_REG()

Also rename:

    cpuid_get_leaf_0x2_regs()	➤	cpuid_leaf_0x2()

for consistency with the other <asm/cpuid/api.h> accessors that return
full CPUID register output; i.e., cpuid_leaf() and cpuid_subleaf().

Finally, rename:

    for_each_leaf_0x2_entry()   ➤	for_each_cpuid_0x2_desc()

to include "cpuid" in the iterator name, and since what is being iterated
upon is CPUID(0x2) cache and TLB "descriptos", not "entries".

* Testing:

- Basic one-by-one allyesconfig compilation

- Comparison of a before/after of below files:

  - /proc/cpuinfo
  - /sys/devices/system/cpu/
  - /sys/kernel/debug/x86/topo/
  - dmesg --notime | grep 'Last level [id]TLB entries'

Thanks!

8<--

Ahmed S. Darwish (9):
  x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
  x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
  x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
  x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()
  x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
  x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
  x86/cpu: Rename CPUID(0x2) descriptors iterator parameter
  x86/cpuid: Rename native_cpuid() to cpuid_native()
  x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()

 arch/x86/boot/compressed/pgtable_64.c     |   4 +-
 arch/x86/boot/compressed/sev.c            |   8 +-
 arch/x86/coco/sev/core.c                  |   2 +-
 arch/x86/events/intel/pt.c                |   2 +-
 arch/x86/include/asm/acrn.h               |   2 +-
 arch/x86/include/asm/cpuid.h              |   9 --
 arch/x86/include/asm/cpuid/api.h          | 103 ++++++++++++++++++----
 arch/x86/include/asm/cpuid/leaf_0x2_api.h |  73 ---------------
 arch/x86/include/asm/cpuid/types.h        |   3 +-
 arch/x86/include/asm/microcode.h          |   2 +-
 arch/x86/include/asm/processor.h          |   2 +-
 arch/x86/include/asm/xen/hypervisor.h     |   2 +-
 arch/x86/kernel/acpi/cstate.c             |   2 +-
 arch/x86/kernel/amd_nb.c                  |   2 +-
 arch/x86/kernel/cpu/cacheinfo.c           |  18 ++--
 arch/x86/kernel/cpu/common.c              |  12 +--
 arch/x86/kernel/cpu/intel.c               |  16 ++--
 arch/x86/kernel/cpu/microcode/amd.c       |   2 +-
 arch/x86/kernel/cpu/microcode/core.c      |   8 +-
 arch/x86/kernel/cpu/microcode/intel.c     |   2 +-
 arch/x86/kernel/cpu/microcode/internal.h  |   4 +-
 arch/x86/kernel/fpu/xstate.c              |   2 +-
 arch/x86/kernel/head32.c                  |   2 +-
 arch/x86/kernel/hpet.c                    |   2 +-
 arch/x86/kernel/jailhouse.c               |   2 +-
 arch/x86/kernel/kvm.c                     |   2 +-
 arch/x86/kernel/paravirt.c                |   2 +-
 arch/x86/kernel/process.c                 |   2 +-
 arch/x86/kernel/smpboot.c                 |   2 +-
 arch/x86/kernel/tsc.c                     |   2 +-
 arch/x86/kvm/cpuid.c                      |   4 +-
 arch/x86/mm/mem_encrypt_identity.c        |   6 +-
 arch/x86/virt/svm/sev.c                   |   2 +-
 arch/x86/xen/enlighten_pv.c               |   6 +-
 drivers/acpi/acpi_pad.c                   |   2 +-
 drivers/dma/ioat/dca.c                    |   2 +-
 drivers/firmware/efi/libstub/x86-5lvl.c   |   4 +-
 drivers/idle/intel_idle.c                 |   2 +-
 drivers/platform/x86/intel/pmc/core.c     |   2 +-
 sound/soc/intel/avs/tgl.c                 |   2 +-
 40 files changed, 159 insertions(+), 169 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid.h
 delete mode 100644 arch/x86/include/asm/cpuid/leaf_0x2_api.h

base-commit: c1ab4ce3cb759f69fb9085a060e568b73e8f5cd8
-- 
2.49.0

