Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029C28DEE7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288467; cv=none; b=tRRut+/jODFBazm/yPeD+hoDaVw8p/DOW62/iKOac2pB6sIhmf0Ccr7tg/+YSqLnW7zHvpfuJnYS060hkpXNe6iRAvnHO0goE17dz3L4yH3rBm8QZSGBRqMB1hCbpA+KKvlz46GoLPKG7fQoTnAqCudIjWDj3eb5cw6P3yrtHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288467; c=relaxed/simple;
	bh=E2Kk/3B1Zvc/DrpiBo6mfnVkxxScIN5ozXUblSaxVOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fX2ySb8urkRDBovVDb9EEZY3c0B3X8bfB3vKHGDvFWwlq8KCzIHfOlK60vxWPnTUP9zFrOb+44PyAnlAL//YExh1LjcQiKL0by790pzU0fuDrzTWUnjaXgZwUc6lTsEO1kX2D5cIb//yE3GuXDT1dY3QWZLqhp1XAjoVYLzGq00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIAcm+B3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIAcm+B3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
	b=bIAcm+B34GjWwePDqYx9WgR+JjSRz7I8jNBY14eq4QQtpqtxHI2J94he/p0Rjt15Lwi44k
	Ul3q6Ej26xiMzbsbZIZp2ohZCEhl0IqzA02Y6+SSClhcy1pPM0JRYSQNnMreACdOZ7dnbq
	yXATAZ8j13uF3FuyFx8RHe0UAxV/B/E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-2k4Xv_p4PK6j9wb6-uaCng-1; Mon, 30 Jun 2025 09:01:00 -0400
X-MC-Unique: 2k4Xv_p4PK6j9wb6-uaCng-1
X-Mimecast-MFC-AGG-ID: 2k4Xv_p4PK6j9wb6-uaCng_1751288459
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4535ee06160so16096685e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288459; x=1751893259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
        b=Nb9UBZS5msP3pH3XmlyDhTk7miY0xKCxjjSypRxbhhZxChsi2F+dUSRcryotI6HBby
         eu9uaNe2Fi3talL+sgEEqhVMAbLo446p9aBYOpoy5HdtfCQAeDzTGvRH21mhH90mfNeX
         3IemwlK7wFRPAyc5Vl+CGK99ci+UnTUxH5lImnwzfiMmuMviApMzf2uyyruW5FbQT8YN
         97xs/b3EVPeHkIQmZv7I+iPh1LXJWrAT1I+AKTQce/dBPx8hD0SFQe8H/rsbspbsNI/v
         rgrugtdtp8V3+8NG+L7rvwfiMYVPwrdPC+mSAQ0LO46gTT+8k6VGXwVzYD9FoMzCSKyK
         AKvw==
X-Gm-Message-State: AOJu0Ywsgy5Pbl8+oLAtIvOUcgLSoLm5GVaYs18DB8qJADcjghfkSmFp
	qrgChv9jmm2k52kN5XbEsCk67dRoSFDs0ZDy66og75lUJ9MtC7S4Hoim81CXXLAPtFZyP4HJfjy
	S0h3XYS+zu4zygsVDVe8YRhlVEswuJz5lVHjCiCgLkriNVNFnhgbGolYTC9aPkCeFJSwzIHoiV6
	Qjmm9nXHtuicR2F+3d4w0/4fJaFWHfW75n7pzCuz7Xy5TeqOFf
X-Gm-Gg: ASbGncsYTDI7p1wCxfkagOmpq0nKzWd8zlyALjY1Q9kh+OCU9UnotOpeNidnaiRbN1R
	Ara4KB2NLgjlVnb2NwGKdVuQevugcwhZH4zFacI+zL8FAS2TkW1CrplJzGtfopfYUw9PK76YHYX
	9o5nhq68d7nveiTM1G0HD87K3YcMDAKalaHppEt/l9CYjzPn1crUHSuUTTmjgBJE/1xG653tO06
	y1EVPCoTZ8jxZWq5jAapsrzTbrmnI6T0+JmHd5XU/3jR73RL0Q9HfsThL9ThawMQhkD0iux8Lne
	BxwyVOmr5oMoyGvqo84P0aagcbxffIxgHRPYTigG4sij5OklPQcoZnqsSJIv8AF8T2i3MJZiTmh
	MbbJeXmg=
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92870085e9.3.1751288458679;
        Mon, 30 Jun 2025 06:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCs0m13Yqq4GukWpM+4uHJmOOd6amI/nvHYcsB4z72aw1swyUlytQ8Ivx43yHYvtcBEII8eg==
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92865605e9.3.1751288455974;
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f8absm10554612f8f.95.2025.06.30.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
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
Subject: [PATCH v1 15/29] mm/migration: remove PageMovable()
Date: Mon, 30 Jun 2025 14:59:56 +0200
Message-ID: <20250630130011.330477-16-david@redhat.com>
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

As __ClearPageMovable() is gone that would have only made
PageMovable()==false but still __PageMovable()==true, now
PageMovable() == __PageMovable().

So we can replace PageMovable() checks by __PageMovable(). In fact,
__PageMovable() cannot change until a page is freed, so we can turn
some PageMovable() into sanity checks for __PageMovable().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  2 --
 mm/compaction.c         | 15 ---------------
 mm/migrate.c            | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 6eeda8eb1e0d8..25659a685e2aa 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -104,10 +104,8 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
 #else
-static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
diff --git a/mm/compaction.c b/mm/compaction.c
index 889ec696ba96a..5c37373017014 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,21 +114,6 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page)
-{
-	const struct movable_operations *mops;
-
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	if (!__PageMovable(page))
-		return false;
-
-	mops = page_movable_ops(page);
-	if (mops)
-		return true;
-
-	return false;
-}
-
 void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 {
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
diff --git a/mm/migrate.c b/mm/migrate.c
index 22c115710d0e2..040484230aebc 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -87,9 +87,12 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out;
 
 	/*
-	 * Check movable flag before taking the page lock because
+	 * Check for movable_ops pages before taking the page lock because
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
+	 *
+	 * Note that once a page has movable_ops, it will stay that way
+	 * until the page was freed.
 	 */
 	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
@@ -108,7 +111,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!PageMovable(page) || PageIsolated(page))
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	if (PageIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -149,11 +153,10 @@ static void putback_movable_ops_page(struct page *page)
 	 */
 	struct folio *folio = page_folio(page);
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
 	folio_lock(folio);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(page))
-		page_movable_ops(page)->putback_page(page);
+	page_movable_ops(page)->putback_page(page);
 	ClearPageIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
@@ -189,10 +192,9 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 {
 	int rc = MIGRATEPAGE_SUCCESS;
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(src), src);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(src))
-		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
 		ClearPageIsolated(src);
 	return rc;
-- 
2.49.0

