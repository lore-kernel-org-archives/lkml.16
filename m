Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6E319CD07
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632823; cv=none; b=u14aeH6O24dR8/87wizqMVT2sldBF8ybeb239Uooqzac69CPVUD6OePdCYJeyVrj1zlrN2FfwZXE0VDKzsAG6S5JZ4EtupJHRqVlNXHe1fNGV6bwUnKXbrLJIzgCYPTJ7A4vh1EYkahN3X4vE6DUu2zgKTAgFYQXIYXVtJUM9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632823; c=relaxed/simple;
	bh=RJ4MiTKJzeiXZqm39xB7AKUZ8j/mMYBPfj4YTmELryk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YM5ma78hf/9gUbyxaKWA9hlMmaIoeX5E1WRi2CdbKnhmfUXJMyZ/Vdxow5gM60jb9H1+4YZuAYUpm4G2DeULVDfL8TBVs7nxLRKdu/nla5hAGSRi+v2erSyrxolPIShBqASS5+5BPABHHU+vinqQjs47dLg4OF6lKeD+BeHhg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04059339;
	Wed,  7 May 2025 08:46:50 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 783333F58B;
	Wed,  7 May 2025 08:46:56 -0700 (PDT)
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
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
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
Subject: [PATCH v4 0/7] support FEAT_MTE_STORE_ONLY feature
Date: Wed,  7 May 2025 16:46:47 +0100
Message-Id: <20250507154654.1937588-1-yeoreum.yun@arm.com>
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
by application requiring strong memory safty in normal env.

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

Note:
  This patch based on
    https://lore.kernel.org/linux-arm-kernel/20250507095757.1663684-1-yeoreum.yun@arm.com/

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
 arch/arm64/kernel/cpufeature.c                |   9 ++
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
 .../selftests/arm64/mte/check_mmap_options.c  | 116 ++++++++++++------
 .../testing/selftests/arm64/mte/check_prctl.c |  25 ++--
 .../arm64/mte/check_tags_inclusion.c          |   8 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  14 ++-
 .../selftests/arm64/mte/mte_common_util.h     |   3 +-
 21 files changed, 167 insertions(+), 66 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

