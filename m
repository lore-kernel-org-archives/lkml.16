Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E932F5467
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175049; cv=none; b=hQeCJSzej7V/28tPpg4/5ouxdftr/P4bOxbO1Ex9wLB8dRk5Iwqh6oTCVdp/ebLI8iMP3f5AiE79+8NQZ3JqEPGm79p8FsroaOaT35iC2InQDms5ZXDbrULxJZwXuEgmWHjDLKh5paTy2BTeh2qn38oJGvEycjx31aIetdiKRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175049; c=relaxed/simple;
	bh=3FCxZ8zDcceG27Pi1n4ipPgji5pZnfBRAxjPk2GRm/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5MwmX8+RLxTo/4JWMBw3SSMzwwXwK0ASfUpcR9zUJGfHWwwMOxjIaFZ0uCJ0E/twO+F5IwFPaHSOIYYwTSabD1Jn4bLmVV/l5YN3Yn4g/2B33CEVvGg9qChE8/pT+zZNGCz8NHELOcdObVBXs/rQh/7NxrcMGacLM+EgEIjCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGyuA4lb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGyuA4lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gs4285BVc9AdSpQGnU9ous2Jq7UzfwNWKMh/gkXW9pc=;
	b=IGyuA4lb6EyOZvI83QJ6eqBP7UXjqYJMk+pK+JTY1B4MbJAPXBhhgAeYMXf+XQe4K8ACkM
	7dhZ5zw7HhVr3aYwn/IJzGJonIFRw19dVfkUN4v/bcXHNc087kuaIs5CD2O8gglPclJfBN
	65c/njgF3jsBXVbsV2aAdlSX16jFaqo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-Lt9pj-g1PSyPASj2ycDhvg-1; Tue, 17 Jun 2025 11:44:06 -0400
X-MC-Unique: Lt9pj-g1PSyPASj2ycDhvg-1
X-Mimecast-MFC-AGG-ID: Lt9pj-g1PSyPASj2ycDhvg_1750175045
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so3556376f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175044; x=1750779844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs4285BVc9AdSpQGnU9ous2Jq7UzfwNWKMh/gkXW9pc=;
        b=avVEaeOTIdvcLuEDWgpjBY/6wggdOJ4/TdSugQ2B/YRslQKgWDsr/jVdPAkV4ucdyI
         0FNW0PE41d28ofsfpmK+R3iF2FqcctC+Y4zpb8tqyVdhW5dJ+nnOFgUzAn9wwP5brWS4
         tEwNndVGxHbu2HXiELDuWnKaqUhXMHT6HYEf5GpYtPZWpee0Hd1xN/RlWMSV8RWbw5Mm
         VhNYPlBbJ7NsSSDIT7C/xmP949cEavfKwUBfVizNB+m3M5CF+hKaiY7jjJ0sESEAyAiC
         4YUSkaVHnx/FqqNe84uN7zh/MGzfIaxAaqmW+wniaGscdAJYGt8rZNLpT0knrFNs/Zjz
         qbPQ==
X-Gm-Message-State: AOJu0YyIl5Ut/2qC5q/CQc97yJMKQsxLNuz38dS3HUf2gF1lHNy7Zh/i
	x3BGwUGbRj3GZC0QuXZ71WNZek5blWn0f1HUpBOn1p7cCZ0QnhfTikisA9YRsyV8ZzZd/p0qqJU
	TfNR0n/Tms1jU7g9/dPcccoVn7lKPaxAeSzNkDP/Xb9W3uGuMzw+ufBkcwMq7iWU1rRNsutjc+E
	imVarp9wlfuWlGifBhtA5HXXiJWEroEjchhB+IwhWFViJTldS0
X-Gm-Gg: ASbGnctZcfP4r+8ejMa/EMdEsU9RyWugqv05/xDJT/MQMnLrd82NIA3bNljOx1OEaUO
	wzTUbVss6Mp+/a4aad9a3yn/hcZ+QItXc/gwC2YKqlAu7M/GvoTm8n+JJ5Trx2lIN52v6CO4cM4
	WMBrqwxN7pq6nqGpkoxi1ZWNvD0r716mKBna0UvXAlLS12XXmQhLI5qa/EKutW5Xauahrb25Pp9
	K209r44o8NY3wLjrFpsshIF9+RxToeHsYJ6pEM87N81jg7LZjjLlE6vh4TRi5G3qOVdQiJct03I
	JESJs0fj6P0in3Kch7/v9NGQlM+br2JmClXe5miC3xFiLr7eT3l1SIroszznrIOBHSHnM1fV6Fl
	dklFTgg==
X-Received: by 2002:a05:6000:1acb:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a572e886ddmr11868390f8f.53.1750175044624;
        Tue, 17 Jun 2025 08:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo66SwAdCOqzoQeskB1+JNa+FajMdh1o2TiDbiY6YeDDtEJko8k8Xcyqba8MVeHhWH2HTahA==
X-Received: by 2002:a05:6000:1acb:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a572e886ddmr11868335f8f.53.1750175044129;
        Tue, 17 Jun 2025 08:44:04 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b28240sm14420724f8f.72.2025.06.17.08.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:44:03 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH RFC 07/14] fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
Date: Tue, 17 Jun 2025 17:43:38 +0200
Message-ID: <20250617154345.2494405-8-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617154345.2494405-1-david@redhat.com>
References: <20250617154345.2494405-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's convert to vmf_insert_folio_pmd().

In the unlikely case there is already something mapped, we'll now still
call trace_dax_pmd_load_hole() and return VM_FAULT_NOPAGE.

That should probably be fine, no need to add special cases for that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/dax.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4229513806bea..ae90706674a3f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1375,51 +1375,24 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 		const struct iomap_iter *iter, void **entry)
 {
 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
-	unsigned long pmd_addr = vmf->address & PMD_MASK;
-	struct vm_area_struct *vma = vmf->vma;
 	struct inode *inode = mapping->host;
-	pgtable_t pgtable = NULL;
 	struct folio *zero_folio;
-	spinlock_t *ptl;
-	pmd_t pmd_entry;
-	unsigned long pfn;
+	vm_fault_t ret;
 
 	zero_folio = mm_get_huge_zero_folio(vmf->vma->vm_mm);
 
-	if (unlikely(!zero_folio))
-		goto fallback;
-
-	pfn = page_to_pfn(&zero_folio->page);
-	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn,
-				  DAX_PMD | DAX_ZERO_PAGE);
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
-	if (!pmd_none(*(vmf->pmd))) {
-		spin_unlock(ptl);
-		goto fallback;
+	if (unlikely(!zero_folio)) {
+		trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
+		return VM_FAULT_FALLBACK;
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
-		mm_inc_nr_ptes(vma->vm_mm);
-	}
-	pmd_entry = folio_mk_pmd(zero_folio, vmf->vma->vm_page_prot);
-	set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
-	spin_unlock(ptl);
-	trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_NOPAGE;
+	*entry = dax_insert_entry(xas, vmf, iter, *entry, folio_pfn(zero_folio),
+				  DAX_PMD | DAX_ZERO_PAGE);
 
-fallback:
-	if (pgtable)
-		pte_free(vma->vm_mm, pgtable);
-	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_FALLBACK;
+	ret = vmf_insert_folio_pmd(vmf, zero_folio, false);
+	if (ret == VM_FAULT_NOPAGE)
+		trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
+	return ret;
 }
 #else
 static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-- 
2.49.0

