Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED705226D02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748985403; cv=none; b=gJ0F81TQ5pU8jK2oK6OrgAF1nYJCVNQzCoTmTa5Pp/2FQFApfp8Ifq6ukpVWyoJ1nbRO8vKnIi7KiEkPC5qB+YS/JM4XWeMaA3nle8Kg/R2we2NFn8+PE3tjPnCUSWUVk+nQHCiQ0KAcirdF6SBHbkHhb9JdUcEbxwnlfnwDReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748985403; c=relaxed/simple;
	bh=8rYDS4TO8ABtj37UFmxpQriDVqi32huOFvyDHq7Vzio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgrA+C/dXLphz6lZmQAGGFSxYofL39K5lZ67kxmNiI0VVCM5z6GOdLvZ+f8Dk8RT1OM5jnUZ7HP8PtGGRGtBI2GGCs9cVBoUMEdoOf8oq4QYdH1sJsIkQaB097FT/AUqDYQmOvhb+8pNQpvp2mFKXQMbpNb5nOCdH7NNVAss6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJvf2Sq6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJvf2Sq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748985401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mm1BYtQxm3N2Ps8LPBW/KCN7FYFGa741SkgBjReTkwo=;
	b=CJvf2Sq6XZs31mjIUrOJEjd5B2UNxo46wxWOzbuAnk0j4R+q7pS9y/KenQKxKnmAz589+S
	FLE27HxAi6oUITM6RIFnzxvtBA32jI6eVyaXhLHpFlEvL8IPP1KAl0J8wmY1CPWiUOVVbq
	2NmoW2LJ04NS3Qi2PgBSqHGvGJrYQCw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Ldr7GeNuM2-zwmru3vkEYA-1; Tue, 03 Jun 2025 17:16:40 -0400
X-MC-Unique: Ldr7GeNuM2-zwmru3vkEYA-1
X-Mimecast-MFC-AGG-ID: Ldr7GeNuM2-zwmru3vkEYA_1748985399
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso45028495e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748985399; x=1749590199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mm1BYtQxm3N2Ps8LPBW/KCN7FYFGa741SkgBjReTkwo=;
        b=WGTqV8Y7/CNr2OVZzL7LQa9YLmB/ysiDI7FWAEXC23YwvUSCX8w3OkxZMjFR0XVBYg
         3UOps1/jjNXEP9ctCgeSv4pJlKaYhnNRoIu2wPB/ikeyP3FzvDthfxNL4nmQIu7UYq8+
         uwkRYj8dGFAOAJ4LLRQErcZPQL03pTCAL6DmxBWAURbxjzo/4a4MbDSVfiAq9oVy4pzf
         SAHfHJIf55ZvFjh9IvXZ4nlJxqNv7sr61J6MBvMoMojNnuHcAxTHNJyJ6hnNVxkRmq/s
         A1uIKwVDMTbfVC5BMqkpNBfuoQBbckoVzbXpVWMbwe09kAQZ93SYJ1yn6KgeEMHyb3n9
         RuQA==
X-Gm-Message-State: AOJu0YxIwHx4K0PRyDt6RYWTtmbDHxAsD1e1WDhUFLg89oyck7p/MTJC
	Utqv/kWTZEEl303wJ0zoRR4uXeHqGyQekDEE1HTUCxsek99YhFyib9WWggAdpLyNTo8sApYneFl
	96Rbwz7KWEr+WjqTBAwszPhZzztam7se4kVF97rs4VyTdkVMD/Twa5726B3q8I8HMg/WZlZ/Efz
	d08V9AmBWl0OZi7RoDDNsC6vEOucpOnZEXv1htl1aNPNgUN2dM+6g=
X-Gm-Gg: ASbGnctN9dh3M7vEeEC73YzPegYB/nfQl8sw5R7y0dBvIDwzGgG8EYzarTMIDZwdjMu
	CrSPpEQ4LgU0MmV+dDO1l63o9tZIrbq6ssjjroX9D/RvufMZPXPmIpTF7Duux6LVhFfly39Ljzh
	L8obIAD40DqLVtYLCIySJqvP/S1IJ3N3AKmXukd5w2z8GC0gyGt+HfsRm5YFCXDUhVde7DkEwYj
	MyYwqoY9LwBjw1tktDFuQG5n80IdcC12jXgeku9K5CKXmUFSrd16O/m9ZQe+xegsO8A2WkrnCcA
	8pRCvAvAn4PMEDVGU+RjNUyWmPT25DBZULb0s5r9Xh47rM/qPHw915/wznqO79zV2hbZ8GIM
X-Received: by 2002:a05:600c:1987:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-451f0a729d0mr2203825e9.3.1748985398890;
        Tue, 03 Jun 2025 14:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkS98RFt7+3OnGuaG+p0pWOXJwdXIjQziuSpjs39IDB1rfs5Wk39SoikwZ5SKry/PJpnQWlQ==
X-Received: by 2002:a05:600c:1987:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-451f0a729d0mr2203405e9.3.1748985398434;
        Tue, 03 Jun 2025 14:16:38 -0700 (PDT)
Received: from localhost (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fa21e4sm180154785e9.11.2025.06.03.14.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 14:16:38 -0700 (PDT)
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
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v1 1/2] mm/huge_memory: don't mark refcounted pages special in vmf_insert_folio_pmd()
Date: Tue,  3 Jun 2025 23:16:33 +0200
Message-ID: <20250603211634.2925015-2-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603211634.2925015-1-david@redhat.com>
References: <20250603211634.2925015-1-david@redhat.com>
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

Fix it by just inlining the relevant code, making the whole
pmd_none() handling cleaner. We can now use folio_mk_pmd().

While at it, make sure that a pmd that is not-none is actually present
before comparing PFNs.

Fixes: 6c88f72691f8 ("mm/huge_memory: add vmf_insert_folio_pmd()")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d3e66136e41a3..f9e23dfea76f8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1474,9 +1474,10 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct mm_struct *mm = vma->vm_mm;
+	pmd_t *pmd = vmf->pmd;
 	spinlock_t *ptl;
 	pgtable_t pgtable = NULL;
-	int error;
+	pmd_t entry;
 
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
@@ -1490,17 +1491,41 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 			return VM_FAULT_OOM;
 	}
 
-	ptl = pmd_lock(mm, vmf->pmd);
-	if (pmd_none(*vmf->pmd)) {
+	ptl = pmd_lock(mm, pmd);
+	if (pmd_none(*pmd)) {
 		folio_get(folio);
 		folio_add_file_rmap_pmd(folio, &folio->page, vma);
 		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
+
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (write) {
+			entry = pmd_mkyoung(pmd_mkdirty(entry));
+			entry = maybe_pmd_mkwrite(entry, vma);
+		}
+		set_pmd_at(mm, addr, pmd, entry);
+		update_mmu_cache_pmd(vma, addr, pmd);
+
+		if (pgtable) {
+			pgtable_trans_huge_deposit(mm, pmd, pgtable);
+			mm_inc_nr_ptes(mm);
+			pgtable = NULL;
+		}
+	} else if (pmd_present(*pmd) && write) {
+		/*
+		 * We only allow for upgrading write permissions if the
+		 * same folio is already mapped.
+		 */
+		if (pmd_pfn(*pmd) == folio_pfn(folio)) {
+			entry = pmd_mkyoung(*pmd);
+			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
+			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
+				update_mmu_cache_pmd(vma, addr, pmd);
+		} else {
+			WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
+		}
 	}
-	error = insert_pfn_pmd(vma, addr, vmf->pmd,
-			pfn_to_pfn_t(folio_pfn(folio)), vma->vm_page_prot,
-			write, pgtable);
 	spin_unlock(ptl);
-	if (error && pgtable)
+	if (pgtable)
 		pte_free(mm, pgtable);
 
 	return VM_FAULT_NOPAGE;
-- 
2.49.0

