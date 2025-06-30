Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A4D29A336
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288500; cv=none; b=VEUvHOQL+rHVAVgHVrcg2BtniWcyYQtbQKHI/TEqyTGZblu+aIM6qOv40tfs0LTJJbBW2/aoQkTTjjVpLfGPOtkfbUq+2VUX8nlWqvUAHY+RHyNLLzAtDnUC4w9KNy2EDhawyvtdjlN4smQ76CiucAuBjO9iZpmyd48jfTivhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288500; c=relaxed/simple;
	bh=WVagca6sn8mP5NDz3wa45UlfrVOPRD5IKy9vkw5Bh+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIDLfkW4fbG5bQfV8zV48lkkKAtTXH6Ab7vAgLHrRjvQ8WosgjIJ4ZnPhqAC84GQ9oiT0RobssfMuffauKVJYmVPa2EI7opWPx1ggNJLxNkCnMTr0/XN0sPGIiPwyOPUolJKgp/wq2VdzlzlI+8sD2Ir4LaUHqaCeSrn7JGTiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUky5LuC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUky5LuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
	b=NUky5LuCMXqWY91+cZAlpEDAns7VdR4IsqaoXmZ9YpsxTkayaCztvThogQvxvpS5Ogh5QS
	Ib2QaQTEz0vbtImw+viQvFL8qmY9kJnX4UaJRjQv1a7d/kzwoTNWv/MI+yXjtxqDv/5/fB
	E1mWz8wMzBvSXOf9FZ4GCRwmgqVwaQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-r4eUJxvfMxO2LyxwFDaIMg-1; Mon, 30 Jun 2025 09:01:32 -0400
X-MC-Unique: r4eUJxvfMxO2LyxwFDaIMg-1
X-Mimecast-MFC-AGG-ID: r4eUJxvfMxO2LyxwFDaIMg_1751288492
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso13586485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288491; x=1751893291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
        b=jGyU0k7VCbMlaY6IotJYrrW1CDoL95sPNe0G1zcOOM53wBvXBsu0ISpVyEhF3fp8CX
         VnWZlvZnZ8AN0YSXT4CLnrjK4ae8KrHyCnHvyvtQL2wbRht5Igr29+iZoGw/8KMNzCIr
         dNyfahR/Jncj1KVjIe0f39T+XoB2RNGwmhBSqHobU9N75p49Tl7eyqTt8TcdZRhBiQKr
         hL8o9jjOoNjA6FDF7Do1VBkt1JgvZ1ng4kzTOCXwiG6/NIf/PpPDpypsgzGsEeh8T3a8
         /HAnmUkGT07N8IymO1EItG5XOUPNrqjUTYAM2oJp7AYesfZiBf4qAGanhbuT7ECWu570
         wQlg==
X-Gm-Message-State: AOJu0YzJ+Jd7/k61cNKqgdTfJN38XIGWW1ANgBf2NvM5l9Z9yxgIe0Nz
	x5X5Us8rk2Q6LWSIZVZfKYfUxaUchv3U6TQkVy2Qjb7xhySuG5TMfOV3shlb55qyCkADBntZwJe
	Nl8TKC/I+f/BOArY/XhH7kBZiKZbleHWgagco0GhHsv/4MG9ZTIuqi7YBQSDJpdgtrunpZr+V2A
	Tp0dU14IliJbnRsMUexMV81m0H15tuPWS8qz6LLPjihM7/y0g5
X-Gm-Gg: ASbGncvTCaYUdrK04A1NXCuGrwYiJ9B+KXPn0DpTJZf0LK5GJoAjg3QWKUn8o3UyCR8
	HXKvzd9p2eJ824LxkdvdFPnaTrv/tphHv2ez0oKgtpTHMndLPQetsPdvMwLYqUAMssSBw576edq
	k74JknSHIoY23MA88zvWAfEA7XVO5l/F1feKGNzxPkg1aF8a1yu01oFXiInZLjNjCyzTS2gWXGY
	8l2V3be69+HZrgZeKKY3aUX+w1rs0IrDsyahGbAxc41Y7VEupUqx7vwUZ8kS9OyfII3B6M1K+9e
	ydZz6tUX5JpwQ/26nBLb+KErGnTmZmqZHUOg/0oAXNDuh/KXiULWA7Cjm9caLhEzrRYhL0pdi3Q
	FZVGDhLw=
X-Received: by 2002:a05:600c:4fd1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4538ee60a60mr107461805e9.20.1751288490946;
        Mon, 30 Jun 2025 06:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvKPbKK01jDGKdO7HMFpJHGVfeP34xEfryqVjaTqeCy8FfNy/5uAgcgaE7N6g1euFItwJ1Ng==
X-Received: by 2002:a05:600c:4fd1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4538ee60a60mr107459575e9.20.1751288488983;
        Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad01csm166146565e9.22.2025.06.30.06.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
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
Subject: [PATCH v1 25/29] mm: simplify folio_expected_ref_count()
Date: Mon, 30 Jun 2025 15:00:06 +0200
Message-ID: <20250630130011.330477-26-david@redhat.com>
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

Now that PAGE_MAPPING_MOVABLE is gone, we can simplify and rely on the
folio_test_anon() test only.

... but staring at the users, this function should never even have been
called on movable_ops pages. E.g.,
* __buffer_migrate_folio() does not make sense for them
* folio_migrate_mapping() does not make sense for them
* migrate_huge_page_move_mapping() does not make sense for them
* __migrate_folio() does not make sense for them
* ... and khugepaged should never stumble over them

Let's simply refuse typed pages (which includes slab) except hugetlb,
and WARN.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6a5447bd43fd8..f6ef4c4eb536b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2176,13 +2176,13 @@ static inline int folio_expected_ref_count(const struct folio *folio)
 	const int order = folio_order(folio);
 	int ref_count = 0;
 
-	if (WARN_ON_ONCE(folio_test_slab(folio)))
+	if (WARN_ON_ONCE(page_has_type(&folio->page) && !folio_test_hugetlb(folio)))
 		return 0;
 
 	if (folio_test_anon(folio)) {
 		/* One reference per page from the swapcache. */
 		ref_count += folio_test_swapcache(folio) << order;
-	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+	} else {
 		/* One reference per page from the pagecache. */
 		ref_count += !!folio->mapping << order;
 		/* One reference from PG_private. */
-- 
2.49.0

