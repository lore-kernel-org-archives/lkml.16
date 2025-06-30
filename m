Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6A28C866
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288461; cv=none; b=OOL8as4yUrrmD0+yOSnP8+f+Jv+Y7Aqn03Cr/mbK8SrQFMKxNYoMagwAesxwCEwLEIyO4lMtqWPI7KUU2uVaNT3LVrHoYYRtblEECxAn/t9pDnACplnOHGhRcmc2lx0I38or+nIquD0PTS1SW5jo8B/+biradt9/ok+2mYsQPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288461; c=relaxed/simple;
	bh=h679pTWyf5chDo0jTdgc5eTOddfWMzqMz/6J3iuD7Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRZO5ntOuHKSt9fNiPa96TgJPkyS/gvBO4apntkcPrnGJ6hRp76iOL/vXiEqz1mxrcM2v9AWqUiIV79rfAw5V0Vcx9G0WB58w3lWYpsTvaQQQf5eDd80mSK5yUjIpG6MDeLc5kWr7QJPyZAbEib5pPJJijPCk6HOQPH21x9bERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oa6NdQTT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oa6NdQTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
	b=Oa6NdQTTra/s7VD6JkH1KtIL38ChtfInLsPaa3Zf830UugvWNJLIMJKuLZ4KtxoMHDOjiQ
	7URVym75qUHs/axL2joaxqhkayVOjxSM7cMXbxDmJFoBTW0MMXqz8igjpd1OppSbZUEc3I
	/VsRH++suMXO6gVhEE5Dd8NjL+qfaF8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-CTeGphwQMD-V-GaWZb6NJQ-1; Mon, 30 Jun 2025 09:00:53 -0400
X-MC-Unique: CTeGphwQMD-V-GaWZb6NJQ-1
X-Mimecast-MFC-AGG-ID: CTeGphwQMD-V-GaWZb6NJQ_1751288452
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a52bfda108so2046466f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288452; x=1751893252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
        b=Ke9ocHmGLONjM11gUTb2ilCML5ROX9lhbpo69I0LhSzAB6gCnBpNT2DHJe5IjYJNA5
         RYxHkiTiU8cfiucPd1CwGbDqyl0P/OQvc3TaXygHGEuRHxhjvhUwcTbw8qLZY1Sgwk1T
         VcL0t2VUGx++msnpcXPxA2VcGn9Bg/TyAs6wzZt4lSmXJKUNwmd9JW8Ozeh+WIh0ImAq
         608flpNDR35PUdFR07BhMLEA5Id2bHKzGSfdlMkCX0Y+DDdPZ268fm9o1rr3jCICzTDM
         B5bsrV+TXurwfHY1TGI+lhul1IBr+76xH2FqlxPXBytncf8oIPftla74BSVBNSCyaDii
         Ll9w==
X-Gm-Message-State: AOJu0YwOnT2vkLw1DO5gVlHHVBzNx5FavC7nN5MSiww9qCv6sG8PDwrx
	IWq5I6PJT8zCHygM1Aq0R5qdHOnTcLb7slhR4KfZL7RuQ39jYeYfY1BbiJcHmNxRS4WfRqhRsVx
	Y3j6TwgWsLISbn46XyR/HThNvoZyESH6sIZM9jiVR0gUxOqltJ+sFwdcFaP90IRGNqV8K3T/swD
	kixJMyfTdWkX9I8KBAKcgoEH5VGQMN3JJ/e/AyQTYP+8QjJD0b
X-Gm-Gg: ASbGncvzNgaaxt7zmUWvq3Ymptl5tir4HZjlu123ATOnggCuZn2TscFVjukk9H6AKwh
	n2Y6LLjBjZ9mSjoqjLAKgnEuiGAWwlEkXlBbdUzToXf+jldRDfzuFINI7VonsvtdvUxm9VU5qJn
	/+EVR44MBJRR2Y4sC0NIKS3lnqJo4ZkRkBAQg4MPyARyZEBkkbZwVC8UFTg5UFKA78iJ1a4sY9U
	ehHLkEl8kRfyZONbaZLC+UT1tC3Nn9CYJSSE7idC3Y0Y4oQeoTj9TBiu8xW4Cbgg2XlvrP3zt8S
	hd/YDz1DxZ/xPr31EiFV8iyKkGx4gnY7L3mvLO/9o8nqi0xc20nlNZ5bagdmtxSDjv1gnokJRB2
	QKqeSQCA=
X-Received: by 2002:adf:a143:0:b0:3a5:8565:44d1 with SMTP id ffacd0b85a97d-3a8fe8917d5mr8134413f8f.25.1751288451386;
        Mon, 30 Jun 2025 06:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcHR74Vg3fOLDK1bhOkeMb0O7J5iWXrvKqq6qclu6yGGjB1xdv/xPEmRceAckepewzfNXHQQ==
X-Received: by 2002:adf:a143:0:b0:3a5:8565:44d1 with SMTP id ffacd0b85a97d-3a8fe8917d5mr8134296f8f.25.1751288450453;
        Mon, 30 Jun 2025 06:00:50 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b6d50sm167133055e9.30.2025.06.30.06.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:49 -0700 (PDT)
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
Subject: [PATCH v1 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:54 +0200
Message-ID: <20250630130011.330477-14-david@redhat.com>
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

We can just look at the balloon device (stored in page->private), to see
if the page is still part of the balloon.

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

