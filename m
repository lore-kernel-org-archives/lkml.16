Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F752980DD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350136; cv=none; b=REo8vJyJWSS9tgQEQEzZLmZq4qo3WR6l3fFf9dLtdkPubRJToX2krDlKyCR5hQyc7LDq9YR7ZV7LzUPN3Ey2bHbPspx9cC5SGv0AVUa2Nzp3Lc4TvdI5a9GW3N9xpP/gEAgWTJ3EwDNbFkdVKabI8yLKkhS3lc1yQIwzWqMTZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350136; c=relaxed/simple;
	bh=62aMsQYVHPp7bHeNS3D+Wg81XfB0kzlWGa83pIbg3qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZldHYrFqiJt8F/odS7q7HmRgMzePE/CIP0i/hecF387ZFN1d4ak/ehqgzSWaJ6kOVTcSI2Y6LiTujFJMeSlie0e/Hg4ybKBZQ5KTAc053tpY2/DXJaGagMUCe/WQe5N/bV6/hWttwcAmXAymtKLSmJEed5zeTnVM9Bsmzs1fdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ru8tlPD5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ru8tlPD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8554C4CEE2;
	Fri, 11 Apr 2025 05:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350136;
	bh=62aMsQYVHPp7bHeNS3D+Wg81XfB0kzlWGa83pIbg3qY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ru8tlPD5fg0IQEnUrNUe4fNZcRl4dg5cK1AvS0ebO96jH8SFPUl86JMxG418yUWFc
	 Tjz1fXst2hM0hJNBWXi4cEa/4pL2BdJqrZBKEl0GUQtQ+w0/VCgziwMkA3ccT4O8a3
	 EX8IXb9CiQv/QCKv0qZfnxlHkGciLdusq+v/mN1qObbcKczs193DawsV9LpLaKdHaf
	 d3AT3ke+ywRNrkH0+FMgaQzaHt7h/ntABUumc9CQ3HrmCwstT70u/lJ+BPlFtLpUXA
	 7tVzYDhT2eboJjc/1DNZLnCMmLwFeJgw8NIKlgBcL7gy0+ZFJaH6GmDF/+mgrsDcRh
	 HNKHN8rwsAfhw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 27/53] x86/alternatives: Introduce 'struct smp_text_poke_array' and move tp_vec and tp_vec_nr to it
Date: Fri, 11 Apr 2025 07:40:39 +0200
Message-ID: <20250411054105.2341982-28-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct text_poke_array is an equivalent structure to these global variables:

	static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
	static int tp_vec_nr;

Note that we intentionally mirror much of the naming of
'struct text_poke_int3_vec', which will further highlight
the unecessary layering going on in this code, and will
ease its removal.

No change in functionality.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ee6ff7660563..d1647aa46db5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2467,14 +2467,21 @@ struct smp_text_poke_loc {
 };
 
 struct text_poke_int3_vec {
-	struct smp_text_poke_loc *vec;
 	int nr_entries;
+	struct smp_text_poke_loc *vec;
 };
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static struct text_poke_int3_vec int3_vec;
 
+#define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
+
+static struct smp_text_poke_array {
+	int nr_entries;
+	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
+} text_poke_array;
+
 static __always_inline
 struct text_poke_int3_vec *try_get_desc(void)
 {
@@ -2510,10 +2517,6 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
-#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
-static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
-static int tp_vec_nr;
-
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct text_poke_int3_vec *desc;
@@ -2538,7 +2541,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	if (!desc)
 		return 0;
 
-	WARN_ON_ONCE(desc->vec != tp_vec);
+	WARN_ON_ONCE(desc->vec != text_poke_array.vec);
 
 	/*
 	 * Discount the INT3. See smp_text_poke_batch_process().
@@ -2627,8 +2630,8 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	lockdep_assert_held(&text_mutex);
 
-	WARN_ON_ONCE(tp != tp_vec);
-	WARN_ON_ONCE(nr_entries != tp_vec_nr);
+	WARN_ON_ONCE(tp != text_poke_array.vec);
+	WARN_ON_ONCE(nr_entries != text_poke_array.nr_entries);
 
 	int3_vec.vec = tp;
 	int3_vec.nr_entries = nr_entries;
@@ -2843,7 +2846,7 @@ static void text_poke_int3_loc_init(struct smp_text_poke_loc *tp, void *addr,
 }
 
 /*
- * We hard rely on the tp_vec being ordered; ensure this is so by flushing
+ * We hard rely on the text_poke_array.vec being ordered; ensure this is so by flushing
  * early if needed.
  */
 static bool text_poke_addr_ordered(void *addr)
@@ -2852,7 +2855,7 @@ static bool text_poke_addr_ordered(void *addr)
 
 	WARN_ON_ONCE(!addr);
 
-	if (!tp_vec_nr)
+	if (!text_poke_array.nr_entries)
 		return true;
 
 	/*
@@ -2861,7 +2864,7 @@ static bool text_poke_addr_ordered(void *addr)
 	 * is violated and we must first flush all pending patching
 	 * requests:
 	 */
-	tp = &tp_vec[tp_vec_nr-1];
+	tp = &text_poke_array.vec[text_poke_array.nr_entries-1];
 	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
 		return false;
 
@@ -2870,9 +2873,9 @@ static bool text_poke_addr_ordered(void *addr)
 
 void smp_text_poke_batch_finish(void)
 {
-	if (tp_vec_nr) {
-		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
-		tp_vec_nr = 0;
+	if (text_poke_array.nr_entries) {
+		smp_text_poke_batch_process(text_poke_array.vec, text_poke_array.nr_entries);
+		text_poke_array.nr_entries = 0;
 	}
 }
 
@@ -2880,9 +2883,9 @@ static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_vec_nr == TP_VEC_MAX || !text_poke_addr_ordered(addr)) {
-		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
-		tp_vec_nr = 0;
+	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr)) {
+		smp_text_poke_batch_process(text_poke_array.vec, text_poke_array.nr_entries);
+		text_poke_array.nr_entries = 0;
 	}
 }
 
@@ -2892,7 +2895,7 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
 
 	smp_text_poke_batch_flush(addr);
 
-	tp = &tp_vec[tp_vec_nr++];
+	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
 	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 }
 
@@ -2912,9 +2915,9 @@ void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, cons
 	struct smp_text_poke_loc *tp;
 
 	/* Batch-patching should not be mixed with single-patching: */
-	WARN_ON_ONCE(tp_vec_nr != 0);
+	WARN_ON_ONCE(text_poke_array.nr_entries != 0);
 
-	tp = &tp_vec[tp_vec_nr++];
+	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
 	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 
 	smp_text_poke_batch_finish();
-- 
2.45.2

