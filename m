Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7A9198A08
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654724; cv=none; b=m5A4PRJfW7mRmlUmeBgSnSc5SWVHW1YPqswpFOLX9ZIOpCNh//1WWJEV3hiQjDrNHmT02l4V34YnKmTvurW14XEYsiEOXoxT4v9i3tSt2GleCNqXRGZKoSvk9PgrJkBvuhkQbxLrbSHy9O1OP4BEkvz3EjQFTMuPiOPtXud3qmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654724; c=relaxed/simple;
	bh=uDtZpEKbcs5hrKRAGjNKhdsVcdeRm/+2JhvW3NWACOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Opuziskrm3paIEr9C99JzmZR95ZbxmrcZfEc853ALP5I5u4yN4Evcvq7Sd0MF1YATZ8tXIKutMmgcV5Y88uKvlVZDktpmndDnQZXXzGHwmZ5yPB/33NQOVWrmGXSXxkDqpQ5YJttPjuFFvaqMtMPgd6KXSG42PhgX6DBQS/Z95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D4B415A1;
	Wed, 11 Jun 2025 08:11:43 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7D643F59E;
	Wed, 11 Jun 2025 08:12:00 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/6] support FEAT_LSUI and apply it on futex atomic ops
Date: Wed, 11 Jun 2025 16:11:48 +0100
Message-Id: <20250611151154.46362-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.

This patchset support FEAT_LUSI and applies in futex atomic operation
where can replace from ldxr/stlxr pair implmentation with clearing
PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
without clearing PSTATE.PAN bit.

Patch Sequences
================

Patch #1 adds cpufeature for FEAT_LUSI

Patch #2 adds Kconfig for FEAT_LUSI

Patch #3 separtes former futex atomic-op implmentation from futex.h
to futex_ll_sc_u.h

Patch #4 implments futex atomic operation using lsui instruction.

Patch #5 introduces lsui.h to apply runtime patch to use former
implmentation when FEAT_LUSI doesn't support.

Patch #6 applies lsui.h into arch_futext_atomic_op().

Patch History
==============
from v1 to v2:
  - remove empty v9.6 menu entry
  - locate HAS_LUSI in cpucaps in order
  - https://lore.kernel.org/all/20250611104916.10636-1-yeoreum.yun@arm.com/

Yeoreum Yun (6):
  arm64: cpufeature: add FEAT_LSUI
  arm64/Kconfig: add LSUI Kconfig
  arm64/futex: move futex atomic logic with clearing PAN bit
  arm64/futex: add futex atomic operation with FEAT_LSUI
  arm64/asm: introduce lsui.h
  arm64/futex: support futex with FEAT_LSUI

 arch/arm64/Kconfig                     |   3 +
 arch/arm64/include/asm/futex.h         |  99 ++++++-------------
 arch/arm64/include/asm/futex_ll_sc_u.h | 115 +++++++++++++++++++++
 arch/arm64/include/asm/futex_lsui.h    | 132 +++++++++++++++++++++++++
 arch/arm64/include/asm/lsui.h          |  37 +++++++
 arch/arm64/kernel/cpufeature.c         |   8 ++
 arch/arm64/tools/cpucaps               |   1 +
 7 files changed, 327 insertions(+), 68 deletions(-)
 create mode 100644 arch/arm64/include/asm/futex_ll_sc_u.h
 create mode 100644 arch/arm64/include/asm/futex_lsui.h
 create mode 100644 arch/arm64/include/asm/lsui.h

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

