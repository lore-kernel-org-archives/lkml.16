Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E428C841
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288459; cv=none; b=M1eV6TruGcomQd/bd2kYxuX8Rj09DtH9i9Rb0yNK0isiBEkgk0bIUeCKcTdxXiyhNEZ4k6Ecwa23YLvzyOce6P3PjRGK4FgayJom7yemtmkp9TKzfebwCf2jW0QhOt2ZemWQMAWg0lfqqUrK0RyBj3QeYRJ7dk0+QVfINsgdAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288459; c=relaxed/simple;
	bh=B4KdnntE/37K79ZPh7jyK3I0hRR/1p6A2DVmbrYflX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5V8lPKO75Zit4a5wStMEAr9eIB9n6DX3SuMrMJMa7rLvTbfQOzd9EiilgVpRof7kND06fPG2a+bCuNjL51zEUStlJTgLjimeMh08AkS0nGtaC3XOR+B4FKGjdR49FZ+NiG6I4skUR3NjxQf9k3VnEU9+zVblNXAvvL9SI2oMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwaIciSy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwaIciSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=gwaIciSySWQNHly+vou9rQY7nvkZG8CMLLPyWVYwAeQdtPb317aguTtY+QU8ZhTicVfbbS
	u+cXjOVGDeiSa3yiYjS6DvE0W6bnD7PbAkpB/MAdGKuzbbESpgei4PISKE7NwHyygK7Hy/
	GMPGZLUBdaefwRuaPm8GVWtWzpjJpio=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-ex0nRRL8Pz6lFs7z2iqhHQ-1; Mon, 30 Jun 2025 09:00:50 -0400
X-MC-Unique: ex0nRRL8Pz6lFs7z2iqhHQ-1
X-Mimecast-MFC-AGG-ID: ex0nRRL8Pz6lFs7z2iqhHQ_1751288450
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so2652114f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288449; x=1751893249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
        b=K617rkcjlqzDp6XjJ4Msx1E1lEB+JXaAhc4iwj1a6SsMTBJ3vJa2Cu1etWUaFfi2Vr
         jXNvC786s49ZeZW1hJmds9BbVY1Efb8I6rtAFqUzEIwIidbaPwgPjK709rNBqP/oKd4F
         8XaIFY+/WjSWT26F55stNb49a19r+WwuS692nxE6VEeXXANAZc7azmrr0Xp2bX5o3Ymg
         fmkDiO+H9ZE+tMUi87aSpt7MBA636qrRRyI69lCXH+kFiav+2oy5TYIqCARt79Mq7VXA
         qIHfsyfXRFK6ZDnFD+BQIRDhZv2QQl99SZJbiBt/EkNfAWTllCUyUQ6lYRroKvvkLgsS
         UJLQ==
X-Gm-Message-State: AOJu0YwCLK0HkB8vfHWom/zE9usMSA07aSROc0EpgGVMAFDyhbQ/hr2m
	4oCGCzNktqM2LA+JllD9itEkdCBl4my254v2gGjFdIzh9jYCVVauWsc6DTYy/SzBuRiJnrFuWMN
	wApusRv7d9EAGJ4DTEG5vDMKrKuHlpInWY2x9NDZuMSjX2ENY5n3js19XJZLSa4UpL7fWYNzUs+
	9bz8JMvvWure5rHXvlpKL7UnQevHu4jEX0KXtqm5T/zxDwOnTq
X-Gm-Gg: ASbGncspfaObC9ve+nEW5ogzFIhNKnSfTeys7sLBPbkWEEX2JVQmrzwywD0odfPsQaF
	WMmMgpYr5G+5Xw72XLqpIdE38oUZGH/eLzJnVbqlSW4PX9TLvjMFA+ZRUPg+PSGMSEW9KNJi9nj
	wqGmvDPZGwQfZ3WEZshojQMKQ5Vito+8ryeWihsVsdEnmrKtcxLg4IY7KKl77PfdI2ak3FZsGfy
	FyU2tQzEEssyeNXz48hQpH20qZ5LS1Kn65aG32/duXRDAHutJMPeA2eWw+M+VXD/H1fDUNSO50O
	F8/72YzrfMLhb7kXlYpdts3xVugPSscOkLTwVA/YbiLm5GKnJxNjX+dekZRv8QJ787F8cHjVW4K
	xqZ1WxtI=
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5970086f8f.11.1751288449065;
        Mon, 30 Jun 2025 06:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB1TGCDIUZET9zX0pBSLAtGHjOK3AMuobCCTliN5r8xMP/2a92mQUobTb4bSUGBJMrG9p6Jg==
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5969952f8f.11.1751288447748;
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c80b5aesm10252042f8f.44.2025.06.30.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
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
Subject: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:53 +0200
Message-ID: <20250630130011.330477-13-david@redhat.com>
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

Instead, let's check in the callbacks if the page was already destroyed,
which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).

If we detect that the page was destroyed:

(1) Fail isolation, just like the migration core would

(2) Fake migration success just like the migration core would

In the putback case there is nothing to do, as we don't do anything just
like the migration core would do.

In the future, we should look into not letting these pages get destroyed
while they are isolated -- and instead delaying that to the
putback/migration call. Add a TODO for that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zsmalloc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f98747aed4330..72c2b7562c511 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -876,7 +876,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
-	__ClearPageMovable(page);
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
@@ -1715,10 +1714,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
 	/*
-	 * Page is locked so zspage couldn't be destroyed. For detail, look at
-	 * lock_zspage in free_zspage.
+	 * Page is locked so zspage can't be destroyed concurrently
+	 * (see free_zspage()). But if the page was already destroyed
+	 * (see reset_zpdesc()), refuse isolation here.
 	 */
-	return true;
+	return page_zpdesc(page)->zspage;
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
@@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
+	/*
+	 * TODO: nothing prevents a zspage from getting destroyed while
+	 * isolated: we should disallow that and defer it.
+	 */
+	if (!zpdesc->zspage)
+		return MIGRATEPAGE_SUCCESS;
+
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
-- 
2.49.0

