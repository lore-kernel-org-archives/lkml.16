Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433C137923
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418303; cv=none; b=EUiPxHoJp3RPoYlR4xFL+cDekEwPBOdeebz1Q+nvp4kvvDoOBhIRnngQVfHMHoWjK9PIbjvlMYm3oFdrqZHjblwycKryZabydo/1B3dhQBkUyhLbCAD93BIHJ1NollIS2eeOnWVWIHQZ2CE6nA81eW4bz/upeUe/xIUPIqCaPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418303; c=relaxed/simple;
	bh=yWmNmWgvKvda0eYoTS5d0V7bZ75rInx7GtYuQcH7ugI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lyqVSAmwUhNgcDu5PM8S0nYeJI8Rhppp8yCtZS5Uo3vcO5LYcsCyonzOvGEtz27Bh70Oyq2Xn9RuyUyEO4zBCMoy5VQlSBn2fGkPKb8hiljdR5DIxO0313hd4AYp0l9PwZrzhB4UNDAQF8er4cbOFoQKaY8X6zUfrf+Kvw9f9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=npa+Gd24; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="npa+Gd24"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74858256d38so3745102b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751418302; x=1752023102; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIXYjl4Oy7cLC2gt6wngeVcZAy4rgnTDnLgmQ+C2I1Y=;
        b=npa+Gd24vyG3ACoAzPH5qeDkoEJ+AbPF1qt3lGqHCYCYhGFIFHorUo6VZZcEAyjd/O
         qxj9t8hi3VilRUCvLbDbjOyh0HHddFc3A/DyQQyS3fs7iN+9hOqgsawVVYjMMrHCi+Xb
         RpCPUzBoA6V6APCWCKyZ0yqB/02ZBsQlZm1nCdjr0P6GhdAS7Q8CnpXGdd+RHDquDcM9
         wfUYwyIe71VBym8oFjUIEMvCX7U2ycg2zRNXcBTxjW3rWwG7JIHvRPLzELYy4YRpZ/l7
         BQfz/LmU9MhpkPY+C66ONjJJel7kOnE9T9+E5yN/Piq4se4yXYXOFmyDjGAMDa5lJVT8
         MgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751418302; x=1752023102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIXYjl4Oy7cLC2gt6wngeVcZAy4rgnTDnLgmQ+C2I1Y=;
        b=k3ciWYLRHAEW4c8YNrwxSSE6ZAFFWcxlh4AttRdBo6SnWPdQeCuB1mn2okP5Q/DwCq
         b7/3dz0G9csG7GnTDFn2V8ZFEt5XSEvEN+tRzzQsBUeyO62dxt9RoXu5H0fNWwYb2QdN
         weYJTx7+scRG+d32CqjuUFpm5BVj6K546V7qv5IGn9vGO77zsA8w5I67f78KRjafBvg9
         4M9FbTjsckZLbUBacREVqhMQ0P/A6lTEPSCasgXXDCiKsm19mHSW/h92ucgnJvySFrpO
         m0YFci0GHLB2ayx8h2QZVyeYroDXi4B06kdewOTDv/WRMw6S139ZNDHlTwciOqIejhJ4
         Jzmw==
X-Gm-Message-State: AOJu0YwmIT7J/qwCq7OXGMkm7lGrlkPfFq6TecQ1JZYH6wY/TkYTMHeP
	OONAHgOfIMa/r32C21CChCsPfG3Nf5XbsMRbfpYmgsgrTIHUP/FMSY0HjdgFq5AKD3gnXvhjsS/
	K/jBDr+TTOBQQEkxVVh3pVlAqImzk66GBYyVdBadkQGVUTWXCBewdJb2mWO4flPAs1aLudUQyeg
	aSwJhHnJENBocZ8S9lBlGGzu7hwhyZVt25xsWDxdot8qRB68cl8g==
X-Google-Smtp-Source: AGHT+IGmIEJHf6ytdXjoRc4RSr5HUZa9EXQBQTvJIBsl7slHc8NIDLI1uctLgzR/SdeJ0vCy6bGQq5k9jFBD
X-Received: from pgbdn12.prod.google.com ([2002:a05:6a02:e0c:b0:b2f:637a:a7d0])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:62c6:b0:220:82c7:309c
 with SMTP id adf61e73a8af0-222d7db195bmr1878753637.7.1751418301541; Tue, 01
 Jul 2025 18:05:01 -0700 (PDT)
Date: Tue,  1 Jul 2025 18:04:42 -0700
In-Reply-To: <20250702010447.2994412-1-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250702010447.2994412-1-ynaffit@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250702010447.2994412-3-ynaffit@google.com>
Subject: [PATCH v2 2/5] binder: Store lru freelist in binder_alloc
From: Tiffany Yang <ynaffit@google.com>
To: linux-kernel@vger.kernel.org
Cc: keescook@google.com, kernel-team@android.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Store a pointer to the free pages list that the binder allocator should
use for a process inside of struct binder_alloc. This change allows
binder allocator code to be tested and debugged deterministically while
a system is using binder; i.e., without interfering with other binder
processes and independently of the shrinker. This is necessary to
convert the current binder_alloc_selftest into a kunit test that does
not rely on hijacking an existing binder_proc to run.

A binder process's binder_alloc->freelist should not be changed after
it is initialized. A sole exception is the process that runs the
existing binder_alloc selftest. Its freelist can be temporarily replaced
for the duration of the test because it runs as a single thread before
any pages can be added to the global binder freelist, and the test frees
every page it allocates before dropping the binder_selftest_lock. This
exception allows the existing selftest to be used to check for
regressions, but it will be dropped when the binder_alloc tests are
converted to kunit in a subsequent patch in this series.

Signed-off-by: Tiffany Yang <ynaffit@google.com>
---
 drivers/android/binder_alloc.c          | 25 +++++++----
 drivers/android/binder_alloc.h          |  3 +-
 drivers/android/binder_alloc_selftest.c | 59 ++++++++++++++++++++-----
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index fcfaf1b899c8..2e89f9127883 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -26,7 +26,7 @@
 #include "binder_alloc.h"
 #include "binder_trace.h"
 
-struct list_lru binder_freelist;
+static struct list_lru binder_freelist;
 
 static DEFINE_MUTEX(binder_alloc_mmap_lock);
 
@@ -210,7 +210,7 @@ static void binder_lru_freelist_add(struct binder_alloc *alloc,
 
 		trace_binder_free_lru_start(alloc, index);
 
-		ret = list_lru_add(&binder_freelist,
+		ret = list_lru_add(alloc->freelist,
 				   page_to_lru(page),
 				   page_to_nid(page),
 				   NULL);
@@ -409,7 +409,7 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
 		if (page) {
 			trace_binder_alloc_lru_start(alloc, index);
 
-			on_lru = list_lru_del(&binder_freelist,
+			on_lru = list_lru_del(alloc->freelist,
 					      page_to_lru(page),
 					      page_to_nid(page),
 					      NULL);
@@ -1007,7 +1007,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 			if (!page)
 				continue;
 
-			on_lru = list_lru_del(&binder_freelist,
+			on_lru = list_lru_del(alloc->freelist,
 					      page_to_lru(page),
 					      page_to_nid(page),
 					      NULL);
@@ -1229,6 +1229,17 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 
 static struct shrinker *binder_shrinker;
 
+static void __binder_alloc_init(struct binder_alloc *alloc,
+				struct list_lru *freelist)
+{
+	alloc->pid = current->group_leader->pid;
+	alloc->mm = current->mm;
+	mmgrab(alloc->mm);
+	mutex_init(&alloc->mutex);
+	INIT_LIST_HEAD(&alloc->buffers);
+	alloc->freelist = freelist;
+}
+
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
  * @alloc: binder_alloc for this proc
@@ -1238,11 +1249,7 @@ static struct shrinker *binder_shrinker;
  */
 void binder_alloc_init(struct binder_alloc *alloc)
 {
-	alloc->pid = current->group_leader->pid;
-	alloc->mm = current->mm;
-	mmgrab(alloc->mm);
-	mutex_init(&alloc->mutex);
-	INIT_LIST_HEAD(&alloc->buffers);
+	__binder_alloc_init(alloc, &binder_freelist);
 }
 
 int binder_alloc_shrinker_init(void)
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index feecd7414241..aa05a9df1360 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -15,7 +15,6 @@
 #include <linux/list_lru.h>
 #include <uapi/linux/android/binder.h>
 
-extern struct list_lru binder_freelist;
 struct binder_transaction;
 
 /**
@@ -91,6 +90,7 @@ static inline struct list_head *page_to_lru(struct page *p)
  * @free_async_space:   VA space available for async buffers. This is
  *                      initialized at mmap time to 1/2 the full VA space
  * @pages:              array of struct page *
+ * @freelist:           lru list to use for free pages (invariant after init)
  * @buffer_size:        size of address space specified via mmap
  * @pid:                pid for associated binder_proc (invariant after init)
  * @pages_high:         high watermark of offset in @pages
@@ -113,6 +113,7 @@ struct binder_alloc {
 	struct rb_root allocated_buffers;
 	size_t free_async_space;
 	struct page **pages;
+	struct list_lru *freelist;
 	size_t buffer_size;
 	int pid;
 	size_t pages_high;
diff --git a/drivers/android/binder_alloc_selftest.c b/drivers/android/binder_alloc_selftest.c
index 486af3ec3c02..8b18b22aa3de 100644
--- a/drivers/android/binder_alloc_selftest.c
+++ b/drivers/android/binder_alloc_selftest.c
@@ -8,8 +8,9 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/mm_types.h>
 #include <linux/err.h>
+#include <linux/list_lru.h>
+#include <linux/mm_types.h>
 #include "binder_alloc.h"
 
 #define BUFFER_NUM 5
@@ -18,6 +19,7 @@
 static bool binder_selftest_run = true;
 static int binder_selftest_failures;
 static DEFINE_MUTEX(binder_selftest_lock);
+static struct list_lru binder_selftest_freelist;
 
 /**
  * enum buf_end_align_type - Page alignment of a buffer
@@ -142,11 +144,6 @@ static void binder_selftest_free_buf(struct binder_alloc *alloc,
 	for (i = 0; i < BUFFER_NUM; i++)
 		binder_alloc_free_buf(alloc, buffers[seq[i]]);
 
-		/**
-		 * Error message on a free page can be false positive
-		 * if binder shrinker ran during binder_alloc_free_buf
-		 * calls above.
-		 */
 	for (i = 0; i <= (end - 1) / PAGE_SIZE; i++) {
 		if (list_empty(page_to_lru(alloc->pages[i]))) {
 			pr_err_size_seq(sizes, seq);
@@ -162,8 +159,8 @@ static void binder_selftest_free_page(struct binder_alloc *alloc)
 	int i;
 	unsigned long count;
 
-	while ((count = list_lru_count(&binder_freelist))) {
-		list_lru_walk(&binder_freelist, binder_alloc_free_page,
+	while ((count = list_lru_count(&binder_selftest_freelist))) {
+		list_lru_walk(&binder_selftest_freelist, binder_alloc_free_page,
 			      NULL, count);
 	}
 
@@ -187,7 +184,7 @@ static void binder_selftest_alloc_free(struct binder_alloc *alloc,
 
 	/* Allocate from lru. */
 	binder_selftest_alloc_buf(alloc, buffers, sizes, seq);
-	if (list_lru_count(&binder_freelist))
+	if (list_lru_count(&binder_selftest_freelist))
 		pr_err("lru list should be empty but is not\n");
 
 	binder_selftest_free_buf(alloc, buffers, sizes, seq, end);
@@ -275,6 +272,20 @@ static void binder_selftest_alloc_offset(struct binder_alloc *alloc,
 	}
 }
 
+int binder_selftest_alloc_get_page_count(struct binder_alloc *alloc)
+{
+	struct page *page;
+	int allocated = 0;
+	int i;
+
+	for (i = 0; i < alloc->buffer_size / PAGE_SIZE; i++) {
+		page = alloc->pages[i];
+		if (page)
+			allocated++;
+	}
+	return allocated;
+}
+
 /**
  * binder_selftest_alloc() - Test alloc and free of buffer pages.
  * @alloc: Pointer to alloc struct.
@@ -286,6 +297,7 @@ static void binder_selftest_alloc_offset(struct binder_alloc *alloc,
  */
 void binder_selftest_alloc(struct binder_alloc *alloc)
 {
+	struct list_lru *prev_freelist;
 	size_t end_offset[BUFFER_NUM];
 
 	if (!binder_selftest_run)
@@ -293,14 +305,41 @@ void binder_selftest_alloc(struct binder_alloc *alloc)
 	mutex_lock(&binder_selftest_lock);
 	if (!binder_selftest_run || !alloc->mapped)
 		goto done;
+
+	prev_freelist = alloc->freelist;
+
+	/*
+	 * It is not safe to modify this process's alloc->freelist if it has any
+	 * pages on a freelist. Since the test runs before any binder ioctls can
+	 * be dealt with, none of its pages should be allocated yet.
+	 */
+	if (binder_selftest_alloc_get_page_count(alloc)) {
+		pr_err("process has existing alloc state\n");
+		goto cleanup;
+	}
+
+	if (list_lru_init(&binder_selftest_freelist)) {
+		pr_err("failed to init test freelist\n");
+		goto cleanup;
+	}
+
+	alloc->freelist = &binder_selftest_freelist;
+
 	pr_info("STARTED\n");
 	binder_selftest_alloc_offset(alloc, end_offset, 0);
-	binder_selftest_run = false;
 	if (binder_selftest_failures > 0)
 		pr_info("%d tests FAILED\n", binder_selftest_failures);
 	else
 		pr_info("PASSED\n");
 
+	if (list_lru_count(&binder_selftest_freelist))
+		pr_err("expect test freelist to be empty\n");
+
+cleanup:
+	/* Even if we didn't run the test, it's no longer thread-safe. */
+	binder_selftest_run = false;
+	alloc->freelist = prev_freelist;
+	list_lru_destroy(&binder_selftest_freelist);
 done:
 	mutex_unlock(&binder_selftest_lock);
 }
-- 
2.50.0.727.gbf7dc18ff4-goog

