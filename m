Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F44CB5B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996196; cv=none; b=obLCy8ye1F7f6SdczpAkJ8gLdkiSRNDarQc+VjTw1xNSUnqebCVxOgMKEAuzhG2hh/JPwqXdoK4PilL8huUhFtpdoZIp1FRAV2BqQQ6hfi3MWUuUbCXjP1QhMsF1pXw8MyzYnDf8pveoUqfTdFz0EX+MxDJG3u65yiS5gxjsigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996196; c=relaxed/simple;
	bh=HIj4ekPEwM4r98jRvLJDsQ351VYTg5qTZG1x37416I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgad2kqp1PfWq1YLeXC5Pv4q6gmLlg3xwdE8Kd+m/t7YfbHHOqd4SjOkMImo5AGH8+pdubeq4S6Eo4zkRkAThlT3Cb5UKrlLMky3XUtyuF9VKJaAGmR2Hr0u650EFZmLHosJySLiuZX8HxeCma0aW9Nn2XWeTBhVnXQc6c/AFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6D0SBzr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6D0SBzr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739be717eddso1647469b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996194; x=1745600994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DJIBJ38EnpEWPm08LJcINJN9maxALKgya+vxd8o0eY=;
        b=f6D0SBzrJJXqgCUPlNt+t1UPYvocRs6kOzb52ApszbCsEb0t2NRw7RKP+jy2TimCEA
         Nv4X6OLrsS9b2RJaIvcEOYeCH+40tpAum3EAvXkaNs1SHVdE3CTTiQvMaoBbGEHNrSxS
         dL4Aavr76jzofYDTjHmdsi3UXKnTXu8WLakEVrkguKb5yjue/nn1YaYXKLXvY5JtiGoo
         fnAWNGK/tEZJ61OfFeSNYc5i/CI/EtResclVoz3Cil38xFzk2He5U+fOSuiXNlSAupHF
         01f2xIyhARK2fNHpJkQn9Ci/15CZAQtK+lYURm6JUjYIKl9Mk7MGQQ9uzHUSVPzfp2Tm
         oL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996194; x=1745600994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DJIBJ38EnpEWPm08LJcINJN9maxALKgya+vxd8o0eY=;
        b=qyKvs+0tF4MKp5ahdE6S89tG0Ic7X3IEpVMo08zCE79Vi9GTP2Rb6AUkhZz30BcLjX
         0UUD+lSbFpMDyM+xlQj2G3rfB+xW/bT1UkY3cfzQendciutR69zZlZJEHpTQVFhMxvnw
         5rPeR1RHn9hCS9IcHCfqZIEV6ZUUkVL8v5aGe3Q/Hy/t7RO49EbHzEj4XEic57ld0I5C
         dLM4BjrNX0ewzrRy1m2pWW34uSGZOkh2B+PFTotsCpUXHzgpcuoje/L49KLQBqSKp9j+
         MtIDEZwGOrrYY3Xd+lyg23tNrvsFQVJkNGqmMg4ZJnFO4BeNPlDn6Dje7Buf3moywWz4
         5wWA==
X-Forwarded-Encrypted: i=1; AJvYcCWKHDW7M1G0SnYhE/gtXEzOZAsOZkoz5v3ZkuKkwVbktuW54D6Pv+2da/IkxYkxYkxiKmsnpWtKVgZ9giM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYEp9WMf2agu0nvZpm0vvUHE8AknVjOS6TypeY1mOkvIDjCBr
	XVVYUqUCpbU56kgOYV2wgt8j4dKICchCBcyoTLCJH0peJlckjrcN
X-Gm-Gg: ASbGnct3rFnPF9bRXkFxXS3ksGLMadyIAVzSGvVoDrJaj3HQofucmnH/vGqH4pBt1hi
	qIdMtB1FDvu8wUyhKyVV9Tq2svgWTOCLNd3fQJn99XVtqsbdmypkAEO/yy+yv8GJR6F0PdKO3Lg
	OUT4Lti/rnXsLS2AcxYbJZA9yc2qTDg3jsKKcq4p4s61sFsA6/irr2mqU0vKQbHEj9QvFUqzdP3
	wjSVTmuXlTm9IbKcA3fmMpWP332eBXIKVjDpcyBXAzTIDQk0FSUCJDRmAdWIkR0OlS2pWiQFzEi
	52037pajXzejImWNdp25r26VTsMOSj3MxzXILzM8At9f9tPaCoTW7PY9sQ==
X-Google-Smtp-Source: AGHT+IHtSkXRjE5kLbVrgFHYUZGqL8t43yfDxEcVnaqVty7Bxqms0EUkMScDbF3lTbhnxKvvjnnbHA==
X-Received: by 2002:a05:6a21:3417:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-203cbc52403mr4988566637.16.1744996194008;
        Fri, 18 Apr 2025 10:09:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59176sm1834069b3a.113.2025.04.18.10.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:09:53 -0700 (PDT)
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
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v2 1/4] mm/hugetlb: Refactor unmap_ref_private() to take folio instead of page
Date: Fri, 18 Apr 2025 09:57:39 -0700
Message-ID: <20250418170834.248318-2-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

The function unmap_ref_private() has only user, which passes in
&folio->page. Let it take folio directly.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
v2:
Picked up Reviewed-by tags;

v1:
https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#mbf9f3e8b49497755b414e1887b2376b3902ffb76
---
 mm/hugetlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ccc4f08f8481..b5d1ac8290a7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6064,7 +6064,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
  * same region.
  */
 static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
-			      struct page *page, unsigned long address)
+			      struct folio *folio, unsigned long address)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct vm_area_struct *iter_vma;
@@ -6108,7 +6108,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		 */
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
-					     address + huge_page_size(h), page, 0);
+					     address + huge_page_size(h),
+					     folio_page(folio, 0), 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
@@ -6231,8 +6232,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 
-			unmap_ref_private(mm, vma, &old_folio->page,
-					vmf->address);
+			unmap_ref_private(mm, vma, old_folio, vmf->address);
 
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 			hugetlb_vma_lock_read(vma);
-- 
2.47.2

