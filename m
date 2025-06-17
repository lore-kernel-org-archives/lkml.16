Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698E2ED843
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175035; cv=none; b=dZK0OVMbV9HTrzdaVrHoSuYLXVYvAPwZ6jgZjjkS5QHXnm8LsN4P1ZOc1Sz0dJuLf6vbwySjPze+ukBa9l7pU1Ss32m5gZGl/UoBfhWjJWn7FribukVqB2lXHKZsLf3zbi/nsB3wfRkIgExilvES67YHELP7KgkBacSZ7+PQNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175035; c=relaxed/simple;
	bh=gfOK1w8At4LCO+SEz2YxE1sL/b3knNVAuIBGQzCExJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3mQyGGQVoszh1BDZucy+txuNzsLaMKKkGJYfONXjg1v0KSVyc+Bo3mQJZOJmlA5HBOlSYjT9WZLW7/F0TiERV2/sd2RKe7SSb/io/gd3/DLnaBLlzYD8Lvt5nKtcrLHRsujFkupZIWeBV07cqotbeDqxBOGup/R4x+kijQ45r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWRBb6bZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWRBb6bZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4hXdfl2BxaEs0JquHL/H5jXrrSdl8LRqFfGRUF6aUs=;
	b=LWRBb6bZ2Z5q5H37/6a19Fy8rnQnzW6tO4tCL9e2vYVTJtAK3pfUIPqpIPWiN5DUod0t5c
	Q6GhzxzS8cH4Wo9uTxOqDCH71hQWgQVh0eecxXuCgAykEotKypxhAWDovfwGPFoWlrOb9o
	ruWOGk+yJh5IhdpydUZO4RH4cpt1Tbw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-hRgb-HucOey_TeIhho_60A-1; Tue, 17 Jun 2025 11:43:51 -0400
X-MC-Unique: hRgb-HucOey_TeIhho_60A-1
X-Mimecast-MFC-AGG-ID: hRgb-HucOey_TeIhho_60A_1750175030
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so1596753f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175030; x=1750779830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4hXdfl2BxaEs0JquHL/H5jXrrSdl8LRqFfGRUF6aUs=;
        b=aAcZbliPIr16hCPE/PFyZYrF8aPDK/TG04UCnNRbv01peWxcqjEEYrdvVtpk0t2wky
         V08hgA+VBtdOTcCndZ8eNxpWNe5THCzTvSABRWvcQ1aleWVFo4unFuFmdX/xZRk6hZMB
         R5RjK5zJUh1zTGlZVJVfAs87ay2gkiabYAaCZ3l+0pjooU+8yNXpgNY11+N4h5aGmF0i
         N5QFsBfNHvnWR1lVBMwvkQcryzOsuRC7tWtNj9R6Erxc0pOJiDCAFyrwGqNPjPyYmpFc
         ZjiZljYfXXHKx59L3GEmwcKjplj6+rzhHagAPh+vG7gwUr90mL/rA2TziHyZGTVL8eMW
         mu8g==
X-Gm-Message-State: AOJu0Yw79GUlp2fUvpiHGGoVem6l0aqtbAWPh7TIvCjWmtjz1W8/pGL5
	7+ZMLVETDgCp8AoNQgSTo976S2Nm/hx8Iv8x9CI8F+NGjUQipmx7ILMmUIuGNGyG2U7N8LZLWOE
	D5iYNPSCod9FvxmgNLBYjeAknrJubzQmG420+1qAMOWnrQvDDqkSVmJS6w5IWrmRnt16hWSJLZx
	ayPWvQRrcv2l7kC15Skn5+0lNsi+jryzDXVde3xgwEZKmmBsIC
X-Gm-Gg: ASbGncumaoByK+CmLR6KSQ0DuuJMhp/tfXERsPI0BvJyZRbm0+qXfzZvv/rc39Y2gON
	VuzICtNfG3jKulo3bEaZ9H8AJ8Z2790A01iWSKy610iLGhD4tsPIloli+3624B/pH7gFxcBgTP8
	mIPVz0N+CtyjSm81IFg0Y4pSqC1wGaF66yVOCR6orjyE8ae7voT5cWlqt+SYor9VQYUD1HQIjE5
	+V3Khqw2fGIkt9LmegsDMPQtvtmlXF2I0967DzPI5T9ARpLXbIVHewIg/DQkr+xjsU30jTYp8cv
	tgAIp9Z/tU31HmPrrX1CbyXd0Dt/l+wEuwIlLdySU1+94/dum4ZJ1YAYGvQr8T2nhmi2d/0KKjN
	qNN5ByA==
X-Received: by 2002:a05:6000:1884:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a56d821e4dmr12961334f8f.16.1750175030047;
        Tue, 17 Jun 2025 08:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcoD8JqLOB4EjbN+k5qD0zJS7SAB63dB1ZbzMQjH6b78ztWbJgN3nPYj9/mZ7cyKIKJjAtyA==
X-Received: by 2002:a05:6000:1884:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a56d821e4dmr12961278f8f.16.1750175029492;
        Tue, 17 Jun 2025 08:43:49 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a54a36sm14542075f8f.15.2025.06.17.08.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:43:49 -0700 (PDT)
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
Subject: [PATCH RFC 01/14] mm/memory: drop highest_memmap_pfn sanity check in vm_normal_page()
Date: Tue, 17 Jun 2025 17:43:32 +0200
Message-ID: <20250617154345.2494405-2-david@redhat.com>
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

In 2009, we converted a VM_BUG_ON(!pfn_valid(pfn)) to the current
highest_memmap_pfn sanity check in commit 22b31eec63e5 ("badpage:
vm_normal_page use print_bad_pte"), because highest_memmap_pfn was
readily available.

Nowadays, this is the last remaining highest_memmap_pfn user, and this
sanity check is not really triggering ... frequently.

Let's convert it to VM_WARN_ON_ONCE(!pfn_valid(pfn)), so we can
simplify and get rid of highest_memmap_pfn. Checking for
pfn_to_online_page() might be even better, but it would not handle
ZONE_DEVICE properly.

Do the same in vm_normal_page_pmd(), where we don't even report a
problem at all ...

What might be better in the future is having a runtime option like
page-table-check to enable such checks dynamically on-demand. Something
for the future.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0163d127cece9..188b84ebf479a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -590,7 +590,7 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 
 	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
 		if (likely(!pte_special(pte)))
-			goto check_pfn;
+			goto out;
 		if (vma->vm_ops && vma->vm_ops->find_special_page)
 			return vma->vm_ops->find_special_page(vma, addr);
 		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
@@ -608,9 +608,6 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (vma->vm_flags & VM_MIXEDMAP) {
 			if (!pfn_valid(pfn))
 				return NULL;
-			if (is_zero_pfn(pfn))
-				return NULL;
-			goto out;
 		} else {
 			unsigned long off;
 			off = (addr - vma->vm_start) >> PAGE_SHIFT;
@@ -624,17 +621,12 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 	if (is_zero_pfn(pfn))
 		return NULL;
 
-check_pfn:
-	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_pte(vma, addr, pte, NULL);
-		return NULL;
-	}
-
 	/*
 	 * NOTE! We still have PageReserved() pages in the page tables.
 	 * eg. VDSO mappings can cause them to exist.
 	 */
 out:
+	VM_WARN_ON_ONCE(!pfn_valid(pfn));
 	VM_WARN_ON_ONCE(is_zero_pfn(pfn));
 	return pfn_to_page(pfn);
 }
@@ -676,14 +668,13 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	if (is_huge_zero_pmd(pmd))
 		return NULL;
-	if (unlikely(pfn > highest_memmap_pfn))
-		return NULL;
 
 	/*
 	 * NOTE! We still have PageReserved() pages in the page tables.
 	 * eg. VDSO mappings can cause them to exist.
 	 */
 out:
+	VM_WARN_ON_ONCE(!pfn_valid(pfn));
 	return pfn_to_page(pfn);
 }
 
-- 
2.49.0

