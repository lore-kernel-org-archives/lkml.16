Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332028D8C7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288463; cv=none; b=FKlACpxxTqgcIA+cnR7MUfo5LpK6Pubm9S4FCjqvIMZf6zoleQUxk3+BraV/nmjgH1y6Y81TPrNIJDTUGvcU+gRjNkUrq1u2NzRUyJnvOWEICGvFVJiu/vDONge2TRwHJVIuARVxITZVvHpMqG5usiGbdWWzqlJRhhj3PVA45Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288463; c=relaxed/simple;
	bh=UHifpKu5ufl8QF9rCxhzhbIhhsXhSiIoRV9644qN9BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQiD1WKNfqzpEfWIBSc/akhyxEUQwGMhk/zdY2wpZ7r1eR/gTIDWCxgjEMW7WW4+upMIN99I4lhefnISGYPXuC1qNCgFNNs8aoHDuQ4xJmP/9sRdBnRWeRTif1bHQtaFgPgNNzUrvyAfAI185oZFD2Ngj38tNJ9z0jToebj+PSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVImoVXv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVImoVXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
	b=KVImoVXvQXpUm2dM4Smpbn3UfyyJTtCAmOl2QzvA47ODqKYuVtLeUVCW+MCtcJOzVjFbCm
	Wg+RrbgRXh4XH+h57DaMklvKXQ6mPLYy19ctYFBMxRncqKrY4UxEejx8tsp8/c8V1LRCcJ
	qLOk1s4dfaFlDzKRqxxd0cTlfhDCcvQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Usm8KLfXOHuat5G6N8SfdQ-1; Mon, 30 Jun 2025 09:00:56 -0400
X-MC-Unique: Usm8KLfXOHuat5G6N8SfdQ-1
X-Mimecast-MFC-AGG-ID: Usm8KLfXOHuat5G6N8SfdQ_1751288455
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso13580775e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288455; x=1751893255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
        b=w/xDGCZeWvfC0QrVciD+jhSxD8IryTScLF0PWeqJoFy8NFXaK3uxfwpRXwSy5uIl32
         EqJTcbPQElk4XzxBj9NED+0w7e+eTSz/qLDJCYD4Z9WQo8JQ+MdYQgj0srJiepIiiORo
         h/p9A5iQDppFzkzIq2lNLPNULhYTFRzFuL0IfZgCUH6hCZu5D1fZxfkJlZ0D5uKVeDgw
         pmUBp/agRmNXGfFtJvbFN0uGjVgpqVq8Sip0JTc6N1DrR+l9ajPPOqrb9OSKEJzrLyTG
         Gp6NgvIHGNe34Ac2UwPs2AbN7JsAAc/19EVRJb9yXQVj3Dw5MDYy7QEZacgsEC8uS5oT
         YijQ==
X-Gm-Message-State: AOJu0Yy9s3OZQvau2Op6EA0GHVXqw2yZ1ZHjx5wZDRNRYvUnXh8bmMRc
	bFYYWuySB+tdoVAmYrqgiX2Lb7RAwYTZFCo3uFDyQwSNyOVAN8v+3HhcUsR+85Q8uY6IX3xL0MK
	IvVXyNqWjDRjqg9MR648L01a4wcDX5R8VWocGF8+Vevrsld/pZE9uUXzME/TgQbCHPTb3V3LTBl
	M7VbWndMaZvskhequrasWaOS7pfoNAfGkuZtKxHzUzVLQPgg/u
X-Gm-Gg: ASbGncthxjfTLS2J0wJIYRs9cI1fW59yRTKsoHMr8O1eHYyV6OHhQrXakzJCu6+8h8P
	98d7BkBHuUufEp+TLv4ktEGN5E5VxWeMNCbSxcEXB32wKDZBTGRMwbO47CL+b2euFJlFJC/AJxK
	WiczxpuQllBtTapkwf4SB5Nqmnt6V1azsbXML05ey7vb1lYMoj0VTKrWHzq3WY37Dj0cAu1QJdl
	SfNDrhtde9DCYgri4KXG9htchwCWtMBYP31p1RGv34POAud7tUd/vFa52I0PQL/+1po4pX4u+4/
	jMgRJ/ISLWVl6hhomvLz3IT4V2qcRYEKnyZu03+gmzJEWiwHkmd2Z0X7dNfQP8jrPG2mT04RWv1
	UVpXN77M=
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120799085e9.14.1751288454451;
        Mon, 30 Jun 2025 06:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZHtsc7XNjhOjxkvKCZ2uHLxZSkMRI4G1PqHHBjrp6rzXGUbjSQmg1iO1pCKPy78A7k9Rgqw==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120797265e9.14.1751288453316;
        Mon, 30 Jun 2025 06:00:53 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59ab5sm10144896f8f.82.2025.06.30.06.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:52 -0700 (PDT)
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
Subject: [PATCH v1 14/29] mm/migrate: remove __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:55 +0200
Message-ID: <20250630130011.330477-15-david@redhat.com>
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

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  8 ++------
 mm/compaction.c         | 11 -----------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..6eeda8eb1e0d8 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ struct migration_target_control;
  * @src page.  The driver should copy the contents of the
  * @src page to the @dst page and set up the fields of @dst page.
  * Both pages are locked.
- * If page migration is successful, the driver should call
- * __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
+ * If page migration is successful, the driver should
+ * return MIGRATEPAGE_SUCCESS.
  * If the driver cannot migrate the page at the moment, it can return
  * -EAGAIN.  The VM interprets this as a temporary migration failure and
  * will retry it later.  Any other error value is a permanent migration
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0

