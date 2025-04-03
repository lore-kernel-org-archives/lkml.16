Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CC224EA96
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690435; cv=none; b=UVq1pUAvab2hEpXLCn2EH+NIy4ig27UuVzrSq/bZEBRF5wQp0TXUSYlxG62mECKpVwrIMusInYJMLJp+5a1/+qLD6m+huDGGzIXA1Nl9uMZ/+0ONz61iWveeCC7AdlXAjffP9sPa7jCSPwWi0jIL8utzq62rMz8pKbeiJmlsZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690435; c=relaxed/simple;
	bh=0G0dgMDGY/LnFiozwv0Qbw0fNXb52V06kGln700h4MM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z9fI4Pjncgtj6KaYe9UDISvsHSsgRlOyRFE4wHdWxNO/j93yupvdsLBXAMuPpq2U8/9N5P6Q4Fa+sDJrZeu3jVF2whI9NnnZoASpcK44Mnlqs7+roWcsHKtl5RJoEMPdu62Yu/vvMGuhksIeIaf+UCU7Bn/X4ZUOOe5JMGPKAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1FEC339;
	Thu,  3 Apr 2025 07:27:15 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 753FE3F59E;
	Thu,  3 Apr 2025 07:27:09 -0700 (PDT)
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
Subject: [PATCH 0/3] support FEAT_MTE_STORE_ONLY feature
Date: Thu,  3 Apr 2025 15:27:04 +0100
Message-Id: <20250403142707.26397-1-yeoreum.yun@arm.com>
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
  This patches based on https://lore.kernel.org/all/20250403141535.23496-1-yeoreum.yun@arm.com/

Yeoreum Yun (3):
  arm64/feature: add MTE_STORE_ONLY feature
  prtcl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check

 arch/arm64/include/asm/hwcap.h      |  1 +
 arch/arm64/include/asm/processor.h  |  2 ++
 arch/arm64/include/uapi/asm/hwcap.h |  1 +
 arch/arm64/kernel/cpufeature.c      |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c         |  1 +
 arch/arm64/kernel/mte.c             | 11 ++++++++++-
 arch/arm64/kernel/process.c         |  6 +++++-
 arch/arm64/tools/cpucaps            |  1 +
 include/uapi/linux/prctl.h          |  2 ++
 9 files changed, 32 insertions(+), 2 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

