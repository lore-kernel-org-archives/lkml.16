Received: from mta-64-143.flowmailer.net (mta-64-143.flowmailer.net [185.136.64.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31E2135CE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161734; cv=none; b=mdapTRUecPSw+GqJ8Np1Knuu8q6QRKvM2yL0ddx74ie4/6l7Fz4nfAILvyA5/6kgcro129ALaaR8foFcYoSN0Lu4pAuRAX16jelzPx6D2LvMnK+gNLUFaEIspz8+2W2trTCd1b3NCcLZL3dvyoR/ivFtxTSYSGJW4eR9CBrVYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161734; c=relaxed/simple;
	bh=53ymfis4dfeL0ecSb9MKI7Q0juoBYEyVTXX0BR7IO0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uCHQvFThhHCh16v9dQBOCwD7kP5CYpuFcQJtMdmrBJdoxQH1R8CmO+wxV1ETD88fBPjqNzYHyW2NLPb6eBUBoMZH1D0JAOeZ6SSOSqZHhhaDdsIZBY+Hglqkp9TAbbgmYTVDjrix2RZzpI41pC4tPdxJDyok6MoBVB6UsM6oG/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com; dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b=oKSYzyhC; dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b=SIT6CiHE; arc=none smtp.client-ip=185.136.64.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b="oKSYzyhC";
	dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b="SIT6CiHE"
Received: by mta-64-143.flowmailer.net with ESMTPSA id 20250327135424aa7366db7c0019fdb7
        for <linux-kernel@vger.kernel.org>;
        Thu, 27 Mar 2025 14:54:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=zRyNrCtp5GeNxxNbMBGYIhJanL4rsyW90z/rY63BsJc=;
 b=oKSYzyhCBZTaJhH0pMGrWh6OHJn/RvmbWlZl51XYZ6/Y48VCWoNwWFqdA2H38imxhyA6ee
 Vw0P2n+Dll4L8fmWJDhpOMz0agoARE2l97mAx8thOaxMKpvgbvWZps4OQ3j3Its1jRJ5XgJd
 Tsv5JsgrZRMfjAPKQLiP3znCJPnQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm3;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=zRyNrCtp5GeNxxNbMBGYIhJanL4rsyW90z/rY63BsJc=;
 b=SIT6CiHEfBE+1Nzw2HADfTuWd2JqV36GC1mGDAPRkejcZJz2/n3H+ZmW3YtRj2OMwYu9Xq
 yiGRQ/PDKXsePSquwJtIzUkti14ErshlV82p7WNz9Vur+H2so1AC1tAA6AENTn1FGbW+x3dk
 kDQbKEHGlpbmAuey+ADmBJT2boMc9Pmkw9A6Ut3klFbhyaiVIp12mSyqMSuzR49K9Q5o1756
 D/VTcmJkgppkeTsZ5dRJjLQtAKGFK9aajiY+/LqrPuoViRnTYFkoZvTBqE2/LnvcH55pYzDH
 aiZtLmhoJx86nhLbQZQRg2ddpGpGg/MyKqwz3n2MqUXUNGQ2vVCt/OQA==;
Date: Thu, 27 Mar 2025 14:54:22 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org,
	Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH 1/2] nios2: force update_mmu_cache on spurious
 tlb-permission--related pagefaults
Message-ID: 
 <fm-32642-20250327135424aa7366db7c0019fdb7-ahhkqZ@errorhandling.siemens-energy.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fm-32642-2025032713472354f98643960019fd6d-cXH63M@errorhandling.siemens-energy.com>

NIOS2 uses a software-managed TLB for virtual address translation. To
flush a cache line, the original mapping is replaced by one to physical
address 0x0 with no permissions (rwx mapped to 0) set. This can lead to
TLB-permission--related traps when such a nominally flushed entry is
encountered as a mapping for an otherwise valid virtual address within a
process (e.g. due to an MMU-PID-namespace rollover that previously
flushed the complete TLB including entries of existing, running
processes).

The default ptep_set_access_flags implementation from mm/pgtable-generic.c
only forces a TLB-update when the page-table entry has changed within the
page table:

	/*
	 * [...] We return whether the PTE actually changed, which in turn
	 * instructs the caller to do things like update__mmu_cache. [...]
	 */
	int ptep_set_access_flags(struct vm_area_struct *vma,
				  unsigned long address, pte_t *ptep,
				  pte_t entry, int dirty)
	{
		int changed = !pte_same(*ptep, entry);
		if (changed) {
			set_pte_at(vma->vm_mm, address, ptep, entry);
			flush_tlb_fix_spurious_fault(vma, address);
		}
		return changed;
	}

However, no cross-referencing with the TLB-state occurs, so the
flushing-induced pseudo entries that are responsible for the pagefault
in the first place are never pre-empted from TLB on this code path.

This commit fixes this behaviour by always requesting a TLB-update in
this part of the pagefault handling, fixing spurious page-faults on the
way. The handling is a straightforward port of the logic from the MIPS
architecture via an arch-specific ptep_set_access_flags function ported
from arch/mips/include/asm/pgtable.h.

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
---
 arch/nios2/include/asm/pgtable.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index eab87c6beacb..e5d64c84aadf 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -291,4 +291,20 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
+static inline int pte_same(pte_t pte_a, pte_t pte_b);
+
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+static inline int ptep_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pte_t *ptep,
+					pte_t entry, int dirty)
+{
+	if (!pte_same(*ptep, entry))
+		set_ptes(vma->vm_mm, address, ptep, entry, 1);
+	/*
+	 * update_mmu_cache will unconditionally execute, handling both
+	 * the case that the PTE changed and the spurious fault case.
+	 */
+	return true;
+}
+
 #endif /* _ASM_NIOS2_PGTABLE_H */
-- 
2.39.5

