Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06991B21AA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867898; cv=none; b=l3ChW1J7TsGCs2/kjt9lKecNWjHxGL8GkizHXxVkSM8GUNFYAgzk8GU0NBYZaRmkZ6wackBAgxU3xfnNInoFFyD8xlQ3CktA9KsQMX/YQEnpCnVXsuQZhVFiMSNdePgGIVFoGTNfhghXJecPPJaXIMb5Ykw5oZ/en30J1HCzBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867898; c=relaxed/simple;
	bh=AqKIWs9Sv7x0CLKfPLKlMM+0qtXjdKuonIonrMdi61g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PzAWpulgvrA1d/eStPvtNnPr/K/U/oXNqKcpuM2w/vf3eU/Pg34P946mvsm373lZYodLTt6crRGkBXpaCORFk1g9lK6nPEReNf3QzdtoRe++wxS6VmBbQrxh2xE5gz6ueMckueCaqud/7ax63F/HGOZIiff6t7vpmLZUTjmBSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kneqMn/2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kneqMn/2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa0204ad21so2418521a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867896; x=1739472696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NeQMOnzxPkjyqTJozldr6OrEIjuFMWwE6WQJOgcCAA=;
        b=kneqMn/2slH6JL71S3C4ueXbD3jIQx/esMr0BXvc/eNjO0rY2ZQxmBV7c8hj3lilw6
         W8svj10jDcuZE4yRfVQokZIlLnIIrFmkLrSBvEvLebsscPkVtEf2ztjNmgvU2eyG9kiC
         FaiYhWka9TSIt/VWjeW7UZmRs7fyc+Fxr8LTbeZJtWD6vZMdLr5iNum2P/+NDSLm3r2x
         NpC2rhnpBWRh5S/7hjKSBeBtHcW2V3N2qeN38CKZdFCbMobQxI/seloIUo+5nH7IyI8S
         k0sIvLi0gyVHIYNwsgqRHjAozfTwj+JfdfDKVUT+0pJ2+GztvUgXS6zjzlRK7c6dQ8Ze
         zTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867896; x=1739472696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NeQMOnzxPkjyqTJozldr6OrEIjuFMWwE6WQJOgcCAA=;
        b=migna7MgsJ0ayWU3GRJLDpbp9feVpg20CHdvRZKJ19puTD3XnHT73a2cJrdKbvMYRO
         TaSjgIyfWzpG1LTsGVVxs4oDqOBu1I/xhxHIkMyNu8Cyi1BUgw+Sl82u/8H3Xchq4o4Z
         FHYQ0XdguocdiI9EjhK5wrEQ3UORUfI4yMcEoZn4nttqA0DM8VmjeVjGKMTDffg8UfNJ
         QtZyqXWVO8LPBb1d9te66QoPbOXj/+6WpnV4XYy3lz5qQ/lXxEswNpEZXnef4DvF6j2E
         RjCUkXe5ZwatYF3LBZYnjLYDAAP90nxj3oasbn5iznMyQVmWJlyeK5AXGih5rMnc/7gu
         Glfw==
X-Forwarded-Encrypted: i=1; AJvYcCVsn2g3kUHa5nMJsLFiQGsb+qbEvQuy0Ygqf1aZaivvl9eA7WmvgGA0lCZaV31vCR492/dfg3o4xail/3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjg46Hwhy0KtRbn1ls49vagGqAUrB9WHQ/9lfzw6Ig7vxCDrzl
	4guw0824D1KN2X8BSugd/MkeImXP9JduJw+dceBW/ZGxkhodBMjfp8lH6rrCXpCz4f7Y1A==
X-Google-Smtp-Source: AGHT+IH7ZN2LcrXXo7ZGhTfjqav29224bEfR3b4dopinjdsKyhAOEliIZ1YG+HBMVTQXtNzOsKEFpkdd
X-Received: from pjuw5.prod.google.com ([2002:a17:90a:d605:b0:2ef:eb2f:ebe])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:f94e:b0:2f2:a664:df19
 with SMTP id 98e67ed59e1d1-2fa23f436d6mr217716a91.7.1738867896108; Thu, 06
 Feb 2025 10:51:36 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:52 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-13-fvdl@google.com>
Subject: [PATCH v3 12/28] mm/hugetlb: set migratetype for bootmem folios
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
 mm/hugetlb.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 5a4b322e2bb2..de8adfb487f4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3258,6 +3258,26 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
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
@@ -3279,6 +3299,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 					HUGETLB_VMEMMAP_RESERVE_PAGES,
 					pages_per_huge_page(h));
 		}
+		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
 		__prep_account_new_huge_page(h, folio_nid(folio));
-- 
2.48.1.502.g6dc24dfdaf-goog

