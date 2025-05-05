Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15B623CB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746473526; cv=none; b=PQLeVEJwM0pdCbUMjMfMF8NYaohblyMgWmzdxrJrNe4pTEtf+Mtdo4WcAET4tNMTOQ0/Nk05r3xfeSGITYY/J/GsmS3yedcZinqQTDPpWZiMaksm3BaS7iNrp+9FnE9Y4qaktuca5bxC1rdIBOyh5Fc7gearQrsSRXPj7B22eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746473526; c=relaxed/simple;
	bh=dqBbTDnPEGJgYeTz5bAmUDmUTvgd8ZM+kONzzQLT7Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SuYqgjBTA6lliJLM31Opos9tbEtexOHNNfYXQSjazMQ4eaiC6VjRuUFwOaw6X7nEpBcsQX1DsvUD4mti2iK+cyEU0manrCEBAULswBZcuD4rlS+3jry7g/9fDGJXxAPo08mSQwFOWIIxSWi9jZsOfqXm0HsHnlPphax1zXrVeqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bWfprKyx; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bWfprKyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MMxsB
	xI5NR7NYwNT1QUEgUcE2MVKZMz9ZlRNrU8ptlM=; b=bWfprKyx2oFGVSkso5OVT
	JBdyCg/k1zpSghy8XdvHTd0CwBrwHZ+Yn9MTaZ0e/XUrDWxKiSIAzRknCXxlB8/K
	LxtYjAsmtiBG2HqU47FWQFSqfUi1F5BawwIPpKquflpunolIgRgntahfPrDhsMjG
	Ye/Mezj+Zfk9yzCtCTRoBs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnbxjcERloOELhEQ--.50443S4;
	Tue, 06 May 2025 03:30:48 +0800 (CST)
From: David Wang <00107082@163.com>
To: akpm@linux-foundation.org,
	vbabka@suse.cz,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v3] mm/codetag: move tag retrieval back upfront in __free_pages()
Date: Tue,  6 May 2025 03:30:34 +0800
Message-Id: <20250505193034.91682-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAJuCfpHKcDkce=no0Uu3UO2ua2GkgkKMZxnctMuDbOqQNKj_KA@mail.gmail.com>
References: <CAJuCfpHKcDkce=no0Uu3UO2ua2GkgkKMZxnctMuDbOqQNKj_KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnbxjcERloOELhEQ--.50443S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1kWw1kCryxGr1fXF4Dtwb_yoWrGF4kpF
	WjqF18Ca98JFy5KFWvyr4q9r13Jws7KaykAFW3K34rZF13tr40kFykJryavF18CFy8AFyv
	krsrKw4Ykw1Ut3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gpEqmgZDbphLAAAs9

Commit 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled()
 checks") introduces a possible use-after-free scenario, when page
is non-compound, page[0] could be released by other thread right
after put_page_testzero failed in current thread, pgalloc_tag_sub_pages
afterwards would manipulate an invalid page for accounting remaining
pages:

[timeline]   [thread1]                     [thread2]
  |          alloc_page non-compound
  V
  |                                        get_page, rf counter inc
  V
  |          in ___free_pages
  |          put_page_testzero fails
  V
  |                                        put_page, page released
  V
  |          in ___free_pages,
  |          pgalloc_tag_sub_pages
  |          manipulate an invalid page
  V

Restore __free_pages() to its state before, retrieve alloc tag
beforehand.

Fixes: 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled() checks")
Signed-off-by: David Wang <00107082@163.com>
---
 include/linux/pgalloc_tag.h |  8 ++++++++
 mm/page_alloc.c             | 15 ++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index c74077977830..8a7f4f802c57 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -188,6 +188,13 @@ static inline struct alloc_tag *__pgalloc_tag_get(struct page *page)
 	return tag;
 }
 
+static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
+{
+	if (mem_alloc_profiling_enabled())
+		return __pgalloc_tag_get(page);
+	return NULL;
+}
+
 void pgalloc_tag_split(struct folio *folio, int old_order, int new_order);
 void pgalloc_tag_swap(struct folio *new, struct folio *old);
 
@@ -199,6 +206,7 @@ static inline void clear_page_tag_ref(struct page *page) {}
 static inline void alloc_tag_sec_init(void) {}
 static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
 static inline void pgalloc_tag_swap(struct folio *new, struct folio *old) {}
+static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5669baf2a6fe..1b00e14a9780 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1151,14 +1151,9 @@ static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
 		__pgalloc_tag_sub(page, nr);
 }
 
-static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
+/* When tag is not NULL, assuming mem_alloc_profiling_enabled */
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
 {
-	struct alloc_tag *tag;
-
-	if (!mem_alloc_profiling_enabled())
-		return;
-
-	tag = __pgalloc_tag_get(page);
 	if (tag)
 		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
 }
@@ -1168,7 +1163,7 @@ static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
-static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
@@ -5065,11 +5060,13 @@ static void ___free_pages(struct page *page, unsigned int order,
 {
 	/* get PageHead before we drop reference */
 	int head = PageHead(page);
+	/* get alloc tag in case the page is released by others */
+	struct alloc_tag *tag = pgalloc_tag_get(page);
 
 	if (put_page_testzero(page))
 		__free_frozen_pages(page, order, fpi_flags);
 	else if (!head) {
-		pgalloc_tag_sub_pages(page, (1 << order) - 1);
+		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
 		while (order-- > 0)
 			__free_frozen_pages(page + (1 << order), order,
 					    fpi_flags);
-- 
2.39.2

