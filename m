Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06BE2FE384
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268448; cv=none; b=vDq0Z6Z1T+L8kSo48/G4qG2NgLnYpuSp0ISB4mde2YMTnmZ6KTMhzqSYp4y5oDWxtTFD6pQMEpxbfbLTUzw9WjCB+g5IatvOCx01rcSzyeN1kYuv7EYDnB3fyZTta/r6IgXBuT/+dUZC5/OmcxzsEA7z3r/ymvS5R23iemSxhMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268448; c=relaxed/simple;
	bh=zbcjdtHnZ1BcawVRomdGBMsau7cooieEoCmjNLCJMWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUqd60PzWHBdXNzqvvCIG30YlMcVTGbg9Ssc1jsu2b+exUpZreg1cTCZ6F+VBBMe5C5KbFz+x5iBEhgcOSO5NTq0CpX9iX0INa5Wz6xIx1boJOZ7Kkxn4vUQvPs01gRRaNXmoV242wYHl0ywehncRbSp5+XcRkhmoM5BHu3myAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b6w9Cslo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b6w9Cslo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
	b=b6w9CsloZEvd0XCjtYKTnr/TvaAbd5PCSq3cG5U/KxPAiH+R70+kH0vQJteUh0RyHVchR1
	HHMk2Zqr+XBwwMpiQZKn3tsKo6RMAHOr4SRnTwe3DSv0ddsFMx9ZzkPVuTy1zraflPT13Q
	jlXAVuGc5kTxujEbywbzMMcXglNPRH8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-8edhxGwxMTO2Q1ar0dSaHQ-1; Wed, 18 Jun 2025 13:40:40 -0400
X-MC-Unique: 8edhxGwxMTO2Q1ar0dSaHQ-1
X-Mimecast-MFC-AGG-ID: 8edhxGwxMTO2Q1ar0dSaHQ_1750268439
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3267793f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268439; x=1750873239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
        b=HUrdNFVULULsm3jGTwWnEGFvt1LnpPKMsyUSlFnl4z0B+j+GpIq5zYjSbdnjbCz2Wd
         //HvVJyYHuxfbz4ImsUX4PhvGhCEeBpBkTtD32Fy+1b6SzUOR8XPS3Iw0MoUZdKawNss
         VJy7Wj1eMTzKy6UTgSp+JNvKnvb6jPg4G4dOTMW0aLVT4mXo0eKl3/6MQOHuM1J8T2pt
         QN/34g3VzjtbAhnYJlUxHs23o8lSJVGarNpOgHnSlP2hQ+rlJPMoTORWmR6Z5ncQkrPL
         OhLzDyv0pJmou/tzSJkfi4WGPdXC+m17x7gogQJNwOpo6zyWtbiS6B9/pJnWMFnKhJ/b
         jttw==
X-Gm-Message-State: AOJu0YzX5DROf7nQLdJDxyq2jdS/VRj7oNoe6Q2QaeDyxnHEmwp6Hc99
	yvveOo7ZwGHpkeFQfZ+WKMwc6V8r2mUgvXuY4fv2WtKQ6oBO5E550Ya4lwwJy5+za7oIQQ7A/Sw
	h3WwpOZ7QGFc7+J5eo2RgP3WOhMspRLmUZPkiIxuXQ3iQoF78wTuORpKQj9b5yaU7c9OExLZYFO
	FC0p15xZ3uasjGtIWi2PXGE8wt6BFCVwgkGL6s7wkXUK1I/WUI
X-Gm-Gg: ASbGncvDqWIMKFcNTuBtzdFb/rU0vtPsFXR3xLNYXj9H90UWjBvrs/3wuMWMY2ReFqQ
	uPjiOekne9qrLtIJYbSc9/T01GZ+DAspMFF5IuyPPjzpFMj3ngNoH+l1SR32ql/FB8JrdaEZ2/s
	9DnHxTF9dqJyGNLzxZTaHDPHOm0sL/EMDcNa3a6p7jp1ID3QzMvEDTMZ89G2lAFswPQ5jHXz8bU
	i9Q7xZFdeXGXsYdwcbYXzsWKYaYwnfKbr2LT9BCwWRT73gFs4NKIwvCElaOb5EsO2DfCYFiH8oZ
	U5Wy/1DhCmQox791+fO/GLzuvdzt5EJkHHJq+zCWCRV4x48kZb79qJ9LoEVZkdaKq2ZcjLe+DnD
	JLBWUxA==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr17230312f8f.26.1750268438674;
        Wed, 18 Jun 2025 10:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk4wH3M6h2T58ReQA5DPEIh/WOsy58XEgAZ0LBQTHsCj9tNbupSQVC4fwDx3ff0ep2cpGgew==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr17230239f8f.26.1750268438093;
        Wed, 18 Jun 2025 10:40:38 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a800d9sm17307416f8f.45.2025.06.18.10.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:37 -0700 (PDT)
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
Subject: [PATCH RFC 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Wed, 18 Jun 2025 19:39:51 +0200
Message-ID: <20250618174014.1168640-9-david@redhat.com>
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

... and factor the complete handling of movable_ops pages out.
Convert it similar to isolate_movable_ops_page().

While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 6bbb455f8b593..32e77898f7d6c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static void putback_movable_folio(struct folio *folio)
+/**
+ * putback_movable_ops_page - putback an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Putback an isolated movable_ops page.
+ *
+ * After the page was putback, it might get freed instantly.
+ */
+static void putback_movable_ops_page(struct page *page)
 {
-	const struct movable_operations *mops = folio_movable_ops(folio);
-
-	mops->putback_page(&folio->page);
-	folio_clear_isolated(folio);
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
+	struct folio *folio = page_folio(page);
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	folio_lock(folio);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(page))
+		page_movable_ops(page)->putback_page(page);
+	ClearPageIsolated(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 /*
@@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
 		 * have PAGE_MAPPING_MOVABLE.
 		 */
 		if (unlikely(__folio_test_movable(folio))) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
-			folio_lock(folio);
-			if (folio_test_movable(folio))
-				putback_movable_folio(folio);
-			else
-				folio_clear_isolated(folio);
-			folio_unlock(folio);
-			folio_put(folio);
+			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
 					folio_is_file_lru(folio), -folio_nr_pages(folio));
-- 
2.49.0

