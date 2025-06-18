Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D029827F171;
	Wed, 18 Jun 2025 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236320; cv=none; b=kslaUIcIA8CpZPvr6mRp9TF4mOYVX11Jz7vV2yHlt72+XNRRUJ1QsXAiEQUT7pxiYRU14hGBTlM1t4fk+WWgIh+lnFrL+TBk5BxpXzidvbjwWHxBy2JTIpIj9U27Xbv90uoGpot+znp9J8LmC9N2sbYGVobavj1npj2IqxAXTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236320; c=relaxed/simple;
	bh=6ZlyTFiZb6HSGFviLtMDNE4JATVyMgaAIi6GYFIQvhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YZmEd+rNFH6cq3tpQpUtXypjNn8EtIh/Wh4I0btgztI8GEB5ODC6gvKyp51yJR0IzbIIS+7tSQMgMpTXQSBfoPRdF9Dfa53deohzGSukD2VNoJ1zS5flM1KphqhJ9vsNsKma9Jm/7hfFhaRWZ3S701xLaW1hHHDj2PgAsHHEgRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53A1B14BF;
	Wed, 18 Jun 2025 01:44:57 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD2B73F66E;
	Wed, 18 Jun 2025 01:45:15 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 00/10] support FEAT_MTE_TAGGED_FAR feature
Date: Wed, 18 Jun 2025 09:45:03 +0100
Message-Id: <20250618084513.1761345-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FEAT_MTE_TAGGED_FAR feature provides support for
reporting all non-address bits during a synchronous MTE tag check fault.

This patchset extends the reporting tag to include
not only the memory tag (logical tag) but also the address tag via
si_addr when FEAT_MTE_TAGGED_FAR feature is supported.

Patch Sequences
================

Patch #1 adds cpufeature FEAT_MTE_TAGGED_FAR

Patch #2 adds MTE_FAR hwcaps and export address tag when it supports

Patch #3 expose MTE_FAR feature to guest

Patch #4 adds mtefar hwcap test

Patch #5 to #8 prepares to add mtefar testcase

Patch #9 refactor check_mmap_option using general testcase pattern

Patch #10 adds mtefar test cases corresponding to
each testcase of check_mmap_options

Patch History
================
v8 to v9:
  - expose MTE_FAR feature to guest
  - https://lore.kernel.org/linux-arm-kernel/20250611180734.63657-1-yeoreum.yun@arm.com/

v7 to v8:
  - rewording some comment word.
  - https://lore.kernel.org/all/20250611135818.31070-1-yeoreum.yun@arm.com/

v6 to v7:
  - fix some error on testcase.
  - https://lore.kernel.org/all/20250611094107.928457-1-yeoreum.yun@arm.com/

v5 to v6:
  - split Patch #4.
  - refactor check_mmap_option using general testcase pattern
  - https://lore.kernel.org/linux-arm-kernel/20250610150144.2523945-1-yeoreum.yun@arm.com/

v4 to v5:
  - rebased on v6.16-rc1
  - https://lore.kernel.org/linux-arm-kernel/20250507095757.1663684-1-yeoreum.yun@arm.com/

v3 to v4:
  - fix hwcap string for FEAT_MTE_TAGGED_FAR
  - split cpufeature and hwcap modification and merge hwcap's
    modification with exporting address tag patch
  - add mtefar testcase on check_mmap_options
  - https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/

v2 to v3:
  - Rebase to 6.15-rc1
  - https://lore.kernel.org/all/20250403172758.67106-1-yeoreum.yun@arm.com/

v1 to v2:
  - add hwcap test for MTE_FAR feature.
  - add MTE_FAR doc into elf_hwcap.rst
  - https://lore.kernel.org/all/20250403142707.26397-1-yeoreum.yun@arm.com/


Yeoreum Yun (10):
  arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
  arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
  arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature to guest
  tools/kselftest: add MTE_FAR hwcap test
  kselftest/arm64/mte: register mte signal handler with
    SA_EXPOSE_TAGBITS
  kselftest/arm64/mte: check MTE_FAR feature is supported
  kselftest/arm64/mte: add address tag related macro and function
  kselftest/arm64/mte: add verification for address tag in signal
    handler
  kselftest/arm64/mte: refactor check_mmap_option test
  kselftest/arm64/mte: add mtefar tests on check_mmap_options

 Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
 Documentation/arch/arm64/tagged-pointers.rst  |  11 +-
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/kernel/cpufeature.c                |   9 +
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/kvm/sys_regs.c                     |  14 +-
 arch/arm64/mm/fault.c                         |   7 +-
 arch/arm64/tools/cpucaps                      |   1 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |   2 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   4 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   4 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 551 +++++++++++++++---
 .../arm64/mte/check_tags_inclusion.c          |   2 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  70 ++-
 .../selftests/arm64/mte/mte_common_util.h     |   6 +-
 tools/testing/selftests/arm64/mte/mte_def.h   |   8 +
 20 files changed, 603 insertions(+), 104 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

