Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A0147C86
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738451888; cv=none; b=rwCwe6o+xysnQeq+/vJmhGrK1LsbRuPlH7TQTZDKcDOXabtwYBQnZS2lpVfT9/QjUGh5xljjxl8Vpd8UYnGDOuyrnq57UhQGAcANDM9SZq2ss1ym1MNAJ3CnA0T00++jKx8OjExSnkxQ12QZGbzFoj0Aw61fk7VuQpHVFvmTJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738451888; c=relaxed/simple;
	bh=Rmvjuq7EyKj+tRGsS5bJYqNs11RnsC2zIowUw902Pjk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NELs7miKY8nc45Wg/he86AVQbkXhUciUKJQYw26RRt1Q6Ny3WdOnX/kUSCzM1x9OwYtn4eyyfdCcFIi9OfGHS+H33Hnet35byFdHGmFoxp2li+d/OJTpT9tpZRrE0fgEswHGlWrqgQbePurXaDzQ2FtqItn93PeXKWWRVxojzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TA+zDXqd; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TA+zDXqd"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21661949f23so97945135ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738451886; x=1739056686; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Kvraf4w4weerjiWyvf6hTFiVHSzsydM/sRRmUt4qn4=;
        b=TA+zDXqdIZ0B8BEclWN4I+aYfbpsdzHCkavrVZcfWmzGz/oU0yLMJB7bBCbzeSWSxS
         1369GKUzEiattDD3cFEit2BSLY8wcwI0b3Q93DKEJHQ9GPWxKp5oiFafdobnslMZlbsa
         S9v7tybzIT8Ck2KQBb1p2wHQf00nhTkiEFDMwFgtHE1ojUgupGQ6VnXJtKjfWOmoZ8V7
         nILlExN5s/4NvDaI3zKnzB65GfhcGgb33GBeL787GnleRW5hNnf+rJeHkdn+BH8gUoor
         TBjIlLD/+AdicTn6YSS3gbBico6mruONUjGHRo3yNk9SeMNM/kSsa+Off/t+/SMoq9f9
         C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451886; x=1739056686;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Kvraf4w4weerjiWyvf6hTFiVHSzsydM/sRRmUt4qn4=;
        b=SSvWUYvLcEUFUSMVdV5FhzJf1y21ajN1jFWkEj+r/jd7TfdnRlRZ8pYJe7Q5igcE+8
         W6brdsn1tAs0aBJIOcJkgCil3EXS1aspYI/Sc4mBqxaE2AjdCD+8aBFlbCLFuYebs9rO
         B2Pm+Iu5NO/RgkYHswoOD8jj/Gsl5k8JO3MIb1nblXvNusoSXB3j1iFM1/LreysRuwWw
         xrDmWf4ROy3FkJKX+txikKeH3Tof+wTwE7TklN7thAbqNkQ8b7j9IcvBJuP6iu3xPLdH
         ZhGIGbBKC4vaqremVHYT2wH6bGoRZr1lRdFw7HXMTfTKPNmp4X0vbRf/dhWGb0lG06mx
         SnAg==
X-Forwarded-Encrypted: i=1; AJvYcCUAOVodmAIew5Xc4Ty+7impnRweJbF6/CWoH28F/4WShrT6VQCYWLqEcpu+JjaaVE+HSYk/uyiJXTEkL04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzgvx8RtJQTyZj2k40g5uNCnodeiQvlHUvVzoOCFcT4q7qmS6/
	fmjqcitcyV8wNM9vZI2RV0XWWEIjsWQkCxgpRdMjJoD39JT89vP5lmAVokU6TV5wTYMiScWr5oU
	j7A==
X-Google-Smtp-Source: AGHT+IF7rl+0kYYhaXTekrdVVwheczJIWDrZLww791nC4RwD+CIsfaA9QQuUOCf1vuXCQHD3GZRrfqGvVg0=
X-Received: from plse12.prod.google.com ([2002:a17:902:b78c:b0:216:44e0:4ac0])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:244d:b0:215:6816:6345
 with SMTP id d9443c01a7336-21dd7c65450mr249942315ad.16.1738451886129; Sat, 01
 Feb 2025 15:18:06 -0800 (PST)
Date: Sat,  1 Feb 2025 15:18:00 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201231803.2661189-1-surenb@google.com>
Subject: [PATCH v2 1/3] mm: avoid extra mem_alloc_profiling_enabled() checks
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, vbabka@suse.cz, rostedt@goodmis.org, 
	peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	00107082@163.com, quic_zhenhuah@quicinc.com, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Refactor code to avoid extra mem_alloc_profiling_enabled() checks inside
pgalloc_tag_get() function which is often called after that check was
already done.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/pgalloc_tag.h | 35 +++++++++++++++++++----------------
 lib/alloc_tag.c             |  6 +++---
 mm/page_alloc.c             |  3 +--
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 3469c4b20105..4a82b6b4820e 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -205,28 +205,32 @@ static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
 	}
 }
 
-static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
+/* Should be called only if mem_alloc_profiling_enabled() */
+static inline struct alloc_tag *__pgalloc_tag_get(struct page *page)
 {
 	struct alloc_tag *tag = NULL;
-
-	if (mem_alloc_profiling_enabled()) {
-		union pgtag_ref_handle handle;
-		union codetag_ref ref;
-
-		if (get_page_tag_ref(page, &ref, &handle)) {
-			alloc_tag_sub_check(&ref);
-			if (ref.ct)
-				tag = ct_to_alloc_tag(ref.ct);
-			put_page_tag_ref(handle);
-		}
+	union pgtag_ref_handle handle;
+	union codetag_ref ref;
+
+	if (get_page_tag_ref(page, &ref, &handle)) {
+		alloc_tag_sub_check(&ref);
+		if (ref.ct)
+			tag = ct_to_alloc_tag(ref.ct);
+		put_page_tag_ref(handle);
 	}
 
 	return tag;
 }
 
-static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
+static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
 {
-	if (mem_alloc_profiling_enabled() && tag)
+	struct alloc_tag *tag;
+
+	if (!mem_alloc_profiling_enabled())
+		return;
+
+	tag = __pgalloc_tag_get(page);
+	if (tag)
 		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
 }
 
@@ -241,8 +245,7 @@ static inline void clear_page_tag_ref(struct page *page) {}
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
-static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
-static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
+static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
 static inline void alloc_tag_sec_init(void) {}
 static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
 static inline void pgalloc_tag_swap(struct folio *new, struct folio *old) {}
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 19b45617bdcf..1d893e313614 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -174,7 +174,7 @@ void pgalloc_tag_split(struct folio *folio, int old_order, int new_order)
 	if (!mem_alloc_profiling_enabled())
 		return;
 
-	tag = pgalloc_tag_get(&folio->page);
+	tag = __pgalloc_tag_get(&folio->page);
 	if (!tag)
 		return;
 
@@ -200,10 +200,10 @@ void pgalloc_tag_swap(struct folio *new, struct folio *old)
 	if (!mem_alloc_profiling_enabled())
 		return;
 
-	tag_old = pgalloc_tag_get(&old->page);
+	tag_old = __pgalloc_tag_get(&old->page);
 	if (!tag_old)
 		return;
-	tag_new = pgalloc_tag_get(&new->page);
+	tag_new = __pgalloc_tag_get(&new->page);
 	if (!tag_new)
 		return;
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 579789600a3c..b7e3b45183ed 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4832,12 +4832,11 @@ void __free_pages(struct page *page, unsigned int order)
 {
 	/* get PageHead before we drop reference */
 	int head = PageHead(page);
-	struct alloc_tag *tag = pgalloc_tag_get(page);
 
 	if (put_page_testzero(page))
 		free_frozen_pages(page, order);
 	else if (!head) {
-		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
+		pgalloc_tag_sub_pages(page, (1 << order) - 1);
 		while (order-- > 0)
 			free_frozen_pages(page + (1 << order), order);
 	}

base-commit: 7de6fd8ab65003f050aa58e705592745717ed318
-- 
2.48.1.362.g079036d154-goog

