Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05A62FE36C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268445; cv=none; b=clKV0w7CZmnXa+LBNLf/CEVusjvjj4FWqZYKk8zXKW7m0GEq0UrMlrv92FnWrtcIyq1QYS3NYnv+osnZOctX+gLGYZXeGYg11N8wlC7r15Dd+UWG33jWA/LI2lMc/Gjd+btYnuY7ZKHHWMGqN2SXAEO0YOwGyRKXcIA5/Wytl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268445; c=relaxed/simple;
	bh=9PSofqRI4P1+E7gv4s7LsRbrQULLczAgLmwV7OUNB6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcOpBXYmEIZ5JsmhrekPEYlGlmqYlrt+n8nCDU4Gaw6MKo7r3GNIPZXKbg3ZkUhsyfN03d9vQB9jWZBMkyYjMAl4MzFjmj0Yv/BURZm9rSk5FyRspeAVI9N0Z+D/Kj7armxquMuXaOGtDF5TTtLK1h5ksgqQ5RGq/CrE1zZ2LZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JeCXRN5w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JeCXRN5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
	b=JeCXRN5w84YfLVOpry5aR6Hi5Hn2fxKjsPq7+n3oT+NCzgzgkFNAJbS/FjHl2WG5OK7zow
	RILXDNdMMjueWr21xdJJqJwGaHRX7jsoGXctHLtYmh8a25RMnfO+44GawBJZcOHi1G1Jbx
	lfwX2wchOWPwVnZ50JIe6kE2h1Uum3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-rIxraZ5APweA0Cl-85Ue9A-1; Wed, 18 Jun 2025 13:40:35 -0400
X-MC-Unique: rIxraZ5APweA0Cl-85Ue9A-1
X-Mimecast-MFC-AGG-ID: rIxraZ5APweA0Cl-85Ue9A_1750268433
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451dda846a0so56144475e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268433; x=1750873233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
        b=uWvaDKXAsTCiXZqqENGtd6CCgDPnOOQPnxDxIx29eGzfw3kuwtIJKahTeDTOT944Bg
         H4SddvFtMxLm8xxqPeMNMniQyF3RQPcw5QukfQJpHsAZ9tAEpYNf0Kezwp3DHQQ5OeV4
         9ASdyHm1BqG/o4IJGLkrt6gkzeHXBiYW0DquAqFtho+AdMcRREY1919lQnYxSXrJ6mYj
         xWqZugWO4g/5yS8R63bcwAFJ29QGdM4oFMhmzqJfSCknIGdWPc1yD5Larc5ZZM9GFxoC
         hIjtc1v5dvgD8HpPZClyg4a7O3uma0Ps+Ryx2tEESX+IxIqd8GRY3h1mu7IhMoZ7rwYb
         YIag==
X-Gm-Message-State: AOJu0Yy2/iX8+3N6TbYq7agFuXzBtYLUkikKTn0Uvrtq2J+2f016i+Ma
	PdBMDdRyM+Uk922ht/o6GCE8gcDUWXggPRyXU5FsCF8znqn5zA89eo/uE4xlDoiMTwVpGx2oVGZ
	PGYN94TTpcf1xzV1kn2QhGzhCDCJQVvVXhj3dVHVuXz+CHnnzfmOXxdoH2hcftMjTx2WBwOyxkf
	unEseeRm1FvhpL5ZVEpVA3+tARNQjDfHsGz8tjFEdZOZbYWv+0
X-Gm-Gg: ASbGncvhyUVSLs75ZCLu7FTZCub5Inn6q2+gGmZqOOVIglJ9SJl1lDWIfzo5RNGNjxv
	CTawfuCnAJT4EeMHfMqpWWM29dGgk93V6K5STedjwlWKxSBYUPrvySTLR7N1Xm5CGynJeAWTkMS
	fKu/Ai78KpLzvwRvD33LC4+vLSGhHjfCbh10HHlWVDk9yZzq9Vutj2R++AB5J11l8PQC/LaUdgr
	GH5nrxsx/r/WAj2dERqDM8T0tK+F+XTdGSyqqag087wnnf58mK13QSXue2JC8Ro8EX6wvaePV3F
	i+iYumuoWJ8utdh3SzHp9+iTg32mHTqP8c0J+Z1GcCD/hpfugq34VgEo9cPJCGayYRly401sbO0
	TyeK7gw==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196393105e9.10.1750268433092;
        Wed, 18 Jun 2025 10:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWAw9+UfLP1Ct5dqz9wzZx48CMnDwfNIf0E7YgKYn6BQsIliiNikQN1x74QYxh04+83mIbA==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196392375e9.10.1750268432585;
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e99d5bbsm3600465e9.36.2025.06.18.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
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
Subject: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Date: Wed, 18 Jun 2025 19:39:49 +0200
Message-ID: <20250618174014.1168640-7-david@redhat.com>
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

Let the buddy handle clearing the type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 5cb7e3de43952..5763f36039736 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -163,11 +163,6 @@ static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
 	__SetPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
-{
-	__ClearPageZsmalloc(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7f1431f2be98f..f98747aed4330 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -880,7 +880,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
-	__ClearPageZsmalloc(page);
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 }
 
 static int trylock_zspage(struct zspage *zspage)
@@ -1055,7 +1055,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		if (!zpdesc) {
 			while (--i >= 0) {
 				zpdesc_dec_zone_page_state(zpdescs[i]);
-				__zpdesc_clear_zsmalloc(zpdescs[i]);
 				free_zpdesc(zpdescs[i]);
 			}
 			cache_free_zspage(pool, zspage);
-- 
2.49.0

