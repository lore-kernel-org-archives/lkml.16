Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A07289E26
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288457; cv=none; b=ITLUd59JG9oFKDEkV2OUtpKYplcxNPCe4d+uIyI6k2wVPZ5N26m2tdV4EHqK1iJ0+4oSyCihzrSH9gu/dFaL4GmHTySjgbDhMNpljOnZKDkIemjrqm44NqV1qJ994/jgAlzakUXe8HsxDeguvoEsmeiIMXKUB2G5pva9v+nbbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288457; c=relaxed/simple;
	bh=bzT3f8SbOSFmP0mAT3t54D4YW+inx1tEVm83+OWEEC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLFxtyxozNhqDTRQzSVpwsi28LZE/jZeAKALa+Wl12uewkO8ggVdEnzs4NCw7+6zRH8kG+mv9zpKOz8Eeto2VNNiRwM9GD5UhuPXe47qNsluEJPowaOYzpcb4FplOShU9qgWvULMOkvraODjinKiu9TQvrCIJsedJF9jcYxMuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ob88BWm7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ob88BWm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
	b=Ob88BWm76Gva0y+lg0gbSIeWphub1mTjXR7Mf3+arn9z+5U70GM0jLOvtWvGUfFKPZP5jD
	r976ZM9AZERElhmhFVHiWlJacfF0tO1DmMoDugMdvu8AfX6MzbG/Bl2ilAm9x7tbzah/7T
	sytN4qa3qfPucYxYjkIA2xzO9AcvgBU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-_1nDWI0CPdi6myJveK2yLg-1; Mon, 30 Jun 2025 09:00:48 -0400
X-MC-Unique: _1nDWI0CPdi6myJveK2yLg-1
X-Mimecast-MFC-AGG-ID: _1nDWI0CPdi6myJveK2yLg_1751288447
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so1198067f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288447; x=1751893247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
        b=I8mLvAtnFlsxpf5SExO5w/DP7qYqmVV3nCf5NFD8M8PMUDVIithFnEdEq1/G3fWg9c
         87bR422cnCcq0mn8xY4y55POvEM6ibY2SuQwe52gSFD17VGDuY8wtut8OPsdaXl1DQfP
         SCMB/t9xhJlhbLA2YEwJsaT0EsRvbrA20sEKGuWUPrJCbfS7y0MZhPmsvD/9oeN3jHFE
         yeiaC9vqg5LHbpSQ2zQT0EdZbuK6XaHB5YMId9AtaLWhOwkib8mt8hwolyyW/C5QaJWH
         m21WewUB/80ui04HhZ9NfjTqhCpySvZVDh7wb+cD/7X2isd6g1FSTM+IeqQfcfMdHB9p
         Y2+g==
X-Gm-Message-State: AOJu0YwLa4OvfZ85kJh4nChK9ZZxCAa+N2WbO2GBbQT8h77FdlDrZfis
	HZ6e2KLc6ZzY6FFO6t2nWmLoNc4tvdIvpket0MSkT7Wsaqe4LteQ1MpCG08UbrCYOXLPtxMXXkL
	5QFOs2nl6120NHU1nojA/pQOH3r8BSYiGfVXG1lSDK9or5N9Tehyeky8rSZadKe0M4bmrcGpmIv
	ppB9MLimHZZstBTmoF/DIedRAiwPDj7RX5+AEF5Lm/lS6rPLgG
X-Gm-Gg: ASbGncvj/RB/yCoy/a/ECjAGC2PL5yn4QVXRA4spVRgNBnXLLFMIBBQZv6U+Skp2JL2
	xrsyP6CKR5094K1mRLJdxZ2U0nNTb7ggC/qiZnq/L243zozCgqL4DOUH6GAtYJyFaX9c5b11Rv1
	vvCVZm2p/v4UvMnqoJXC2bmxaIdF4DGJJUJ4vL6AvJIkBPBCUY30/drrx+XGE3zqpL6yl+MY/5v
	qgICamDdXtOOHkbHLkwvuzbUSBOo8js6qNlzD0IsHOAazOi6q/rOhFdeKjQMtvFuIihB8PXBETR
	j/BKBl1XbtGUe0KByuc6q+Hb2WWDLLMqbnIaQKFWN1XfkqMnt47vGXNaC3kN/lGM4UraDAdVI0K
	cScm7Z30=
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883192f8f.40.1751288445961;
        Mon, 30 Jun 2025 06:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZT4aB5+IKBjQnh+yncb7ZFTxj1NuN2dDZeVwVJqvRnlRrWkNRGfP/el4NU32fGgywSRoLtA==
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883079f8f.40.1751288445063;
        Mon, 30 Jun 2025 06:00:45 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7e72c1sm10293032f8f.1.2025.06.30.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
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
Subject: [PATCH v1 11/29] mm/migrate: move movable_ops page handling out of move_to_new_folio()
Date: Mon, 30 Jun 2025 14:59:52 +0200
Message-ID: <20250630130011.330477-12-david@redhat.com>
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

Let's move that handling directly into migrate_folio_move(), so we can
simplify move_to_new_folio(). While at it, fixup the documentation a
bit.

Note that unmap_and_move_huge_page() does not care, because it only
deals with actual folios. (we only support migration of
individual movable_ops pages)

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 63 +++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 0898ddd2f661f..22c115710d0e2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1024,11 +1024,12 @@ static int fallback_migrate_folio(struct address_space *mapping,
 }
 
 /*
- * Move a page to a newly allocated page
- * The page is locked and all ptes have been successfully removed.
+ * Move a src folio to a newly allocated dst folio.
  *
- * The new page will have replaced the old page if this function
- * is successful.
+ * The src and dst folios are locked and the src folios was unmapped from
+ * the page tables.
+ *
+ * On success, the src folio was replaced by the dst folio.
  *
  * Return value:
  *   < 0 - error code
@@ -1037,34 +1038,30 @@ static int fallback_migrate_folio(struct address_space *mapping,
 static int move_to_new_folio(struct folio *dst, struct folio *src,
 				enum migrate_mode mode)
 {
+	struct address_space *mapping = folio_mapping(src);
 	int rc = -EAGAIN;
-	bool is_lru = !__folio_test_movable(src);
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
 	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
 
-	if (likely(is_lru)) {
-		struct address_space *mapping = folio_mapping(src);
-
-		if (!mapping)
-			rc = migrate_folio(mapping, dst, src, mode);
-		else if (mapping_inaccessible(mapping))
-			rc = -EOPNOTSUPP;
-		else if (mapping->a_ops->migrate_folio)
-			/*
-			 * Most folios have a mapping and most filesystems
-			 * provide a migrate_folio callback. Anonymous folios
-			 * are part of swap space which also has its own
-			 * migrate_folio callback. This is the most common path
-			 * for page migration.
-			 */
-			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
-								mode);
-		else
-			rc = fallback_migrate_folio(mapping, dst, src, mode);
+	if (!mapping)
+		rc = migrate_folio(mapping, dst, src, mode);
+	else if (mapping_inaccessible(mapping))
+		rc = -EOPNOTSUPP;
+	else if (mapping->a_ops->migrate_folio)
+		/*
+		 * Most folios have a mapping and most filesystems
+		 * provide a migrate_folio callback. Anonymous folios
+		 * are part of swap space which also has its own
+		 * migrate_folio callback. This is the most common path
+		 * for page migration.
+		 */
+		rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+							mode);
+	else
+		rc = fallback_migrate_folio(mapping, dst, src, mode);
 
-		if (rc != MIGRATEPAGE_SUCCESS)
-			goto out;
+	if (rc == MIGRATEPAGE_SUCCESS) {
 		/*
 		 * For pagecache folios, src->mapping must be cleared before src
 		 * is freed. Anonymous folios must stay anonymous until freed.
@@ -1074,10 +1071,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
-	} else {
-		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
-out:
 	return rc;
 }
 
@@ -1328,20 +1322,23 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	int rc;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = !__folio_test_movable(src);
 	struct list_head *prev;
 
 	__migrate_folio_extract(dst, &old_page_state, &anon_vma);
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
+	if (unlikely(__folio_test_movable(src))) {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
+		if (rc)
+			goto out;
+		goto out_unlock_both;
+	}
+
 	rc = move_to_new_folio(dst, src, mode);
 	if (rc)
 		goto out;
 
-	if (unlikely(!is_lru))
-		goto out_unlock_both;
-
 	/*
 	 * When successful, push dst to LRU immediately: so that if it
 	 * turns out to be an mlocked page, remove_migration_ptes() will
-- 
2.49.0

