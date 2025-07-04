Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6377A260571
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611105; cv=none; b=T2Zym52bUwuGp67n2VKFAWVYPSq4ZXz5KEMa9+CCUsupZ/kKFSizdyGHz6YF3WlutvCVDZYSMRcjgHlcdy4oDIsbknzgkYLtqSGya1beweDHntROv47ap/CsAr4eL7socOPpIfrVJjMBZ79jDJrPcFMOyVVuxg0xkuH8R+4dSVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611105; c=relaxed/simple;
	bh=nGyyzfry4zaJDaCvGHdWnzjUP+eEC2W1qHwpYhPgkK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oTXLjoxOYFWYuSsrM5xFgoIiJ14+4/HJsNAeAq0iucImAxKEVnnFlWXOvtDzUtBqJ5yRj0q8CfP6uJUiwc3hHe8Mmlzln+xpgo2XJ65mSyM0HzTgPgtcNyIQP4xpCIdo9ENDhQQVxk6JB5flr0Vrd+UhkuOaq8RJlaRGcVsJ9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0CFF152B;
	Thu,  3 Jul 2025 23:38:08 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 471EA3F63F;
	Thu,  3 Jul 2025 23:38:20 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Fri,  4 Jul 2025 12:08:12 +0530
Message-Id: <20250704063812.298914-1-anshuman.khandual@arm.com>
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
clears TCR2_EL1 which again gets set subsequently with 'tcr2' after testing
for FEAT_TCR2.

Drop this unwarranted 'msr' which is a stray change from an earlier commit.
This line got re-introduced when rebasing on top of the commit 926b66e2ebc8
("arm64: setup: name 'tcr2' register").

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 7052e808c446 ("arm64/sysreg: Get rid of the TCR2_EL1x SysregFields")
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.16-rc4 and tested with and without FEAT_S1PIE
enabled.

Changes in V2:

- Added information about the rebase error in the commit message per Marc
- Updated the commit message a bit

Changes in V1:

https://lore.kernel.org/all/20250703050453.136871-1-anshuman.khandual@arm.com/

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

