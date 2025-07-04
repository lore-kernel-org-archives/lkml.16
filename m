Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279B42F3C04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624786; cv=none; b=L1LMaRSULRojMYGIaiTqkgbJ5AqpvHoAaoXN1Gdtl+lj52nZZ67f648c0YLZ0URxt0Ruvu5EZ7kGc/xFgv9BuocSSvLifBrMQ4BWDhLOCwYmIv4JKyfGAmO0qNjijTtu2lshUqeSEFKRmtUTOvDYPse6RJCtGFhXjhBJq9vrZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624786; c=relaxed/simple;
	bh=CEOWBR0ho45KHBlgU76irVulTR2FPeYP8m0twAminTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDB2gd4QUZBBYk4rAAwXZi+eSS8dHXu3IQPmjM2DBHrFmdSoBdBg0LCHzfIjVihIgjdEZJAKDRX2N9nbH8Mb5j4J4hQKJs0y3x5/cBddbRTwIvXjXtv/oSrirADi4nCzFn8N6cPINZSVQgsf7kjtDcxznxDyuR2ieqRrCf6ThiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRe2DMzt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRe2DMzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
	b=bRe2DMztSP+dOQPpEDzkZ0OvXJ82XKzpi4MN91WvyoIHei8VmBT7VoC3F+s6vH7k+YkEGr
	Zd5qCucojFyFCJBkQPvzUCE7hRomSXEFgsQVTmk87zq8LI6hWrgGbTkTzSYzYgdpS6X6Am
	VajQsiVcDsIdDu/bQIEJWfsY/wLyDHU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-7GN7KdLmOKWc5XCZTvo6dA-1; Fri, 04 Jul 2025 06:26:22 -0400
X-MC-Unique: 7GN7KdLmOKWc5XCZTvo6dA-1
X-Mimecast-MFC-AGG-ID: 7GN7KdLmOKWc5XCZTvo6dA_1751624781
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso4616195e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624781; x=1752229581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
        b=Fb1fjQUg2NPmKf9Tq2Mf2fXbxwLfGr9hzvrv/kmXYUQP15T556Hwkzw+/QJIEqsKYK
         R2TVvBSABtEDTkWQYbGNPI8lupArIbzUnqnc/C5sGleydufVe1+JAK7y7FKiqyZDp40T
         F1bjCWjtIrV0BQl0YRs2R96ogMpO3Lf8QsZm412LCl7euM44xG88ScynuCF484Nepi5D
         Fe4IaC1tDkzHxNVaGjZKlpN6pVQYXS5qNaF1WLHtbSlA1KDIm3Fjhxyjun8gSTXzvQtg
         IYN6LGPk9wK7zaKfbc46BM7TKln7lX1kMdxHVcMU/bAJ71KZ8vzaJTWao486KA/HScOp
         zQOg==
X-Gm-Message-State: AOJu0YyS7qy4u5boCvmjyGo1IuNFGHwo5KwH+v5j5DrsOD/h5eTnJr1z
	ePyI/fzTRv6ljssAWIDo/akKA202XUU03I43rWGmsg280jiBXodO45vmb2IsAfpWEOKuoXPH/Dp
	Ykkj2og9o+W4aMG+oOAB1gDK8I+c/cQDpp0jPk2SRSe9s5uSu4toFDxDHEI3Qm5Ft85u7fQGX4i
	tcFtJdmvrPjkYx7o7JNMEbKYLoIJl92sUmOwlfoUT86fSDrQ==
X-Gm-Gg: ASbGncvkxTp7XT1ZCMAvp1CBB2GyeMuPU5IhxG2Q4Chjva5RNAQFotXgQ9Ufl4iyhq6
	BBAuTLH66sovk/JH7f2+74pMzIKu+gIxmWuc8ByGnSGxWED6Vqb1s02iwLBMlftS6juW5qiFNNi
	gGjbsLEPmeNqJPS/EH2HBsxwMnsdjuf716ink/QQpFjyoyIrksen2fxzn2gk2zoNrKXwcFM6y28
	lfckS3/1WQ1ims3BAF9+VygoWvluiw4LG448e+xSlH73hujW1CEnlTagSpy2tX1bcwvg9OFViel
	roZfC9a4dHfO0/1Of23scHwgXhEVOFwwh+pBnjaJgmM0j0S8ZCZnmRxwghtFT2bVwNZ9vfEg3oB
	l3zftGA==
X-Received: by 2002:a05:6000:18a3:b0:3a4:cf10:28f with SMTP id ffacd0b85a97d-3b4965fa4b0mr1306265f8f.31.1751624780898;
        Fri, 04 Jul 2025 03:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbtvCxrQrQrYrJp00fZP6RxGB4BHMLsK8k2E+KsEE1fK7HT/hfJLD1aXJjlmgOs0fjfm/CXw==
X-Received: by 2002:a05:6000:18a3:b0:3a4:cf10:28f with SMTP id ffacd0b85a97d-3b4965fa4b0mr1306179f8f.31.1751624780162;
        Fri, 04 Jul 2025 03:26:20 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0ae0sm2166343f8f.33.2025.07.04.03.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:19 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v2 18/29] mm: remove __folio_test_movable()
Date: Fri,  4 Jul 2025 12:25:12 +0200
Message-ID: <20250704102524.326966-19-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to page_has_movable_ops(). While at it, cleanup relevant code
a bit.

The data_race() in migrate_folio_unmap() is questionable: we already
hold a page reference, and concurrent modifications can no longer
happen (iow: __ClearPageMovable() no longer exists). Drop it for now,
we'll rework page_has_movable_ops() soon either way to no longer
rely on page->mapping.

Wherever we cast from folio to page now is a clear sign that this
code has to be decoupled.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h |  6 ------
 mm/migrate.c               | 43 ++++++++++++--------------------------
 mm/vmscan.c                |  6 ++++--
 3 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index c67163b73c5ec..4c27ebb689e3c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -744,12 +744,6 @@ static __always_inline bool PageAnon(const struct page *page)
 	return folio_test_anon(page_folio(page));
 }
 
-static __always_inline bool __folio_test_movable(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) ==
-			PAGE_MAPPING_MOVABLE;
-}
-
 static __always_inline bool page_has_movable_ops(const struct page *page)
 {
 	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
diff --git a/mm/migrate.c b/mm/migrate.c
index 3be7a53c13b66..e307b142ab41a 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -219,12 +219,7 @@ void putback_movable_pages(struct list_head *l)
 			continue;
 		}
 		list_del(&folio->lru);
-		/*
-		 * We isolated non-lru movable folio so here we can use
-		 * __folio_test_movable because LRU folio's mapping cannot
-		 * have PAGE_MAPPING_MOVABLE.
-		 */
-		if (unlikely(__folio_test_movable(folio))) {
+		if (unlikely(page_has_movable_ops(&folio->page))) {
 			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
@@ -237,26 +232,20 @@ void putback_movable_pages(struct list_head *l)
 /* Must be called with an elevated refcount on the non-hugetlb folio */
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 {
-	bool isolated, lru;
-
 	if (folio_test_hugetlb(folio))
 		return folio_isolate_hugetlb(folio, list);
 
-	lru = !__folio_test_movable(folio);
-	if (lru)
-		isolated = folio_isolate_lru(folio);
-	else
-		isolated = isolate_movable_ops_page(&folio->page,
-						    ISOLATE_UNEVICTABLE);
-
-	if (!isolated)
-		return false;
-
-	list_add(&folio->lru, list);
-	if (lru)
+	if (page_has_movable_ops(&folio->page)) {
+		if (!isolate_movable_ops_page(&folio->page,
+					      ISOLATE_UNEVICTABLE))
+			return false;
+	} else {
+		if (!folio_isolate_lru(folio))
+			return false;
 		node_stat_add_folio(folio, NR_ISOLATED_ANON +
 				    folio_is_file_lru(folio));
-
+	}
+	list_add(&folio->lru, list);
 	return true;
 }
 
@@ -1140,12 +1129,7 @@ static void migrate_folio_undo_dst(struct folio *dst, bool locked,
 static void migrate_folio_done(struct folio *src,
 			       enum migrate_reason reason)
 {
-	/*
-	 * Compaction can migrate also non-LRU pages which are
-	 * not accounted to NR_ISOLATED_*. They can be recognized
-	 * as __folio_test_movable
-	 */
-	if (likely(!__folio_test_movable(src)) && reason != MR_DEMOTION)
+	if (likely(!page_has_movable_ops(&src->page)) && reason != MR_DEMOTION)
 		mod_node_page_state(folio_pgdat(src), NR_ISOLATED_ANON +
 				    folio_is_file_lru(src), -folio_nr_pages(src));
 
@@ -1164,7 +1148,6 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	int rc = -EAGAIN;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = data_race(!__folio_test_movable(src));
 	bool locked = false;
 	bool dst_locked = false;
 
@@ -1265,7 +1248,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		goto out;
 	dst_locked = true;
 
-	if (unlikely(!is_lru)) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
 		return MIGRATEPAGE_UNMAP;
 	}
@@ -1330,7 +1313,7 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
-	if (unlikely(__folio_test_movable(src))) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		if (rc)
 			goto out;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 331f157a6c62a..935013f73fff6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1658,9 +1658,11 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 	unsigned int noreclaim_flag;
 
 	list_for_each_entry_safe(folio, next, folio_list, lru) {
+		/* TODO: these pages should not even appear in this list. */
+		if (page_has_movable_ops(&folio->page))
+			continue;
 		if (!folio_test_hugetlb(folio) && folio_is_file_lru(folio) &&
-		    !folio_test_dirty(folio) && !__folio_test_movable(folio) &&
-		    !folio_test_unevictable(folio)) {
+		    !folio_test_dirty(folio) && !folio_test_unevictable(folio)) {
 			folio_clear_active(folio);
 			list_move(&folio->lru, &clean_folios);
 		}
-- 
2.49.0

