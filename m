Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B412F5463
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268435; cv=none; b=Ug5AfOOsQwp5i37eebdY0w1QWFyUvhKEiZLJ54SfCM5Ksn1bPf6ecieJjd08fEuWi+Y6B3VqLRcMNtpIxrAP0VseM6Dh/nnA8g3kzjgL5dT2j6f3w14A2gv1ZLgLZBar+bSuoIM+R50thb4Gj98zvgkDHETAHD2Ibb0uyJ5oP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268435; c=relaxed/simple;
	bh=HoU6IkwEzSx0bRpH46YFQR6C5ixdQUXKWK5iDFNMOt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH/4MlAwBXKuD7C1wjBzGaDcpdT9V1jQqKCtSfAU48q205XLccopd3mzI25ErkjlDpRoZOoh4bUw24zYETSOZT3x0QWvS9xXfTJJhPE/gCtWO2rzyVjOvx+67B/tjOP04Ud0/+EqSNg8oZlwcRMGkHlzCU2HU89IEHoYpfmuHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcl6EE/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcl6EE/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
	b=bcl6EE/87rvRp2sZY3yW4TyWvzk+gmZwkzmagzxpSpSK/sTRlNmotlfC3TIHjL58iqfkgP
	9takqlkn78UYG4U+Vl6ry6jCiPK/XJVJn7lNEQdplqiRcXmEF+tg1NnxCboZJnEG2meVtQ
	qD/m52Uznopwjtwf7L1z4f1F7qPfuxY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-N7_vIxtROFiJYOy3St1EbA-1; Wed, 18 Jun 2025 13:40:24 -0400
X-MC-Unique: N7_vIxtROFiJYOy3St1EbA-1
X-Mimecast-MFC-AGG-ID: N7_vIxtROFiJYOy3St1EbA_1750268423
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so7580475e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268423; x=1750873223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
        b=JVoS1KMkm5MTGFv3Q+2Fp3NAF78YgEe+JozEk9Rk07JhbCWQN0sDtU43qvDFZKnA4i
         IkcMubdx21Lwc24uZprA1kvEUsdJP6Em92btH79IwLpuIuabywnkyrUkZj4erASrnG+k
         5+wEkDTGHCl2plM1mNHjrC0qMW9AtX6JDj4PHNtj9ulw/vDYMZhC5Ll+sHYDGs97XWBI
         OeRrW5eE/iTV12iYJLXValtyXkLZ8RPD/cPXsMM2gpZE9zXVkbfYOeFnD23H/1WdR8iN
         WKaJaWZLT6I7yqq2htAZ5nMVE9UZMZhBJZu+mUfNriAAr4RyQvvQ90awmQj1GauNGIxP
         s7Fw==
X-Gm-Message-State: AOJu0Yz8YO/9C7uOw/Za2NSKdz+Y8KUKa9bQL1FMHPaV2DA+OMjiGJ2E
	7nOsCXpr2aK0QBxzK4NfpH7kEIInNp36DNES56zRQLa2n2hV4tbWHPbQKMznu7TdqLMXLgsro5I
	8O+q/XEAB5NhWRhhKqsZJYLIclpH5LP6A6eKfnTY1XlhC4xqNeVWjJxOW1uEheKlu3o+51boGgC
	5jqPk7QbbljbDjUCFbvygkkynyVlN4heoE1LzGhLQuatgBapoQ
X-Gm-Gg: ASbGncsMAgNd+A061+b+Q35PN++vsvJyVZckK2QhMNMR/X9V7yDvnhWvHNS799BrOlp
	zTbGHOoSQkAzS2FedOLTnqa/61EAydR+//eBR5aMipPKXm/1lY+X0A1UQGUT/41msBHaU9+9D7a
	UJHgXEAkbZIgiHfYvg/gddNbb+ICDS8CdPgL3alBUOeSNJYxZVm38fM6A+NHfNvQZRNbxv+cCpn
	E65/phiy/HtyEdFrx07qQ5TShNE7VhjfeAQJDeHgyyXTlOdKZX7PcmJdxRX6nAazmqhJVaFqmMB
	VZjQnxcSpJzvN5O6/qIUGKSIMGYRnVTLugfPqOMPPCnAl9LwHOHsz0m0ywxE3vACsEoREkYkriR
	FOYoG1g==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171055925e9.19.1750268423071;
        Wed, 18 Jun 2025 10:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNY4J8Mn4IFBBexw6iB/8oHFBQjZ0Pcfadu7y3OlxCDXC24glKPTWmaukP08KWSs+L7QyIw==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171055095e9.19.1750268422300;
        Wed, 18 Jun 2025 10:40:22 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebcecdcsm3339075e9.36.2025.06.18.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:21 -0700 (PDT)
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
Subject: [PATCH RFC 02/29] mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
Date: Wed, 18 Jun 2025 19:39:45 +0200
Message-ID: <20250618174014.1168640-3-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's move the removal of the page from the balloon list into the single
caller, to remove the dependency on the PG_isolated flag and clarify
locking requirements.

We'll shuffle the operations a bit such that they logically make more sense
(e.g., remove from the list before clearing flags).

In balloon migration functions we can now move the balloon_page_finalize()
out of the balloon lock and perform the finalization just before dropping
the balloon reference.

Document that the page lock is currently required when modifying the
movability aspects of a page; hopefully we can soon decouple this from the
page lock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c |  2 +-
 drivers/misc/vmw_balloon.c           |  3 +-
 drivers/virtio/virtio_balloon.c      |  4 +--
 include/linux/balloon_compaction.h   | 43 +++++++++++-----------------
 mm/balloon_compaction.c              |  3 +-
 5 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe8..5e0a718d1be7b 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -532,7 +532,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	balloon_page_insert(b_dev_info, newpage);
-	balloon_page_delete(page);
 	b_dev_info->isolated_pages--;
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
 
@@ -542,6 +541,7 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 	 */
 	plpar_page_set_active(page);
 
+	balloon_page_finalize(page);
 	/* balloon page list reference */
 	put_page(page);
 
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index c817d8c216413..6653fc53c951c 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1778,8 +1778,7 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	 * @pages_lock . We keep holding @comm_lock since we will need it in a
 	 * second.
 	 */
-	balloon_page_delete(page);
-
+	balloon_page_finalize(page);
 	put_page(page);
 
 	/* Inflate */
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 89da052f4f687..e299e18346a30 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -866,15 +866,13 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	tell_host(vb, vb->inflate_vq);
 
 	/* balloon's page migration 2nd step -- deflate "page" */
-	spin_lock_irqsave(&vb_dev_info->pages_lock, flags);
-	balloon_page_delete(page);
-	spin_unlock_irqrestore(&vb_dev_info->pages_lock, flags);
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, page);
 	tell_host(vb, vb->deflate_vq);
 
 	mutex_unlock(&vb->balloon_lock);
 
+	balloon_page_finalize(page);
 	put_page(page); /* balloon reference */
 
 	return MIGRATEPAGE_SUCCESS;
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 5ca2d56996201..b9f19da37b089 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -97,27 +97,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-/*
- * balloon_page_delete - delete a page from balloon's page list and clear
- *			 the page->private assignement accordingly.
- * @page    : page to be released from balloon's page list
- *
- * Caller must ensure the page is locked and the spin_lock protecting balloon
- * pages list is held before deleting a page from the balloon device.
- */
-static inline void balloon_page_delete(struct page *page)
-{
-	__ClearPageOffline(page);
-	__ClearPageMovable(page);
-	set_page_private(page, 0);
-	/*
-	 * No touch page.lru field once @page has been isolated
-	 * because VM is using the field.
-	 */
-	if (!PageIsolated(page))
-		list_del(&page->lru);
-}
-
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
@@ -141,12 +120,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-static inline void balloon_page_delete(struct page *page)
-{
-	__ClearPageOffline(page);
-	list_del(&page->lru);
-}
-
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
 	return GFP_HIGHUSER;
@@ -154,6 +127,22 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
 
 #endif /* CONFIG_BALLOON_COMPACTION */
 
+/*
+ * balloon_page_finalize - prepare a balloon page that was removed from the
+ *			   balloon list for release to the page allocator
+ * @page: page to be released to the page allocator
+ *
+ * Caller must ensure that the page is locked.
+ */
+static inline void balloon_page_finalize(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		__ClearPageMovable(page);
+		set_page_private(page, 0);
+	}
+	__ClearPageOffline(page);
+}
+
 /*
  * balloon_page_push - insert a page into a page list.
  * @head : pointer to list
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index fcb60233aa35d..ec176bdb8a78b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,7 +94,8 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		balloon_page_delete(page);
+		list_del(&page->lru);
+		balloon_page_finalize(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
 		unlock_page(page);
-- 
2.49.0

