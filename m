Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB8225EF8F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749533508; cv=none; b=Hl3jQZTNiQUI98FMT0etpGziliPxWZKgci7+oGzrwkwrH2Nw1lAELBaJNCwH/xCncKVLp3PQToDdiwIX33/yCCSzdFyEPZuz2dFvQu3obIeLBN9v3p8ix3arToGThx82U+nYGOSX2jFWMPlNLEhSZh1iOdZ5jiSJrOFoeRyD2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749533508; c=relaxed/simple;
	bh=uO4/ickybqpPH68R03sd6AqtWPXqMsW2lxXy7SVyyl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TpJI+t2Sx/c1UmjN+Yoqk8ZwoAbGIqDFhTqM2zfGRablTay7zsg5d35rbQ5+RaJBX4D0XzkGrh2kfFjeCihVzdJyp7z++6spY6aGVQY5G5HAWJPaX0Nn3pPHKNylZPUoCOuD2MImasHIza2E/wWDGW6XStubDjncmXvy6lsxcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC8814BF;
	Mon,  9 Jun 2025 22:31:20 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A8373F59E;
	Mon,  9 Jun 2025 22:31:36 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Tue, 10 Jun 2025 11:01:26 +0530
Message-Id: <20250610053128.4118784-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MDSCR_EL1 has already been defined in tools sysreg format and hence can be
used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
macros become redundant and hence can be dropped off completely. While here
convert all variables handling MDSCR_EL1 register as u64 which reflects its
true width as well.

This series applies on v6.16-rc1

Changes in V3:

- Split out the self test changes into a separate patch per Mark
- Added RB tag from Ada

Changes in V2:

https://lore.kernel.org/all/20250508044752.234543-1-anshuman.khandual@arm.com/

- Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
- Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
  install_ss() per Ada
    
Changes in V1:

https://lore.kernel.org/all/20250417105253.3188976-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/debug: Drop redundant DBG_MDSCR_* macros
  KVM: selftests: Change MDSCR_EL1 register holding variables as uint64_t

 arch/arm64/include/asm/assembler.h            |  4 ++--
 arch/arm64/include/asm/debug-monitors.h       |  6 -----
 arch/arm64/kernel/debug-monitors.c            | 22 +++++++++----------
 arch/arm64/kernel/entry-common.c              |  4 ++--
 .../selftests/kvm/arm64/debug-exceptions.c    |  4 ++--
 5 files changed, 17 insertions(+), 23 deletions(-)

-- 
2.25.1

