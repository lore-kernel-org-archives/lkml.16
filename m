Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD601EC01F
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190558; cv=none; b=YOg/s6khU/2ewvUmjXrtqOzObFrc0TBua+LZH7ERvCwPUBg5Z4oSw+tIXiK3tjdWdqQbPBOlP/55KdBPy+8G2h2Fn0kEIr2M9fzlZdfIPreF5hvXsCwqHR30gZzZn5lXTi+eslbwX6MSeRP/CKZb+/xqHOxbVHxJFyMe93EcF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190558; c=relaxed/simple;
	bh=Gu1u2DXo15ac0AxVzDZnMFcfHwPhqJHHi/OiRcW6shA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ISQ/LUcYpmxRI87xsVBf7RJjq7naRcaRrnHsbE2Wx18NB9P++IlAXyMDYM5wZddjoBBRMfVghpCqqki5tcm8z4ay3mdhXHjcF1e5LAwN/jJzgZrOuZcNGjI1XiJol53tyCI+R9SMDNm+4zucyfl/UPqpVLv5/HcOMnM/iwOyqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjXgkvh/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjXgkvh/"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21661949f23so4144655ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190556; x=1738795356; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tk6hF6rqBW9AusrfDePvQanEIhsmPpyv3aYoz52NJE8=;
        b=JjXgkvh/k+gZ8iePhzpZ8zJ7fIe6NVU9x5T5Fm5vwcxc2dFVbReUhQzerQEkQ8MP5n
         XeAzzhshbafqrU7NM49eJdpU0ZtCueJ7kXaYTIjEJFDERKxN9lHL7CpLHAYOQJ2r8PpU
         3eQsh9pLZt+vyOviOPxmsBjFW/y16/2B5F+8LICwFKvg7spzPsOTAe1YJ/ECF1QohPKr
         Ll6bAORgqGUXqOfleTp11hcExnGqcpGWpfalizrYln417mCywTVZWRny+b1NcLtvNE9Z
         Ci+QxnCcgVJnX6k9TGvHcNQ6IYumV3hM2IJU/HI3H4XS/8vavqTSj+rHoMJjbJzPm2fr
         kPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190556; x=1738795356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tk6hF6rqBW9AusrfDePvQanEIhsmPpyv3aYoz52NJE8=;
        b=dmQR106NxRQInEATLbgT/tgB6YLCO4FbGuWHApw31HaGxmHUdEt2bOKSz7zGvHXhDV
         lytfoJvi57VZrRg0mnjxt6Hyl6b+YtJZoexTpyRfEnJV0dtN4n3y5DHEmKZuROWHRcSr
         00i4N8itDGfLSYXaBKc38t9cN9Dyb32qpaMCulV/dSq2sGNrbTJ65Mog4ZIp5eIpT3NJ
         Pk9zTXt8CH8WKxRZRtAWlM8gGaXOu1+gg2685y1GlkolNWd/A4VlHnkaQzuhikw9QqC9
         8L6Tl4KU2CZeHH8TorgVDc7nmTbLWF5Cr56RZd+KQ5q6vXMoh8EjGkZXj5hHH1iZ66v0
         CMNw==
X-Forwarded-Encrypted: i=1; AJvYcCU87ZVaK9dZe+wKrRRY8HtuyafYuuRNEgsQLGSQVfe4UVjVPRKHWspGrEulfSCqwXk9+J/POhhw0pUgWPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+1gRQ+yG0ZvBBQqzpiewf0cNyy9LpUj84l0Qrt+8jS4jb3Zs
	Y1ozo/qee6nNEMJPmfXgJxklEzHRHBqihNu2K1st+n9MMCx6gpIx2U+PmSB2YjWwDhPk2w==
X-Google-Smtp-Source: AGHT+IEqjJb+x+dhP5rhHYNRAeOuV6o2kqh55KQZeq8wjY02yXG128DZoAUhFzB6wXoeeE68EWhcrrD9
X-Received: from pfbay42.prod.google.com ([2002:a05:6a00:302a:b0:729:9f1:663e])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c91b:b0:1eb:3623:59fd
 with SMTP id adf61e73a8af0-1ed7a48c425mr8653488637.4.1738190556311; Wed, 29
 Jan 2025 14:42:36 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:41 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-13-fvdl@google.com>
Subject: [PATCH v2 12/28] mm/hugetlb: set migratetype for bootmem folios
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

The pageblocks that back memblock allocated hugetlb folios might
not have the migrate type set, in the CONFIG_DEFERRED_STRUCT_PAGE_INIT
case.

memblock allocated hugetlb folios might be given to the buddy allocator
eventually (if nr_hugepages is lowered), so make sure that the migrate
type for the pageblocks contained in them is set when initializing them.
Set it to the default that memmap init also uses (MIGRATE_MOVABLE).

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index c16ed9790022..e5ca5cf2c6fd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -36,6 +36,7 @@
 #include <linux/memory.h>
 #include <linux/mm_inline.h>
 #include <linux/padata.h>
+#include <linux/page-isolation.h>
 
 #include <asm/page.h>
 #include <asm/pgalloc.h>
@@ -3258,6 +3259,26 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	prep_compound_head((struct page *)folio, huge_page_order(h));
 }
 
+/*
+ * memblock-allocated pageblocks might not have the migrate type set
+ * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
+ * here.
+ *
+ * Note that this will not write the page struct, it is ok (and necessary)
+ * to do this on vmemmap optimized folios.
+ */
+static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
+							  struct hstate *h)
+{
+	unsigned long nr_pages = pages_per_huge_page(h), i;
+
+	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
+
+	for (i = 0; i < nr_pages; i += pageblock_nr_pages)
+		set_pageblock_migratetype(folio_page(folio, i),
+					  MIGRATE_MOVABLE);
+}
+
 static void __init prep_and_add_bootmem_folios(struct hstate *h,
 					struct list_head *folio_list)
 {
@@ -3279,6 +3300,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 					HUGETLB_VMEMMAP_RESERVE_PAGES,
 					pages_per_huge_page(h));
 		}
+		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
 		__prep_account_new_huge_page(h, folio_nid(folio));
-- 
2.48.1.262.g85cc9f2d1e-goog

