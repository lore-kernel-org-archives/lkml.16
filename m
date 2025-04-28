Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A328F517
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860704; cv=none; b=MoVDrBarLAZR/uedhAsZHnCVeKHHrfgXbPD57FHbMU9F7NSdWvGrgvxMCrgs2p2MXapAVd5lkAva1gn3EFZ3DJqQeZlsTlp0JHN9JJ5ZFx3HDIyZvoTwZxpjn7B/8ZfUm+ovZXMhXyKSL7hS9ZfzHawyhaGyXkZz374BVnscM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860704; c=relaxed/simple;
	bh=ghVD0xlWN75J9sWKkQus07SwjOWJ9XJa/EZO5q63R8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSCJf7yj8sN1VxVeILMgvfvPBxccemgIrXdPiSIzRIoLoukBLkd1hZyOqg1xR5F4/6k8kNvxoCcOuQWGn0bEQomSSmVHozc5FemVP2Bikwbhd+edOviWziMyfUf8Fq0TOrhosg56L6i3EaYf6B27pldGXUez0M0b0qGAZ6FDPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnfTShOU; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnfTShOU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769bbc21b0so60146821cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860702; x=1746465502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiKX0SdCfE9sy/GIOsIW6ZqQMoygzHfnTOodJbxC6o0=;
        b=XnfTShOUpEkm4KiAAkQLRO62nJQbnHPxMG69/2D04SyDRLPo/cLIK9jxlYV+l0uK4Q
         AabT7NvzUWY2llNqyOXNcuQVZsF1K4n993S70jqP/Hb0CAFt1+vPEUCaVPoKOSmG41C3
         GpmSkaPMcwkweSiBfP5WKqFzOqTDwD0TEiOi3bqMgIB8LhFjxfDovZ98C3Y//Gc3mMY2
         /TBDaNyDuoJKah/M8omUVYP4uatHq/EptBu0GckY8lFRHwwsyH8XyNng8sPERA0doVcV
         rh/XhfdtjSpb/Ir+DBW6XBP4YAhC7w3KOLeZ1u1wYgYgY29S/jPnimpceBR6X/+cNaSE
         rv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860702; x=1746465502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiKX0SdCfE9sy/GIOsIW6ZqQMoygzHfnTOodJbxC6o0=;
        b=UwtRnIxkB9tzffdf1RHYwLCfD31ln34fuuA8q303H3/8VozLYOI1VDbIr3m31JNSWg
         DDwcCEYH7xnd5d889cKdWXFuosy320JXLb6aeTf2jsr4WTJIvRZYO6c2Bp5RS4NUInwc
         Q2a460GXLj5g3Zy4gEtmCA0qCcQFf1GkcpSXw2Iva/SzVwayRVFzWwrgrxUzIniqVPD6
         a5DKPYXnJ8uPWaQWzQ4w33eF91s9hWvWK/4gj6gRJYeJaMOklhmm1U/GOqeaUF/l0tNf
         vYb4uJo9EjejrMUa9+WD7jt9MhY1KkJr8LXwcblWamb6H5Q3dhnWlLrzD4X/9nw9+ej9
         B9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFS0t/8JWEQItJilZ8Cbt6AH9z7wD1TJwOk5aOS1O2EG7GLm7ICyZ5vbIupoJQ2qub/RPHssBxjbM4wmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJb0EcRfBdFXuVS0MwuGm0LanQRoW8srmqja9Mc0xT1wfT35g
	mUk272ZtvLMckqUnppW7RXowULmqXa9t5fuDLCn64bGwc6G4eeoW
X-Gm-Gg: ASbGncvV1M78IngzPRpRTtGZxzu8CVXRp/DNwwvzavH+ymT3qwksjC2jw0rRi5Y2dsm
	Kajhtv0ES+nV3O0zqP6NnyqoZc55l8Is596GrUHu20LHp8cOE1Hu24HzVpqJ7RhO0ogCKXbszu+
	KjUwy6Vik5pvbBvV5pzrUYSgyTw1XijKL96tYG6UqeDG6/hxkHk2q+GTW8XmNAVD1PoYZGcs45G
	HhMMzJQVIY8RQUaRBfWg73rTp7jFH5GckKeiqJoB28uRj0kwkkl9A8r8ux3FAoT8Swf6SFXgxSu
	Zu/305WbfJdJuAXcXkJB3NSJYK7kEKnIvzmfaTIPYbN47r2jtq+jAkucgPtCmawcQ6d7
X-Google-Smtp-Source: AGHT+IFE0qo/MVZB0ZrufpjHZWbt8KIsvVRYQ2v99+CxEj7pkIQ3bll3fYSmXWeDkacZXT9gZTajTQ==
X-Received: by 2002:a05:6214:21a2:b0:6ed:1545:65c3 with SMTP id 6a1803df08f44-6f4cb9ba479mr223255616d6.2.1745860701630;
        Mon, 28 Apr 2025 10:18:21 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8ee2:8c9a:73d0:fe8a:86bb:e664])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef3e7sm63443436d6.6.2025.04.28.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:21 -0700 (PDT)
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
Subject: [PATCH v3 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of page
Date: Mon, 28 Apr 2025 10:11:45 -0700
Message-ID: <20250428171608.21111-5-nifan.cxl@gmail.com>
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

The function unmap_hugepage_range() has two kinds of users:
1) unmap_ref_private(), which passes in the head page of a folio.  Since
   unmap_ref_private() already takes folio and there are no other uses
   of the folio struct in the function, it is natural for
   unmap_hugepage_range() to take folio also.
2) All other uses, which pass in NULL pointer.

In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
take folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 include/linux/hugetlb.h | 4 ++--
 mm/hugetlb.c            | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index a57bed83c657..83d85cbb4284 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -128,8 +128,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
 void unmap_hugepage_range(struct vm_area_struct *,
-			  unsigned long, unsigned long, struct page *,
-			  zap_flags_t);
+			  unsigned long start, unsigned long end,
+			  struct folio *, zap_flags_t);
 void __unmap_hugepage_range(struct mmu_gather *tlb,
 			  struct vm_area_struct *vma,
 			  unsigned long start, unsigned long end,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b1268e7ca1f6..7601e3d344bc 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6014,7 +6014,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
 }
 
 void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
-			  unsigned long end, struct page *ref_page,
+			  unsigned long end, struct folio *folio,
 			  zap_flags_t zap_flags)
 {
 	struct mmu_notifier_range range;
@@ -6026,7 +6026,8 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
-	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
+	__unmap_hugepage_range(&tlb, vma, start, end,
+			       &folio->page, zap_flags);
 
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
@@ -6084,7 +6085,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
 					     address + huge_page_size(h),
-					     &folio->page, 0);
+					     folio, 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
-- 
2.47.2

