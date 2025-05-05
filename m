Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F1B26E158
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470119; cv=none; b=A2wjaF9ajOO12ZtH6fDJjKcpWNXm0QWAUe5Yl6TZ5kGnfTsKGYrzNrFyBLBONrjkUcLD6UU5JSJ11JTubZ21MS5i31HEduxbAgdhYhyEi4LsGHJAfteP3ybXMbffwjG97SUJKDdYLzlmmtyaX3Ixb61k60Xtz0ooGeoMJ43+E7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470119; c=relaxed/simple;
	bh=9tCowISUglEPJlE8qQkJJCrCOPbnB0yHBX3gw9lxLHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ukLxsDzGNrvD2WwrXy4yHAMTKhJvpQMGg03mOxJk0I4YR7ANAh4DhS7xXxegC6Gp0rzzMbcOzzFjx+JHwrYGQxjMw7v9PAk+nmxTKICNAQq4n9t5gSXxaptU+KpTBMFSj/Ugq0QWC3XUIKbeJmtWsZcmG9Oa7YaXFVvzuLF0JKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=i3Zm9nav; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="i3Zm9nav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tfBon
	y4XS8BLgrQQTD1o4zXF0qseVI+xZME9jPnR+dY=; b=i3Zm9navh4FziPqtvuKZY
	L9RhStmBu3p1IJ7k0atz9m+KHM/Is2qtPltsDGsq4tpVcMWGRmmy4Gdszhi2ojSW
	zHgM5uFEBop+FqiHdiIzTFeScLXG8odALg0QfPlxX+A9qG7ELw6AG35PWxb1aS0d
	s+xlBaAFXFCNbdMdJ7Y+Dc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAX1wmwBBloCYuxBw--.47927S4;
	Tue, 06 May 2025 02:34:39 +0800 (CST)
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
Subject: [PATCH v2] mm/codetag: move tag retrieval back upfront in __free_pages()
Date: Tue,  6 May 2025 02:34:23 +0800
Message-Id: <20250505183423.33773-1-00107082@163.com>
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
X-CM-TRANSID:QCgvCgAX1wmwBBloCYuxBw--.47927S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1kWw1kCryxGr1fJrWDurg_yoW5uw4UpF
	Wjq3W8Ca98JFy5KFW0yw4q9r13Jws7taykAFW7K34rZF13tF40kFykJryavF18CFy8AFyv
	9rsrKw4jkr1qq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAhEqmgY-iCqkwAAsZ

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
 include/linux/pgalloc_tag.h |  7 +++++++
 mm/page_alloc.c             | 15 ++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index c74077977830..97eb4835568e 100644
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

