Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F419A250C16
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743702432; cv=none; b=k401NyfXdijnQXcTM69+Ap9XhmIYs5JYREFYXGwOGZB3/iMEMOvQ9SapTQ5UPsBoj7jsBh9p+f2ZhtRFX1JfaBwd6GPeRIyXZiizTB2RiGyfT5CeaMUpAzMTOTRUPLKl4uZoP+/vmvgm/87IQaAXt5gKrHGA/OI8H3qzosPF5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743702432; c=relaxed/simple;
	bh=hvkr4bgfjRVp27m2lwx3g/wEt0pX8Yxg5gZ439eHWJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mH6DlpAHIoji36+LAPy7lZKrDa9cpNDCZfy3tgwYdAbxxuRpzv0C7GgmYGGsoi3oFkjYDO5WyWYSvN46lqpwZUaji5wGSlJj3VELU/stZ1/MQdO6rswG8jonBE3aCdGMbazUUtPriYC7W4n+9v2A/WPyimpMEmcEWIUGqAXKcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87AB7106F;
	Thu,  3 Apr 2025 10:47:10 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BA1A3F63F;
	Thu,  3 Apr 2025 10:47:04 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com,
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
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
Date: Thu,  3 Apr 2025 18:46:57 +0100
Message-Id: <20250403174701.74312-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FEAT_MTE_STORE_ONLY feature provides support for
tag check for store operation only. read operation is considered
as unchecked operation so it doesn't raise tag check fault.

NOTE:
  This patches based on https://lore.kernel.org/linux-arm-kernel/20250403172758.67106-1-yeoreum.yun@arm.com/

Since v1:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test

Yeoreum Yun (4):
  arm64/feature: add MTE_STORE_ONLY feature
  prtcl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check
  tools/kselftest: add MTE_STORE_ONLY feature hwcap test

 Documentation/arch/arm64/elf_hwcaps.rst   |  3 +++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/asm/processor.h        |  2 ++
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kernel/mte.c                   | 11 ++++++++++-
 arch/arm64/kernel/process.c               |  6 +++++-
 arch/arm64/tools/cpucaps                  |  1 +
 include/uapi/linux/prctl.h                |  2 ++
 tools/testing/selftests/arm64/abi/hwcap.c |  6 ++++++
 11 files changed, 41 insertions(+), 2 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

