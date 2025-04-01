Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00878F2F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473495; cv=none; b=N8/vmjmA70otlMLn1Af6tvHIcCjbjVqnW9FwSk7TzqOWgDYGn1sBsjRwTHJkgZs2kIm2c36bjnfIxhIZIx7Wuhjvj5DzPmH+nlP6Jri7bu1O7Te+t6v9wNP0HAayXF21CWFrQbA1JV/Z2Oop1yffgRDVnR+cLPiK5G1fjxBTtNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473495; c=relaxed/simple;
	bh=FM7vwV/gwxRo8vZOp+TObuaZVChbsmKtv9AggzXg8EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uU4pX1sjkgSj5J0cBgG0SxtK1u2G1zKyy3CFog7IRzofMLU5G1l3Inhir2Tnn2HxsvzO98bHrHPf+Tz6zVKCOfYYFRtpPV9NYQ1nmreRmOhiDDXrNosJ5xZF9pVJyh3sShzGr+dxUF6Ux+CK5XK0qp3e2w6sIz1eyl4k2dhzaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1AAK9/E; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1AAK9/E"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so11011857a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743473494; x=1744078294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRYvR1rAvbssstSNgyfi531UoTXrgDsOkqVWHoYG9I0=;
        b=M1AAK9/EAzo8PANkj8TmOHFAmxGGQfG5rteXYZcSP9uyRA2xPmWoCEDeEinCLPFL9o
         mKA2QrxdVL86hlRakJI5zRzacTRSz3kSgq1X2IoEZ1Uc4KavTB2aiTN5w3yuzHknTdiO
         tWqYOW4ODsn/o6ADibzvS8jvglhVHoF7lbkaNtRu4al1ov7Zn3ViDvDWkzb34RhYMXZE
         5NnUwJ5H7a/u1ChByB4RfRRgKGrw2jPNPhEFrSKDop8rXDTrvNJdEnPIDKZJhnXNnQ1Y
         I4KJaKhzenn/NVuTzSvtXK5OoAgzCcNb9MMKx6qTckMRCWDfkZT7PVLADHSHQ4LDVJjx
         eg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743473494; x=1744078294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRYvR1rAvbssstSNgyfi531UoTXrgDsOkqVWHoYG9I0=;
        b=kkGhahO/WBtd9zckssjo6jhoX3+4hHkt/n6VGG2Z9JCbUEDU0kWEjEPJecd7T/lKSb
         hk7WFGoAj/w+epPrPDo1KJNu2JCKkJ4a32PTwd2B5NusSJh6m5IHCvbIzyRBUCH+04kJ
         BYyxraTWlbceFihuTa9P27g3bAC5kj+iduEcgLZsgeWS+aCprt1LpCwysCRCtDtS3ANn
         oEXfymkZGonNxF9P60/8M9FA8eRQhYOgJduhGFboCcAq6Uk90spBdYtoZgqeulHTTLmw
         YmAMXreSJtP6ADnGSVcaOtQV1YdFuic7DyJv9J/GaGtHQnYdf2gHfL3TTa5+JG80h2Iz
         z3Yw==
X-Gm-Message-State: AOJu0YyWF7mRiK5rl7SFmb1jaIZJEUmWySuCeWrYZy3VrSEAHOJt3ceI
	gcdzuT7WoATJyrSZ9H4mjos8jysFx3KbTuNkOfAD9fq7MedSyPONBLwsxny9
X-Gm-Gg: ASbGncvsPt49kXnzKCo8in2KYBc6soHCmdZRS0TvzmZw+1pjVsP+HOd2tRTtenMawCd
	HLLtPIhsmnoOzVVQXPyI/4Zrr9JSJoYpLICadnt2aq84MNotdXT4jF94yt69FFuxgboW/XcfEiQ
	iF1eqhjERzEWcZef8AFGZKckf7dzYsUHhiHm3vIWRqFJQOVuExvp4fnLFqvq7u8I4UzyucBTY/N
	+nwtwv5RywLK72rMHGxBwVr297fBgIM3RNeqbewpam/EoDfh4HEtDFZx0AIu/2Tp0mDnRDf0Tbs
	g4534UwkQAcLKNCjZxkZ/XIJPvXviFWzUQosPs4DfIrhYkeqcRR5PHXYGZ3umeppMAn0K2SMR/t
	CzW6ZM0SfmvwngQ==
X-Google-Smtp-Source: AGHT+IFXzch+myvH4/yZk2PGZtAv8bQ8slVe8J3+jLushY9riWFNOq8lTpZCJ8ILTx/tWy4ScCL63Q==
X-Received: by 2002:a17:90b:4a52:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-305320afc4dmr16080685a91.15.1743473493827;
        Mon, 31 Mar 2025 19:11:33 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-30516d3ce04sm8074118a91.9.2025.03.31.19.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 19:11:33 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	muchun.song@linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH] mm/compaction: Use folio in hugetlb pathway
Date: Mon, 31 Mar 2025 19:10:25 -0700
Message-ID: <20250401021025.637333-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401021025.637333-1-vishal.moola@gmail.com>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a folio in the hugetlb pathway during the compaction migrate-able
pageblock scan.

This removes a call to compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/hugetlb.h | 4 ++--
 mm/compaction.c         | 8 ++++----
 mm/hugetlb.c            | 3 +--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 8f3ac832ee7f..a57bed83c657 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -695,7 +695,7 @@ struct huge_bootmem_page {
 
 bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_page *m);
 
-int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list);
+int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
 void wait_for_freed_hugetlb_folios(void);
 struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
@@ -1083,7 +1083,7 @@ static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
 	return NULL;
 }
 
-static inline int isolate_or_dissolve_huge_page(struct page *page,
+static inline int isolate_or_dissolve_huge_folio(struct folio *folio,
 						struct list_head *list)
 {
 	return -ENOMEM;
diff --git a/mm/compaction.c b/mm/compaction.c
index ca71fd3c3181..dd868c861774 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1001,10 +1001,11 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				locked = NULL;
 			}
 
-			ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
+			folio = page_folio(page);
+			ret = isolate_or_dissolve_huge_folio(folio, &cc->migratepages);
 
 			/*
-			 * Fail isolation in case isolate_or_dissolve_huge_page()
+			 * Fail isolation in case isolate_or_dissolve_huge_folio()
 			 * reports an error. In case of -ENOMEM, abort right away.
 			 */
 			if (ret < 0) {
@@ -1016,12 +1017,11 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				goto isolate_fail;
 			}
 
-			if (PageHuge(page)) {
+			if (folio_test_hugetlb(folio)) {
 				/*
 				 * Hugepage was successfully isolated and placed
 				 * on the cc->migratepages list.
 				 */
-				folio = page_folio(page);
 				low_pfn += folio_nr_pages(folio) - 1;
 				goto isolate_success_no_list;
 			}
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 39f92aad7bd1..93bc8c4c904b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2896,10 +2896,9 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 	return ret;
 }
 
-int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list)
+int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
 {
 	struct hstate *h;
-	struct folio *folio = page_folio(page);
 	int ret = -EBUSY;
 
 	/*
-- 
2.48.1

