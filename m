Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B40528C5CF;
	Wed, 11 Jun 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650309; cv=none; b=KacAXz85sQr5xro32zzXlWRy+/qvj+vmAbB7h16UQ3wgyGNF1j+to/mxOdZDxtKHTpggLqbxdHN1IqbR/gThpeYA39kIFFWn8DMn4o7AryFioFjHwjoUuUP+UTLeYrSHrrkhtqGk/DC6TIk1eQGGhrUPn/fCqvSCYv14b6ctf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650309; c=relaxed/simple;
	bh=2oYbUA5DTf6ljJD7+A2PAcLzmI/rT/OPcPM1DwGgu08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=myDqeBI+LQB1AAxYPhjFE9rQkN1zc5nI1bwHQinn/t81Iku3YzFfANZU9+q75BuB4XYLjWlPnep3yoMiZUWBMqdkNSOYqUit4NfeVCGz4pU0MNNdmZ3LD948BDayUBfQR0VHnWlhUADKUbjCyhQ80acGFbKZVx23SjUNh/B+Plo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96A315A1;
	Wed, 11 Jun 2025 06:58:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1E6723F673;
	Wed, 11 Jun 2025 06:58:21 -0700 (PDT)
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
Subject: [PATCH v7 0/9] support FEAT_MTE_TAGGED_FAR feature
Date: Wed, 11 Jun 2025 14:58:09 +0100
Message-Id: <20250611135818.31070-1-yeoreum.yun@arm.com>
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

Patch #3 adds mtefar hwcap test

Patch #4 to #7 prepares to add mtefar testcase

Patch #8 refactor check_mmap_option using general testcase pattern

Patch #9 adds mtefar test cases corresponding to
each testcase of check_mmap_options

Patch History
================
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


Yeoreum Yun (9):
  arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
  arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
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
 19 files changed, 593 insertions(+), 100 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

