Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960928CF48
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860707; cv=none; b=LOgINgJpvHAWap/TDJ655NUTkKcKZKSAy3oIlyqiTD90mbnwJyovv+cN5ridy63gMKu3l3qsRq+mDWVOo5DjbMLZMHly5xRu1eBs1Iu7/pYPa2/C6OyNnpnehG1+l5hnVg70MG9EGIrPuxMJPw649Dj9psQBOYCLeQ+JHo8Bntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860707; c=relaxed/simple;
	bh=lfBHTooLsmWZQsBhxBLpxPvm5QdgpKRX8sfFzW5Ncec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUrKVzDyIbOrGFoVkEz5O0w7+Uhkrn/TJLEu4Bh1iV52Trh1pceWmeSLh70xs5jN0pSYKi+CALmBiauPUb42jcLaQOHnOuO7iCr4A06dIaM/fxmvjopQPThugnXs36zkgW+FuI1ETmq7nGE51U3YLnqzqeXPc4KTbT5B2FHmXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1h/k4OS; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1h/k4OS"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so34633976d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860704; x=1746465504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9GLyHiHBYPWRVABHbMnnhE1eRgqrotaJLvz7nhIF2A=;
        b=a1h/k4OSdoNrJe5HABrB0uhyNLK0Ha0X/GXY0Wh+7beRlFmpDtqd3okzZZdAFweB0H
         /hn0DExBJkJmqLg9U2zF6MS+oUq5myuAJpc+P6JoogWGo9HqMBz2kjjFbfV4lyT1JzHx
         bMsEl16qKBMWfHbtG4NvZoJRURYhJRpSJqVhcYbrocNMNqzWiAd02j6JycX0MsZqAzFW
         aIziw1M3OitqLVFxsDJz93XJmPRSYd3cXD7lccxOoSdprjEVexKRdNqDGO5bSnYs5ieT
         MhBFNv8273JP/dzHVpYlwYnblV0Ws5XqoO2aL1AXcSuiVbk6eANqHBwf0nsvPegUJJVg
         Xl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860704; x=1746465504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9GLyHiHBYPWRVABHbMnnhE1eRgqrotaJLvz7nhIF2A=;
        b=NzlxglR7o5xdTktf3GPSv7Byp3l+w81AquJnGc7kEAwPpOZAcEzcqAM2LJl+6KfmcE
         E0ZvbPS7Sgpl+OhUx7jUyX+a9xDNI6hkL+oocNy55qIwouGN8e7+IbRUq55KHwTEwAs1
         FbuN1pjPdeVQIciNPnuknuxqnMKvZG42LuVHkoDBLawj+exBVYmtLn0CLvZReJ8sIEPo
         ZP3zPg8F2Vh6tCz77VRkoHBL913ZsbEyviEGR2irVOpLJXYOH5YsHM3oBYkjmMsq3TJ0
         oedkwt2JmQuxUVeueTXX5b9fcETR82lgyBUwsqvFENNRU0PuLErQhDCwkVWsqGtY6TT6
         gcbg==
X-Forwarded-Encrypted: i=1; AJvYcCUJNt3jIETEOd09LFxuxFSrSylb4SbCW0ApzD0iWlgx8MfQ/PbnVsXNM6X7TezxVein/zb3iSD+5p9FRvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/rNW/a6VWtoVj86ehDREju5fE+dRU2rlHjGh7spjGP0IL1m3
	EqNF0WnYBPlrbAy3KjTg6Gm2Kl9pzzhK5yDbCyaKHaiNHkuobbM0
X-Gm-Gg: ASbGncsKeQEYhwfC4pciOvuCNSFfmhtMoG5gCHmL6oXncUICIBRaQuEOQLhMrknOhWU
	D/tj64qpyhH/p5fuGodlvs6dkXanqF7pJ3TdE/lxTPwUu8noka6Ljcfbm42WDapmZ1Bs+fqLRl4
	v0XrOyQEhq2aFPl45GQUtcP0oY2Rom7yuzAzysHWL2OUZtzc1RmcNWP0LImJ0emDNfGFgXDJvFN
	J8KeXmaGq1NXrgXWaJw0sMIOv8nioz5dBITqDzGdV+bLIu7Dk8N5tza+ov9mJyFFaMwgMieyc0v
	h9gLDEOofxyL79VayISRPxa2WhkI8rKfzBQGqKsP9ppdIlh4Bp1eYpjyLA==
X-Google-Smtp-Source: AGHT+IEETmc76i/GhvmDIeRmFwP+L2/5Ogmmw4PRYrgxmPYGFVESci3tRKGsTwmGBWmCenqLJ62h9Q==
X-Received: by 2002:a05:6214:5009:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f4f053085cmr9931726d6.4.1745860704360;
        Mon, 28 Apr 2025 10:18:24 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8ee2:8c9a:73d0:fe8a:86bb:e664])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef3e7sm63443436d6.6.2025.04.28.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:23 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v3 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of page
Date: Mon, 28 Apr 2025 10:11:46 -0700
Message-ID: <20250428171608.21111-6-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428171608.21111-3-nifan.cxl@gmail.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

The function __unmap_hugepage_range() has two kinds of users:
1) unmap_hugepage_range(), which passes in the head page of a folio.
   Since unmap_hugepage_range() already takes folio and there are no other
   uses of the folio struct in the function, it is natural for
   __unmap_hugepage_range() to take folio also.
2) All other uses, which pass in NULL pointer.

In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
take folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 83d85cbb4284..3a07a60c8cd9 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -133,7 +133,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
 			  unsigned long start, unsigned long end,
-			  struct page *ref_page, zap_flags_t zap_flags);
+			  struct folio *, zap_flags_t zap_flags);
 void hugetlb_report_meminfo(struct seq_file *);
 int hugetlb_report_node_meminfo(char *buf, int len, int nid);
 void hugetlb_show_meminfo_node(int nid);
@@ -452,7 +452,7 @@ static inline long hugetlb_change_protection(
 
 static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
 			struct vm_area_struct *vma, unsigned long start,
-			unsigned long end, struct page *ref_page,
+			unsigned long end, struct folio *folio,
 			zap_flags_t zap_flags)
 {
 	BUG();
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7601e3d344bc..6696206d556e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5808,7 +5808,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 
 void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			    unsigned long start, unsigned long end,
-			    struct page *ref_page, zap_flags_t zap_flags)
+			    struct folio *folio, zap_flags_t zap_flags)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long address;
@@ -5885,8 +5885,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 * page is being unmapped, not a range. Ensure the page we
 		 * are about to unmap is the actual page of interest.
 		 */
-		if (ref_page) {
-			if (page != ref_page) {
+		if (folio) {
+			if (page_folio(page) != folio) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5952,7 +5952,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		/*
 		 * Bail out after unmapping reference page if supplied
 		 */
-		if (ref_page)
+		if (folio)
 			break;
 	}
 	tlb_end_vma(tlb, vma);
@@ -6027,7 +6027,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
 	__unmap_hugepage_range(&tlb, vma, start, end,
-			       &folio->page, zap_flags);
+			       folio, zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
-- 
2.47.2

