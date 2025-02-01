Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF061CEE9B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738451892; cv=none; b=ajrqkwcZiEAsQXAquXcV9A2TyHqCjnSAhf1J1YC/ods1Kvetc6UaxSBTEIJUFH7UEUMbIM/JYULDr+6rD06KqPkders2WVUpXErQIz6OYpNsUP95GsFfWpddzKG+BtYYZCwmaY25oaSOWKae0+TUzFzaNRwzBXlD0zRvMZr55bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738451892; c=relaxed/simple;
	bh=mJ6SRSQshvUuU6M00pLUY5gzmNqpdba1JC8WuyNd/qE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4wYVP718nVNxFySQEbEJ4Ctmo37J0gjKXs0hx/KbnXqBxCWeeuA+6duOzLt25gPIWuPu3edSVj9ErGt90dpV3Pwj6L4Ntd4eielf61RSV4GTnmh7u7RX+vwZnrw/wM/XmC6ww1+h07zVSVE4V9fQrUhdGqfTEfCQ+Yid20+1b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LCDVmjRt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LCDVmjRt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso9000517a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738451890; x=1739056690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=REEyzR4VwcXBG/MiulZy61h2cqis6B2iwbKUK+/Z7ro=;
        b=LCDVmjRtUoX3tG708KtkUVTU3c933KWKJ3JhUJ+wpXWl93hXBjyPpA3RSYzr4xAlQc
         mW2Pt5xoE9npIjP6RwyG5x3HO2oJWbNR92AQXIOGhm/UU1A9DuB2mCUFzqo25v2a1I6T
         BSbj113FWFaAR4NeX+tJAz2F/ocP6dGALZxj3OGUqNqgjUoJCrYP4mPrDSUUftrRn4b2
         C4QKddG82uMA3AOP9ocH3zuvL6WFpRA7WCMEMa17coQtLkIMgsjuqhC0zlTLzxax2aPi
         r8qdZdgykdQNHksT7BYFP9kFL48UXG1vOuY2iEu9wR5M9J/Jahe1yqi+/zo5BDR1oB0w
         wyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451890; x=1739056690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REEyzR4VwcXBG/MiulZy61h2cqis6B2iwbKUK+/Z7ro=;
        b=Jd0TaSqiSXrCQySXFuhy7WAxlFUjQZNPGMxTP/AjdcLlq25wIUvGNSYGgE+IEAj1kx
         CpYFANqwgBWkPyeW9fybFUwGG6lPe18O4aPyoPWy6leLOvU09XGNuIyYWlamX6+B7Ggt
         5yVIXMBosbOJ3uZbVOGAw3he5+P1AS6w8lygLlhiKlRdyCA0DQr9XZTlTaFdc9a9gJ/3
         daCyvWNeK624LH1h32Gz+yNDOHsEGfvgZrpCM9u7LsrfshM/iDSqMlnjitrovZAqhYi+
         v1/IJpu3Z7agusSdipB3BcRL5tBZnb2031CAtsHzwT7NC3FJ729sJvayVeEKIdO6QlCm
         OnPw==
X-Forwarded-Encrypted: i=1; AJvYcCWg5BKtrhTd3J3nWaJ/Ty4IWQv9M7baisdvHXa8g2DwERoXt6HXyOhB4YJ4u09WepV893XIue0KhBBrf8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpdpo1fYIf6QS9upvA1XMaUNz0QCFJ2RTpUg7FXc1TdXjTVuB/
	k25aGtpcFPCbraHfLglMHgoy2tCbYxL46gqmnHc06Pa7v22mGFXgmznvoDIYhFQQdk7mrqFjnLF
	aQQ==
X-Google-Smtp-Source: AGHT+IH3XLGWaDaT1t9/Cp7o6c+RF7ry2yIsdfJHITI/fssp3IRkvyZrbgiqnj5YWj1ktwSp36mfOaC0fRY=
X-Received: from pfwo11.prod.google.com ([2002:a05:6a00:1bcb:b0:72a:bc54:8507])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:930b:0:b0:726:8366:40ca
 with SMTP id d2e1a72fcca58-72fd0bbd6dcmr22976159b3a.1.1738451889825; Sat, 01
 Feb 2025 15:18:09 -0800 (PST)
Date: Sat,  1 Feb 2025 15:18:02 -0800
In-Reply-To: <20250201231803.2661189-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201231803.2661189-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201231803.2661189-3-surenb@google.com>
Subject: [PATCH v2 3/3] alloc_tag: uninline code gated by mem_alloc_profiling_key
 in page allocator
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, vbabka@suse.cz, rostedt@goodmis.org, 
	peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	00107082@163.com, quic_zhenhuah@quicinc.com, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a sizable code section is protected by a disabled static key, that
code gets into the instruction cache even though it's not executed and
consumes the cache, increasing cache misses. This can be remedied by
moving such code into a separate uninlined function.
On a Pixel6 phone, page allocation profiling overhead measured with
CONFIG_MEM_ALLOC_PROFILING=y and profiling disabled is:

             baseline             modified
Big core     4.93%                1.53%
Medium core  4.39%                1.41%
Little core  1.02%                0.36%

This improvement comes at the expense of the configuration when profiling
gets enabled, since there is now an additional function call. The overhead
from this additional call on Pixel6 is:

Big core     0.24%
Middle core  0.63%
Little core  1.1%

However this is negligible when compared with the overall overhead of the
memory allocation profiling when it is enabled.
On x86 this patch does not make noticeable difference because the overhead
with mem_alloc_profiling_key disabled is much lower (under 1%) to start
with, so any improvement is less visible and hard to distinguish from the
noise. The overhead from additional call when profiling is enabled is also
within noise levels.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Changes since v1 [1]:
- Removed inline_if_mem_alloc_prof and uninlined the gated code
unconditionally, per Steven Rostedt and Vlastimil Babka
- Updated changelog to include overhead when profiling is enabled

[1] https://lore.kernel.org/all/20250126070206.381302-3-surenb@google.com/

 include/linux/pgalloc_tag.h | 60 +++-------------------------
 mm/page_alloc.c             | 78 +++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 55 deletions(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 4a82b6b4820e..c74077977830 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -162,47 +162,13 @@ static inline void update_page_tag_ref(union pgtag_ref_handle handle, union code
 	}
 }
 
-static inline void clear_page_tag_ref(struct page *page)
-{
-	if (mem_alloc_profiling_enabled()) {
-		union pgtag_ref_handle handle;
-		union codetag_ref ref;
-
-		if (get_page_tag_ref(page, &ref, &handle)) {
-			set_codetag_empty(&ref);
-			update_page_tag_ref(handle, &ref);
-			put_page_tag_ref(handle);
-		}
-	}
-}
-
-static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
-				   unsigned int nr)
-{
-	if (mem_alloc_profiling_enabled()) {
-		union pgtag_ref_handle handle;
-		union codetag_ref ref;
-
-		if (get_page_tag_ref(page, &ref, &handle)) {
-			alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
-			update_page_tag_ref(handle, &ref);
-			put_page_tag_ref(handle);
-		}
-	}
-}
+/* Should be called only if mem_alloc_profiling_enabled() */
+void __clear_page_tag_ref(struct page *page);
 
-static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
+static inline void clear_page_tag_ref(struct page *page)
 {
-	if (mem_alloc_profiling_enabled()) {
-		union pgtag_ref_handle handle;
-		union codetag_ref ref;
-
-		if (get_page_tag_ref(page, &ref, &handle)) {
-			alloc_tag_sub(&ref, PAGE_SIZE * nr);
-			update_page_tag_ref(handle, &ref);
-			put_page_tag_ref(handle);
-		}
-	}
+	if (mem_alloc_profiling_enabled())
+		__clear_page_tag_ref(page);
 }
 
 /* Should be called only if mem_alloc_profiling_enabled() */
@@ -222,18 +188,6 @@ static inline struct alloc_tag *__pgalloc_tag_get(struct page *page)
 	return tag;
 }
 
-static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
-{
-	struct alloc_tag *tag;
-
-	if (!mem_alloc_profiling_enabled())
-		return;
-
-	tag = __pgalloc_tag_get(page);
-	if (tag)
-		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
-}
-
 void pgalloc_tag_split(struct folio *folio, int old_order, int new_order);
 void pgalloc_tag_swap(struct folio *new, struct folio *old);
 
@@ -242,10 +196,6 @@ void __init alloc_tag_sec_init(void);
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void clear_page_tag_ref(struct page *page) {}
-static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
-				   unsigned int nr) {}
-static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
-static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
 static inline void alloc_tag_sec_init(void) {}
 static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
 static inline void pgalloc_tag_swap(struct folio *new, struct folio *old) {}
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b7e3b45183ed..16dfcf7ade74 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1041,6 +1041,84 @@ static void kernel_init_pages(struct page *page, int numpages)
 	kasan_enable_current();
 }
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+
+/* Should be called only if mem_alloc_profiling_enabled() */
+void __clear_page_tag_ref(struct page *page)
+{
+	union pgtag_ref_handle handle;
+	union codetag_ref ref;
+
+	if (get_page_tag_ref(page, &ref, &handle)) {
+		set_codetag_empty(&ref);
+		update_page_tag_ref(handle, &ref);
+		put_page_tag_ref(handle);
+	}
+}
+
+/* Should be called only if mem_alloc_profiling_enabled() */
+static noinline
+void __pgalloc_tag_add(struct page *page, struct task_struct *task,
+		       unsigned int nr)
+{
+	union pgtag_ref_handle handle;
+	union codetag_ref ref;
+
+	if (get_page_tag_ref(page, &ref, &handle)) {
+		alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
+		update_page_tag_ref(handle, &ref);
+		put_page_tag_ref(handle);
+	}
+}
+
+static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
+				   unsigned int nr)
+{
+	if (mem_alloc_profiling_enabled())
+		__pgalloc_tag_add(page, task, nr);
+}
+
+/* Should be called only if mem_alloc_profiling_enabled() */
+static noinline
+void __pgalloc_tag_sub(struct page *page, unsigned int nr)
+{
+	union pgtag_ref_handle handle;
+	union codetag_ref ref;
+
+	if (get_page_tag_ref(page, &ref, &handle)) {
+		alloc_tag_sub(&ref, PAGE_SIZE * nr);
+		update_page_tag_ref(handle, &ref);
+		put_page_tag_ref(handle);
+	}
+}
+
+static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
+{
+	if (mem_alloc_profiling_enabled())
+		__pgalloc_tag_sub(page, nr);
+}
+
+static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
+{
+	struct alloc_tag *tag;
+
+	if (!mem_alloc_profiling_enabled())
+		return;
+
+	tag = __pgalloc_tag_get(page);
+	if (tag)
+		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
+}
+
+#else /* CONFIG_MEM_ALLOC_PROFILING */
+
+static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
+				   unsigned int nr) {}
+static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
+static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
+
+#endif /* CONFIG_MEM_ALLOC_PROFILING */
+
 __always_inline bool free_pages_prepare(struct page *page,
 			unsigned int order)
 {
-- 
2.48.1.362.g079036d154-goog

