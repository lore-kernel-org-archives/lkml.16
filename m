Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E13192D97
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768243; cv=none; b=O5nnLh5j/yejzXt81Q7SvrDjFiuHJH1lfEdO97QmDQNQO4agsXJgt2vJfwcPYDLIqRqyoQvKpGi8GVsD3BHifGoLUwTWq+b+JhHnjOynkDixuZG/1QdRNBEGwSZV7AGA3e1JiN7Yag6lc82DxZec2/hh8j8oTMGH8Pf9DXT6VqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768243; c=relaxed/simple;
	bh=hq3KIoaraouIbFieN8wCFefIKAKmlTqavX0k7E5xqOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJwxobgzoq1POnImk21qu9sgUJh+8qlgMoB53nblROWjmTsWhwhtHi/C3OMoLQ53gtJ2FtJbCb0z1eFCJeWyMxnZRlNrtxrr/fe4z5a+GOHcsE6J2hcJLYNa8b6bOWxIzuVxu55r6I1YOvaeWN6DTk4Pj4BgKt8CZRzosP6vWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04381063;
	Wed,  5 Feb 2025 07:11:04 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D46F73F5A1;
	Wed,  5 Feb 2025 07:10:38 -0800 (PST)
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
Subject: [PATCH v1 05/16] mm/page_table_check: Batch-check pmds/puds just like ptes
Date: Wed,  5 Feb 2025 15:09:45 +0000
Message-ID: <20250205151003.88959-6-ryan.roberts@arm.com>
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

Convert page_table_check_p[mu]d_set(...) to
page_table_check_p[mu]ds_set(..., nr) to allow checking a contiguous set
of pmds/puds in single batch. We retain page_table_check_p[mu]d_set(...)
as macros that call new batch functions with nr=1 for compatibility.

arm64 is about to reorganise its pte/pmd/pud helpers to reuse more code
and to allow the implementation for huge_pte to more efficiently set
ptes/pmds/puds in batches. We need these batch-helpers to make the
refactoring possible.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/page_table_check.h | 30 +++++++++++++++++-----------
 mm/page_table_check.c            | 34 +++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 6722941c7cb8..289620d4aad3 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -19,8 +19,10 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr);
+void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
+		unsigned int nr);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -74,22 +76,22 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 	__page_table_check_ptes_set(mm, ptep, pte, nr);
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
-					    pmd_t pmd)
+static inline void page_table_check_pmds_set(struct mm_struct *mm,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmd_set(mm, pmdp, pmd);
+	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
-					    pud_t pud)
+static inline void page_table_check_puds_set(struct mm_struct *mm,
+		pud_t *pudp, pud_t pud, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_set(mm, pudp, pud);
+	__page_table_check_puds_set(mm, pudp, pud, nr);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -129,13 +131,13 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 {
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
-					    pmd_t pmd)
+static inline void page_table_check_pmds_set(struct mm_struct *mm,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
-					    pud_t pud)
+static inline void page_table_check_puds_set(struct mm_struct *mm,
+		pud_t *pudp, pud_t pud, unsigned int nr)
 {
 }
 
@@ -146,4 +148,8 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
 }
 
 #endif /* CONFIG_PAGE_TABLE_CHECK */
+
+#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
+#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
+
 #endif /* __LINUX_PAGE_TABLE_CHECK_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 509c6ef8de40..dae4a7d776b3 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -234,33 +234,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr)
 {
+	unsigned int i;
+	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
+
 	if (&init_mm == mm)
 		return;
 
 	page_table_check_pmd_flags(pmd);
 
-	__page_table_check_pmd_clear(mm, *pmdp);
-	if (pmd_user_accessible_page(pmd)) {
-		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
-				     pmd_write(pmd));
-	}
+	for (i = 0; i < nr; i++)
+		__page_table_check_pmd_clear(mm, *(pmdp + i));
+	if (pmd_user_accessible_page(pmd))
+		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
 }
-EXPORT_SYMBOL(__page_table_check_pmd_set);
+EXPORT_SYMBOL(__page_table_check_pmds_set);
 
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
+void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
+		unsigned int nr)
 {
+	unsigned int i;
+	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
+
 	if (&init_mm == mm)
 		return;
 
-	__page_table_check_pud_clear(mm, *pudp);
-	if (pud_user_accessible_page(pud)) {
-		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
-				     pud_write(pud));
-	}
+	for (i = 0; i < nr; i++)
+		__page_table_check_pud_clear(mm, *(pudp + i));
+	if (pud_user_accessible_page(pud))
+		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }
-EXPORT_SYMBOL(__page_table_check_pud_set);
+EXPORT_SYMBOL(__page_table_check_puds_set);
 
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
-- 
2.43.0

