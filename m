Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4153627FD59
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239005; cv=none; b=ghx3l+1u72nfl+21vh0VrMZ8mWhdt7vfPvADxvdwucQqaq3O6bBjC/qO1qU1iLRmSq0VQ6+fumAlpaZiV0eYmLdDWu3QyeUvP3kfb/vO0YW6Po3sRPMN6Am/GaWTyWr9HJ4SJPOu/pC1fsZOZrz3t2eps9syIvXoxrMxaG4T/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239005; c=relaxed/simple;
	bh=cO+II4RqY6wZhAQa4SnC0GMrIsOpYVR1gFsTXOOWId0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dLrweBvOQhiDHluL45zfYTAwXsnrwzy3iUNlf4oeZjEexzfaECK9UjoVWXrzt7+q9nUJd8/U7eaKTj6MGbxGIEtEE2QjLftqUWtD2mG1/ifVu3koeO0cK+F/0XDA5yFwSN8ZDGAzJwC80nOgWEv8fMWdvxHF1eDwbmHCfaX9G1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C14E614BF;
	Wed, 18 Jun 2025 02:29:41 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B3D83F58B;
	Wed, 18 Jun 2025 02:29:58 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 0/8] support FEAT_MTE_STORE_ONLY feature
Date: Wed, 18 Jun 2025 10:29:49 +0100
Message-Id: <20250618092957.2069907-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
MTE is built on top of the ARMv8.0 virtual address tagging TBI
(Top Byte Ignore) feature and allows software to access a 4-bit
allocation tag for each 16-byte granule in the physical address space.
A logical tag is derived from bits 59-56 of the virtual
address used for the memory access. A CPU with MTE enabled will compare
the logical tag against the allocation tag and potentially raise an
tag check fault on mismatch, subject to system registers configuration.

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.
For this, application can use PR_MTE_STORE_ONLY flag
when it sets the MTE setting with prctl().

This feature omits tag check for fetch/read operation.
So it might be used not only debugging purpose but also be used
in runtime requiring strong memory safty in normal env.

Patch Sequences
================

Patch #1 adds cpufeature FEAT_MTE_STORE_ONLY

Patch #2 introduce new flag -- PR_MTE_STORE_ONLY

Patch #3 support MTE_STORE_ONLY feature

Patch #4 add HWCAP for MTE_STORE_ONLY

Patch #5 expose MTE_STORE_ONLY feature to guest

Patch #6 adds mte store-only hwcap test

Patch #7 preparation for adding mte store-only testcase

Patch #8 adds mte store-only testcases

Patch History
================
v6 to v7:
  - expose MTE_STORE_ONLY feature to guest
  - https://lore.kernel.org/linux-arm-kernel/20250611150417.44850-1-yeoreum.yun@arm.com/

v5 to v6:
  - fix testcase constant
  - fix subject of Patch #5
  - https://lore.kernel.org/all/20250611094802.929332-1-yeoreum.yun@arm.com/

v4 to v5:
  - rebase to v6.16-rc1
  - refactor the check_mmap_options for STORE_ONLY testcases.
  - https://lore.kernel.org/linux-arm-kernel/20250507154654.1937588-1-yeoreum.yun@arm.com/

v3 to v4:
  - separate cpufeature and hwcap commit.
  - add mte store-only testcases in check_mmap_options
  - https://lore.kernel.org/linux-arm-kernel/aApBk8eGA2Eo57fq@e129823.arm.com/

v2 to v3:
  - rebase to 6.15-rc1
  - https://lore.kernel.org/linux-arm-kernel/20250403174701.74312-1-yeoreum.yun@arm.com/

v1 to v2:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test
  - https://lore.kernel.org/linux-arm-kernel/20250403142707.26397-1-yeoreum.yun@arm.com/

NOTE:
  This patch based on https://lore.kernel.org/linux-arm-kernel/20250618084513.1761345-1-yeoreum.yun@arm.com/

Yeoreum Yun (8):
  arm64/cpufeature: add MTE_STORE_ONLY feature
  prctl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check
  arm64/hwcaps: add MTE_STORE_ONLY hwcaps
  arm64/kvm: expose MTE_STORE_ONLY feature to guest
  kselftest/arm64/abi: add MTE_STORE_ONLY feature hwcap test
  kselftest/arm64/mte: preparation for mte store only test
  kselftest/arm64/mte: add MTE_STORE_ONLY testcases

 Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/asm/processor.h            |   2 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/kernel/cpufeature.c                |   9 +
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/kernel/mte.c                       |  11 +-
 arch/arm64/kernel/process.c                   |   6 +-
 arch/arm64/kvm/sys_regs.c                     |   6 +-
 arch/arm64/tools/cpucaps                      |   1 +
 include/uapi/linux/prctl.h                    |   2 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |  10 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   6 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   2 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 363 +++++++++++++++++-
 .../testing/selftests/arm64/mte/check_prctl.c |  25 +-
 .../arm64/mte/check_tags_inclusion.c          |   8 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  14 +-
 .../selftests/arm64/mte/mte_common_util.h     |   3 +-
 22 files changed, 442 insertions(+), 44 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

