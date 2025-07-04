Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E122F3C2E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624820; cv=none; b=axSCuIJ9yOJnqNR/MM9vqO6FXD1M3GWKthYonvrGqVjnWQpY16FkRsJqxkawuJLImrbKulnrKlqMhW9DBndVdRCtSkGpaQMoOcQH768ThY+9WsbZKhBFhopS/1OCj+Yf0FLqT2Jit5RgKP3n4hCJKU4T2GDl2GQTxHlWCDF4YjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624820; c=relaxed/simple;
	bh=EzLnGXHkuZsrbU+9yZ2bD2FaU0ugKSCfE5X54vg+vxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ae2hKWoQcbyL6b1qLivw2868WUH9dqNAHCogoBFFQYGgq3dP9UYDGg3XmfBWHN7ZYCpLezjMHzlKwFTQrkBO5TuUJDAPWkKzTyvXNwackB5aagEaTbmvM9e7a/NEdCr/Q0B7I4e6CiKNeClMIald23Dvyc/quahZ7VpFHWgPYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StAQGxJP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StAQGxJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
	b=StAQGxJPacJtJejWR8F90AqxDkYLIycwS8WPtT+gBYH8Ph7T9keBq4ZC5Fw4JsY5wYbAjd
	97/1A4RZ3pWSHLvI/HE64dWfDpayMWWhK/H6Z2fNpv6+kRBXYteJQh8WyFqMdBq0tTA7a2
	RZLTx39zXw1WVtOwX1T+s+Jtaz22HNE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-g1qyVvnaNxiqJlFx4mN_rQ-1; Fri, 04 Jul 2025 06:26:51 -0400
X-MC-Unique: g1qyVvnaNxiqJlFx4mN_rQ-1
X-Mimecast-MFC-AGG-ID: g1qyVvnaNxiqJlFx4mN_rQ_1751624810
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so500535f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624810; x=1752229610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
        b=eAdjMm7h3IbRuh22XVpLIYMXCBb4hZY8OP6oAk6cxTLAOdNCFAdXvCq9Rk+IxB626v
         OaFDd0goBSzZBDtxNwISnv0RXbgTytuv9+q+sllYIov/tcJu1i4q1ypNwvBJkhbrYLhI
         hk3Gt+72rzH9VmtkUPYipXKVhp9dW1+Ghue8nuD0ltenxCkhafjdObKTgW1SUHL1kDZc
         qpXe9CjqUZe0/MicxbEC/TQYpcUHXPqjCNk8V/veMjzvH64g4EaW6k1hyVR4RcC/YuHS
         Yh/dCnxZjVKOLoDx603DQNj7H62ZvT3B/mOrx3RBKBcG5MzqxwxZvJx9XrtRXnW4kny6
         WXQw==
X-Gm-Message-State: AOJu0YzsrQMPu7rfFlF/cEdmqHkrr5s8aiC1y7HUUaJxj24hfRe5xcDk
	bwzpb1Otliz/DfTXi+IVR8UVTzliCXA4FIxF6uDMD0ex1/l+p35Fs8UlurxI5fJh9YuNVvkGmaX
	wi51onfaR3ZsiwRXeq2Igj7dtYQuU7Suy4btSLiUT5u+P8OC077bDENHSbbbT9P74Qb9zllVp+5
	M82B4p+HaXeS/ia/XTLIIuArG531wla/hVfVilt0u8rrLZNg==
X-Gm-Gg: ASbGncse6aQYEJh6rY3x5z6rAqRLen52xmpli3QrZ1f9XbdqnMklH+dtKU6YmoN7o84
	oVcZRbHBgLeUE1q7jDczCWYlzCcAwtrGL+y9h7ffhvbnTzaQG7nf9bft6XESFfbWXElNdgUQ54/
	VpbJksc+9fDPB4qQYUsR/QGfYsjLzM6Pnh++m/mNQP9247BBLm0Kz3R/QMK0pPTvADGxgexGlAX
	1QbAYFyKsUyGVpLUT5qCNjT2isLlU3Lgb0PqpH92/dT2xB0i2/z1MId4HL4XDUUsyfl1dFbUH4M
	YrR1VA+aqnUEbiYmrVqJJQFM56qyOPPn+1wqmOtm2Yb1g0HjdzeCmfiO57yx/Y/a0zXtSn9kBhN
	YwUYIpw==
X-Received: by 2002:a05:6000:2906:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b4970294bamr1229518f8f.30.1751624810387;
        Fri, 04 Jul 2025 03:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU9MKO4L2eImwXLAzlEGTAbbgXQLTQHWpn061Frnhroy+xSoAIVNW9jaIe3vRaTd6Fz7itPA==
X-Received: by 2002:a05:6000:2906:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b4970294bamr1229434f8f.30.1751624809815;
        Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030bc5asm2113887f8f.20.2025.07.04.03.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
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
Subject: [PATCH v2 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Fri,  4 Jul 2025 12:25:23 +0200
Message-ID: <20250704102524.326966-30-david@redhat.com>
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

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION)
like we did for balloon_page_finalize().

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 42 +++++++++++-------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 2fecfead91d26..7cfe48769239e 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -77,6 +77,15 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 
 #ifdef CONFIG_BALLOON_COMPACTION
 extern const struct movable_operations balloon_mops;
+/*
+ * balloon_page_device - get the b_dev_info descriptor for the balloon device
+ *			 that enqueues the given page.
+ */
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+#endif /* CONFIG_BALLOON_COMPACTION */
 
 /*
  * balloon_page_insert - insert a page into the balloon's page list and make
@@ -91,41 +100,20 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	SetPageMovableOps(page);
-	set_page_private(page, (unsigned long)balloon);
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	return GFP_HIGHUSER_MOVABLE;
-}
-
-#else /* !CONFIG_BALLOON_COMPACTION */
-
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
 	list_add(&page->lru, &balloon->pages);
 }
 
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		return GFP_HIGHUSER_MOVABLE;
 	return GFP_HIGHUSER;
 }
 
-#endif /* CONFIG_BALLOON_COMPACTION */
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
-- 
2.49.0

