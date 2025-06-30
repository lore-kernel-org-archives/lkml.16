Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A1291C0F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288487; cv=none; b=f5tY7jHwwXVdl4JdH+V1KxtIodrZV+nDUxmsMcFhZDhUKI2dPWvQjkbNvy86qbMYj17Vu7m/IOQwLjhJPY/K1010j+rJKky6tbungEP5K5/U9ISQ292cht8FDVF8EI72Ke4nGDJcMyxkufn0e/mxl2c6oXJNDb4Qrk73UHBXu3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288487; c=relaxed/simple;
	bh=spRVtsrXQeSiPctpyfXJIwnWB6OKPlVJ51M2oKx7H3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5bag+aiUStdQlbN6lUuWljX84cz+xvhz2OTE88nhxrdcQICOiOQ/JmGymUowJ6kcCuM+8mqswQzB+yzEmkGAgfV5ZXNFBjJtpAfIc6sO72z0SvOa62L74wMO8jZJ0IOootSAZw8YsWOVIRFcGftoBbtseh5171pSA/nVLo1rps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYNOPmKV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYNOPmKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
	b=PYNOPmKVqA5gV7JKoyFAR2N6ea6FGKaFjCn1TK2mWgq9AYM4KC4uVxI1nX5WLRgXEVTgut
	8i5GNTBjCBB5979Gb106HpeByt3HG/gA7veU+ht0+y3Hkc/UfuR7UKaHtxUZE56K1Mkt1Y
	NMZt2AO/4UUionj/lRNMYoDhTGskBG8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-eQOped5JNfiYHgPD21gmRQ-1; Mon, 30 Jun 2025 09:01:19 -0400
X-MC-Unique: eQOped5JNfiYHgPD21gmRQ-1
X-Mimecast-MFC-AGG-ID: eQOped5JNfiYHgPD21gmRQ_1751288478
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1368427f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288478; x=1751893278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
        b=TcHSawMTa6KtIm1bi0/aSVzreM+QBmd1UPU5I/hFP/RN3lYvjADj6fDxC0pdaoKM4r
         8GXq9N/93HF0QL4p6oII7pNt4ehOABSWad7RNAzB+q+evEzRzWH8VYWkf6xwUgxW6Pnt
         egXMfXmg7MwC2s5Hiwovu8LWBhO+E1PFpFZB+JtZ7MsDcAghEn5/5FTnv/+0dVnd90Yq
         SH78hP75T354WwRpVdxo5HOdiP+bqrMeOarKrMIPRcNNXbiFcaVX/Vnq+ZHi1ypfxUIE
         YlfMbiYib7qOeDp0lXRbnDb1QfEQma9RttHUI25NzV7YTklaa4SdU8TNe+8tsznCPlzW
         ufaw==
X-Gm-Message-State: AOJu0YyCU/WPu/GzJ5FwqhjEz/pp1SxT1p0Shf4ZmJwwJ8M1HuT22j2j
	GKih2uyWveHAdVay3+iC/5fJBuGjkhDSNt1oT4OvXzC1563/Prw0AEmTxhWt139e6fx6Bgk67gC
	KOF0Z8PTwtwfNBYRGaryzHsCUKaOkjXHyQu4PqkLXkywxdZiG/N0rjvWax6bJto/ywQgR63KR8o
	sVp44mGerCXe7237x4/JBSbhbcilhhPHd3V5YwU7UFSlcGhsUi
X-Gm-Gg: ASbGnctl7/pDaLKFc9mRx0TYafVTwtxnctN4u9nOx2jsSzb1IMahkLlcVvLF6xi+ujo
	5ZBqcTcqPSpOJEm+2f5r7dnce1j7wGbMovyF/jONlXS2OG67BhRTF4ePuL9hRQ6dzkRVhYlkEn7
	n4oS736mSUmC8k1GuE2mNFtGTHEq+shgdqvxnwyD5AoRnzTRwjoQ+RGtPMU//7H9Z/C8C2KOA9j
	Kq4Aa6J7OEHyDm8f8puHBBcAOqUlxkq6T5zNiVlqwrr2Y8SdeeNFyNbazguD6ko5CblnJJhKabb
	F3cgRZdZw5VE22ZCz1BIMHO6+xhv0NbLPgISGlUTgJjo03FLyfiTCnLUp3dUWYGwvhQATcFNZ9P
	PfKB5Rmg=
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628989f8f.48.1751288477359;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9r1p0u/0kcCjG+nghTpHrdk2mNLfE9z/HI6liANtRmtIL3dMCa2Pbf5hTgLV/B0o5eULaw==
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628767f8f.48.1751288474943;
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a35sm10528754f8f.57.2025.06.30.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
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
Subject: [PATCH v1 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Mon, 30 Jun 2025 15:00:02 +0200
Message-ID: <20250630130011.330477-22-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's rename the flag to make it clearer where it applies (not folios
...).

While at it, define the flag only with CONFIG_MIGRATION.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 16 +++++++++++-----
 mm/compaction.c            |  2 +-
 mm/migrate.c               | 14 +++++++-------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 016a6e6fa428a..aa48b05536bca 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -167,10 +167,9 @@ enum pageflags {
 	/* Remapped by swiotlb-xen. */
 	PG_xen_remapped = PG_owner_priv_1,
 
-	/* non-lru isolated movable page */
-	PG_isolated = PG_reclaim,
-
 #ifdef CONFIG_MIGRATION
+	/* movable_ops page that is isolated for migration */
+	PG_movable_ops_isolated = PG_reclaim,
 	/* this is a movable_ops page (for selected typed pages only) */
 	PG_movable_ops = PG_uptodate,
 #endif
@@ -1126,8 +1125,6 @@ static inline bool folio_contain_hwpoisoned_page(struct folio *folio)
 
 bool is_free_buddy_page(const struct page *page);
 
-PAGEFLAG(Isolated, isolated, PF_ANY);
-
 #ifdef CONFIG_MIGRATION
 /*
  * This page is migratable through movable_ops (for selected typed pages
@@ -1146,8 +1143,17 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
  * page_has_movable_ops() instead.
  */
 PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+/*
+ * A movable_ops page has this flag set while it is isolated for migration.
+ * This flag primarily protects against concurrent migration attempts.
+ *
+ * Once migration ended (success or failure), the flag is cleared. The
+ * flag is managed by the migration core.
+ */
+PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
 #else
 PAGEFLAG_FALSE(MovableOps, movable_ops);
+PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
 #endif
 
 /**
diff --git a/mm/compaction.c b/mm/compaction.c
index 349f4ea0ec3e5..bf021b31c7ece 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1051,7 +1051,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!PageLRU(page)) {
 			/* Isolation code will deal with any races. */
 			if (unlikely(page_has_movable_ops(page)) &&
-					!PageIsolated(page)) {
+			    !PageMovableOpsIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
diff --git a/mm/migrate.c b/mm/migrate.c
index c6c9998014ec8..62a3ee590b245 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -135,7 +135,7 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_putfolio;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	if (PageIsolated(page))
+	if (PageMovableOpsIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -146,8 +146,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
-	SetPageIsolated(page);
+	VM_WARN_ON_ONCE_PAGE(PageMovableOpsIsolated(page), page);
+	SetPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -177,10 +177,10 @@ static void putback_movable_ops_page(struct page *page)
 	struct folio *folio = page_folio(page);
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(page), page);
 	folio_lock(folio);
 	page_movable_ops(page)->putback_page(page);
-	ClearPageIsolated(page);
+	ClearPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
 }
@@ -216,10 +216,10 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 	int rc = MIGRATEPAGE_SUCCESS;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(src), src);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(src), src);
 	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
-		ClearPageIsolated(src);
+		ClearPageMovableOpsIsolated(src);
 	return rc;
 }
 
-- 
2.49.0

