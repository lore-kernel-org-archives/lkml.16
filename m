Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D00EACE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473472; cv=none; b=DM4n+09bf824PS3c5rzWCUpFz2HvnJQS+sQx0F3Y1/CG2v9CoBIR1XrgSU/b3UqQr8a3T7cweXUCA7isEPVtVCydNZ+mW+8YgjNqVDzMVObKMY0um9Xel23OAD2xVnW9kTV8di4L8QFRCOpDFJJM+vIf9Agctu8ASjuL2hgin/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473472; c=relaxed/simple;
	bh=LPFRASbnYusxIp+HlezuMC4nyuX+afixxKYwypBXibw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4olRBPXwBRDVIPMlc6/O9LlunYcCRSjl/AI2863WAHOB56fH4uclxRQFbZCaqcH0jNeO0521z7Vi8eX9vySi4OU4jzEJXSEK4vyxcBsYOjZEg6LhJYAWsn+p5n89yqt4ZsZ45MlE3y6lwhvbR6TWJa3kVTBuCL1VQ87PmGL/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apJuIAjn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apJuIAjn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so10176383a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743473470; x=1744078270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOPlZ2IqgG3J5fbHUI0LVdUbG8WW7Z0L1XqmSy1WgQ4=;
        b=apJuIAjnUDwIcH/BBBvaYQwSny679CeQnCt3V+qbnrt5+D3ijwQP1pwsUl56ON4/Jl
         ecM3ZxL9rsFb4oGD237yOWXCrGHtDT5sr7Ni/kFt3h4bIE012687lt/YhNC5Li8BR26V
         mL362/xfcG1wvBrGDNklmsRs/wCW2ZN4MvWqJK3K3RUeiDqWs3mtDlUk02Gn+b73lLB2
         R71p9JW7bABe5I+oqBXvKVIvmJYd78OsRMXRcwP2jSZH9NrnEJxZTWJ2z6M4kRbPtqTS
         afYno6Z8mpt5vjaiMf3TLconUmHncRYOATAlLGRNt3CFZ6yv99HC7UVdaF6dCNkOy9Bf
         2Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743473470; x=1744078270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOPlZ2IqgG3J5fbHUI0LVdUbG8WW7Z0L1XqmSy1WgQ4=;
        b=eCwFKpxlbWZRqwt4kCwRIDJol+Tz8FDDrogU8XxVMcN4HbcI6h68nenJBvK+1Bnl8Z
         I1sVqOZLIYKGJkulfvpr2fFoSHNhB+gYh/vej2nZ/hmQn8gvChVFAKtrh4Xks0Q5QM4z
         TKt6T7T9VPJ3I1fgCNmwrRJlsHI5+ZEtC+H1Hvjx7tFQdsklSKiPDKeVQX7nMrx9dlzZ
         MjR+2lR0fN0ddZa2n88uKfexyXOKSA7+QO/xJVPr64V05L4okH9CWZWGKWwTsKfRggiB
         SRn29ij9C1oXFOUBTl3H1EHBep3J/20oOqJCbG2HlV5pyjlF40E3kYsMV/u4WWAZUVRJ
         w7Hg==
X-Gm-Message-State: AOJu0YwAVxK5jB9btJPOfC/NvTfmBFReJgKQjTt7UYTJEMeE4O8/JfrD
	F2unlHvcmiv+ChZNFt9yiGwGij5Dfn+Xfz4wlrKqF9XWInCMmt1pqyIIMbkf
X-Gm-Gg: ASbGncsjrGoKh6h1BPz+geHgVTV1diRnzzL/99tSImmIjTebbBCP3hlQzC11jUiZRaS
	elCt5LTEUmKaS6zra0jr3umP8Xn1oCRBI6tiirTI20k1To5CSBPbUHpJCw4YqlcFayQbg82dUA/
	3rKYTHqjZKDTSlRJAf7tdxr/2aWI0b6Y4xhEP+kOMi3oKmyFVTDNv9LSYpH3tWA9B5QVhT6qG44
	2qad9+Ro5KzVp8plZl0ha0U4+aAcUCPI9tPkg31Oui+kC0W7Kt48cqp6AwVpdq9IsyJbcj+3ajl
	Ox74E8FCFHTxb2Ilj6FOLJTw/MQ0QDxev6On9Mp3BZJecFfLMVj7uVAjNmQ59mPRIXiEr3EI4gj
	zer0=
X-Google-Smtp-Source: AGHT+IG4QRQF0niFAjvGK1I2zj7C/puZbed3eaweHgTfDfneLiZqbuZlRtu2w3kkRDe9KfHhjPrYSg==
X-Received: by 2002:a17:90b:2650:b0:301:1c11:aa83 with SMTP id 98e67ed59e1d1-305321640acmr18888329a91.28.1743473470275;
        Mon, 31 Mar 2025 19:11:10 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-30516d3ce04sm8074118a91.9.2025.03.31.19.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 19:11:09 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	muchun.song@linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] mm/compaction: Fix bug in hugetlb handling pathway
Date: Mon, 31 Mar 2025 19:10:24 -0700
Message-ID: <20250401021025.637333-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compaction code doesn't take references on pages until we're certain
we should attempt to handle it.

In the hugetlb case, isolate_or_dissolve_huge_page() may return -EBUSY
without taking a reference to the folio associated with our pfn. If our
folio's refcount drops to 0, compound_nr() becomes unpredictable, making
low_pfn and nr_scanned unreliable.
The user-visible effect is minimal - this should rarely happen (if ever).

Fix this by storing the folio statistics earlier on the stack (just like
the THP and Buddy cases).

Also revert commit 66fe1cf7f581 ("mm: compaction: use helper compound_nr
in isolate_migratepages_block")
to make backporting easier.

Fixes: 369fa227c219 ("mm: make alloc_contig_range handle free hugetlb pages")
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/compaction.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 139f00c0308a..ca71fd3c3181 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -981,13 +981,13 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		}
 
 		if (PageHuge(page)) {
+			const unsigned int order = compound_order(page);
 			/*
 			 * skip hugetlbfs if we are not compacting for pages
 			 * bigger than its order. THPs and other compound pages
 			 * are handled below.
 			 */
 			if (!cc->alloc_contig) {
-				const unsigned int order = compound_order(page);
 
 				if (order <= MAX_PAGE_ORDER) {
 					low_pfn += (1UL << order) - 1;
@@ -1011,8 +1011,8 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				 /* Do not report -EBUSY down the chain */
 				if (ret == -EBUSY)
 					ret = 0;
-				low_pfn += compound_nr(page) - 1;
-				nr_scanned += compound_nr(page) - 1;
+				low_pfn += (1UL << order) - 1;
+				nr_scanned += (1UL << order) - 1;
 				goto isolate_fail;
 			}
 
-- 
2.48.1

