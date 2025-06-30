Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB3328A73E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288450; cv=none; b=B/Jq2h/b6aoj9M9ctlysuZI4YZNRRvFRpDmn1XE2r8IW3oA9m5AlhjknPTXmgINTsFsJ2boM7qi53e+iHMjfEKZLzW4AOgZxnDU88rMhM3+b3tl/zlJzL7jxzMZaKMKdzZv35X0H0XnAM9tAF4yM0ZSR9TQcF/HGuyZOX4S5kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288450; c=relaxed/simple;
	bh=VUTFI3+8sn+Bo7jfgsxfJB7XgkCxxsX8WPCDC/hYNNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRzu0pg2j3UvptfkEUgIfHk+zo2oxfEgLuJ5PfCSf3opwA2BtnNphrLh4V5z42V/tr+bburTM3BsFJWmO0PiFmr4DbXhSZHYVcx7shDkLrlcgA3s1NbXbf3ma5whUARj7VfpU4cokrjQB8p5GAN/lr+SbSyM07XFrrkX3GTHSUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVOjgStH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVOjgStH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
	b=jVOjgStHXjnr1MaRzzAwZtsh9S+pxk0w2cC9fg03WKL52+4Ia/MSTbx6jK1H1f1iZ91rQy
	XPoFfE+Al0PieIph4yDeAURl9ujDDR3hfPs81SUd3y2B3z0bczeUleyUUGamAtpe7JMZp9
	uC6gDW6QHxIeoBO0QGW8702a+mc1F8o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-BPuFg694NWCZ1g5ZwPZqLA-1; Mon, 30 Jun 2025 09:00:42 -0400
X-MC-Unique: BPuFg694NWCZ1g5ZwPZqLA-1
X-Mimecast-MFC-AGG-ID: BPuFg694NWCZ1g5ZwPZqLA_1751288439
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso22225345e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288439; x=1751893239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
        b=L1GGtKECnxweWej19/C6geUOUUSjbE6GeJFprUvrUNIGxW9cpw1j5nWWS0ctjzQOp2
         3YHDzc4f4gN00ddYTtH9a+FoLprxHDOd3RtLNT3Ud9vUJ/AavDcidJBeCVzXUaGqApOC
         ttG+Y8DKSHgmIuoeVoKLHo86UXw8aTYT57avsuQHiKKpNXGNVgSLoS9tZA5Yp+QuO+MV
         fTMHtGy/GOgu8MLpEqhYwyi34egeuuGROUyK1GCw7woPxVpok3c28Zz9FK+2WbkTmmLD
         SSHRHseQWc7QMHj+wszPVJgnJ9TdK586Q+a6PXCsct/GXeE7hVE/d+unee9ImgJwMZFd
         Bw/A==
X-Gm-Message-State: AOJu0Yzso9M8z71v5ocxHBeeyc4QPzYLw//nmZPrwS4cUqRj3MqJprTd
	0PM1huSoE36ZrpyPCsSGscHSRTzQ3NjqzCOBgsoL//UkciJHH13XCIYwmv2XM0F5XD3SITsxP/D
	hEFseVSoZHxaH9bAHx4LFpw5kTm1J485bVBdq9kChPjMu+Mk7IqLhJMRWRM0q38YE6Osk0evXo1
	uvj/uykg46arYyBx7q4C/lE1P27dCth0uJq8EUVChIpf570Qqp
X-Gm-Gg: ASbGnct7zGn1VHyjsN8HN0VBBY07UZeyYOlgpgWgrQOZjX3uABhIBjpi6+/l+tbbn+u
	rD/r0OH4us4UIz2hFaTx99cc1Y1ZMGq4E67oRYSrpMs8bPSwnBcLFoa/gelo4VGu+6DiOrsCRHN
	uHnYt0nnZHHXvErH5iZQ89vpJmfYDUJgw1dP6y6az3HvTpSuuoCJ1mH5gpu1PLTNgvCSxL36wMu
	SUyfk4Ph5DstTcz+nTDkyWeRyhRYHebjWVGUDcFpMUc0Xr3QiUxx4nwBwCRadgUbJAkenWTC0fZ
	AMNmqicsxRqXVEIdivmTm+LbfFrLT3Y5uVQm9nxyBLStSve5GUqR1IFzBlrNvtRqkyVzp9vF/lX
	98ZV5i/4=
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116867965e9.4.1751288436224;
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcKPudq4hAX3ZUQbBxj7a9OFNaExkIT0GfF2UdhGugpVpmsHfKtz6PBCtjyRSKpLMaHzgIYg==
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116864905e9.4.1751288433794;
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136741305e9.27.2025.06.30.06.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
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
Subject: [PATCH v1 07/29] mm/migrate: rename isolate_movable_page() to isolate_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:48 +0200
Message-ID: <20250630130011.330477-8-david@redhat.com>
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

... and start moving back to per-page things that will absolutely not be
folio things in the future. Add documentation and a comment that the
remaining folio stuff (lock, refcount) will have to be reworked as well.

While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
it gracefully (relevant with further changes), and convert a
WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().

Note that we will leave anything that needs a rework (lock, refcount,
->lru) to be using folios for now: that perfectly highlights the
problematic bits.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ++--
 mm/compaction.c         |  2 +-
 mm/migrate.c            | 39 +++++++++++++++++++++++++++++----------
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6d..c0ec7422837bd 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -69,7 +69,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
 		  unsigned long private, enum migrate_mode mode, int reason,
 		  unsigned int *ret_succeeded);
 struct folio *alloc_migration_target(struct folio *src, unsigned long private);
-bool isolate_movable_page(struct page *page, isolate_mode_t mode);
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode);
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
@@ -90,7 +90,7 @@ static inline int migrate_pages(struct list_head *l, new_folio_t new,
 static inline struct folio *alloc_migration_target(struct folio *src,
 		unsigned long private)
 	{ return NULL; }
-static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+static inline bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	{ return false; }
 static inline bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	{ return false; }
diff --git a/mm/compaction.c b/mm/compaction.c
index 3925cb61dbb8f..17455c5a4be05 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1093,7 +1093,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 					locked = NULL;
 				}
 
-				if (isolate_movable_page(page, mode)) {
+				if (isolate_movable_ops_page(page, mode)) {
 					folio = page_folio(page);
 					goto isolate_success;
 				}
diff --git a/mm/migrate.c b/mm/migrate.c
index 767f503f08758..d4b4a7eefb6bd 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -51,8 +51,26 @@
 #include "internal.h"
 #include "swap.h"
 
-bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+/**
+ * isolate_movable_ops_page - isolate a movable_ops page for migration
+ * @page: The page.
+ * @mode: The isolation mode.
+ *
+ * Try to isolate a movable_ops page for migration. Will fail if the page is
+ * not a movable_ops page, if the page is already isolated for migration
+ * or if the page was just was released by its owner.
+ *
+ * Once isolated, the page cannot get freed until it is either putback
+ * or migrated.
+ *
+ * Returns true if isolation succeeded, otherwise false.
+ */
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 {
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
 	struct folio *folio = folio_get_nontail_page(page);
 	const struct movable_operations *mops;
 
@@ -73,7 +91,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
 	 */
-	if (unlikely(!__folio_test_movable(folio)))
+	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
 
 	/*
@@ -90,18 +108,19 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!folio_test_movable(folio) || folio_test_isolated(folio))
+	if (!PageMovable(page) || PageIsolated(page))
 		goto out_no_isolated;
 
-	mops = folio_movable_ops(folio);
-	VM_BUG_ON_FOLIO(!mops, folio);
+	mops = page_movable_ops(page);
+	if (WARN_ON_ONCE(!mops))
+		goto out_no_isolated;
 
-	if (!mops->isolate_page(&folio->page, mode))
+	if (!mops->isolate_page(page, mode))
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	WARN_ON_ONCE(folio_test_isolated(folio));
-	folio_set_isolated(folio);
+	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
+	SetPageIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -175,8 +194,8 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	if (lru)
 		isolated = folio_isolate_lru(folio);
 	else
-		isolated = isolate_movable_page(&folio->page,
-						ISOLATE_UNEVICTABLE);
+		isolated = isolate_movable_ops_page(&folio->page,
+						    ISOLATE_UNEVICTABLE);
 
 	if (!isolated)
 		return false;
-- 
2.49.0

