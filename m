Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2152EE603
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175040; cv=none; b=Iq0m6gLS+NBhdVkqzXd0Wwfq/8b23ho47J81TBbQbo1DQCdBJkWuToRRPkx4CvQZq6WwUpBoOYhfCW37NdXi+Q/ykxHl1X//CjdMAEhqqBAOIN4lqIFVQ/tCJtVXNf2waYZDSXCpMJEcPvXGLiaz5evNrizJWYVTGSQZIx7Nlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175040; c=relaxed/simple;
	bh=QWNOR+1eFkXIAwi4188jXafhSE+uLJ9EpozLL4/g7bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPu5ixi7NV2+wNmqmHe4XW7pvwjtu5tASAFSkIF6m2g3E7U0OlK9QXhR/HCJ+E5GvDGpqzQwYMR9HeCmsbLx07eMu7iX08DJS23mJoPySZFM3N6BNLCooCBJIYeXsw3x3KY6v2mNj61qkGAavmBinaHj59YJEW4V0AhYPrd7k58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fpMMW94D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fpMMW94D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIojkghjiOfK3qS9mo4araH3tv/iIJHq9NK1Pu9RhVw=;
	b=fpMMW94DQPqVLGF7wHVQtxI2EHwx/DaQmeyHf7di0xl8BLAhzMiE5u5eBWH0F8uGr0KYHm
	92dhc6E6OYy36nDBrIrGztLH+v5njslOVd1EZYPgWXUiJVlL4IEdzMfbLWo0i8eKTxVEZJ
	fpklndtunzyQD+Mzu3vZLmlheKUsBH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Rwexx-4UO8evmcYEWY56kQ-1; Tue, 17 Jun 2025 11:43:55 -0400
X-MC-Unique: Rwexx-4UO8evmcYEWY56kQ-1
X-Mimecast-MFC-AGG-ID: Rwexx-4UO8evmcYEWY56kQ_1750175034
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso2412962f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175034; x=1750779834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIojkghjiOfK3qS9mo4araH3tv/iIJHq9NK1Pu9RhVw=;
        b=kz26qZBEpGo1YW3YsonpqDcbWA7Q8Mpyk+mD9suwP/ZpCsXvKqUM/oLnNiODTPm6nu
         iiLkbB92kUzTUJM1qK97UtgUjN33UDUsg6TSWYvGUimZUlBbTJ6SkY66GKSa4DDEw8K3
         61pWlIjjUBX2xjWcWp5Xpq7vzPa8/LZDNW6OcpuB1ucfuq3+ppp7C0YdE6zPi1QdjQeE
         k1B/eRpH4s+UM+FbiuFGhGxOJ1m+YbhqfZp6g1rbRiQlnJHyAkX3lGM+qN4LZiGlFC96
         IIpmm0RGLk68HqdCdfL8QjJuNCwsdzArLMNUmOFRU557CWvFTW7K1wZ43qzawxtk91y6
         GuLw==
X-Gm-Message-State: AOJu0YwJLSFEZr2lNNWPnwnmQ3+S28SLlJ1A9R2OA8Ds8fhenIOj3mps
	9Umgcp8JyT7pkA4Niv84T+f3agt0J5S6B6o6V0ka0i6gUwpZv46kwF4gG52t/lOafw3m9c+xku3
	9Zs6gJN9hcO3a+kLLEDzt3I8HeOZWjbaiL5qXG0e7pnUEJW19dRk1ia0VLn6FODcCovL5qMrsiv
	7pxq5uSIFjNa1gPq+g1AA1N4hvqRU6lPEMCdu1IN17xayewYDp
X-Gm-Gg: ASbGncueNKD9WeeDVRymwrt/WD8xqsClliNnRDEWHx8ZfcAjzoFGk2ap2keeCtxmrVV
	OGJVtYQvGYBX9CDMXWFCtZDyo4ZayqGWrcmJ5nuXkEZ/6f30G5YxieIavtiCdK6r1Sdcut7KXx2
	WKf/N854OzeQtqZrtOUQCX3+0diHyd4Zqzz4PYRuaWx/3Jc5cBt2XbelsXU2e3DEp4w78wuO+Q1
	21oDP2oaueyhIhEywvGXUe9pw7pez2FMSn9l9K4el2XiqTOxbP7e3Hr7JFUJUaNkYBaEVIVz/uk
	iAg3wB2wUwei1LMdYHjSPRDKpOVcGLFtsi0Snq+MnDOtvY1uGovZh7BI3RW4k5UhAwH+choKQSA
	PNZiTYQ==
X-Received: by 2002:a05:6000:178e:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a572e92862mr10792713f8f.49.1750175034398;
        Tue, 17 Jun 2025 08:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuUUJS22/cv8lxbktZwrzLsxc7yFEH6CvMGkxQ5Sx5aQp7V5zrRMyeFF5jQJ+MyIsqVh3uOw==
X-Received: by 2002:a05:6000:178e:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a572e92862mr10792665f8f.49.1750175033907;
        Tue, 17 Jun 2025 08:43:53 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a543d9sm14118342f8f.5.2025.06.17.08.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:43:53 -0700 (PDT)
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
Subject: [PATCH RFC 03/14] mm: compare pfns only if the entry is present when inserting pfns/pages
Date: Tue, 17 Jun 2025 17:43:34 +0200
Message-ID: <20250617154345.2494405-4-david@redhat.com>
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

Doing a pte_pfn() etc. of something that is not a present page table
entry is wrong. Let's check in all relevant cases where we want to
upgrade write permissions when inserting pfns/pages whether the entry
is actually present.

It's not expected to have caused real harm in practice, so this is more a
cleanup than a fix for something that would likely trigger in some
weird circumstances.

At some point, we should likely unify the two pte handling paths,
similar to how we did it for pmds/puds.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 4 ++--
 mm/memory.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8e0e3cfd9f223..e52360df87d15 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1392,7 +1392,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
-		if (write) {
+		if (write && pmd_present(*pmd)) {
 			if (pmd_pfn(*pmd) != pfn) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
 				return -EEXIST;
@@ -1541,7 +1541,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
-		if (write) {
+		if (write && pud_present(*pud)) {
 			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
 				return;
 			entry = pud_mkyoung(*pud);
diff --git a/mm/memory.c b/mm/memory.c
index a1b5575db52ac..9a1acd057ce59 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2137,7 +2137,7 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
 	pte_t pteval = ptep_get(pte);
 
 	if (!pte_none(pteval)) {
-		if (!mkwrite)
+		if (!mkwrite || !pte_present(pteval))
 			return -EBUSY;
 
 		/* see insert_pfn(). */
@@ -2434,7 +2434,7 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 		return VM_FAULT_OOM;
 	entry = ptep_get(pte);
 	if (!pte_none(entry)) {
-		if (mkwrite) {
+		if (mkwrite && pte_present(entry)) {
 			/*
 			 * For read faults on private mappings the PFN passed
 			 * in may not match the PFN we have mapped if the
-- 
2.49.0

