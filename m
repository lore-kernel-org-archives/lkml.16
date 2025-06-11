Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1C280CFA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643636; cv=none; b=YjUGnLQF47wPFzUMbGYwCadN+xyNy9dZPOPNRwpTa9xHgLIvmJyBjBrWN9cCJimezrfQRjkOONTv4p0QI2dAgmZUIHZtwsg8MGmdgwOOdVfbHimOhnDSS178bbITGP9n6XycVQbUq2DjCH2UOdj5JGFoO+3a4z1a4W/Wi9+nY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643636; c=relaxed/simple;
	bh=d7UzkQtVY7kuIxcI/EZc5YSadWXv/sCE0nDIA2XsSqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gm9if1Lxnz2mxqvxXQlcvFJXwO077pQaYCzS7lxyuk87ghX0PF8B54Py/R3j/4H7z5uHKgMSFblI1XeDx/c50a1B0FXALvGAaUMyqbFCdUzBqQq3g/8qBLfcX8BGgqP+1RMPQXmOBLYFPBENvHKTqxVSLN6gUSH9WbUh+7+zr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MZ/d1vD/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MZ/d1vD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749643633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYmY9lqRnj4cw3caoSyKqMYCbf0QdwGbw8D5FFvmOek=;
	b=MZ/d1vD/JZQCVAXLmnvPpbxO35OwortBeI0CrL3eTOcF1B336plHEQ7atpZzw7gqVz7cNt
	Ki0yzVzzhX+8yVUrvVKRNha/V86Mxd/5+SXniOm3+/XvSGp9l1Q9hI4yzagqs7/py2Jy1L
	xQ88tfgV+Q0LOJcVq6ygq2N/ikcpiL0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-3ixmKHoINIOUKv_ImWwKFw-1; Wed, 11 Jun 2025 08:07:10 -0400
X-MC-Unique: 3ixmKHoINIOUKv_ImWwKFw-1
X-Mimecast-MFC-AGG-ID: 3ixmKHoINIOUKv_ImWwKFw_1749643630
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-478f78ff9beso209855191cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643630; x=1750248430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYmY9lqRnj4cw3caoSyKqMYCbf0QdwGbw8D5FFvmOek=;
        b=TN5HWmpn+i/poUA0Digk3YeVXfZHtYr4zN5xH3uWrUVumxXqLLf3FJ9sGRGIH7IXKZ
         u13bPtcXXT21U7if9MOTV3EAsfQx9S9Et4aqdpapS0cO2hm+RXqH6yoJxfXAqvo5juHf
         7FtK4iwuXhMh0fK/Bro3vbnbllXKsRzxwQsYNOqgQ/D76A4w64eb2OjuL5BeqEqUtRCz
         9qIhmNLZ8inYesMlI8ufBQXLulDfqnWjs9Hu6Hw56C58zfzI89KVYIeYeeNb5hfoYWnT
         bxxBAH6bLTFQmVeKYFQ0CqGedbS669XXgsbevgNGPBXvQOx8+hkSZ1AE4S9Q1F1VDll+
         qpgg==
X-Gm-Message-State: AOJu0Yxo/muSitnHRxhh0ZFOZMMyVXbqRi3YSqwgrcCRm+kCWQFwhULK
	qUlzPsmhtF1JyDK+Zq85YtQ7NP3g3082Ma1T12yt6mJhpLC1X4GaaU+BsYPkA6ahpLwtMJejhww
	H+YeDyo70CnBXUHs1R/14QUsUajoj//vrPUXOkusMeMnEbmq3EcCqg2DWaSSIbeBF6Xz80q+X56
	Ur2Pn5t/bk86djOqqJi+9SQXiS8obuQqHCAajlV3z9wFGAGxId
X-Gm-Gg: ASbGncuq8WBuZGaLLCfz+KC4+TjcJNxhVWZtzS5mqpkcLeMAYx8f5qHl1AoA1hsRwEK
	VgstZsx50oPv52Sa5rOj1rtNn4VKZsY3ZpvvMgeCN0Ift6PdtT99/mcd2dOm/3KFrsGnUvZ9e/f
	b8xU1osVbk/stS8AvuBimAq+Oe202oKq9IowvdUdKId3LQPrfSNnF8EVyDjPBKdfVkClZjd0xu1
	idriDCmY6e8oypbjtDK9LE6VLLz0SccK2PVzBm8stqI8CqsimYrTY6YFdToeJmtDldWq5DYyGOO
	UVaDdR4YcqFViiyMHT99F24RA1LGJUUjTC8HXw5BIw==
X-Received: by 2002:a05:622a:258c:b0:499:23e5:a39e with SMTP id d75a77b69052e-4a714b5f095mr41023141cf.18.1749643629449;
        Wed, 11 Jun 2025 05:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFkRu3pD31QY49jF7czwiN04VZspGiT3brE6ESvHTJ+EUAthmLASS1EV2SOMHG5iqhG7+Byg==
X-Received: by 2002:a05:622a:258c:b0:499:23e5:a39e with SMTP id d75a77b69052e-4a714b5f095mr41022301cf.18.1749643628891;
        Wed, 11 Jun 2025 05:07:08 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619865e74sm87713091cf.61.2025.06.11.05.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:07:08 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mm/huge_memory: don't mark refcounted folios special in vmf_insert_folio_pmd()
Date: Wed, 11 Jun 2025 14:06:53 +0200
Message-ID: <20250611120654.545963-3-david@redhat.com>
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

Marking PMDs that map a "normal" refcounted folios as special is
against our rules documented for vm_normal_page().

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
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 58 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 49b98082c5401..7e3e9028873e5 100644
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
@@ -1396,11 +1407,19 @@ static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
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
+		if (pfn_t_devmap(fop.pfn))
+			entry = pmd_mkdevmap(entry);
+		else
+			entry = pmd_mkspecial(entry);
+	}
 	if (write) {
 		entry = pmd_mkyoung(pmd_mkdirty(entry));
 		entry = maybe_pmd_mkwrite(entry, vma);
@@ -1431,6 +1450,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
+	struct folio_or_pfn fop = {
+		.pfn = pfn,
+	};
 	pgtable_t pgtable = NULL;
 	spinlock_t *ptl;
 	int error;
@@ -1458,8 +1480,8 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
-			pgtable);
+	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
+			   pgtable);
 	spin_unlock(ptl);
 	if (error && pgtable)
 		pte_free(vma->vm_mm, pgtable);
@@ -1474,6 +1496,10 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
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
@@ -1491,14 +1517,8 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
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

