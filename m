Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA62381A3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272451; cv=none; b=PbwjhFe9rlAl0XqQFdHImjembhJQmA1zvx9MbwE6w3xBHy5ohTfF/T4e/XoC9Ovx00KZehIP19F2v4QHE4sMFo4M5Vei6LXIVWEhKsBoB7OU5OPfBJejBJYA4LbZZAfHDoq6yIiCxzhTmT7I3y676TlzFSdKl4/b7BNPRYgjMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272451; c=relaxed/simple;
	bh=mkLm0BKF7/zvsej2Gbgj/eFY/QKzpohFK6IqkaReCZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Egc6Wqb9dsg6WKcO8KBdvlOTVrxx1OhizgOCx388zQBKfbQpaOH/xKFzXgFzP6LzDVaHXW1cTlIXYEF4IqeYtw5dTc+HrsBy6Epntvo7ae+uVMqT7pNSLjhaMdQGJbmVNPB/Rn+wn+n4Bj8iy9N1dNjDEDJUru3l0yG39tBd/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EEC41007;
	Thu, 10 Apr 2025 01:07:29 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC7493F694;
	Thu, 10 Apr 2025 01:07:25 -0700 (PDT)
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
Subject: [PATCH v3 0/4] support FEAT_MTE_STORE_ONLY feature
Date: Thu, 10 Apr 2025 09:07:19 +0100
Message-Id: <20250410080723.953525-1-yeoreum.yun@arm.com>
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

Since v1:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test

Since v2:
  - Rebase to 6.15.-rc1

NOTE:
  This patches based on https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/

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

