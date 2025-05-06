Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD0227B510
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530729; cv=none; b=UBZ4m2Q/vGRSZgOvE1gle/7swdDZqCl6RNeZC/HH5T20/wlTQQ3epP3RlrLLqwGXOKmUY137tE01dC2MA0i+MFZUoeWbq0dyABJJL6rgvTey64U907d7RE7u5qqHt6j+f3CEZF1mB/JhxoaE/X2HVAc7K4Nl7uoUDsN1MCXNOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530729; c=relaxed/simple;
	bh=GaK+MeY4RR2wFjjXSUnauYpLdCtUfKHMhZGrtxTn52A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QA5rkQeuIijahK00Sfni1RP1Z7cpPzQAPhII0pw9pczLqfbdKhSYIAzuvOiZbG0CY1ETrI3oC6dXtAsrBvY1uEWAGgJb/05wyv71N1TH1D4AVp0g6AsNs4YgHaSwMAQ/UFFGv5rwCBskzKnsvXeYCWrCs1TbU5LZXIP74bx80gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv9E5V7Z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv9E5V7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746530728; x=1778066728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GaK+MeY4RR2wFjjXSUnauYpLdCtUfKHMhZGrtxTn52A=;
  b=Dv9E5V7ZrwES7OSQY61zXEO5hL1PBCHFWivhwOv5N0ZycJHWtENqaI9G
   30tRiSbst9feiLHtyW17i6CgoCAKW4vmaSo6YebmXBaS2+QMlXRO+CVOj
   QR/+3gnQs5EIXrpQPKUSn7yF+lAvuwqKIUe887M0SnoQru1FRJV3Yu0eT
   p6X/qDKX4ZwpVcGU4tFni6Vpmyy74iCUE0sqx+JK8tc5dFMTvZ04HD4TI
   rxNkGPgFbRRw90++UuSrDP7lZcwMAK/CZfL8x9gFvjJm5QH7u7m5Yrfde
   PfALfb2FrFvZCx5mZ8rtYF+gUhHi2svZYnn32TT7VbeWoQa8FyEDKIrUP
   Q==;
X-CSE-ConnectionGUID: rf9zB/0QRfaL/cxzdjOW4Q==
X-CSE-MsgGUID: 92fyb+xORiiylhi+ji3FEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58822071"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="58822071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:25:27 -0700
X-CSE-ConnectionGUID: zoC/e2LwTai3NljjJd+R8g==
X-CSE-MsgGUID: 1R/i59llQ8ujObofyYck7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="166517109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2025 04:25:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 5640FE7; Tue, 06 May 2025 14:25:22 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: akpm@linux-foundation.org,
	vbabka@suse.cz,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	bp@alien8.de,
	tglx@linutronix.de,
	david@redhat.com
Cc: ast@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well with unaccepted memory
Date: Tue,  6 May 2025 14:25:08 +0300
Message-ID: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

try_alloc_pages() will not attempt to allocate memory if the system has
*any* unaccepted memory. Memory is accepted as needed and can remain in
the system indefinitely, causing the interface to always fail.

Rather than immediately giving up, attempt to use already accepted
memory on free lists.

Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
for ALLOC_TRYLOCK requests.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation")
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5669baf2a6fe..5fccf5fce084 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -290,7 +290,8 @@ EXPORT_SYMBOL(nr_online_nodes);
 #endif
 
 static bool page_contains_unaccepted(struct page *page, unsigned int order);
-static bool cond_accept_memory(struct zone *zone, unsigned int order);
+static bool cond_accept_memory(struct zone *zone, unsigned int order,
+			       int alloc_flags);
 static bool __free_unaccepted(struct page *page);
 
 int page_group_by_mobility_disabled __read_mostly;
@@ -3616,7 +3617,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 			}
 		}
 
-		cond_accept_memory(zone, order);
+		cond_accept_memory(zone, order, alloc_flags);
 
 		/*
 		 * Detect whether the number of free pages is below high
@@ -3643,7 +3644,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 				       gfp_mask)) {
 			int ret;
 
-			if (cond_accept_memory(zone, order))
+			if (cond_accept_memory(zone, order, alloc_flags))
 				goto try_this_zone;
 
 			/*
@@ -3696,7 +3697,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 
 			return page;
 		} else {
-			if (cond_accept_memory(zone, order))
+			if (cond_accept_memory(zone, order, alloc_flags))
 				goto try_this_zone;
 
 			/* Try again if zone has deferred pages */
@@ -4849,7 +4850,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			goto failed;
 		}
 
-		cond_accept_memory(zone, 0);
+		cond_accept_memory(zone, 0, alloc_flags);
 retry_this_zone:
 		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages;
 		if (zone_watermark_fast(zone, 0,  mark,
@@ -4858,7 +4859,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			break;
 		}
 
-		if (cond_accept_memory(zone, 0))
+		if (cond_accept_memory(zone, 0, alloc_flags))
 			goto retry_this_zone;
 
 		/* Try again if zone has deferred pages */
@@ -7284,7 +7285,8 @@ static inline bool has_unaccepted_memory(void)
 	return static_branch_unlikely(&zones_with_unaccepted_pages);
 }
 
-static bool cond_accept_memory(struct zone *zone, unsigned int order)
+static bool cond_accept_memory(struct zone *zone, unsigned int order,
+			       int alloc_flags)
 {
 	long to_accept, wmark;
 	bool ret = false;
@@ -7295,6 +7297,10 @@ static bool cond_accept_memory(struct zone *zone, unsigned int order)
 	if (list_empty(&zone->unaccepted_pages))
 		return false;
 
+	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
+	if (alloc_flags & ALLOC_TRYLOCK)
+		return false;
+
 	wmark = promo_wmark_pages(zone);
 
 	/*
@@ -7351,7 +7357,8 @@ static bool page_contains_unaccepted(struct page *page, unsigned int order)
 	return false;
 }
 
-static bool cond_accept_memory(struct zone *zone, unsigned int order)
+static bool cond_accept_memory(struct zone *zone, unsigned int order,
+			       int alloc_flags)
 {
 	return false;
 }
@@ -7422,11 +7429,6 @@ struct page *try_alloc_pages_noprof(int nid, unsigned int order)
 	if (!pcp_allowed_order(order))
 		return NULL;
 
-#ifdef CONFIG_UNACCEPTED_MEMORY
-	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
-	if (has_unaccepted_memory())
-		return NULL;
-#endif
 	/* Bailout, since _deferred_grow_zone() needs to take a lock */
 	if (deferred_pages_enabled())
 		return NULL;
-- 
2.47.2

