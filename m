Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74042C158A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806834; cv=none; b=WfIql3/50oPuJQMyPc+A5rvvz7j46rufH1nnOUZDVpnyRmSudwC6r2+hi9C9zI5XPq6reQw+H0JcPg5xLsA1d0lFIuyqy5Gv3PAdSNqLOwB1dT3xC5JyYl5nm0lV2sJ9QjvgqKILUN8iUDYnSMB2N4HF8VkrFIYnI6AYtkLZ+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806834; c=relaxed/simple;
	bh=I6rFqh4q3G6JolUrUnqDfQkAwN4FRP8LLGB+fl8jl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sm0XR15klPgCPXn7Zbbo/UjN+uB+dS7LByMd5wq5YqImqnb1vEx6z+nU2lCBEEVs1bO1IPh8dPSzW1NE8tPSQC3AUVXyZpfZISn5ODeJU/5ebfBDLzmZm00c62XY5QGyuY3jz+UHlO1iifQtpjvFFC16lhWvRN1iKtdg7Sv5WsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oroj7Ci6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oroj7Ci6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749806831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uggfBUR9d238l1g+jci/3gzcAR2fLsDD8UO38owVDeE=;
	b=Oroj7Ci6csAvB/+VK4l14P27cU6ZDmTjfaF9OOieYqGQPTgR/wAI7DAXX2n9Be+thuDxni
	A8fuRx1lK84tbxv347zl8BipAhoP+OmX7xQlXi2Zu8yyXXANpHk3OuWgxtnkPY6ZesFhJR
	OEp2DeuKlBEywIyFKRUWlrzL7WGGvBk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-qTes6yXfM8SODeJvgmdv2Q-1; Fri, 13 Jun 2025 05:27:09 -0400
X-MC-Unique: qTes6yXfM8SODeJvgmdv2Q-1
X-Mimecast-MFC-AGG-ID: qTes6yXfM8SODeJvgmdv2Q_1749806829
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530623eb8fso14872185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806828; x=1750411628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uggfBUR9d238l1g+jci/3gzcAR2fLsDD8UO38owVDeE=;
        b=ofebfwn2mmF5YBq63AP1Vgivah7RTGgAA91B5wpTMXOyLjOK1UVpJet5JyzjYX0wcg
         JViJdidOGWJmvYvBhXXrow+Evb7OVL9VzzV2k2IiOFAxIeIYV9MaB3gUzOefFdwbgYoF
         aSOGj3ZJcNEuExpIlBuTgKe4/+SdHNYcvtxWkm3yIXzaO8dVy62EPWc5bo1fE90xHJ0N
         +ZQvnJkxV9f0k85xVBEnQjQ3L7X6oZ5SGg1IeCk5qlkK/QEvRN3u01lpi3tXgXELUyCJ
         Fuo/CVksdEWVLc0hCjnggwwJPmYBnwRw+5BqMkD0kE029FsN7JT+jPb7RMTAHbXR32Q7
         mCrQ==
X-Gm-Message-State: AOJu0Yy+u07j/EecHTocKbYW3pA5F4EQ1akkkfWU8H4IHtvTQ8Tssc5k
	NFl3tAMu2emoNp0db+Uu+NEHYLCH76WrQc0UF5svsNGjQGkGTQwyG12jytewe2w7exhzv21gj/L
	JGB1+6AnAhT4onWxVf7d/T1y57+i8d7M8YMOsAX8j5vu8rFpKSBZGHkaSE+8UYBTYCAM0ctk9r8
	3oOCvwm8FpyJEInsSt9mE2r1GQMrEnk/FsdhzXZSioAPSSNnxn
X-Gm-Gg: ASbGncsKACijYZ0sB7zq2CzNoHUbqgKoG+ZjYE60ukQo+ou1ou5HXeRQmYT3G7ond3S
	geLbi5MuZxJEwva2TAsZJ+KVKm/awHgSD7QlfIFKR3gcNKlUnK1M3WbGILldUuhKytS0wUcEJJU
	TjuJ2MeMqk+hqhzCF64J732rE3gaEMlkjRIDu8OLI9A1rzyucYHGPVcLjtIs4cxM4EVCvptpjpn
	utPdlpMcXV39fF9RmbzmzVyVzvC1hCqCQVX40Ec5MGrgHyot35zQsdrMBN/n247XaYrfCzScatP
	S2f289yrPoag7eiWud8o5h9pJuA+T5KQ2oe9B88ISUwWkdm6tgVrfUiqi+kHBJyfFI1Kyr54b+8
	caeRKVHQ=
X-Received: by 2002:a05:600c:3555:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-45334ae3072mr20022175e9.1.1749806828596;
        Fri, 13 Jun 2025 02:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+Xfy0kGImh9fcGzc/29deoEfQtCD94y9Y0vrqw5H+9WvgHxYhYPUGGxGlHloUQMOpNTtnSw==
X-Received: by 2002:a05:600c:3555:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-45334ae3072mr20021745e9.1.1749806828156;
        Fri, 13 Jun 2025 02:27:08 -0700 (PDT)
Received: from localhost (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b28240sm1774029f8f.72.2025.06.13.02.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:27:07 -0700 (PDT)
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
Subject: [PATCH v3 2/3] mm/huge_memory: don't mark refcounted folios special in vmf_insert_folio_pmd()
Date: Fri, 13 Jun 2025 11:27:01 +0200
Message-ID: <20250613092702.1943533-3-david@redhat.com>
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

Marking PMDs that map a "normal" refcounted folios as special is
against our rules documented for vm_normal_page(): normal (refcounted)
folios shall never have the page table mapping marked as special.

Fortunately, there are not that many pmd_special() check that can be
mislead, and most vm_normal_page_pmd()/vm_normal_folio_pmd() users that
would get this wrong right now are rather harmless: e.g., none so far
bases decisions whether to grab a folio reference on that decision.

Well, and GUP-fast will fallback to GUP-slow. All in all, so far no big
implications as it seems.

Getting this right will get more important as we use
folio_normal_page_pmd() in more places.

Fix it by teaching insert_pfn_pmd() to properly handle folios and
pfns -- moving refcount/mapcount/etc handling in there, renaming it to
insert_pmd(), and distinguishing between both cases using a new simple
"struct folio_or_pfn" structure.

Use folio_mk_pmd() to create a pmd for a folio cleanly.

Fixes: 6c88f72691f8 ("mm/huge_memory: add vmf_insert_folio_pmd()")
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Tested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 59 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 49b98082c5401..d1e3e253c714a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1372,9 +1372,17 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	return __do_huge_pmd_anonymous_page(vmf);
 }
 
-static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
-		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
-		pgtable_t pgtable)
+struct folio_or_pfn {
+	union {
+		struct folio *folio;
+		pfn_t pfn;
+	};
+	bool is_folio;
+};
+
+static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
+		pmd_t *pmd, struct folio_or_pfn fop, pgprot_t prot,
+		bool write, pgtable_t pgtable)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
@@ -1382,8 +1390,11 @@ static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 	lockdep_assert_held(pmd_lockptr(mm, pmd));
 
 	if (!pmd_none(*pmd)) {
+		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
+					  pfn_t_to_pfn(fop.pfn);
+
 		if (write) {
-			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
+			if (pmd_pfn(*pmd) != pfn) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
 				return -EEXIST;
 			}
@@ -1396,11 +1407,20 @@ static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		return -EEXIST;
 	}
 
-	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
-	if (pfn_t_devmap(pfn))
-		entry = pmd_mkdevmap(entry);
-	else
-		entry = pmd_mkspecial(entry);
+	if (fop.is_folio) {
+		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
+
+		folio_get(fop.folio);
+		folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
+		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+	} else {
+		entry = pmd_mkhuge(pfn_t_pmd(fop.pfn, prot));
+
+		if (pfn_t_devmap(fop.pfn))
+			entry = pmd_mkdevmap(entry);
+		else
+			entry = pmd_mkspecial(entry);
+	}
 	if (write) {
 		entry = pmd_mkyoung(pmd_mkdirty(entry));
 		entry = maybe_pmd_mkwrite(entry, vma);
@@ -1431,6 +1451,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
+	struct folio_or_pfn fop = {
+		.pfn = pfn,
+	};
 	pgtable_t pgtable = NULL;
 	spinlock_t *ptl;
 	int error;
@@ -1458,8 +1481,8 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
-			pgtable);
+	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
+			   pgtable);
 	spin_unlock(ptl);
 	if (error && pgtable)
 		pte_free(vma->vm_mm, pgtable);
@@ -1474,6 +1497,10 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct mm_struct *mm = vma->vm_mm;
+	struct folio_or_pfn fop = {
+		.folio = folio,
+		.is_folio = true,
+	};
 	spinlock_t *ptl;
 	pgtable_t pgtable = NULL;
 	int error;
@@ -1491,14 +1518,8 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 	}
 
 	ptl = pmd_lock(mm, vmf->pmd);
-	if (pmd_none(*vmf->pmd)) {
-		folio_get(folio);
-		folio_add_file_rmap_pmd(folio, &folio->page, vma);
-		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
-	}
-	error = insert_pfn_pmd(vma, addr, vmf->pmd,
-			pfn_to_pfn_t(folio_pfn(folio)), vma->vm_page_prot,
-			write, pgtable);
+	error = insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot,
+			   write, pgtable);
 	spin_unlock(ptl);
 	if (error && pgtable)
 		pte_free(mm, pgtable);
-- 
2.49.0

