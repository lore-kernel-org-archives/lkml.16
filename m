Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CC275101
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707613; cv=none; b=TM4Hx9AtmWCQcc7xSuuhGNHVwjyMSZr4Qw7mqv1huKrw23WS4DLkxWLnKTSendcN/bRAj+9iXdLWDEzfaml1J+4GKJckfs6mLZ4+qMCWd2lyzO+jpYyXmhRXLavuev/xCHJVFD49RLd26TQ6IBzdko3X7HVqErBnFZ18XZr3mJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707613; c=relaxed/simple;
	bh=xBWPCSVDb/jNFzNj7wFwHu6Gc3RMfVNi+DfW2HhL7rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAH0A431fB1mKVAHDqCdn/mk+EBZXLfah42mRcIxg//ZyTRQZFkhkrs2PAa1YoTR7/FfpMpNVaY1rGuH4jbHiAZN5QgHAf6t0Vvt9HhIUpo1+P10kvLoYE1UIm94A+zi4DZQ8cj4CowKXljW8FA0j+5OmKfz9phR0sE+WQtO8ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye6yH+/Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye6yH+/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744707612; x=1776243612;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xBWPCSVDb/jNFzNj7wFwHu6Gc3RMfVNi+DfW2HhL7rE=;
  b=Ye6yH+/YIHI36CGViID5bH5FXiK/foZAJ7REGqfa67j73mCi0t2bKIOi
   IZFSqqZYkioJGfPjg41mNxtCtaWypoNRGUbXZXKrp5y+/p2vaOhv9z7uh
   jYqUr3lq/GLvQz5o5FpidCW01OBjwbSPe3HixnKflJWXRSD/EgrSPaEdv
   NToPWJRp7uDJXymGTw0WiQEofnM9dLHAMV1TM6CJy2ZlV8JesJZVsrR4i
   wv86KubRWVhqSW3TSabk0haNg9qoX6RKvkA7bkFPa8C8DtfQ2AFFsZUGB
   dn+Dak/kV8UZYm1cGzAmOK12MhgeTFkMjCqzUoaBQauUNsRcI8Fpaq2Zz
   w==;
X-CSE-ConnectionGUID: bDqyp6+DQPOYmrlaq9rViQ==
X-CSE-MsgGUID: OTEhnD+8TWCNQxRDRE/CNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56843162"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56843162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:59:02 -0700
X-CSE-ConnectionGUID: 1DbjZ8d8TGi5A5RUX5ewfw==
X-CSE-MsgGUID: 05h2elAbSgKOV2ofHA7y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134165879"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2025 01:58:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 467BB17B; Tue, 15 Apr 2025 11:58:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] lockdep: Move hlock_equal() to the respective ifdeffery
Date: Tue, 15 Apr 2025 11:58:56 +0300
Message-ID: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hlock_equal() is unused, it prevents kernel builds with clang,
`make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
CONFIG_LOCKDEP_SMALL=n:

  lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]

Fix this by moving the function to the respective existing ifdeffery
for its the only user.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Fixes: 68e305678583 ("lockdep: Adjust check_redundant() for recursive read change")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/locking/lockdep.c | 70 ++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 58d78a33ac65..546e92827de4 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1976,41 +1976,6 @@ print_circular_bug_header(struct lock_list *entry, unsigned int depth,
 	print_circular_bug_entry(entry, depth);
 }
 
-/*
- * We are about to add A -> B into the dependency graph, and in __bfs() a
- * strong dependency path A -> .. -> B is found: hlock_class equals
- * entry->class.
- *
- * If A -> .. -> B can replace A -> B in any __bfs() search (means the former
- * is _stronger_ than or equal to the latter), we consider A -> B as redundant.
- * For example if A -> .. -> B is -(EN)-> (i.e. A -(E*)-> .. -(*N)-> B), and A
- * -> B is -(ER)-> or -(EN)->, then we don't need to add A -> B into the
- * dependency graph, as any strong path ..-> A -> B ->.. we can get with
- * having dependency A -> B, we could already get a equivalent path ..-> A ->
- * .. -> B -> .. with A -> .. -> B. Therefore A -> B is redundant.
- *
- * We need to make sure both the start and the end of A -> .. -> B is not
- * weaker than A -> B. For the start part, please see the comment in
- * check_redundant(). For the end part, we need:
- *
- * Either
- *
- *     a) A -> B is -(*R)-> (everything is not weaker than that)
- *
- * or
- *
- *     b) A -> .. -> B is -(*N)-> (nothing is stronger than this)
- *
- */
-static inline bool hlock_equal(struct lock_list *entry, void *data)
-{
-	struct held_lock *hlock = (struct held_lock *)data;
-
-	return hlock_class(hlock) == entry->class && /* Found A -> .. -> B */
-	       (hlock->read == 2 ||  /* A -> B is -(*R)-> */
-		!entry->only_xr); /* A -> .. -> B is -(*N)-> */
-}
-
 /*
  * We are about to add B -> A into the dependency graph, and in __bfs() a
  * strong dependency path A -> .. -> B is found: hlock_class equals
@@ -2915,6 +2880,41 @@ static inline bool usage_skip(struct lock_list *entry, void *mask)
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
 #ifdef CONFIG_LOCKDEP_SMALL
+/*
+ * We are about to add A -> B into the dependency graph, and in __bfs() a
+ * strong dependency path A -> .. -> B is found: hlock_class equals
+ * entry->class.
+ *
+ * If A -> .. -> B can replace A -> B in any __bfs() search (means the former
+ * is _stronger_ than or equal to the latter), we consider A -> B as redundant.
+ * For example if A -> .. -> B is -(EN)-> (i.e. A -(E*)-> .. -(*N)-> B), and A
+ * -> B is -(ER)-> or -(EN)->, then we don't need to add A -> B into the
+ * dependency graph, as any strong path ..-> A -> B ->.. we can get with
+ * having dependency A -> B, we could already get a equivalent path ..-> A ->
+ * .. -> B -> .. with A -> .. -> B. Therefore A -> B is redundant.
+ *
+ * We need to make sure both the start and the end of A -> .. -> B is not
+ * weaker than A -> B. For the start part, please see the comment in
+ * check_redundant(). For the end part, we need:
+ *
+ * Either
+ *
+ *     a) A -> B is -(*R)-> (everything is not weaker than that)
+ *
+ * or
+ *
+ *     b) A -> .. -> B is -(*N)-> (nothing is stronger than this)
+ *
+ */
+static inline bool hlock_equal(struct lock_list *entry, void *data)
+{
+	struct held_lock *hlock = (struct held_lock *)data;
+
+	return hlock_class(hlock) == entry->class && /* Found A -> .. -> B */
+	       (hlock->read == 2 ||  /* A -> B is -(*R)-> */
+		!entry->only_xr); /* A -> .. -> B is -(*N)-> */
+}
+
 /*
  * Check that the dependency graph starting at <src> can lead to
  * <target> or not. If it can, <src> -> <target> dependency is already
-- 
2.47.2

