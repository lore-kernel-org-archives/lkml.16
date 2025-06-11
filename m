Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0522027AC57
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643629; cv=none; b=Aq9b1b5QdJlgOhg0Lc86DFKhl+PBXjcpq5ptgSaKDkPjo0NKbvbflsjMvs1+rVjXd8rFBtmi4WBuZ/lTPT1ZxlIeKdwW4cQdcFRLeWt65wYAid6YfRO7hzGEKhsD3PFY1f3QTMHWKHNDLs596gUjy4D3aRWfJpltEiqR1PAd770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643629; c=relaxed/simple;
	bh=zKTs78RTRTqS5HP35DRDL4Y0b0mNW3Gu1tDXt0akX1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOjURrN5DC5NL9Di1MvBo9qkJlx12nEycC59TvgcA+Zj6xF02/xw3maSmbrWiwbcsUliNEK3m+3dxH4ERpuzl+j40FRCagjYGj+QxDSkeCXR4BT5cjSuIuxg2uy6ORDjaUh2Z6j9CJ1UCNyt3u7Pc+9QkhXGwi6yVCZe4iYNpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RDKRTyUc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RDKRTyUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749643626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PENtkLUfBH1Z8n7k4h6Ysph6sI1iUW3ZV5Hjz4OJ3o=;
	b=RDKRTyUcWuloDj/R+zaF3acRBOYjmTDutco0YMI7zpXpzyixGozhqlY2bVmTHcT+7CwznU
	XNh+kXglWO6K9JOiIbqeMpHHYmEJaSFHfrZ0CF9BxHqIPHeDALaLN7yhOoo0RSXtjw2y8x
	rA1+oab/kGd4mUEXldN4lZlEHfRUKcw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-QZIuqbeQPdK5cVLmij6tkA-1; Wed, 11 Jun 2025 08:07:05 -0400
X-MC-Unique: QZIuqbeQPdK5cVLmij6tkA-1
X-Mimecast-MFC-AGG-ID: QZIuqbeQPdK5cVLmij6tkA_1749643625
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399070cecso471921985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643625; x=1750248425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PENtkLUfBH1Z8n7k4h6Ysph6sI1iUW3ZV5Hjz4OJ3o=;
        b=olIm6j9xWV9tytTbMdHB53bZt+XeW7MZ77U8BbWaHxjK0WQ8AkqclKSx+5uunpSRYw
         26t1nz9Nogog95Pzd0QqLuRwdGBHBHL3030x+B6kPa7d7DBV5+jmVaeRL/SpLkRDEhxY
         DoNWtCnEDNx4scI54BN3LDTqcDU3iG0xBUljxzYq07dDkQscXO0nkhZg+ngASNSP8+Fm
         KP1YeKQStN6Z3BqZ7ZiPIQ+mGzBLCPsVYAyqTbwbRhxGBCFF2B81FtmUasSemcjg+eO2
         yXC1kJi/gDHnFX9t5IITQJPNcimJITqjqoUyIa01ZHHkFgihg8ATyY5hfQ+iel9flnN0
         lV/A==
X-Gm-Message-State: AOJu0YxaYj+4OjDti8Wu35YLBs6OfG4M9qomYVvOWamt5cHLi2Vn27ze
	kwwIDV2eQQsZHPJACHf3mYc7QvQ1akO7YKce/sqmBKQZZTJyQ64BTMtrBDK478IxGZ2GOYtI3Nv
	bzzH8Vm6sJEnC4N3rp8VLS8ZZ/bsSN1iMSnT7kTJClDEUT2H2hDlFbPKbvx1iSxEfmJqRvT+3QL
	8clPH0TJrHYMGcCG/i78G5VNS8/YrMlDzNSfr5qJcPHJs/2t/f
X-Gm-Gg: ASbGncuQ1jTo6twCbn+QSpjdtuM3jdNW/5imXJ3N7dFjoRmbZMobVdZL8aPEJlyXB9z
	hOlghPRFn0AbwpARHBCv2BoJI1YWTNaizQhGEnS+gHHzRod5+A1/3kxTEdt6bcd/L6YmQP06pQZ
	gVDZ+asdIlNXs6LbJVo/WBFKIHzN9h3kUlur3Hx/XtByyrNOXoEQm1Q9UcviB0GrUZKZxScxFw8
	4/+++IWMFhoT/01RKmAG0IdVlGRu8oJ9EP660K1CkQbl8mejg6RBB4gueAUEvqgSjO0Px3wa6vQ
	V4kY6dY7iYEN38ti9FIPAPrOz0djTUq6ORy9rnDTCA==
X-Received: by 2002:a05:620a:3194:b0:7d0:9ffd:422f with SMTP id af79cd13be357-7d3a89b1b3bmr505264985a.54.1749643625176;
        Wed, 11 Jun 2025 05:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJLjpZ1uY3+YpiReTBDNjkNaFYo7+UKPSqXzU9BVywxK8ty0bHeAi1vwl8x6v5Oh4c1OLQSA==
X-Received: by 2002:a05:620a:3194:b0:7d0:9ffd:422f with SMTP id af79cd13be357-7d3a89b1b3bmr505257485a.54.1749643624636;
        Wed, 11 Jun 2025 05:07:04 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a60c183sm847676485a.58.2025.06.11.05.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:07:04 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mm/huge_memory: don't ignore queried cachemode in vmf_insert_pfn_pud()
Date: Wed, 11 Jun 2025 14:06:52 +0200
Message-ID: <20250611120654.545963-2-david@redhat.com>
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

We setup the cache mode but ... don't forward the updated pgprot to
insert_pfn_pud().

Only a problem on x86-64 PAT when mapping PFNs using PUDs that
require a special cachemode.

Fix it by using the proper pgprot where the cachemode was setup.

Identified by code inspection.

Fixes: 7b806d229ef1 ("mm: remove vmf_insert_pfn_xxx_prot() for huge page-table entries")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d3e66136e41a3..49b98082c5401 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1516,10 +1516,9 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 }
 
 static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, pfn_t pfn, bool write)
+		pud_t *pud, pfn_t pfn, pgprot_t prot, bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	pgprot_t prot = vma->vm_page_prot;
 	pud_t entry;
 
 	if (!pud_none(*pud)) {
@@ -1581,7 +1580,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pud_lock(vma->vm_mm, vmf->pud);
-	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
+	insert_pfn_pud(vma, addr, vmf->pud, pfn, pgprot, write);
 	spin_unlock(ptl);
 
 	return VM_FAULT_NOPAGE;
@@ -1625,7 +1624,7 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
 	}
 	insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)),
-		write);
+		       vma->vm_page_prot, write);
 	spin_unlock(ptl);
 
 	return VM_FAULT_NOPAGE;
-- 
2.49.0

