Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDB01DBB13
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768260; cv=none; b=H3N/kHaOTm7qbzWT9dhfg6jobqs7EcJY6lRvkYo4LAe0j6caT9ppW/L164bfMnC/bT3WL2bG0xHZz6RXE3c2WCG1SxDPwcnwa1Z6EWEXACxZvNY0UN5W88fJ1MbX98SqLjQWTfI6Z3GhM4k3+QiaMF8mdse94sfI02GrOjdZInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768260; c=relaxed/simple;
	bh=QXe8dUCDp+BKR+2eya14NSQxvp87N/vZ+M9E5qojvFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyBY1ZTq68U18XyQ9mCmVyIROpEiA1MKhfwr3WGZ2Cc2KUX9zbECyx79/rUKp80I9YKvmJCQ1klto9t8b2VLVzHncy/amsUa1dhHYeugJCHY5GRz8SKCj/KlXp+3IYXqPqTVVg+3+u3ql7d4V2mLb6tC3DF0GqvpOm4SE1suO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45141063;
	Wed,  5 Feb 2025 07:11:21 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E5CF3F5A1;
	Wed,  5 Feb 2025 07:10:55 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/16] mm/vmalloc: Gracefully unmap huge ptes
Date: Wed,  5 Feb 2025 15:09:51 +0000
Message-ID: <20250205151003.88959-12-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f7ee1f13d606 ("mm/vmalloc: enable mapping of huge pages at pte
level in vmap") added its support by reusing the set_huge_pte_at() API,
which is otherwise only used for user mappings. But when unmapping those
huge ptes, it continued to call ptep_get_and_clear(), which is a
layering violation. To date, the only arch to implement this support is
powerpc and it all happens to work ok for it.

But arm64's implementation of ptep_get_and_clear() can not be safely
used to clear a previous set_huge_pte_at(). So let's introduce a new
arch opt-in function, arch_vmap_pte_range_unmap_size(), which can
provide the size of a (present) pte. Then we can call
huge_ptep_get_and_clear() to tear it down properly.

Note that if vunmap_range() is called with a range that starts in the
middle of a huge pte-mapped page, we must unmap the entire huge page so
the behaviour is consistent with pmd and pud block mappings. In this
case emit a warning just like we do for pmd/pud mappings.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/vmalloc.h |  8 ++++++++
 mm/vmalloc.c            | 18 ++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 31e9ffd936e3..16dd4cba64f2 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -113,6 +113,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, uns
 }
 #endif
 
+#ifndef arch_vmap_pte_range_unmap_size
+static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
+							   pte_t *ptep)
+{
+	return PAGE_SIZE;
+}
+#endif
+
 #ifndef arch_vmap_pte_supported_shift
 static inline int arch_vmap_pte_supported_shift(unsigned long size)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fcdf67d5177a..6111ce900ec4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -350,12 +350,26 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
 {
 	pte_t *pte;
+	pte_t ptent;
+	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
 	do {
-		pte_t ptent = ptep_get_and_clear(&init_mm, addr, pte);
+#ifdef CONFIG_HUGETLB_PAGE
+		size = arch_vmap_pte_range_unmap_size(addr, pte);
+		if (size != PAGE_SIZE) {
+			if (WARN_ON(!IS_ALIGNED(addr, size))) {
+				addr = ALIGN_DOWN(addr, size);
+				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
+			}
+			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			if (WARN_ON(end - addr < size))
+				size = end - addr;
+		} else
+#endif
+			ptent = ptep_get_and_clear(&init_mm, addr, pte);
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
-- 
2.43.0

