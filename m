Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5463A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819572; cv=none; b=CwW8IF3pW/IUHHiacqz2g5NA3m+qkkrH/j0okI2iSaxtvmfwyRy0ZJ26uEw0zJ9/Di9iJ0FQCCnAZQtcuYCym48RO47Z4ECdZL+Gyr4rnajaQGvJiVJ0fLB9aD7Lw7yQUkIuqxc2beEb5qevTfS0f/XnMTSZJlDoOQdm3c2CV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819572; c=relaxed/simple;
	bh=1GoZAGAypiB2oHd3pN/5VWptPj76Frs4MFiz1/rzIR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKGoG3mbMNrDO7SNCWRALD6fSVUHOg7FaX+QNPbthXSL1z0ba7gas8UWpXubMt3XHJYzQ5406oD5EzMOpHVOw+4yIqh6f/LsQ9xFdXLyMeQu62p4xra1Ax0ogByJvFdDZzuH5kDXbOBO+uJw6akwgjBVJq5Um3j2zz5ArrVkfzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjqlRkjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjqlRkjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A6CC4CEE3;
	Fri, 13 Jun 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819572;
	bh=1GoZAGAypiB2oHd3pN/5VWptPj76Frs4MFiz1/rzIR4=;
	h=From:To:Cc:Subject:Date:From;
	b=DjqlRkjSqS4mtvE0BoZP79f0E6u+3WNmszFR8VjFFD2aCwZ15xjkAhJ8fpbOt43CR
	 MZFOeHBWYZ5EqEVRW6wy741J9UBA4AP5Q4hauneLWNANRSRCwZW9AN/P6REch1et8Z
	 tGjDseMijrNPgamzq06NS61zhF9jkoobMe5tnJzmp8MHU4p4ERROPUh/tD+618lRQp
	 USno98Hg8mmJN46I+37znExqRzf8hDsLHZ/q32KhFx+CdmFp1550mf0ChHgJ3hk2JF
	 OfN4cBW1kafDhd53rvo/d0elwoZsWm33lttAxxqYMDBV4/k9f/g4ITmzSl/rKGe+hf
	 ez9rJQYWOaUmw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2] kho: initialize tail pages for higher order folios properly
Date: Fri, 13 Jun 2025 14:59:06 +0200
Message-ID: <20250613125916.39272-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Currently, when restoring higher order folios, kho_restore_folio() only
calls prep_compound_page() on all the pages. That is not enough to
properly initialize the folios. The managed page count does not
get updated, the reserved flag does not get dropped, and page count does
not get initialized properly.

Restoring a higher order folio with it results in the following BUG with
CONFIG_DEBUG_VM when attempting to free the folio:

    BUG: Bad page state in process test  pfn:104e2b
    page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffffffffffffff pfn:0x104e2b
    flags: 0x2fffff80000000(node=0|zone=2|lastcpupid=0x1fffff)
    raw: 002fffff80000000 0000000000000000 00000000ffffffff 0000000000000000
    raw: ffffffffffffffff 0000000000000000 00000001ffffffff 0000000000000000
    page dumped because: nonzero _refcount
    [...]
    Call Trace:
    <TASK>
    dump_stack_lvl+0x4b/0x70
    bad_page.cold+0x97/0xb2
    __free_frozen_pages+0x616/0x850
    [...]

Combine the path for 0-order and higher order folios, initialize the
tail pages with a count of zero, and call adjust_managed_page_count() to
account for all the pages instead of just missing them.

In addition, since all the KHO-preserved pages get marked with
MEMBLOCK_RSRV_NOINIT by deserialize_bitmap(), the reserved flag is not
actually set (as can also be seen from the flags of the dumped page in
the logs above). So drop the ClearPageReserved() calls.

Fixes: fc33e4b44b271 ("kexec: enable KHO support for memory preservation")
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
---

Changes in v2:
- Declare i in the loop instead of at the top.

 kernel/kexec_handover.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index eb305e7e61296..ca525f794f6be 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -157,11 +157,21 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
 }

 /* almost as free_reserved_page(), just don't free the page */
-static void kho_restore_page(struct page *page)
+static void kho_restore_page(struct page *page, unsigned int order)
 {
-	ClearPageReserved(page);
-	init_page_count(page);
-	adjust_managed_page_count(page, 1);
+	unsigned int nr_pages = (1 << order);
+
+	/* Head page gets refcount of 1. */
+	set_page_count(page, 1);
+
+	/* For higher order folios, tail pages get a page count of zero. */
+	for (unsigned int i = 1; i < nr_pages; i++)
+		set_page_count(page + i, 0);
+
+	if (order > 0)
+		prep_compound_page(page, order);
+
+	adjust_managed_page_count(page, nr_pages);
 }

 /**
@@ -179,15 +189,10 @@ struct folio *kho_restore_folio(phys_addr_t phys)
 		return NULL;

 	order = page->private;
-	if (order) {
-		if (order > MAX_PAGE_ORDER)
-			return NULL;
-
-		prep_compound_page(page, order);
-	} else {
-		kho_restore_page(page);
-	}
+	if (order > MAX_PAGE_ORDER)
+		return NULL;

+	kho_restore_page(page, order);
 	return page_folio(page);
 }
 EXPORT_SYMBOL_GPL(kho_restore_folio);
--
2.47.1

