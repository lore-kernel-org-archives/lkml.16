Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0F72DC789
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746339639; cv=none; b=rsvN6qM5uVTwPg3ZasYnpfk9SitZc2fSdNdiTMtIXVvag1zVJ4cWELRLt8bC7PO4JGd+Oj2sXkqWwi45Hsijbn1lslk6o9nB1QQwev5I+D0+0ejUZMhT3e5/9C9jI5iZyufApNEPTVfSubNQaLF2M9uoxxL+KmRTv8lvD+xUAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746339639; c=relaxed/simple;
	bh=ukcFH3J6VBYuTHFx1PVn2lJw/NOkZCI2bU4qip62JDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IR7BYkuFBqD5EjF0RWg6ane1QyPI1a9Se545i5GyjlT5MhrzUMMmGzQcKKHcIiKcKqn0ps3hYAPaXhko7iEWhJyDf+qpQYQMlBWGMYz+xWHoHiIfuqQucJUYJ1eUySodFcywHkv3bwLuQD+FrcxHAwtZRqlhy2UUN9vxqKhulUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cNFqQUQ8; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cNFqQUQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CEmFb
	V9+t7MvYK/7OJKI9tCALb+HwQt7wx9pOocMd2M=; b=cNFqQUQ8ZGc2qihquWHt2
	BcCQxgi3Q3tLwZTBCpvC2iOIy89+FeI/Z7WGgQtkahuucvLQ5q2onZ3LMJBKv6/+
	hKlo6VYFE4TzD/ETf/34M0jl4VvONq9b87QvDb+BbPXeB9FebWRqdALONFLH4dHO
	PUEW+fNMX9sJLMFmJt/TwU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD33sjtBhdocJwhBw--.55736S4;
	Sun, 04 May 2025 14:19:39 +0800 (CST)
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
Subject: [PATCH] mm/codetag: sub in advance when free non-compound high order pages
Date: Sun,  4 May 2025 14:19:23 +0800
Message-Id: <20250504061923.66914-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD33sjtBhdocJwhBw--.55736S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW8Zw1rWFykuFykGr4rZrb_yoW5Ww4fpr
	WUt3WrCan5JFyYkFWIyw4DZrn3Jrsava95ArW7K34Yvr13trWIy348tryjvF18CrykAFW8
	CrsIqw1jk3Z8WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJGYdUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAlDqmgXASeP9gAAso

When page is non-compound, page[0] could be released by other
thread right after put_page_testzero failed in current thread,
pgalloc_tag_sub_pages afterwards would manipulate an invalid
page for accounting remaining pages:

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
  V

Move the tag page accounting ahead, and only account remaining pages
for non-compound pages with non-zero order.

Signed-off-by: David Wang <00107082@163.com>
---
 mm/page_alloc.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5669baf2a6fe..c42e41ed35fe 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1163,12 +1163,25 @@ static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
 		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
 }
 
+static inline void pgalloc_tag_add_pages(struct page *page, unsigned int nr)
+{
+	struct alloc_tag *tag;
+
+	if (!mem_alloc_profiling_enabled())
+		return;
+
+	tag = __pgalloc_tag_get(page);
+	if (tag)
+		this_cpu_add(tag->counters->bytes, PAGE_SIZE * nr);
+}
+
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
 static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
+static inline void pgalloc_tag_add_pages(struct page *page, unsigned int nr) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
@@ -5065,11 +5078,28 @@ static void ___free_pages(struct page *page, unsigned int order,
 {
 	/* get PageHead before we drop reference */
 	int head = PageHead(page);
+	/*
+	 * For remaining pages other than the first page of
+	 * a non-compound allocation, we decrease its tag
+	 * pages in advance, in case the first page is released
+	 * by other thread inbetween our put_page_testzero and any
+	 * accounting behavior afterwards.
+	 */
+	unsigned int remaining_tag_pages = 0;
 
-	if (put_page_testzero(page))
+	if (order > 0 && !head) {
+		if (unlikely(page_ref_count(page) > 1)) {
+			remaining_tag_pages = (1 << order) - 1;
+			pgalloc_tag_sub_pages(page, remaining_tag_pages);
+		}
+	}
+
+	if (put_page_testzero(page)) {
+		/* no need special treat for remaining pages, add it back. */
+		if (unlikely(remaining_tag_pages > 0))
+			pgalloc_tag_add_pages(page, remaining_tag_pages);
 		__free_frozen_pages(page, order, fpi_flags);
-	else if (!head) {
-		pgalloc_tag_sub_pages(page, (1 << order) - 1);
+	} else if (!head) {
 		while (order-- > 0)
 			__free_frozen_pages(page + (1 << order), order,
 					    fpi_flags);
-- 
2.39.2

