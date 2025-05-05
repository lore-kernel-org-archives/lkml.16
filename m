Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD426AAB2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469523; cv=none; b=XyJkMEAcZ8HU8lMMLp4xgG6CyjYME8oHSyim3w6b7K2D2IZ7m0QJgM4f3zuOGujf2HQOM/C5ymKjw18sbhCWH2+9OiloQRGyeH+ikIu6nyGxt6D7zJxBx2+Ulr+jf25KY1JPGCNNiZUTr0FKNa4UXZvGWFqi63VqDuGR11i+Yl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469523; c=relaxed/simple;
	bh=65UkHrY6uauKVo2LNFRHclBenNlGQMxHRcwVUD23GXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxdB6G/NUyLIvRuf+CRHLyCOs0zlBHkLpw+RT/MdyJRS1WWXduMEONTzvTJGgdjcf+UNLVF/g/LgqDoLHZFb6KKU7Y8+ykHVKVvqvzXbYhJAb7yqK621fim2VofhHEvdnl/PBv+HPT0PdRDOIdI9C8qJFGmgwH5tkLCOwMYaL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1sUctwN; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1sUctwN"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e75607fe4ceso2871925276.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746469521; x=1747074321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnfZA2IHUIkY6UoC+ef6MZiplYqTuTGQERPbWjxFZpY=;
        b=G1sUctwNAoBLH/O/o/GtyFFHoG7pkfQEAKCRIRh8CQ/rtGtHwmCX3UTYA62OnNE2vd
         Dbw5A87qglQXoh7SS2Tu0KIhRx/F3tYhlMnoCLCH0IUztkzhfuUfOomRAvZ7+9FcmJ6s
         +41VBGQNDAruzpHhgQNXv/Dsf7dAF2mj2refs9CsWvPuk2k7VROSueRyuxSq/eutEU0c
         f5E4ZkfedDjhWteQ1sGEDo3Qlb8klrIja+jcNMqf2gY0oEghzq0QlHwiBJRDpAoRSaJ7
         +lrDPjxEGwcaa7WLwt982ONyDiRs9VxT61zWAjsKK/2aTUTR4/xDQl855g7QmDOGoTFr
         A2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469521; x=1747074321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnfZA2IHUIkY6UoC+ef6MZiplYqTuTGQERPbWjxFZpY=;
        b=qnb92Bg7deFkDTIlnz4OfC31O8HUN/1PTAT9JwE1EBVmZtun3H/JmEYhv8WzpPPNpc
         Rnx10arwdfSff2w5VA1ZS5YfbQWC5x2IUdD5sEBscKBZ9Xul6lPVSuIHl6bw3arWDD2y
         C7CGojD+IEEFjen9EomMRL/zH582IEeJFULhO6o96GF1FzwU0eOw1v1Lwy1vRmwdwKL7
         aaDqYsQkyQJzgYg6y4nuBv0ZcE/stSWQG2WvyC1a2hXdfFuW2RQHHM9nUJXktNc4GDkh
         k+bfU/Fr8ecn/grG1iJ98HNHj1ZeKIAzuenH9EKYy2yQ0v9qb4jTD6RIWHQTcADwxRg2
         7YDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkCK0HxLRfBa904qOHhw/t2CFgfhJ6o5PBaNi8ObAXY8yn4UJPGMsVUa8OrYEu7j4M/rg7Tx7YQIxgSRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6KA+NhMCBd11GipHnjIJGi3TPmFBZt6TK7nYG1cEk7PxLBivE
	b/VAUYSXUDuHGD4346b4m9fm3v2rSY57/3yKiIJqOJ7LZSGlta5+3hc/xg==
X-Gm-Gg: ASbGncuw2ivIwGFcpSvJ3mllxLBP7rAr2wUZoqyssuwXwu/8LQZRfYG8KA1WWP0p2rg
	j2Q+vwyKUKs8cPiCsR5KoWCgnP3Ce/uimnPUsFDHp778DFblnfiJ9G/3p7wSKKoUep9VjX6zLLM
	rIHvYMO2wEjLQX05hVrLmKjyKhlp278IB/19nZwa9/0xkqWtWuG2B/bTYSNfa+L2gPJpct1EB0X
	sbuQgN2w7ZPtaOqT9GBIUpbvrOIHdo32f+not8GICY+j9O/YJr6w7zjHsKSKqrnqbkiL67/LKFa
	uI9zwYxhuYe6mJZhv4To+YJSgZjV8pLBRm8EAZTYJ/gPHStFU4A=
X-Google-Smtp-Source: AGHT+IEncTjecX2FNQsy5Tz5Wgcv1LiGKUt/HIXhMcJXS3nA4VLyh6fNU0pxsK/RDnVAho81QOn7Sw==
X-Received: by 2002:a05:6902:84a:b0:e72:d88e:80d3 with SMTP id 3f1490d57ef6-e7571b1d754mr11640133276.36.1746469520583;
        Mon, 05 May 2025 11:25:20 -0700 (PDT)
Received: from localhost.localdomain ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7a897asm2113429276.38.2025.05.05.11.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:25:20 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org,
	osalvador@suse.de
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	nifan.cxl@gmail.com,
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v4 1/4] mm/hugetlb: Pass folio instead of page to unmap_ref_private()
Date: Mon,  5 May 2025 11:22:41 -0700
Message-ID: <20250505182345.506888-3-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505182345.506888-2-nifan.cxl@gmail.com>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

The function unmap_ref_private() has only a single user, which passes in
&folio->page. Let it take the folio directly.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0057d1f1dc9a..0c2b264a7ab8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6071,7 +6071,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
  * same region.
  */
 static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
-			      struct page *page, unsigned long address)
+			      struct folio *folio, unsigned long address)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct vm_area_struct *iter_vma;
@@ -6115,7 +6115,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		 */
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
-					     address + huge_page_size(h), page, 0);
+					     address + huge_page_size(h),
+					     &folio->page, 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
@@ -6238,8 +6239,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 
-			unmap_ref_private(mm, vma, &old_folio->page,
-					vmf->address);
+			unmap_ref_private(mm, vma, old_folio, vmf->address);
 
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 			hugetlb_vma_lock_read(vma);
-- 
2.47.2

