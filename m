Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611F30554F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268501; cv=none; b=GFXe/Ec3BgmGu1iJm2Ht2nZHyQBAdHRXDK5nQCzzCeXydAACQn7ryNuguReamXVWobDqjjMqKkYBd6RpiLSH/yzZWENqTx2UZafqTlL7UsJd0bhVZbAam90rzfLm2u0SwAu/rSQEH/uhyfnO5bYxeZM9gvOMOyzGGjOBovuz+7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268501; c=relaxed/simple;
	bh=VLtr/75+OgLg5UKJqAhr4SPpTHq3QNsAl+8ocPk3Nhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1SUl1bK/0vJj7x/Dw5sGZ3+ph/avqXrD/3iQt/7knLv+D6L5VHjenUcAnCMOmvBYfFtxDu3MM23MNTM5bfSj2mRSXCcoMyCQKVk+1fhKLYUtmss/IjN/YO/t0yC9hTTOgocJmbPgc6eDDZ177fcmfZVDEyw2AWgL/oFB/KtAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RbbKPKIa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RbbKPKIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=RbbKPKIamvam59q7i2JUbHN+/91evqGYAK47FwhUsB6vkEErp9wsMZQhpXi4UCgdqsUIPE
	PLnZHZ1sBJaBs4fnlGEYHJrLCcA+k4n2G7PefHZFLrNOOUg0oRHdxZn0GoteFEfSYALVk0
	AzZ1CV80CSuj1V2NS06dpd8O5lD1Zm8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-zrQn6tsJNQC5Mc48ctmRYQ-1; Wed, 18 Jun 2025 13:41:37 -0400
X-MC-Unique: zrQn6tsJNQC5Mc48ctmRYQ-1
X-Mimecast-MFC-AGG-ID: zrQn6tsJNQC5Mc48ctmRYQ_1750268496
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d22so46556025e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268496; x=1750873296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=MkqkaWhwo50ufxpbKq1xIjKm/eYEmT6EbVfjVy4WOpKfBBOocaGme2yFdDQALegqpl
         omvuCjORkhGQ1r9kqadTSTmmMkAP4Xw8eEaHacweYArJri3rzk3oeJ9J/f0z7U1Wrm7Y
         p0On38kDNOwrJw3PRyLJOkgbqEPUY7btIFqZJ/2YiyBqfdgyfKgDZIl4S2bM3lqvkeGD
         V7w+8gQmmcFRg/Ep+0deFfIx+iOrKwizJJd69xc//UK5hc/ry2phHMrYtGv1jZGpqpg2
         vSRF4Bge4QQyYI1Xotk9731oSz/MG9sdQwTx5Oi9yKzcpOtTeTxPcycUHgmCi7kwbqwC
         2n0Q==
X-Gm-Message-State: AOJu0Ywxq4Zs4kjqR86UL+2LWgB4tPK8Y3bA6uoOEhkIlWSsDiOufqvS
	WHKtDWvHlQQnvwLvnm5XOCGux3mpIRX0GlsMSMA/UWt29+fltBaY48eN4eIiTEvN7FrK4sYR2Y2
	LQwJ/y55z3ObyFq/H3YHdPQickgdx3RKQVyeHw64LEDTvwbuHf9T9unjeSwowuX7ZwTmUkvVOI0
	Wvbh+tmgLgp51yQ2gg10+Nbz8cOvN+srJ5tG2LeQx6nUCXoH4C
X-Gm-Gg: ASbGncs4tqua98rPfdw2LGfqbh6joG32bg5hyQu77fypbbHumPbgTciFEo2Dd7dC3cc
	8vkSOMcPampdUQzbGIRc7MG/urF8z/Ei6pPISBOZzz0IpBjBdofjEB4e0CwDmZ2opjCTxTjpi3y
	8h7cQdsA1/k/3ERoTY6KuqT/xOl3InoUsLm72OQ87gPEBwoXVwB5ozy4zNc8B0mYs1iq31y3TmR
	ARz/dynAUcN6nTfIFzJdHtEJYAx51KHfy6EatMWuJQiKGP7oVXxpD0TIap7e/MYrcxpKhVFaP8O
	v9SBYb2PRimMxqgCMrjjDHEaVlxze+gKtf9ABww/wO5KVt+iBeiEKmrqG/uR1wW7/hShRzEPKlP
	hLs5CSA==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154424705e9.11.1750268496242;
        Wed, 18 Jun 2025 10:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJSoFqz4Qx4eaIpu3abT7lqqTMcn+cWB1r/wxQDnmsMcckQg5l2MzM3eBNzoSDxLAyECFAg==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154423805e9.11.1750268495716;
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8edbsm3459385e9.24.2025.06.18.10.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
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
Subject: [PATCH RFC 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Wed, 18 Jun 2025 19:40:12 +0200
Message-ID: <20250618174014.1168640-30-david@redhat.com>
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

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION
like we did for balloon_page_finalize().

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

