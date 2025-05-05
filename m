Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD7225D7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469521; cv=none; b=FwwEp+9KNA+ScfNFZQBpYNaIii1WcLUzxFl5deGg3hhwcRfqVHxObj+R1ZtJutlcqxCdoFWkzDH8k55Tyi/fqlTnxGvGjAuNAbRv0aG7g7AOB1AWI42cEE2WtXL0v3Nxdh2BRUiqBqzXKaU+sPX0dCtrnaAFU4X3gvvOU6jifjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469521; c=relaxed/simple;
	bh=DoigUANu383PTCpop1i6rEUnISuvz9j5IF0SrV3WCXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdeZvu/+BaF79QMTel2WfUG76LKLGyGwG1BTijSzklxpKYsfFAzNh4ZR/p46i+1M9Ah953rXfgiaAJvpAwvPnsF4jha5VwrSikskn5UvrvMGat+hOtsyPhCylPT6DRfpz0jvtrk2Lk/T9UW3GbiMYR2cCMCWZ1k4B/mj0VNgqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flVtBXKU; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flVtBXKU"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e733b858574so4369915276.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746469519; x=1747074319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=flExleV9uttU0alncnyvd+AsNvHIOm5K0cabfa4tgrA=;
        b=flVtBXKUYA83PIHabOrYW+iQodV00fYRe8oLwGLV41vtkriSv6mgqdd+98YjpjhZBZ
         2Cn8JxAnDWIRNvvN8Fl+AkeKPD+P07uoURuMVZ7kPd41riCuMSLf8LqT6s0dvvUw0IOU
         CoHRsA1ZRkhEK7WQXnS7Kuui4LblWMC102zgVQE9BwNmHr7J8FNt2UhBSg3r6hCKJv3h
         yNm994uA0oHMeVfo6am8bY7HOwSbH70FBsWcYh7taZXrtFGPP3W6PfZEAxG4Cmcqe3kc
         h1a0J80ikyk26jXbzN63otdpbKTfyzVgNwRvWqLw8F0tmrQGb/1AVD2MbHFZGSbpFtEQ
         L8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469519; x=1747074319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flExleV9uttU0alncnyvd+AsNvHIOm5K0cabfa4tgrA=;
        b=vfYTyrzLN4Si64kBVOS20Zg7XpmdH06gmmq4nb/1Vtp1q+Tcd2fC42UvXzIZEg3B2l
         Wa0ol1iSperc+aNjOLtbNJ8KdqHMmjuM94W7jH6M9e54k3fsRROynuO+WLroUoQFpYBR
         0jycwV19nHHPdLYNfvivppAwRnL/Bllf8GxNlLMm2J3W69FeD4wTgjCEUmWRNr7BeHSw
         e326uDWI4hFITEn0nhfJ/O2l+4Dm/52pPbJ2HEUs88RoQtbRb22JjI6sCQx9C/63wQ3e
         t7W37qe4x9y3OQJccYVDlAfqtsV3+kWokLHc86NuuXuQ7x4zqCyA3Pqwrqh3BrtWM3RJ
         91+w==
X-Forwarded-Encrypted: i=1; AJvYcCWQZSDuN1J4oK7bEMiUskyxZYHJjhm70zfqmjmoNR3EOEPLkXbkqaSCcV5SxfqPVeGn4fUJjEj+W9d8LAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK3IZ4Q0OrHXkewVYJjHJP8UfOAp1uZcO6oULPVnNA4Crszbmw
	5lqh+V2NCNVkJfzrBKukBiCdOnaBYAjpUKm6dM0d/EOI3Ez/z6nY
X-Gm-Gg: ASbGncv61Eik6wUEfCLYTYEyAwem0lyS0Ljv/N13IXtGGur+v1VtjszCb/ACWYLTBbu
	v0xb2+gSV9ggghALqKaG2V5v2B0kDTgVsC8mb0nLc331nxujxgfnajeN62HwgNqMum3h3+tfWum
	ReI9gdSr8MP5a+v6mUN8LNnSdKMy6rpEaXe8cxl+08rp+h+4uW2A9tcuyfrFspPuth+maBkwwsz
	I09pSG7F0LbUNigVcJ3SQXPet7FDqc1raReOy4/daAkvVwDCHgFlxmsV86m9MI7j0ar6c0jAsCI
	HPp/j/xxa9x2ZG40XWjhda2InXBwJOz/iZW4ngX52MC9Sst7U6k=
X-Google-Smtp-Source: AGHT+IHsCj4vcXMtnew6S4I3ohSckwHjFUXSSi+BabmVRyJrPG5W9SzpFPdj/H4qveyPmg8Ux6zBfw==
X-Received: by 2002:a05:6902:1887:b0:e6b:8025:a9d8 with SMTP id 3f1490d57ef6-e7571a75075mr12777245276.17.1746469518807;
        Mon, 05 May 2025 11:25:18 -0700 (PDT)
Received: from localhost.localdomain ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7a897asm2113429276.38.2025.05.05.11.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:25:18 -0700 (PDT)
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
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v4 0/4] Let unmap_hugepage_range() and several related functions to take folio instead of page
Date: Mon,  5 May 2025 11:22:40 -0700
Message-ID: <20250505182345.506888-2-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

Changes compared to v3:

Patch 1: 
1) Pick up tags;
2) Reword the commit message a little bit based on feedback;

Patch 2:
1) Pick up tags;

Patch 3:
1) Pick up tags;
2) Update the comment to reflect the use of folio instead of page 
in __unmap_hugepage_range;

Patch 4:
1) Pick up tags;
2) Move folio_provided definition up in the function as suggested;

v3: https://lore.kernel.org/linux-mm/63aec3cb-60a8-4f30-9b12-3ee19c6c14f3@redhat.com/T/#mbbe1f5bdfcf3a70e6b2b1dfba9af35110a5065ec

--------------------------------------------------------------
Cover letter from v3:

[PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and

From: Fan Ni <fan.ni@samsung.com>

Changes compared to v2,

Patch 1: 
1) Update the commit log subject; 
2) Use &folio->page instead of folio_page(folio) in unmap_ref_private()
  when calling unmap_hugepage_range();

Patch 2:
1) Update the declaration of unmap_hugepage_range() in hugetlb.h;
2) Use &folio->page instead of folio_page(folio) in unmap_hugepage_range()
  when calling __unmap_hugepage_range();

Patch 3: 
1) Update the declaration of __unmap_hugepage_range() in hugetlb.h;
2) Rename ref_folio to folio;
3) compare folio instead of page in __unmap_hugepage_range() when folio is
  provided when calling __unmap_hugepage_range();

Patch 4:
1) Pass folio size instead of huge_page_size() when calling
  tlb_remove_page_size() by Matthew;
2) Update the processing inside __unmap_hugepage_range() when folio
  is provided as sugguested by David Hildenbrand;
3) Since there is some functional change in this patch, we do not pick up the
  tags;

v2:
https://lore.kernel.org/linux-mm/20250418170834.248318-2-nifan.cxl@gmail.com
--------------------------------------------------------------

Fan Ni (4):
  mm/hugetlb: Pass folio instead of page to unmap_ref_private()
  mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of
    page
  mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of
    page
  mm/hugetlb: Convert use of struct page to folio in
    __unmap_hugepage_range()

 include/linux/hugetlb.h |  8 +++----
 mm/hugetlb.c            | 47 ++++++++++++++++++++++-------------------
 2 files changed, 29 insertions(+), 26 deletions(-)

-- 
2.47.2

