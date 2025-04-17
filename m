Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C50253330
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905360; cv=none; b=Pq+r7VV9Ur3FryWKx/QivooOGqFbZnWqJyE0Owd8CkxSNFycXC4cs/KbQQ1dTt6lA8nzVyoOPJlUVkAJL692q3kTFFgkGf5SxQpzJoH5W+AJl0uRd0ztUHQjjrfeeUP8m16+mQfV1CQJBYBJuPXYYD0YO+w4EzPljLt2ciqnE+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905360; c=relaxed/simple;
	bh=VBjgQJC+Pq70naRket4NqfBkbd5iCF0HCcJo/OSCmno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSl8rO+SoY/FWYsZnx4LrRHr9ZUII58wE2A0++nASYfbN7XP8jAZHHuc18lca/oaL2+sukdT/JnV9GkrY2jdPlGcTS5zvimgEhMldmjs7nwzthxL+dL+G1yGVL5fS/K0Bq7WScE1oQO1SpaHtWwA3UDaDC5vLWPXGwF701elzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA/8Mn8g; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA/8Mn8g"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33e4fdb8so11495955ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744905358; x=1745510158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXJ++ZYB4CUrHJfGeizELkG7bwzF7vvY/YoERDdrBr8=;
        b=dA/8Mn8gWru6OkwAhhtSmUarr05meqgjT96CsBIpXIw3RF7rmTweiBRwq5+Hd3ir/U
         /mL6O5GhSMX8x0J4Y8MPnc/HGHgJ2tjMTK/mUrWZlCTn/G+i9jdVZKWj0Dh5mPZcLlfT
         0MIWRFcrMt8sqdgqGjhR6yE8GJu9Fnw+AgmDhLzRfP4jveLC06625HKmugiZhtQeeHwT
         yUZzp3ZzL/H3WopOWszzssW4iefIKcxBcAQbbPqrCoHodrkvFdBCt9FpuQCTmEyD0Lgi
         z8V7gozr5rHLlj5jIPIe06Z6UdPMXpy32aQkeqlnXTVqJhV1TShLPL6d6iiqeC7WndUT
         GMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744905358; x=1745510158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXJ++ZYB4CUrHJfGeizELkG7bwzF7vvY/YoERDdrBr8=;
        b=Oxztos7pi3W73Jw/sW1UzMof/Cj1K2TpccBQPRm/3J/JNtJwv9/zFFg3pcRgMseIQU
         Q9UZPrhr2NsZS41lfg9kmbLshK/LZ14q6KgO1xRtVzqTbpZ40yGIrPjRsQuPQu/7BPws
         7AQyHy5SzDRtJU4QENwx83whQ+a6f6UN//+u5K0zEPpnsMgkg6k0IjwrlHyhdnpt/DCB
         ca2fk1erii0aX4ALbR98HQ9m3aelf63fkB/9ogQDLvAlakjZbae/kNNGykytVZ7e+egI
         U/UTuZyOVGR7y+RjWwzjfnPUl8XcGEkIwL2mE19uleE9IlOeGCYlrNUrLlX5kBN6Mk8R
         9D9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEJ5kKhKiDD+tHPmkX2tMUOs+NJDRQCLOWdXOn6qBDdRpJv10UR0e0bCwMsxOCdc4rRwIMFqueP+DjXcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTCrz7bWfSZSStcGwe8hAqx6amDnW5niEeRhPcF0nzi4Wb+IW
	9FKVkU7PFuXL/Hnbxk4SvRmjDeiXNwhFRSK7BBd3UxpYsOW3Bzjm
X-Gm-Gg: ASbGnctQDSWU++XHzAtMiM8hWzH+nMk4mNIjGsKkoKssl23PcZfgJ3R+v8v1f3pHZXM
	lHfkXiWzMUJ1MSkDse3gowAk62ob13tW2UszAAy5tPLib4lupZwmHvkXixQPlhdYd+gxfgkJILK
	BdTqi9z2rwp9TBkMjL29YszaWi4koFP8J7R163sr6VygEp39LIZ42r67NN8LB8umj0+K/yeuDcN
	gFNCGisoEq+eQTEJDpiV4I+mZFnEsF+JSyAHi8D3Gg7Se46N5uzYgN5s1fh2hRODNyEBo5trxKn
	92ao/7MXZP1uaJukDLw3CF8LbajXdv1iMLKd2KR69x5jwQtHHTxDQIsRdBaU0IvyoXLI
X-Google-Smtp-Source: AGHT+IF6QguIu2QXteF6PLhJZs/sPdfIp2KpzZa/FiBntrCSGh7LhD8sTM8nxwWkatBq2dlJgpGfdg==
X-Received: by 2002:a17:902:cec6:b0:223:5a6e:b20 with SMTP id d9443c01a7336-22c358c50c8mr80078455ad.7.1744905358097;
        Thu, 17 Apr 2025 08:55:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaae7sm1636085ad.36.2025.04.17.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:55:57 -0700 (PDT)
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
Subject: [PATCH 1/3] mm/hugetlb: Refactor unmap_ref_private() to take folio instead of page
Date: Thu, 17 Apr 2025 08:43:13 -0700
Message-ID: <20250417155530.124073-1-nifan.cxl@gmail.com>
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

