Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42322F533F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624762; cv=none; b=bRJ5gnPhnhMxDo58EOXehBv1vNeoik8xiut4FcGovHHrF5iZpiWz5dXFrt6Xdkjl+mjCuAi2uWMGDRI7qGo4yJr8BMAbJ2JsyblwzoX4qXWJt7RivXslajBglIr7sajZlvWwUmMA5iMtxiFY3eWo9N6bpgweolOKzjRGn8i59Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624762; c=relaxed/simple;
	bh=Wr+Kn1AL8lzxIZAskivxC/G+Yen/YkPljMI4x8om+J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF/rrAno51KCzG5S2hkjDlY64sL3lTx2wKFE9vFkbl3NWmeOtXnYWMQlEeO9XI7taJ/rbI3u4pWW5dVx0HJvosHAmAXt2k/SK9RWT3NsaPL7QLJf/OHJVIT5OWF7DJX4C0VG7QqexHKVtBSOXzjxiG7hFnzE0mm7j/wS7LagHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gz7pRfUu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gz7pRfUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
	b=gz7pRfUudMau/EDR1GDfJiwnKBy8+IPwj9325vhC5MLE1wnFjCB+9dxa/XOKlKX8CNo7ki
	4N+0MGrO147BluQkXVWpOtb7wNFtvsQnTWtiDOKUN7VQFOOiNwisgfwnCsGo9s3vYWWaTN
	0FIjljEIPYDDkrU7DSLd04dUYX+Uxzw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ETBGd-MeOw6GXsTBvbUL5w-1; Fri, 04 Jul 2025 06:25:59 -0400
X-MC-Unique: ETBGd-MeOw6GXsTBvbUL5w-1
X-Mimecast-MFC-AGG-ID: ETBGd-MeOw6GXsTBvbUL5w_1751624758
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so475429f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624757; x=1752229557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
        b=QgANQkweE2zZlJAdvcSD8zc4mshUPoN2CBqFI8iZ6YHvmM/UNK1O1oVKr1mXu6/kHP
         r9U1NuZe04nOb1/FaaKFCec+AK/JOfgNUjj1RjTMpwqZzu6GbCFsq3JbuAwVF85NYvhd
         bdVAVolQtyqsHQyTXBPOW/1c//NcOenGUgeut4zELxNxM92G0s4pm1kmCouvIph0BdfE
         QPvVcmCi13U6CB86P474o+XSHvJl5UfwV234UMh9awntK+nBc/oTTQJ2BwRTwf8drGqF
         6pVkUe11o12G5vHiLZfKW1Golx6XY6hX5FjkEhgXH7uBxSwjPCtH3bEVZyZrsDSNj3F1
         5rog==
X-Gm-Message-State: AOJu0Yw2I25AY88z0y3mJX4X2YVpte86EThhzAdj146HYlqi+rsbubvd
	xAwkwWaXO9hs7s+XfmdDhninDHWLCDlsts65MSXN0PdIw/Xb44ir9FhPhOcyzlXNe+nfP6GbfrX
	Gzhna/f/XbDOCikV4vn2DbOrYlWYtXxhPaInHS6lkDVwQxSimbfqtNQqenjlQ/+YrypeBe/AFG5
	oBL5vaFvVVxNp8zUAFvuZwo9jVxS7JzZ24EpymV11lzMI6jw==
X-Gm-Gg: ASbGncvZlggpFfaqeheugk2sqKTcjfYXkY9dOw2WgKhmGLdt7c6OTpDmukbQ/58205K
	H2oHK+Rp0/WuCgHcK64ve2kAfY8j+rR5LmZR7yjPCJulbJ/GVGCyUZwESSRloqol91kwMbSRQAz
	S1XX5bAjJQel0eeAyrgGsfKvfDskvhcV7Kutv6EvawFrhKnTvV4Oj75pIZh+rCHSH0NSakasKZi
	5HCxzdbl+il1LQkYFTZZJbJASuC4WtkynKGtEMsdZSW6tQVjjh5FbPQj+mgRIrue9L9nxvmxBSr
	iHmtXYeT7T6UG1Brkgam54hUrS0zNDStU+SwrPkhx9WLi29GX3HYhGbWdP5ewLjYu0wZnI5XsH1
	xB/6juQ==
X-Received: by 2002:a05:6000:40e0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b49702e8bbmr1184033f8f.47.1751624757593;
        Fri, 04 Jul 2025 03:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjTF6Bi5YHLD4LeEN00n0rlH4Rvb7Qu4SkJgVJFS3bHVyzx6sYZQQ7vAELvz5hrZ++LyEv3g==
X-Received: by 2002:a05:6000:40e0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b49702e8bbmr1183969f8f.47.1751624757061;
        Fri, 04 Jul 2025 03:25:57 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0fdfsm2172535f8f.32.2025.07.04.03.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:56 -0700 (PDT)
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
Subject: [PATCH v2 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Fri,  4 Jul 2025 12:25:04 +0200
Message-ID: <20250704102524.326966-11-david@redhat.com>
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

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Note that __folio_test_movable() and friends will be removed separately
next, after more rework.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
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

