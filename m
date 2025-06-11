Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18A227702A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638962; cv=none; b=aVAHfPVefPlBv5DeE3lEvD68mZmNjs38H9lg6baPL02PVC8HR7z6D69wfBU1eKilhem1MluHVhtCvaLt18CGf36JGw+6gZeOIeeVZZwGfWAJp1rmSvTUzQdzOlJPFXFu6pTQ4xcvtJkqYvHIGClEZGz7cgLSpwS7BZSmYJRO+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638962; c=relaxed/simple;
	bh=onUVoi9qdGKtprZAIgKilTGqnXs96Trnqx8WFpToRcg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qvj57IUJC4taiCfBkARrfG3bSKMn0GjHxJSNm8K6RWRAh2uecNFKDSBRLPECNoS8q0IUabv5kogfHA0wlngwwb6HTq9EEwHs2cLlb0sMReD2q+Fk1uctuPjAhpOc1q4UGSR0Tg+QukgWVej39WOj5+gKIkZvyNuAOPEAZd+vcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76C981655;
	Wed, 11 Jun 2025 03:49:00 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 316543F77D;
	Wed, 11 Jun 2025 03:49:18 -0700 (PDT)
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
Subject: [PATCH 0/6] support FEAT_LSUI and apply it on futex atomic ops
Date: Wed, 11 Jun 2025 11:49:10 +0100
Message-Id: <20250611104916.10636-1-yeoreum.yun@arm.com>
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

Yeoreum Yun (6):
  arm64: cpufeature: add FEAT_LSUI
  arm64/Kconfig: add LSUI Kconfig
  arm64/futex: move futex atomic logic with clearing PAN bit
  arm64/futex: add futex atomic operation with FEAT_LSUI
  arm64/asm: introduce lsui.h
  arm64/futex: support futex with FEAT_LSUI

 arch/arm64/Kconfig                     |   8 +-
 arch/arm64/include/asm/futex.h         |  99 ++++++-------------
 arch/arm64/include/asm/futex_ll_sc_u.h | 115 +++++++++++++++++++++
 arch/arm64/include/asm/futex_lsui.h    | 132 +++++++++++++++++++++++++
 arch/arm64/include/asm/lsui.h          |  37 +++++++
 arch/arm64/kernel/cpufeature.c         |   8 ++
 arch/arm64/tools/cpucaps               |   1 +
 7 files changed, 331 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm64/include/asm/futex_ll_sc_u.h
 create mode 100644 arch/arm64/include/asm/futex_lsui.h
 create mode 100644 arch/arm64/include/asm/lsui.h

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

