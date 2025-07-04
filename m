Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398EF2FC3BB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624792; cv=none; b=eO6cXWD4uFCeZHh3ATAdfm90aWI5Rsko6wZATx1k+8qkEIbqaZ3DY8OI08KkxGiMnfAdsNXEl6NxSdKUezncT/p4sHfBStNbHIcb4aktw5po4vD3/Bkd8TuLUSuUYAh/rGhKOAr9otoqXRylYQIj0HxBnE3LfcVn/GUYk05RbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624792; c=relaxed/simple;
	bh=C6jPkBseruyPYB2V4vPia4YjzGxO7oc6LRdQsocjdPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaFxqoTHuiZffNuyLVh8Jp8Mk2Tt+y0zX4tArHGPVpE6QaI270BGm0JYhm19dPVMhnOFacuxadHbTDLU20fGx3Uf1MZtu7T//0MfdsBGRIf18G5D1hZsfJ7CHEe+hSjIO9uek7rx12X8UQYeZCh6EReBULA8+m4Ju2YlOXdK71w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQSf7MCH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQSf7MCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
	b=QQSf7MCHJ0+6djILhVCdnykQZFP+3tHzG84xOreUSIcBgtFvzru7IQWhMnfbjLHEV8TLbk
	epBxvee05TRoCKuNn3bQgHGuFIQ5w2EogHLTPfeBkdjuQljV7oNGQ824sUD6JOUAD6/j1x
	XSwQZ0pMHhjtbOMehkvxpGRLCLRT7xE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-fMc5h8GpM8Cwwtr7OKfn2g-1; Fri, 04 Jul 2025 06:26:19 -0400
X-MC-Unique: fMc5h8GpM8Cwwtr7OKfn2g-1
X-Mimecast-MFC-AGG-ID: fMc5h8GpM8Cwwtr7OKfn2g_1751624778
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so416095f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624778; x=1752229578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
        b=oehaySEbcpKIXsFNSNixKoUq7sJn6fX24UCspeabLnEzNt9lLRg+vAkA0tAkvMV8kR
         gL55iHOIT1TOiCfSojxrRXj0ENZAFVs/qYaOcCbqWeH9qUHwrHqd1157ybnjUVs4dhSu
         Uy+pTAxWhDVp7C6A13Xd9rCbLfsOCW7k1r/m69AJEAsLKFxRuYYgclzBEXx6bDP6fSBs
         gvkZYoPuHPBA9dQswZzTu34C0F0z4sID+a0y1zNtviTBM82RXN1ClV16i8xmrzdJSWLX
         zHcVUYmKoAFU7gvlYkLyBCHFeqnSXqtr66Wcj7fM3dn2pcKOgH9cQPTPHPnTxr96dfUs
         nEeA==
X-Gm-Message-State: AOJu0YyJVO6oK3i+pwRmfbTGAwSWyQXFCa7p+HJA7RxRD6suf4SC8VyT
	dDjHwwJYZchdUFu5B01wFNrwd/qeCerBU32PdyStKbQMpdSSZEzrkm6sdpkqVUcjxy7kR9ClIky
	ErIsAOLMl8j9jL0OF9nNEDihj+r16VqIbuiOJ4G9mAmGHw00+igDv72s2pcBM7/ocTzacYARfeV
	we7L/DmX4AUdZPrgnX3mTXD650+PJ89EctJe6Uihl9bZfmCQ==
X-Gm-Gg: ASbGnctvi7P2PI3/2HoFUTixc1OEqW4LU81Wp4bV9y+LaaBeYDzsWFRtJ02Rhpup/Hn
	ISENK+2BM4SkOjPEiwdJt5edbv8P+mbIxIpxHWCoPvXVfCJpNaakudMCLAU/ukL9vh/FxNGNOOM
	+uNCq9bnP219nUz3NWNRge40YkvIzHSmP0BATyJGKwjQx3xO2QIwd4W8RL0YMVR04hHpU6XBpsV
	CyuuZLEGFRNEjidMAdgXFtfENMiRoHta/QJgAEhfs45s0+jrgosnUdenOpvZmV190MOrWbzCQ/o
	2aBEfVGXBFxfcqi9uZbYvBe6/tQqQXNnn4PWlEyaoXWXUv2ywWSrKoD8Ez4lksdSjbPT+IUUw57
	T0kdLfw==
X-Received: by 2002:a05:6000:2f85:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b497019684mr1247119f8f.22.1751624778043;
        Fri, 04 Jul 2025 03:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsIhm+puni7M70O9UOfmv7nAn160MUBp8IUwHGoHgLCi+2FqWLpmioUQXF2wdRtw6a1cigug==
X-Received: by 2002:a05:6000:2f85:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b497019684mr1247037f8f.22.1751624777474;
        Fri, 04 Jul 2025 03:26:17 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9969a8bsm51842365e9.2.2025.07.04.03.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:16 -0700 (PDT)
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
Subject: [PATCH v2 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Fri,  4 Jul 2025 12:25:11 +0200
Message-ID: <20250704102524.326966-18-david@redhat.com>
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

Currently, we only support migration of individual movable_ops pages, so
we can not run into that.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0

