Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFD2FCFC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268461; cv=none; b=e9XS4rhoPG6nd8UdMcpdQxl4vKPWL2SdqY19yfiIqvDAp7DwT1BGWkaICFjPURG4O7AAxesMRq6Wcsy6nevgHWF/6kMlz5yWHF0Xj0j3nRCUqUrX4qLJWGSOA6Zbljr1AvRgsQLMWLr8XCXwT9M8fSnyFIDcuJO/bp90sCSPgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268461; c=relaxed/simple;
	bh=qF9Vy6Hq3fkswUG+ny4V9wMgoAlWF7MBQAZDgFpHwys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oASu798MtbvUw8beNxFIb1gc7RVUPvdbaP/2GGP1J1CMVRSOBaqRVAdagjfM9pRwgBqZXsmOT5CqfRER6IKy21EmTWkehbl/czkMb/fv0DHLxJjz3KXT9t2tB7qzuPJM3icbK4A37FMomfDOlK+5s/SyRYNr3a+VJo4RqBM8Ikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9UcrD4A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9UcrD4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
	b=Z9UcrD4AgrVAV3A7pbeUic2BO95FSqSYhkik9xBsOOPqQYUMmUht+y5NmLJjid1FJ5OFsu
	Ey9j0e5jBxop29SoyFUzuitF1elFGEHQfsvQdNN37HrK8/7Xm7BM4DvhFTZU8I6F8GVbuD
	R9fn7PrlL6p9rxRWOq7x0Um7MV1mvdk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-UuCAPPjoPBiA9uWP49FJzQ-1; Wed, 18 Jun 2025 13:40:53 -0400
X-MC-Unique: UuCAPPjoPBiA9uWP49FJzQ-1
X-Mimecast-MFC-AGG-ID: UuCAPPjoPBiA9uWP49FJzQ_1750268453
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f3796779so4865773f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268452; x=1750873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
        b=k7RUvPbvUfQukvC/KGXXlQf5gyed8wFva0Exp9X1ixQ6jHdalSfkOEGupF4zEUI0IW
         nKUOhDuj6n9gVgGIUCgYb//3nVwXMYN8x/HyFOk/WqImQyQ8ldQOKM7HwZtE9bKjzTf6
         HhqFhOFII5hYKz9jDfMttPsaHIwe65vYGcBzyJnUD4DEW6oa09AWlFFx6uwufcz4/wIn
         vS2irxA6BWbPtMM8nd7RKUJy0KYRO1uorT7wvF0e8MXuseQGckSeaV4Y/89rgFEfDzZN
         THnkSjx5tpPjIryx2OJ92fNGCissR7N427dEamwAy8UueHJKa0io5LOwgI2qZIqpnffe
         Jg3Q==
X-Gm-Message-State: AOJu0YxK84vtysdiuWxsyyJHWbFk/6uv0LFBLTe2y5MsiLHqLoDR6jea
	Wt9IYfen83uYlocZ5lMOZvv8jas7iWEvpvxDdF5pHV/O7FyOKSvfOEhpPfwoyqpdmXLalEdEaZX
	cTNDXTLkLV4J6Agc9AL+6B8TGfevi2PIEjDD0x3HC+rMcfi9dKOq9RNPGM+iUnObYRhTDFhhGlM
	VELDACzYkV472zvxDqCXVuzIQD9gnEq+49UB0kCC85M4jiTwfo
X-Gm-Gg: ASbGncvmgv5mbdXh2Lg+Q6HdN2xwO7DZLck2LoZWnScipvxqQszCQLxAjswiv1MQGXV
	5Vkn8ejb4CDHauONrZiRlBUVDXwHvFLdNzUDF45BaELuyeYrSpaMk8jJf+b8txMGiMYFltkyQsp
	WtQ9TBnBXgdEWpRVFbOUs4aLZ6SGIlc1/V5osx27QAvvhDO3HFyD4BY0wtw71N35a3isNDahqLI
	81HbtKwVJNuljcUPKAlwDY4qrI3pNqiJnQrB8aYXz3nmHNxtzSs/IqOd9G3eS2sM40RefkaNS0a
	NXb/bSLWytBjvuizuNNDcZo+N41BsPYLU01NTdu9xCKM5znHdPpp0fr9Dh958kdkdeBKjlAzX9U
	iAOLY8A==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954348f8f.44.1750268452518;
        Wed, 18 Jun 2025 10:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4X4ziwIkhys2144e75SHEIZN/Ibpbo9aRHgWcvkByvBS3juQ4aklJtEd9sXicogG+MbEwPQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954276f8f.44.1750268451787;
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089c2sm17710418f8f.59.2025.06.18.10.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
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
Subject: [PATCH RFC 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:56 +0200
Message-ID: <20250618174014.1168640-14-david@redhat.com>
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

We can just look at the balloon device (stored in page->private), to see
of the page is still part of the balloon.

As isolated balloon pages cannot get released (they are taken off the
balloon list while isolated), we don't have to worry about this case in
the putback and migration callback. Add a WARN_ON_ONCE for now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  4 +---
 mm/balloon_compaction.c            | 11 +++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index bfc6e50bd004b..9bce8e9f5018c 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -136,10 +136,8 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
  */
 static inline void balloon_page_finalize(struct page *page)
 {
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		__ClearPageMovable(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
-	}
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index ec176bdb8a78b..e4f1a122d786b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -206,6 +206,9 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	if (!b_dev_info)
+		return false;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
@@ -219,6 +222,10 @@ static void balloon_page_putback(struct page *page)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!b_dev_info))
+		return;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
@@ -234,6 +241,10 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!balloon))
+		return -EAGAIN;
+
 	return balloon->migratepage(balloon, newpage, page, mode);
 }
 
-- 
2.49.0

