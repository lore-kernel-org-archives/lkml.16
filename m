Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E3291C3D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806836; cv=none; b=tpIZj40vvsTWbtGMVl1J98VL3T+bLdJp5iqGrJK0zXIANkzcLGxTwgWBAb937Cwz2YQqlqSBJRNkUBtgwL/QZMcoTVxaiwfU8CHw5vqhrkW6Bci6+3TLeroaAaYLKvG7Qh63LKb1aV6oAio6hekbi7qNijtNi5aIeCoK5Eq9wj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806836; c=relaxed/simple;
	bh=6tO5VYLM2T1L+Bh5vole73WL1rOpW9UksZR14TfFrDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay4H99jaNYrOgOmgbk0Fg5fDCOk/3QL7YQIMOu5RujqEZoDbtTu+piwZXnOzVEdGbLxfna/xlFWcgSyL/H1y9iuQw7woKQUphnSXdLjJrbTlwTEM4kkBMKa+O2kBWqiG8wH7nm824/ZIff+GQOuHuFk53dvrpAW/aRLHj8/RSGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZY7J3FhU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZY7J3FhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749806833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dB/Gx1sOYTj3RBFxV3FcA/SYk77nCJNbmnFBuqoX6J8=;
	b=ZY7J3FhUj0bkocl6UYlyWONxZdwrG/E9vEp4BMHBJ6jV36aTnquCJ/annteQyh6kDYPmLf
	eO916XeaDThvtd39UgpFct8f2sUVYvkW91lw1FJ4ZMw+hi9ViSAILxMAd1vHWOZObLdwd3
	fn3BaBis5nsjHPZ2dEq+H4FLo/J6w9E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-cuEw5A5VNoCrShWqcd4QpA-1; Fri, 13 Jun 2025 05:27:11 -0400
X-MC-Unique: cuEw5A5VNoCrShWqcd4QpA-1
X-Mimecast-MFC-AGG-ID: cuEw5A5VNoCrShWqcd4QpA_1749806831
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso1491902f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806830; x=1750411630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB/Gx1sOYTj3RBFxV3FcA/SYk77nCJNbmnFBuqoX6J8=;
        b=qSSqJzvMV/RkGvkW4ts9TbvBOpibTXtxMelgXM13OLYxE1XcfL3sQgX8el0VpL059u
         9KoqxDYtlaWVbkXvPWj4rh5W/zMcJUQz110Wl7Oz14Iw8+DkQNKj2Me+diRNTj9KDE17
         0eq9Q8zkeQYxDrxTXvVBkzh5as5HQvZIM6KP1/RC6EfeCi7jiShG+ZLvOba8/AL/s6cm
         6ACYI5fhQiTIYoi3C5vDd6nfPy1cStmgaspAXTEVyhDDGXiV4C8SUNu8vxSKgEZmSq7r
         beI/y8RlFv8apLj1TpAtYuXULxRCtz4wKaFn1bv7zTz5BIM4JbePUAmMtxn1Xq50f/MB
         GjcQ==
X-Gm-Message-State: AOJu0Yw5yflE/thx9e/jzWlJ0xzyDTtn2Bg9AN47RqOmRr7TVbQZbdob
	mJrAulOh+cW5LLFJMe/3E+z1U7rOIniaom75bax+XdiMI8R0hT7XZlhzFQ6yz62LxgZWhgQGAXX
	S24KONoKOhaT3PgYhFfxdXPFTJhSeP/NRtlOZfMt0taPiZTjA1GsJUVFSLUjY+zIzLLyXJo4hpd
	jpO1M9MFGBuK1+bgHwjKJQPBnGinRDRKzYvYmf0vhE96QgTFBB
X-Gm-Gg: ASbGnct6Z5v6lXr91ooF5ytdd37PjC7FdLXINM8nggoQYLkYh1/EdOIARq+hzZDczA5
	Rggz+E/6Sd5WUNYRVIwu6KqSJ5sEBQFC1FewqBFkkdLvVWqPiZRl9rcqhDlpgFC5o+E8SMhDsuU
	yEc642Vfs2eFDu1Hc/kG8KvrnUQYwJrqqFs/UY2sFr3zRTbxmdxAGMkFBUq8JwGvNS+J5re/tVQ
	GrFvcqNTkcbKoTrsIUIstz4L6Mte9hfPeUOdKZBtErXwFeKtdek4P1lgAx3Cr33BUOxlcNr+2NT
	RIj6JYU+BssLVY+ioC1Nj8M4AW1E1C0MByXrBm1zUenWQDi5bL/ro8WazlyasvlPyfjyGzOhufY
	grcZOrHo=
X-Received: by 2002:a05:6000:24c8:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a56874a137mr2481392f8f.58.1749806830569;
        Fri, 13 Jun 2025 02:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqj6NdODj43XbLFVDeV1qD7UYHV1rn0TfwsC4tf99O0oNc/40w2gplW02JFKnmYY0c01aDOg==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a56874a137mr2481334f8f.58.1749806829879;
        Fri, 13 Jun 2025 02:27:09 -0700 (PDT)
Received: from localhost (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5689e5f3dsm1827987f8f.0.2025.06.13.02.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:27:09 -0700 (PDT)
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
	Oscar Salvador <osalvador@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 3/3] mm/huge_memory: don't mark refcounted folios special in vmf_insert_folio_pud()
Date: Fri, 13 Jun 2025 11:27:02 +0200
Message-ID: <20250613092702.1943533-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613092702.1943533-1-david@redhat.com>
References: <20250613092702.1943533-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Marking PUDs that map a "normal" refcounted folios as special is
against our rules documented for vm_normal_page(). normal (refcounted)
folios shall never have the page table mapping marked as special.

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
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 19 ++++++++++++++++-
 mm/huge_memory.c   | 52 ++++++++++++++++++++++++++--------------------
 2 files changed, 47 insertions(+), 24 deletions(-)

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
index d1e3e253c714a..bbc1dab98f2f7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1536,15 +1536,18 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
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
@@ -1554,11 +1557,20 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
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
+
+		if (pfn_t_devmap(fop.pfn))
+			entry = pud_mkdevmap(entry);
+		else
+			entry = pud_mkspecial(entry);
+	}
 	if (write) {
 		entry = pud_mkyoung(pud_mkdirty(entry));
 		entry = maybe_pud_mkwrite(entry, vma);
@@ -1582,6 +1594,9 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PUD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
+	struct folio_or_pfn fop = {
+		.pfn = pfn,
+	};
 	spinlock_t *ptl;
 
 	/*
@@ -1601,7 +1616,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pud_lock(vma->vm_mm, vmf->pud);
-	insert_pfn_pud(vma, addr, vmf->pud, pfn, pgprot, write);
+	insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
 	spin_unlock(ptl);
 
 	return VM_FAULT_NOPAGE;
@@ -1623,6 +1638,10 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 	unsigned long addr = vmf->address & PUD_MASK;
 	pud_t *pud = vmf->pud;
 	struct mm_struct *mm = vma->vm_mm;
+	struct folio_or_pfn fop = {
+		.folio = folio,
+		.is_folio = true,
+	};
 	spinlock_t *ptl;
 
 	if (addr < vma->vm_start || addr >= vma->vm_end)
@@ -1632,20 +1651,7 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
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

