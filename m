Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6B8253B76
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309929; cv=none; b=uodAvu4f5pa2KnmlXTzIZiS7wqpz+wn36DgPCzVz8uX8IOjHgBeOCfVqNhh0zmTsVQ8kpJ3aWoTVzik03DYtVOEWTJs5JGGdFO00Gom5YIClH2DTaVu/OtYx+fq2YfN4CHRdsF80wT37IAyFxs3+9x2pHVlX0/tKMeAQY/htdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309929; c=relaxed/simple;
	bh=WtFgLzjE6Xt+IMvTJdo2SRZY1dpM1xtz/1BKjqzINxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JD/aeAC46PCGFWMihJ/liuX5jfDyxUQBsWCP91S4GFXjyrN5xlilyiJqkRTRVpE5PtaVuJIYVIdBrOvIfP6cTq4kjMlp3Hd86IuFHcY6Ka8MsElBY33/EclV+jg9UlSElkJvPG4evjElZdkbFtwa8Cw7NVD225qCDH6FzIzzcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EC931EDB;
	Tue, 22 Apr 2025 01:18:43 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BB513F66E;
	Tue, 22 Apr 2025 01:18:45 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/11] mm/page_table_check: Batch-check pmds/puds just like ptes
Date: Tue, 22 Apr 2025 09:18:11 +0100
Message-ID: <20250422081822.1836315-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
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

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
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
index 68109ee93841..4eeca782b888 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -218,33 +218,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr)
 {
+	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
+	unsigned int i;
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
+	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
+	unsigned int i;
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

