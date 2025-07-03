Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F282DE6FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751519104; cv=none; b=JDA9ZQREvoY3yzyCgju8ioZkgUz0DY8ALpeJiIFTip+fIz6JEX6rtay2WBqv++2hTZXuTZtzXaLTwhFL0VB33NUSRpXiVlajXSLhvX01haNTc/0gG+BG1Yh6UWSNrOYSfzPpJtgA8pkzjM6OKYO7d1vUz31sWb4L9UMyzZRrGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751519104; c=relaxed/simple;
	bh=dz2EhiuMAtBVMuIMmlQWt53sWu06JNPFSKbbsA37l1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UHET4gDV7xA24qXKxqEOme44/MxbHf/1JkmUXPpkg7uEsPT5GkFb2sE9Rbu+3Sqgtj4z1vDtbeZL3Z9+loFiUovRyVd9Qm5BUzy8NCKK6IlNKQ06qsrp8owuVy79Z3IpgFp0u1kDFncc3dxtmp1FFwGW+ppSm8h6mEhtgiOTuHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F6C81655;
	Wed,  2 Jul 2025 22:04:46 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 585FD3F6A8;
	Wed,  2 Jul 2025 22:04:58 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Thu,  3 Jul 2025 10:34:53 +0530
Message-Id: <20250703050453.136871-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register X0 contains PIE_E1_ASM and should not be written into REG_TCR2_EL1
which could have an adverse impact otherwise. This has remained undetected
till now probably because current value for PIE_E1_ASM (0xcc880e0ac0800000)
clears TCR2_EL1 which again gets set subsequently with 'tcr' after checking
for FEAT_TCRX.

Drop this unwarranted 'msr' which is a stray change from an earlier commit.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 7052e808c446 ("arm64/sysreg: Get rid of the TCR2_EL1x SysregFields")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.16-rc4 and tested with and without FEAT_S1PIE
enabled.

 arch/arm64/mm/proc.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 80d470aa469d..54dccfd6aa11 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -518,7 +518,6 @@ alternative_else_nop_endif
 	msr	REG_PIR_EL1, x0
 
 	orr	tcr2, tcr2, TCR2_EL1_PIE
-	msr	REG_TCR2_EL1, x0
 
 .Lskip_indirection:
 
-- 
2.25.1

