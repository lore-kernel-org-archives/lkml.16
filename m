Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227828C2BD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288455; cv=none; b=COMajjgGmaIGOB/DvjrGqCf57N+z4EQVeHZWfIP+kLpEz8xvDzuLPcsMXAO8z81SHR0NBASoL9Czl6NtJxvZtK9zqJkhFxD0t2uaMgQV7bPtB3CXaiXyWT10/X7KM7znx0q9UsOkAuosW5vcgYKajC4MMHr8o+bletoS3taUCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288455; c=relaxed/simple;
	bh=QFR4ekfQkxloQewE0nsmyAbq1SFLKM7czL9sZhql/lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eH9X6Ob6XPTCLmJuRJhEw4HXJvj/RLGHn9UPZah2HdHynpPyDDeXhxBeGVU2UseuqPQPTIow3BuPcup5avj+Lc5ClVW0fpd9jeU4zHq+SpfX7ipLQvdX5LvVPZfhmJlQYS4m44k3LZ69/sGJrf5XQI2AXecONLmtfaPqqds2QfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPWft+kJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPWft+kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
	b=fPWft+kJ+ufKPz0uc9TR3XvTnixHZ3WiMXWto4GfXi8oM1CKOVTuTRiZ37Xonxr9zawEgJ
	ui0NGmMkAOQeVA7KJerbKF9pGQ14VgF+7HpfLcnKXCr35jseZrpUXk/qDUzXGGaGfHcflq
	52VJdj4Q5k8JlkSH3p4buvZn3cy1eQY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-NAtwNT3eOdyaW5k_lYnfjg-1; Mon, 30 Jun 2025 09:00:43 -0400
X-MC-Unique: NAtwNT3eOdyaW5k_lYnfjg-1
X-Mimecast-MFC-AGG-ID: NAtwNT3eOdyaW5k_lYnfjg_1751288439
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1367775f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288439; x=1751893239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
        b=drj7nW2MmF82ysrLiniXvf2FwpAiUtcvjk/VHykHjgpSmSIfDNuI4knojoZSeJ+fUx
         cNY5VA2ry7fjmMFJu6C3HcUwdzlFnaxbhj+420MQwa5P9Fz63tAAL5eBRObSNSmauml8
         sizk8tlawKv1GRV5eOlf1ZHaBLQ8pgYujnXLmTykVpAVk/ic28GNkej+/Yu4o22id4kp
         xqC0SmXMisSaWSKkQV0V6apSmUY4RnZFBmBSaGgikvkDAS+i/C2CWU+FH9e4tRdJ/7Yk
         tfxem6T4Pyk7Lztc5YYe960s9mdW8RUlQWevYdLBd/z7xjk9+Uh0e9oQL9BMCk0gcw6K
         XoHw==
X-Gm-Message-State: AOJu0YxuHcLd48sUF5Q+MSQW1Nuv/EWMuF03syI5vVJ3XFs8QUZKrsfd
	/SqBBxtoQk3esvwMYVLzFEycHkH3j2MVOLYVBISL3UDxI9M75OOZITXgsF/VQaVeMnALzlQ1CPo
	dNxo8EuFozcbLy45UxSMnL3KVgGYZ8gx+88Gk0tNRVYKVUt0wxKbXH4w37LPr4xflSx/+46VkBo
	GPVoAL9ENUR9AVXW3qwUhQ/4lJCUCOOGv+IBaDLijAZPpxsTfG
X-Gm-Gg: ASbGncv/BGASjxB31hQWVs32qg1I9CGE3ZPEnSxotQlsgXY8e3pZNSRiWVWapqhLcRc
	E4G7WQ1NBMvcSZ3DE7H0vFWyBtUU2lWBHLMUG/N2+1eS8oydLBivKGmWVNBAcCO9NI+eZ6hpx+T
	GJJQnXPggSo3+y8Ygo+uruT23VTLs7BPQtpS60xKe5iKwEvYFX6zwk2iHSDmpNyRAA8PO8eWeV1
	/X95JmwqNQzL1Mz1ccIJ4q8gsRm8L69txJvzOzchB3AbPJDoaNhfy91CG+v86KGGQr0COaxZiRT
	XGK3vtUAkEl/5TxcFd+7vj/I4SPzqeyBmDwd3lgEMjOFE8X3CA2rKWJsWPP6XgHdueMrz4ZPss0
	/SUJUqG4=
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr9830802f8f.6.1751288437474;
        Mon, 30 Jun 2025 06:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEehlYPXkAQhWmsU6NKWbFkXt51tuHaEnt5gEo+HlKa0FWalrdKbSodH+fk72qwn9YuXcO6g==
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr9830683f8f.6.1751288436787;
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5b2a7sm10408982f8f.69.2025.06.30.06.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
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
Subject: [PATCH v1 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:49 +0200
Message-ID: <20250630130011.330477-9-david@redhat.com>
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

... and factor the complete handling of movable_ops pages out.
Convert it similar to isolate_movable_ops_page().

While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d4b4a7eefb6bd..d97f7cd137e63 100644
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

