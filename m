Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FA283128
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643638; cv=none; b=SqLzd4+nmU0YzZZ6hZn2+TEhzyayz2ZiU8hicXTrcQycnwoU2JWvaObQcbNmgWbKBaWfgrSDGi2gzT8JzIgfTyngR+p3hKdIiOR4Xc4Z8+dJPM5XlPVtwmXuK+xK2lUDYt5aMtsCfDHVcZkzmPybBnmiCGe4ekJ881Bl5R/h9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643638; c=relaxed/simple;
	bh=lDuMcIkqdVYfT9oTqnsRg9TwWuYN2/pKXvzQU1WFu8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ighRdYQ7Pcgj0KWyV5Y5Mehl3EssE61dOTCUAXGV1S+PTW7ioY33FqMWX22PUIVFsQ9bT1tlzjT+wB+LKEcYc9UjtvXQ1KM80p75oGh0OgB/c9/p82mhF2NGQYEqJZET9Ox71TH/ltFz7PePFcO4Otsqd5duYsfI6h18twcQY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MCXhMtLk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCXhMtLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749643635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtWlysWlQBjRkoN9+CJXCvGFy/ErJq/rTFp6EVa14FI=;
	b=MCXhMtLkwHeH5IeKJ7IKG0FCyK8Cc2qjTOiFRyC9B8lce9TvNoD4K1o2t0ZfyiNFx87m9T
	D46N1U207wg449tILjFL+ta+TnutRoRKg5B0II4Ifxpwh5e4dP/MDsMdu7o0yDosGFmpy8
	PzgkjQDGP9vHJinWTv4sudr4xXx+Ka0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-9E0MLvhJNf-FSJ0Nurlm6g-1; Wed, 11 Jun 2025 08:07:14 -0400
X-MC-Unique: 9E0MLvhJNf-FSJ0Nurlm6g-1
X-Mimecast-MFC-AGG-ID: 9E0MLvhJNf-FSJ0Nurlm6g_1749643634
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6face1d593bso128674046d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643634; x=1750248434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtWlysWlQBjRkoN9+CJXCvGFy/ErJq/rTFp6EVa14FI=;
        b=WjAAtCPvT27MJ0rllmizew3iQ5sADFs9b6bd8JRMLgtehCexjCRMCkRn2AbPR70dtO
         1lrU9qcgai76JD52volvkkHi1O/wyseaOQ8FB9yMTmDyysCV9ysvn1jAoRUgu6ObF18E
         e/751UoHcEbJDKvMla4DVrbzyMvH7gSIPtKoxqcLJ2Aq0bQVK+JopdJg1AOE/VT2M1+y
         s1y7/bSllNmi/A/BvWriVL46Iu1oQHuKprR2cJz2spqLUaAn4UEFJUQBeDV5x1CTqCBc
         59xM4riPQOfvlk+y+WZ2tOKeOpKFs/ULppg8R1XgFhvpeiwvuXWeLYmY0kMGmohwbS5R
         lvgg==
X-Gm-Message-State: AOJu0YyT9Kr1uLX5awwe2qIk9xezx36onDdaUgO2Y2g5D4Ro3LCkP0S2
	0giH+pBzbavVW/Ol/cHMqrcuoFLLqtg16AjhS6sZ/UbsqExNi+HSwDfeejbR1+zWIMYMrxFmR/+
	RCFcj34igLuRKYKk7dm4HQ952/ZsA++XzZVWGTeF6X7wb3OUxJKjqhnHoYUL2OW+U9HJJJjrPBc
	Vhzz3dwMuzKdCSenJ3fqXShhO5AeAhyEL7IYixwqmB/txAyZx/
X-Gm-Gg: ASbGncuhQDCm2behXwrOZMaROgxRkXra7Bm8tYlj2hTeOWnxzcXIfejfpyt5fWA/S04
	9/Ok8CKLq58mKNB6fioHJgFZKpcKELWZJAc2r+4Wkq8/OI5ICHpcYdN10xyRN9pcnVWwFNqf4cX
	OgB8HZ2agemBD+oYed7sKhdUHo5oS5nDnzTfNG00SYqsOKbU5b3Q/O8gi9q9bxNiSu89aEAeaTw
	5F2ItozDwXF9iR0g1UcWwg5a5+yQa6K7Ypn/rvIXL0/Bj7TO/ECsKybie03VESGVjwnfMkqGapR
	FxPoL8hhk5cJw0t3KSvTe14J1GQXv8JCvJXI6T4zrQ==
X-Received: by 2002:a05:6214:2247:b0:6fb:eff:853f with SMTP id 6a1803df08f44-6fb2d1355e8mr38204156d6.11.1749643633952;
        Wed, 11 Jun 2025 05:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM4p2qx6IwsF7ygt/fJLoNiy0HXlnShIRf40WhWevNTjDTOZVqQY8Q1r9EhVLBlQWkw0T8DQ==
X-Received: by 2002:a05:6214:2247:b0:6fb:eff:853f with SMTP id 6a1803df08f44-6fb2d1355e8mr38203456d6.11.1749643633381;
        Wed, 11 Jun 2025 05:07:13 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b2a1b6sm80566356d6.100.2025.06.11.05.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:07:12 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 3/3] mm/huge_memory: don't mark refcounted folios special in vmf_insert_folio_pud()
Date: Wed, 11 Jun 2025 14:06:54 +0200
Message-ID: <20250611120654.545963-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611120654.545963-1-david@redhat.com>
References: <20250611120654.545963-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Marking PUDs that map a "normal" refcounted folios as special is
against our rules documented for vm_normal_page().

Fortunately, there are not that many pud_special() check that can be
mislead and are right now rather harmless: e.g., none so far
bases decisions whether to grab a folio reference on that decision.

Well, and GUP-fast will fallback to GUP-slow. All in all, so far no big
implications as it seems.

Getting this right will get more important as we introduce
folio_normal_page_pud() and start using it in more place where we
currently special-case based on other VMA flags.

Fix it just like we fixed vmf_insert_folio_pmd().

Add folio_mk_pud() to mimic what we do with folio_mk_pmd().

Fixes: dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 19 ++++++++++++++++-
 mm/huge_memory.c   | 51 +++++++++++++++++++++++++---------------------
 2 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fa538feaa8d95..912b6d40a12d6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1816,7 +1816,24 @@ static inline pmd_t folio_mk_pmd(struct folio *folio, pgprot_t pgprot)
 {
 	return pmd_mkhuge(pfn_pmd(folio_pfn(folio), pgprot));
 }
-#endif
+
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+/**
+ * folio_mk_pud - Create a PUD for this folio
+ * @folio: The folio to create a PUD for
+ * @pgprot: The page protection bits to use
+ *
+ * Create a page table entry for the first page of this folio.
+ * This is suitable for passing to set_pud_at().
+ *
+ * Return: A page table entry suitable for mapping this folio.
+ */
+static inline pud_t folio_mk_pud(struct folio *folio, pgprot_t pgprot)
+{
+	return pud_mkhuge(pfn_pud(folio_pfn(folio), pgprot));
+}
+#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif /* CONFIG_MMU */
 
 static inline bool folio_has_pincount(const struct folio *folio)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 7e3e9028873e5..4734de1dc0ae4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1535,15 +1535,18 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 	return pud;
 }
 
-static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, pfn_t pfn, pgprot_t prot, bool write)
+static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
+		pud_t *pud, struct folio_or_pfn fop, pgprot_t prot, bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pud_t entry;
 
 	if (!pud_none(*pud)) {
+		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
+					  pfn_t_to_pfn(fop.pfn);
+
 		if (write) {
-			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn_t_to_pfn(pfn)))
+			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
 				return;
 			entry = pud_mkyoung(*pud);
 			entry = maybe_pud_mkwrite(pud_mkdirty(entry), vma);
@@ -1553,11 +1556,19 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
 		return;
 	}
 
-	entry = pud_mkhuge(pfn_t_pud(pfn, prot));
-	if (pfn_t_devmap(pfn))
-		entry = pud_mkdevmap(entry);
-	else
-		entry = pud_mkspecial(entry);
+	if (fop.is_folio) {
+		entry = folio_mk_pud(fop.folio, vma->vm_page_prot);
+
+		folio_get(fop.folio);
+		folio_add_file_rmap_pud(fop.folio, &fop.folio->page, vma);
+		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
+	} else {
+		entry = pud_mkhuge(pfn_t_pud(fop.pfn, prot));
+		if (pfn_t_devmap(fop.pfn))
+			entry = pud_mkdevmap(entry);
+		else
+			entry = pud_mkspecial(entry);
+	}
 	if (write) {
 		entry = pud_mkyoung(pud_mkdirty(entry));
 		entry = maybe_pud_mkwrite(entry, vma);
@@ -1581,6 +1592,9 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PUD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
+	struct folio_or_pfn fop = {
+		.pfn = pfn,
+	};
 	spinlock_t *ptl;
 
 	/*
@@ -1600,7 +1614,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pud_lock(vma->vm_mm, vmf->pud);
-	insert_pfn_pud(vma, addr, vmf->pud, pfn, pgprot, write);
+	insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
 	spin_unlock(ptl);
 
 	return VM_FAULT_NOPAGE;
@@ -1622,6 +1636,10 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 	unsigned long addr = vmf->address & PUD_MASK;
 	pud_t *pud = vmf->pud;
 	struct mm_struct *mm = vma->vm_mm;
+	struct folio_or_pfn fop = {
+		.folio = folio,
+		.is_folio = true,
+	};
 	spinlock_t *ptl;
 
 	if (addr < vma->vm_start || addr >= vma->vm_end)
@@ -1631,20 +1649,7 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 		return VM_FAULT_SIGBUS;
 
 	ptl = pud_lock(mm, pud);
-
-	/*
-	 * If there is already an entry present we assume the folio is
-	 * already mapped, hence no need to take another reference. We
-	 * still call insert_pfn_pud() though in case the mapping needs
-	 * upgrading to writeable.
-	 */
-	if (pud_none(*vmf->pud)) {
-		folio_get(folio);
-		folio_add_file_rmap_pud(folio, &folio->page, vma);
-		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
-	}
-	insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)),
-		       vma->vm_page_prot, write);
+	insert_pud(vma, addr, vmf->pud, fop, vma->vm_page_prot, write);
 	spin_unlock(ptl);
 
 	return VM_FAULT_NOPAGE;
-- 
2.49.0

