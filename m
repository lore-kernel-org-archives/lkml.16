Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DA293B53
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288491; cv=none; b=N4aN+DoRmd972Txpmfd2XFMVNZbtfEIz3nCM6EJkOv1C8G/U4QdeyxPXGn5XUFJLLfdPn6GsJ7UdVmVvYPBetueh3TiLgsD+aA99XXGMzy0ypwo+JI2hhl6+syxAtE0GPf0IUzcqhWVEkhar5kpphK75aSenj15cNHMGi7NNAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288491; c=relaxed/simple;
	bh=bX2O32zo3eRkpyjOPjcPSMjPx5jynwq3pH5hPVFisUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjPnC9HAijbvt4WAZl/JdXpSTQpawKwmmFcCFoNuZSGR+D1neuSbsYsmD8fb67Xkwl0RZCJuVkkumn+ILIqHvyaX1b+SM03sinzeWZ0aDjeRJmOKYzXdjo1wMfg6mLrKyRE8UTuteo58i0zIZN4rS3FFwzEzx9Ja1KKwMuK9KKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLYI1Ifd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLYI1Ifd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
	b=cLYI1Ifdq87OfqHzL97m/GJ5+7HTHc6hl5jekhY9fUVbudZQxSnHvMgiWPmEWu59QIMoal
	tVTYMebiAoNunQquUoYO4patmtB2DQFkAFwAClw1CxjaqtNIRIu1LsMV4b3PPTi4sskqw7
	jEYG2N0r+fSbfAyFUa7WU+2sM2cVP7s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-vmdBftSbPuq10TCJxlxShg-1; Mon, 30 Jun 2025 09:01:24 -0400
X-MC-Unique: vmdBftSbPuq10TCJxlxShg-1
X-Mimecast-MFC-AGG-ID: vmdBftSbPuq10TCJxlxShg_1751288480
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso11776525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288480; x=1751893280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
        b=Kmlsv1anFu/DG5yIcUZuOfGxLetNR7nMgQs8/Tc9grO5dPocHvpak8Ven5VkuMRq8Y
         osmz3XVw8xJ3bRuhbZplzukGfB78R7YDmeoAQ236t/mxSlA5i1Pqrldkw+APh1TnC82/
         XYXI2kr4vpm5X08rTf5T7moCV79V118TFzXjRNNPykVpnUcI37ivQGONS3JKfkVjs0O1
         YlQ9Yvqk7uEpj/LkYtgUaqlBkGUfIbtmxcReJN/lNzCGlg+FNq3vY9JwGil7G71LU7tN
         8+5NeEtwW/8Glokn7+56LZVHCLmz6m1prh8IQDzJfCBDAIakE8zWoYFjId7pACUmmR5I
         kdqw==
X-Gm-Message-State: AOJu0Yxr9yL3H0Invd6xAz6vEnc4+Osx2PFnB+GqD5YGYxkTUBmKv/lm
	sd7kNxQmRqjHXTFl2NX5b/UhItQ6Sao8FsXfLez/3Yy4nuO/7QxHURdLlsnW8VfC5V9l8PbYz9K
	zFb1KPgwlEUZqsphmVHF0dpefVOEfm9hePjBm57o3RiVXY5IOkmvQ2951ehk1bFO5M1snEx/FGS
	vmudhWSxKfm88FpsR+Vr4EGTFvdEldUS7HdZCxmmOEUpyoPA2X
X-Gm-Gg: ASbGncsL+nvchr3VWCjg4TAxTEl4PRmP4IJZjVJnOMpaKCJNcyGDzbmNWfe47gnbJAE
	N19g9FpvxQyC7yz512CvHCxKJSRZZvrOt+V2DkMk2P6QuTO0VNRAEbXk0pg5j0ohEe0NetiIm/o
	75LUZCx3HexGQ1dEIQbHYbzC+zCeiMbjg2XHa6NIsL1m5X+/d4LXsY95j+IvAOi1JOZNzz8cKBV
	b2hUj0vNJje56dtqOcjMu/Vnjo6zJlB6JMq9mShr2FuU08BGAMOKLZ4O6DLhSf2LETXtkYlxCD0
	bnxLA3JF4N73XwA5jlUNBwCFT9DCLyC80rjxL5NmBpcopiJwCIyGAhr82E1QQZwKyANHGvEzt2G
	ia+gaaeI=
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142843235e9.4.1751288479382;
        Mon, 30 Jun 2025 06:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIe1HafHWQMdBGxTE/8gmXCwDECQtvb4nkW8MYtHAgLmX5UxDUSKKTFebF7rirr8hhXGCxDA==
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142840675e9.4.1751288477814;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e528a9sm10541491f8f.60.2025.06.30.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
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
Subject: [PATCH v1 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Mon, 30 Jun 2025 15:00:03 +0200
Message-ID: <20250630130011.330477-23-david@redhat.com>
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

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa48b05536bca..abed972e902e1 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0

