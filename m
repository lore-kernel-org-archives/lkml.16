Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7430E4207F;
	Thu, 10 Apr 2025 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271249; cv=none; b=OK30Sf+nN4GTvvM/czKrDU08kErHIROX/BxLyaS67QZm0bvKW75TL7jhHIrUnuSUbG0X6UwdQfe05G0bS3LYoPnjMUfrL1dBfvbQ20Hs0dMjCE8JYd9GZY/XhLo9kfg4qRf8JpJLaTw4jqeiSFQ+ZSV6QRI216u1OYuggtGD5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271249; c=relaxed/simple;
	bh=jVQLPwJUsRBRKypXnzmJa2WRIb88zmnp65JMO8PaOuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fC5X+N84+QDnZuzzsx6iryAviciOiLgqIopRvwwZi+sAbphViDnMNZY8kM4+dANC+bKbmY89vefteOOf6systsGI3Ouuye45RsRsE/qXfxZsWc8sDSdF6MwtZk9RNHj98yhOi2x9XTSLH0nyqA+/UCPToE5fcGp40e7yJvWCros=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A55081007;
	Thu, 10 Apr 2025 00:47:26 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C88D3F6A8;
	Thu, 10 Apr 2025 00:47:23 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 0/3] support FEAT_MTE_TAGGED_FAR feature
Date: Thu, 10 Apr 2025 08:47:18 +0100
Message-Id: <20250410074721.947380-1-yeoreum.yun@arm.com>
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

Since v1:
  - add hwcap test for MTE_FAR feature.
  - add MTE_FAR doc into elf_hwcap.rst

Since v2:
  - Rebase to 6.15-rc1

Yeoreum Yun (3):
  arm64: add FEAT_MTE_TAGGED_FAR feature
  arm64/mm/fault: use original FAR_EL1 value when ARM64_MTE_FAR is
    supported
  tools/kselftest: add MTE_FAR hwcap test

 Documentation/arch/arm64/elf_hwcaps.rst      |  3 +++
 Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
 arch/arm64/include/asm/hwcap.h               |  1 +
 arch/arm64/include/uapi/asm/hwcap.h          |  1 +
 arch/arm64/kernel/cpufeature.c               |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c                  |  1 +
 arch/arm64/mm/fault.c                        |  7 +++++--
 arch/arm64/tools/cpucaps                     |  1 +
 tools/testing/selftests/arm64/abi/hwcap.c    |  6 ++++++
 9 files changed, 33 insertions(+), 7 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

