Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C5293457
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288490; cv=none; b=nm0hjBjD0Lz/dwsjme2odzGa5Qw0DBNR3moDXUH2HJz4RzXlyN/tYBHKAq922qHBxaRWLdIlf43pIfamF2rYgdCW3YE4OJ8g2/ZtEEqw+JsM1H3YnqSJCUc/V65hMAUcWyub0vOL4kflxo4EgVEzkheNYpGGlQeDSQB+7qhT/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288490; c=relaxed/simple;
	bh=HoU6IkwEzSx0bRpH46YFQR6C5ixdQUXKWK5iDFNMOt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akm1h9SIsXtW6uyJvVqNsVp9oVFPT5PcLms0w0Q1Bk2roz+sslLT5Z10Z8yrxGnsuM9PLCDZbgtx3+29c/Mdc8MjUuRaC/76v7VJeO0MOdsR2RIaXw345zZlKu4T8+5/Rq5ss0vxnjria2HeQlcIbLyfsMGVGJLiiwCZV/VF0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioSE6Vfs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioSE6Vfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
	b=ioSE6VfsbT+rBAR/i+2wVff7rSEWhRUcLAeJLA/RfyWqAnrL6krQoJf7TsspzQKcrZlzcp
	84dqniuuMB5spneDM9RRMSo3Y0G89qufgSDVUOPaoOzLaEBlL5NKfAdFnmjcH8UAtoXBFp
	Rvtli7JNJfVkzxEI7lB7h4hlvkiI+tY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-YbBW2880N7CDEDL-pn7FjA-1; Mon, 30 Jun 2025 09:00:22 -0400
X-MC-Unique: YbBW2880N7CDEDL-pn7FjA-1
X-Mimecast-MFC-AGG-ID: YbBW2880N7CDEDL-pn7FjA_1751288421
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso11767165e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288421; x=1751893221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
        b=gS6gscqG2zZoK8i6vtRHlq7eiUmhB/F1smWXX/GOh5SPLMB88OJKrRzu13cdbohmfM
         236TE1EbaolbYRhDdodOa9Iitw/2GgR3x0dEz5pR1C+ANUPQ8gwEoFT9gCKchQfBqg+q
         PbPOjr4dCdIO7/hT1Dtli54Reflf2VEGuDJGhyUsc4lXmhJDZ/lHnSbUd9N3edEK/jiL
         I73Nf6mDK9udgjuojwow0TckwcgBPLR5iRyQ1f0MzVQsvtfbK+8BaY+L0far0uGhR8Ns
         CZ/VAnlYpEiM/KfDALBHx03AEHnbraVAG/lrPfjPUkC7xrnuO1ParTitYIpR9YoMgcMJ
         jooQ==
X-Gm-Message-State: AOJu0Yz/WylWqYQ6/j6qilmAliu5L+rayPjsOv/LLHTse4mGMTupLOxG
	LCvhiuFTgktitH5tKlQJs/egsZ0sftWKJ+/+az1QmDoaPpvhCCJ9uhKyrwpdXxd6B+uv8gRp9K5
	VBcNeqh2OWOnlf/PUd2e3VB69tG5LirEehAxcLG1Tz5P9Zu5UBnSVSgzzMCdGBgv+eki0jHYAlL
	msBhKmvsiJbMSOHaohTA6p1tbhWGfl7ITgLy5tce0a563voDxP
X-Gm-Gg: ASbGnctSolFPehMoabI8EyS/FwHwhbrbeLI1IgZJcevtjwkBkC465pKD3hRkNb2Fd5P
	/MJZw19H9f5r9s+Yyp8J1i2mlz0Hp9TWdiM0l2d1KfDp8h6ByHoxfwgToBDGBHrPF4E1PTU5rip
	y2vDRend+3C1+9buyN4n5kXmPS50ZhSFdwQIrCIxXWL5jKA4MQ1QuXFsVR6PjvstpJULOf8bzUN
	z9tC7yB2sZOvBNj9w0GYATGvbdPcFxog4VJctr0sXN9KyFLV99jpJBvcv2KAvI4GhMS85keqBrM
	CzTWSwft0iXAscCCBwELkMwrgA0f24247KAHwXKJ+TN71HX0b9IwVFugAIiL+hX2/Ztp0l8Y7gF
	BsUu8KBQ=
X-Received: by 2002:a05:6000:4186:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a8f482c7a3mr12061903f8f.21.1751288420899;
        Mon, 30 Jun 2025 06:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0gb3C+C+LV4oU6wKBD78SFqxqmgRCphVWjbRDEuvh0xGGV6ZK62AjmpQKGwfy92kungebyQ==
X-Received: by 2002:a05:6000:4186:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a8f482c7a3mr12061792f8f.21.1751288419988;
        Mon, 30 Jun 2025 06:00:19 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7facf9sm10288204f8f.22.2025.06.30.06.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:19 -0700 (PDT)
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
Subject: [PATCH v1 02/29] mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
Date: Mon, 30 Jun 2025 14:59:43 +0200
Message-ID: <20250630130011.330477-3-david@redhat.com>
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

