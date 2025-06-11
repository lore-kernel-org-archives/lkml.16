Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EDD23ED69
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635289; cv=none; b=aIX1hOgD0uAMgyfg+/fW3p1jM9zMDb5UHF0wRq03MH7jQukaiH5j+qHDpvVHU7BO3QwsZVcPYkPchWoMPvaAJtRpRb5u05JUq0H7Ktb5nHJeGQ4IXCWq2vdBTlGMy/jYlEAkvH2xaQcr/fkgI+DY1+TLNK4ZcI0YyQsryEULce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635289; c=relaxed/simple;
	bh=Bcnv2IphMb0GcR61pDD2lYaMzSNOFmQxj4FDqN4O5E8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hzD42O3ivrFWU/1ixEBcQOmcYBH+wyqkYw473dPiLhopcZTL1p2tDc+95R2QsptCkeiAhmc8ejFpBrPm1E7OCl8WfaPseM7MIaFD6JGbpDQIQdYe4z99eQ4EvP1Rb5llawrI7Hc7d3C5/tDf1c3Rw5Y1N08AjjjXmkW4cPxGNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 381581596;
	Wed, 11 Jun 2025 02:47:48 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 840013F59E;
	Wed, 11 Jun 2025 02:48:04 -0700 (PDT)
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
Subject: [PATCH v5 0/7] support FEAT_MTE_STORE_ONLY feature
Date: Wed, 11 Jun 2025 10:47:55 +0100
Message-Id: <20250611094802.929332-1-yeoreum.yun@arm.com>
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

Patch #5 adds mte store-only hwcap test

Patch #6 preparation for adding mte store-only testcase

Patch #7 adds mte store-only testcases

Patch History
================
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
  This patch based on https://lore.kernel.org/all/20250611094107.928457-1-yeoreum.yun@arm.com/

Yeoreum Yun (7):
  arm64/cpufeature: add MTE_STORE_ONLY feature
  prtcl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check
  arm64/hwcaps: add MTE_STORE_ONLY hwcaps
  tools/kselftest: add MTE_STORE_ONLY feature hwcap test
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
 arch/arm64/tools/cpucaps                      |   1 +
 include/uapi/linux/prctl.h                    |   2 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |  10 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   6 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   2 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 361 +++++++++++++++++-
 .../testing/selftests/arm64/mte/check_prctl.c |  25 +-
 .../arm64/mte/check_tags_inclusion.c          |   8 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  14 +-
 .../selftests/arm64/mte/mte_common_util.h     |   3 +-
 21 files changed, 437 insertions(+), 41 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

