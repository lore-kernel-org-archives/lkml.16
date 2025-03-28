Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933EC1E0B67
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743186608; cv=none; b=ULkloLgkFwPAZZR9jzc5p5OMlfqk39ANPj+fWYkFjbA2zVvUF8IhWpXBJvl4HjyfD0DkVBLVXNLQ8oVj5c4oQjrPRE71KyPqDpdIGIwh3iB61dWyq8c+RIMPew3JeiHZAHxVFIDfT+SuO0hdFMwACSWYuJBmKoQiVBQRoP+LNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743186608; c=relaxed/simple;
	bh=0XebXl+Om/rMg+RdS+JY/LjLXtd4q5WCPR44cJdQYUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A1Fb16G8DxGGcgELug8/N6ksobL3wFZn23a7oa6Dg3zjAhxus0W+hQflzMmJwXa36jg8KhVjfAxZxH5MVviZr2myj87m9olwGKpRMxghL4IqTbdeGXfckZUXUn+Gbs99/wHoxspwJAW+o8GD2BwUosui74isrDbLdXGZmopR8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tyEK7-000000004rg-42PA;
	Fri, 28 Mar 2025 14:20:55 -0400
Date: Fri, 28 Mar 2025 14:20:55 -0400
From: Rik van Riel <riel@surriel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Vinay Banakar <vny@google.com>, liuye <liuye@kylinos.cn>, Hugh Dickins
 <hughd@google.com>, Mel Gorman <mgorman@techsingularity.net>, Yu Zhao
 <yuzhao@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v2] mm/vmscan: batch TLB flush during memory reclaim
Message-ID: <20250328142055.313916d1@fangorn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com

From: Vinay Banakar <vny@google.com>

The current implementation in shrink_folio_list() performs a full TLB
flush for every individual folio reclaimed. This causes unnecessary
overhead during memory reclaim.

The current code:
1. Clears PTEs and unmaps each page individually
2. Performs a full TLB flush on every CPU the mm is running on

The new code:
1. Clears PTEs and unmaps each page individually
2. Adds each unmapped page to pageout_folios
3. Flushes the TLB once before procesing pageout_folios

This reduces the number of TLB flushes issued by the memory reclaim
code by 1/N, where N is the number of mapped folios encountered in
the batch processed by shrink_folio_list.

[riel: forward port to 6.14, adjust code and naming to match surrounding code]

Signed-off-by: Vinay Banakar <vny@google.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
v2: remove folio_test_young that broke some 32 bit builds, since pages should be
    unmapped when they get to this point anyway, and if somebody mapped them again
    they are by definition (very) recently accessed

 mm/vmscan.c | 112 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 44 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c767d71c43d7..286ff627d337 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1086,6 +1086,7 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 	struct folio_batch free_folios;
 	LIST_HEAD(ret_folios);
 	LIST_HEAD(demote_folios);
+	LIST_HEAD(pageout_folios);
 	unsigned int nr_reclaimed = 0, nr_demoted = 0;
 	unsigned int pgactivate = 0;
 	bool do_demote_pass;
@@ -1394,51 +1395,10 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 				goto keep_locked;
 
 			/*
-			 * Folio is dirty. Flush the TLB if a writable entry
-			 * potentially exists to avoid CPU writes after I/O
-			 * starts and then write it out here.
+			 * Add to pageout list for batched TLB flushing and IO submission.
 			 */
-			try_to_unmap_flush_dirty();
-			switch (pageout(folio, mapping, &plug, folio_list)) {
-			case PAGE_KEEP:
-				goto keep_locked;
-			case PAGE_ACTIVATE:
-				/*
-				 * If shmem folio is split when writeback to swap,
-				 * the tail pages will make their own pass through
-				 * this function and be accounted then.
-				 */
-				if (nr_pages > 1 && !folio_test_large(folio)) {
-					sc->nr_scanned -= (nr_pages - 1);
-					nr_pages = 1;
-				}
-				goto activate_locked;
-			case PAGE_SUCCESS:
-				if (nr_pages > 1 && !folio_test_large(folio)) {
-					sc->nr_scanned -= (nr_pages - 1);
-					nr_pages = 1;
-				}
-				stat->nr_pageout += nr_pages;
-
-				if (folio_test_writeback(folio))
-					goto keep;
-				if (folio_test_dirty(folio))
-					goto keep;
-
-				/*
-				 * A synchronous write - probably a ramdisk.  Go
-				 * ahead and try to reclaim the folio.
-				 */
-				if (!folio_trylock(folio))
-					goto keep;
-				if (folio_test_dirty(folio) ||
-				    folio_test_writeback(folio))
-					goto keep_locked;
-				mapping = folio_mapping(folio);
-				fallthrough;
-			case PAGE_CLEAN:
-				; /* try to free the folio below */
-			}
+			list_add(&folio->lru, &pageout_folios);
+			continue;
 		}
 
 		/*
@@ -1549,6 +1509,70 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 	}
 	/* 'folio_list' is always empty here */
 
+	if (!list_empty(&pageout_folios)) {
+		/*
+		 * The loop above unmapped the folios from the page tables.
+		 * One TLB flush takes care of the whole batch.
+		 */
+		try_to_unmap_flush_dirty();
+
+		while (!list_empty(&pageout_folios)) {
+			struct folio *folio = lru_to_folio(&pageout_folios);
+			struct address_space *mapping;
+			list_del(&folio->lru);
+
+			/* Recheck if the page got reactivated */
+			if (folio_test_active(folio) || folio_mapped(folio))
+				goto skip_pageout_locked;
+
+			mapping = folio_mapping(folio);
+			switch (pageout(folio, mapping, &plug, &pageout_folios)) {
+			case PAGE_KEEP:
+			case PAGE_ACTIVATE:
+				goto skip_pageout_locked;
+			case PAGE_SUCCESS:
+				/*
+				 * If shmem folio is split when writeback to swap,
+				 * the tail pages will make their own pass through
+				 * this loop and be accounted then.
+				 */
+				stat->nr_pageout += folio_nr_pages(folio);
+
+				if (folio_test_writeback(folio))
+					goto skip_pageout;
+				if (folio_test_dirty(folio))
+					goto skip_pageout;
+
+				/*
+				 * A synchronous write - probably a ramdisk.  Go
+				 * ahead and try to reclaim the folio.
+				 */
+				if (!folio_trylock(folio))
+					goto skip_pageout;
+				if (folio_test_dirty(folio) ||
+				    folio_test_writeback(folio))
+					goto skip_pageout_locked;
+				mapping = folio_mapping(folio);
+				/* try to free the folio below */
+				fallthrough;
+			case PAGE_CLEAN:
+				/* try to free the folio */
+				if (!mapping ||
+				    !remove_mapping(mapping, folio))
+					goto skip_pageout_locked;
+
+				nr_reclaimed += folio_nr_pages(folio);
+				folio_unlock(folio);
+				continue;
+			}
+
+skip_pageout_locked:
+			folio_unlock(folio);
+skip_pageout:
+			list_add(&folio->lru, &ret_folios);
+		}
+	}
+
 	/* Migrate folios selected for demotion */
 	nr_demoted = demote_folio_list(&demote_folios, pgdat);
 	nr_reclaimed += nr_demoted;
-- 
2.47.1

