Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5DD303817
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268485; cv=none; b=YuQ/neqk09f1fqJG00w9qQrsjsiRIfcjXRb4/pDgXpPyKkj+zz4hM9QNooVZhcnAzvi/xE/D98hkjsA79+mJ1jGEwJYudb+WeU9/jpfjRZOzdDPdINjJAU3ArKGyUFEQG9/SdcMcBhHG4S6/ELgw0Wfkifs2r1uyCrf3fwKrJYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268485; c=relaxed/simple;
	bh=mR4wKIFzNAz9lCxg/2MhGizqJd2oyhLD6gTXEVIJK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3/mKaL9PaCoer8Tdg8PZbCxcByQFKXP9apV6fJswh25nU+fN6P7SzierXPKdoX1jBq+EiDtIgvzJP/1uCeBplJ0kGr5I8arcnW4XFSv9nVEqnp5wpW4rG3RneBVcOz+yLIN3vXC0396oO3bhYhXEXPZBSGVRG/0l0jN54wxlDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnYjW/0v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnYjW/0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
	b=cnYjW/0vveQnlf7N5lEvxILby+8nkU6rXMGZlLgddd2ngAta4V9M7fGltXuKUvhFZ0qYlI
	nMLz0+RxQShOJgLfooSdZmfnQgNjZyHWnml17wEzbFHOqmnrfNpD/i01iBeAmbOyMksW2v
	B0oTP2mqaewUus7wXN0HUlqCHV7rpPI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-wfoRhxuVMFOGe6Mln5M5Lg-1; Wed, 18 Jun 2025 13:41:21 -0400
X-MC-Unique: wfoRhxuVMFOGe6Mln5M5Lg-1
X-Mimecast-MFC-AGG-ID: wfoRhxuVMFOGe6Mln5M5Lg_1750268480
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so4365920f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268480; x=1750873280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
        b=Xxfn7UjC6zoHD4+4XnV25oE7eqXlptfHB3eouImArbvBs2rdR++oKZmjyhmnSOT/81
         bJpt46xUNUpeNYFCsaCECCJWivUzxcKRbGPEKqTweupVlo24RlllOvI307b5HD+CPYkS
         8G30qg/WcTEDG0dE4YFYOhM3B1UAX4pYS5SY9Pde3qzNjyNq38H3fnCq4ywwpKRmM+Id
         tgTCvI3ZiRRgpGdw45Htz6RfxnwMyDiw1KWmii1Am9ZU6nhYfChqfzU8GUEm5G1h2k90
         OFPUFHEJS4t6QO/McCHzLpE6m89V4mS+4YuNgOJAdPtwQoIp+1txMCPKvYlHsfs3Z70Y
         SX7g==
X-Gm-Message-State: AOJu0YyCnJ9Tnd9hlrwLlM1cmAQ2u4Zh8W/mP0JQuXdVY+1xa8wGO/lZ
	mrah2sMqMGiKrY5zPRbmLGoyIZeF/GPTSkFv0t5LGNA5SWiXNtr3Kwqa5TiEr+zL5cMWPQtbEqW
	gNCpxmG4yUKqXWkwrsv16qXxqy1mOBreBvRz4XNXFvD7NvPIfYVNlxk2SIgIGU+h/jwGY6RdCAc
	Gw/DiHLPg2GOiQDcyiBP98E4a/kjNZwSDNEpZWf1IzJa3t/ieS
X-Gm-Gg: ASbGncus3Hb1H92LVsGwYErZ3d0/bc9ybJm7TXJpgO+UST/Dj3XBwH2NdcaXyoziuno
	/JKL3tsAuy7FPRnDhQVtT2XQ9GG26OGcueXuZzElZabdI3WsMuYq+D/B8WbJy+M2ypC57mmLkq3
	B3URp9II77n1mG/xhTqym9INLgXymrfv4Zv8iouyoCdFd5pEVBV3lkLj9oFSOqnIdmL63S11cYo
	AzRhRgLqlrP4u0XveAb23t7MAeL1tNeliPVLbllJmR5CYXKthLTE/SaUKTVluBFiRKvU/EBUyFG
	V5HdAHThCUpeOsiYimCqxgLL9aq0pMRVUEXTIy9FYS7NmRcO7lXp5mIykvkRGekWFM1cabu3XgM
	uJKSzEw==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379352f8f.36.1750268479954;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGgOLn/JzQiVrSw8561br8iJzDS6W98mGXalaJQyvnuLaRLghELBqFwLLjepyMMgs/X1CCpA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379264f8f.36.1750268479340;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17866251f8f.91.2025.06.18.10.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:18 -0700 (PDT)
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
Subject: [PATCH RFC 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Wed, 18 Jun 2025 19:40:06 +0200
Message-ID: <20250618174014.1168640-24-david@redhat.com>
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

We can now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index abed972e902e1..f539bd5e14200 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a134b9fa9520e..a0ebcc5f54bb2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		page->page_type = UINT_MAX;
-- 
2.49.0

