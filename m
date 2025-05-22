Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F1128A1CC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914274; cv=none; b=gNZorxDEMCF+t0dsy+p49YlUblxWsShJj8DHIlccKQgWfyGUrBgxBSO70y1+9rOuGe5UirW+gqqvfFXUBpj48RDqb+EaY/jtfXBv5h//VYx3QK+9iJIxMwP7++dCdELuuiIgfdb4G4A33aUHJksHGs1N5ETuhOjrBk8SPBld+p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914274; c=relaxed/simple;
	bh=9CNau1nTd3Mo5TI1c80XSa1ABPRx6xbzpIIfhAb0klU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pQ6TYHDEw6/g+fLon0qxUPwH0sUik4mRh0NgXQQ3/2wIMEv9T816AG9u12eeNwdtxk6zN4YQmqcxEpMMxyTYa4fAf7lPX0VFVIE9BN+T2hKl5OQplDl7ARgVCOd8k0JoKmb36cDOM/BfbwDRdx3o3CwVT1/UmtqHf/GX8NylbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE301756;
	Thu, 22 May 2025 04:44:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.82.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDE793F673;
	Thu, 22 May 2025 04:44:20 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	wangkefeng.wang@huawei.com,
	yangyicong@hisilicon.com,
	baohua@kernel.org,
	pjaroszynski@nvidia.com,
	ardb@kernel.org,
	david@redhat.com,
	Dev Jain <dev.jain@arm.com>
Subject: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
Date: Thu, 22 May 2025 17:14:14 +0530
Message-Id: <20250522114414.72322-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dsb(ishst) is used to ensure that prior pagetable updates are completed.
But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.

There were no issues observed while running mm selftests, including
test_vmalloc.sh selftest to stress the vmalloc subsystem.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index eba1a98657f1..9b4adf1ee45e 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 		return;
 	}
 
-	dsb(ishst);
+	/* dsb(ishst) not needed as callers (set_pxd) have that */
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
 	dsb(ish);
@@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 {
 	unsigned long addr = __TLBI_VADDR(kaddr, 0);
 
-	dsb(ishst);
+	/* dsb(ishst) not needed as callers (set_pxd) have that */
 	__tlbi(vaae1is, addr);
 	dsb(ish);
 	isb();
-- 
2.30.2

