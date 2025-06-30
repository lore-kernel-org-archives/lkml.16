Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62D28C03D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288452; cv=none; b=X5kNeh0l6+rwEpzAxUcSulTU6ZtQMLzTPq7IDyy8AeTJJiwV5q0yqlBTMdIKo4+ekXCLAGkow/9QcDXky06m4NiHP9l1dWBSH/gfBhT3pJL2tjaZcU2iYHR9u+7yYlTmL0o3QgqnERieRJ/nO3r4cLvySaevYjXDfKgtx2NfNdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288452; c=relaxed/simple;
	bh=rcWuXS8i+J1+1NqCBG24FdrnWnU9/Zr9SBDXhHAAeFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNgMOWlSHbxa6OKy/83MUI8HzNr75T9hf0cbjZJEHP/uNd8fRoDrdCeiU08zrQBRVtSf+TJBKt5cSDHqBNG5KAFT2ukEoMIgsrGCTn0SoF04jT1UiblKBZT9gIvJRpM6vtnCDAaCx3292kP2irux8y4guh47PQcF+IVt6C91m5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdtbMg32; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdtbMg32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
	b=CdtbMg32CABVZMySIuJYkWlfYQXxIj2iPixDmNN7eYvswEt6pfQgaGUaQEmLEBF4v9ILmR
	icFcEZx6zbC/sxQpoVyVX/Y9kL5rWpGA30EAUeIsZkkqS0HPYHLz+qbdXRCi3WrAYpEf5z
	WyOOt+alOTOlxYY8EQS9jOT+nDoYepE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-6CrPMQG4N0GDB36cNYyhnw-1; Mon, 30 Jun 2025 09:00:44 -0400
X-MC-Unique: 6CrPMQG4N0GDB36cNYyhnw-1
X-Mimecast-MFC-AGG-ID: 6CrPMQG4N0GDB36cNYyhnw_1751288444
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450eaae2934so15171705e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288443; x=1751893243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
        b=pTS75n/1lrsYBrjobfHGCjy+ebtG8pnYE4I3+72FmZOD/tNiKOWI5Um+YaUog92RSK
         /TLqID6a5e+WtVZHIC1PN1ItTC2BgPJkxvhLX/uKgSjTxYlmt2zfwSyy71oEAyZXTV5i
         KpXK1WzZ4FTBT9rX/6YSRGU9pmESUFyfm62sILi28qTKs49iBOYZcgaYCNaoC4hHpTP8
         Iv3aPwnIzpIO3dn5Ac4Im2ViMI+vKR8g+o0LZ1lIVQxMgFSAfkN95QaNlbADhvQ7Ah1n
         l3ydXaXmljTQVpm256KSfgetqz9z8PcMJBWEafofkRpjR6P9krbcybFa4+wK29Tj9dNc
         K6Rw==
X-Gm-Message-State: AOJu0Yz40Na4L06otgR43tUyu968WCBe+LhaAYwGEHNGfRUy6iKMFF6b
	aFyljkYe0r77k7cXMcv4B5+Mwsvjia+4IoWa7hxtwsduLkAVeLmn29a/ScRds/m3RyeFhCgUK6q
	gJuHPzKuTZMdRyp2ur+MlogeEMbC9cDANvxv91aRWz4kBDsomPlN2iRwhFkhDh334rJjpQB0buo
	37HWvExQekjPDjwPKGUwUZ2OuHs3SEXoaqVbyDRDtzqTywNWHs
X-Gm-Gg: ASbGncsrkgfHace1zDONUYYsH2bRl40FGytzmxmDpqb1+LWs0c9q+VpUNqpRvSWNmdd
	Tr2wW2v/60gUHPRYynWdePEPNImtXXv8+xrftUgmVjB7w6dus6j0oDZoL83sssn/KQs7N5Xr1FZ
	OoWAG0SidC6hFkiPLqToEdRQDMYd2+b1jCaOx1NgnRidr2jpVJbT88/GPzUwCdBtCHcp5l4hCDg
	XbyTrOquAc2stl9pO7At3PU9SukcZquVqSHiu6xi0KL3ukNo8FviEvI0SnN9eiCn67ItL9fn7mT
	iQEC3xIVaXxLe15WsYavvJaZTJqn0MY4xuagt7drt5Y8idTO9YKxBLxAe3IzAJNrcsGzItH4XKC
	YAxjrSO4=
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766148f8f.52.1751288443330;
        Mon, 30 Jun 2025 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx8UWJltFtDizxyihu6cXjhn3Ci52lQuk8tR1EGhsL0o4Tf/9IaaIN7lF9qzEV9dDz+LNV9w==
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766023f8f.52.1751288442367;
        Mon, 30 Jun 2025 06:00:42 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136745865e9.27.2025.06.30.06.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:41 -0700 (PDT)
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
Subject: [PATCH v1 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Mon, 30 Jun 2025 14:59:51 +0200
Message-ID: <20250630130011.330477-11-david@redhat.com>
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

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c0ec7422837bd..c99a00d4ca27d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -118,20 +118,6 @@ static inline void __ClearPageMovable(struct page *page)
 }
 #endif
 
-static inline bool folio_test_movable(struct folio *folio)
-{
-	return PageMovable(&folio->page);
-}
-
-static inline
-const struct movable_operations *folio_movable_ops(struct folio *folio)
-{
-	VM_BUG_ON(!__folio_test_movable(folio));
-
-	return (const struct movable_operations *)
-		((unsigned long)folio->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-- 
2.49.0

