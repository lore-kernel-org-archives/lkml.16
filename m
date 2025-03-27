Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C41F8741
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108902; cv=none; b=IKeIRQqBpvUIBbY5Rp977hxBKuvpWoysGDCTBCtcKbLwyZGevBSJH5RehNOAOlOogUUEARLOx7MS+/Vyx3zRdzD7QqhbrWemMYXuKsJDmCMOFfP0PA1kpolto+I8E3AJN9FwkQoOm5Hjd8ZSBbjauTSmYjN/wX/scArK5GQxjHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108902; c=relaxed/simple;
	bh=bdiwBSo9W6RD9K2588a9gOGZgIRFv+BS8HeSGoR5mdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyU1VFc2C0zy+BNY46zhwi34Jn9qPHGuut+9WYgz8Pd8N+6t/M7Bh4EPtN7ny1gDPJ1e5Buvb8jwiZRzucHE3FC63ZqqK+sZe3ul94mT+OGVssaFr7aP36drAFiNKha/pfibth+hA2Jna3QRjuAMLT1Rc5uiaX2zfhNBev18/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbjK632f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbjK632f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC1DC4CEE8;
	Thu, 27 Mar 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108902;
	bh=bdiwBSo9W6RD9K2588a9gOGZgIRFv+BS8HeSGoR5mdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KbjK632fDcy2usClEHmIdVo7Qhwyzm0SWBV2e6aDHbitgBQBCBazaRgC6z6s/Yo2P
	 EmCWbLp0kLZXci88+m5QznMazQt2qMEQWLvA3/xlHLQXdRrw8kXE1zkHHOlZ6bX7z/
	 hlEYyeHBc8w7J+X1/L/HpwLAHm9h+tFoKJGUy40MzUumD+ldm0sfur9TRs7GA3ZMDQ
	 Go4y/LvbyZrjh1Omt/3o78qwm8LFpaqORc+QNLqfLlSTtlVQdacd2If5iVF1I8akVT
	 hdxrz0Md+Xpe9N68JZRv0XoCgY4/BDU4V41l+VDIzS3D4naHtPcqhqP2omqfJLhE6C
	 iF924132OWQfw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 26/41] x86/alternatives: Introduce 'struct text_poke_int3_array' and move tp_vec and tp_vec_nr to it
Date: Thu, 27 Mar 2025 21:53:39 +0100
Message-ID: <20250327205355.378659-27-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct text_poke_array is an equivalent structure to these global variables:

	static struct text_poke_int3_loc tp_vec[TP_VEC_MAX];
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
index 393d796e797d..cf3bcaa97957 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2467,14 +2467,21 @@ struct text_poke_int3_loc {
 };
 
 struct text_poke_int3_vec {
-	struct text_poke_int3_loc *vec;
 	int nr_entries;
+	struct text_poke_int3_loc *vec;
 };
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static struct text_poke_int3_vec int3_vec;
 
+#define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct text_poke_int3_loc))
+
+static struct text_poke_int3_array {
+	int nr_entries;
+	struct text_poke_int3_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
+} tp_array;
+
 static __always_inline
 struct text_poke_int3_vec *try_get_desc(void)
 {
@@ -2510,10 +2517,6 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
-#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct text_poke_int3_loc))
-static struct text_poke_int3_loc tp_vec[TP_VEC_MAX];
-static int tp_vec_nr;
-
 noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct text_poke_int3_vec *desc;
@@ -2538,7 +2541,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	if (!desc)
 		return 0;
 
-	WARN_ON_ONCE(desc->vec != tp_vec);
+	WARN_ON_ONCE(desc->vec != tp_array.vec);
 
 	/*
 	 * Discount the INT3. See text_poke_int3_batch().
@@ -2627,8 +2630,8 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 
 	lockdep_assert_held(&text_mutex);
 
-	WARN_ON_ONCE(tp != tp_vec);
-	WARN_ON_ONCE(nr_entries != tp_vec_nr);
+	WARN_ON_ONCE(tp != tp_array.vec);
+	WARN_ON_ONCE(nr_entries != tp_array.nr_entries);
 
 	int3_vec.vec = tp;
 	int3_vec.nr_entries = nr_entries;
@@ -2843,7 +2846,7 @@ static void text_poke_int3_loc_init(struct text_poke_int3_loc *tp, void *addr,
 }
 
 /*
- * We hard rely on the tp_vec being ordered; ensure this is so by flushing
+ * We hard rely on the tp_array.vec being ordered; ensure this is so by flushing
  * early if needed.
  */
 static bool tp_addr_ordered(void *addr)
@@ -2852,7 +2855,7 @@ static bool tp_addr_ordered(void *addr)
 
 	WARN_ON_ONCE(!addr);
 
-	if (!tp_vec_nr)
+	if (!tp_array.nr_entries)
 		return true;
 
 	/*
@@ -2861,7 +2864,7 @@ static bool tp_addr_ordered(void *addr)
 	 * is violated and we must first flush all pending patching
 	 * requests:
 	 */
-	tp = &tp_vec[tp_vec_nr-1];
+	tp = &tp_array.vec[tp_array.nr_entries-1];
 	if ((unsigned long)text_poke_int3_addr(tp) > (unsigned long)addr)
 		return false;
 
@@ -2870,9 +2873,9 @@ static bool tp_addr_ordered(void *addr)
 
 void text_poke_int3_finish(void)
 {
-	if (tp_vec_nr) {
-		text_poke_int3_batch(tp_vec, tp_vec_nr);
-		tp_vec_nr = 0;
+	if (tp_array.nr_entries) {
+		text_poke_int3_batch(tp_array.vec, tp_array.nr_entries);
+		tp_array.nr_entries = 0;
 	}
 }
 
@@ -2880,9 +2883,9 @@ static void text_poke_int3_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_vec_nr == TP_VEC_MAX || !tp_addr_ordered(addr)) {
-		text_poke_int3_batch(tp_vec, tp_vec_nr);
-		tp_vec_nr = 0;
+	if (tp_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !tp_addr_ordered(addr)) {
+		text_poke_int3_batch(tp_array.vec, tp_array.nr_entries);
+		tp_array.nr_entries = 0;
 	}
 }
 
@@ -2892,7 +2895,7 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
 
 	text_poke_int3_flush(addr);
 
-	tp = &tp_vec[tp_vec_nr++];
+	tp = &tp_array.vec[tp_array.nr_entries++];
 	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 }
 
@@ -2912,9 +2915,9 @@ void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void
 	struct text_poke_int3_loc *tp;
 
 	/* Batch-patching should not be mixed with single-patching: */
-	WARN_ON_ONCE(tp_vec_nr != 0);
+	WARN_ON_ONCE(tp_array.nr_entries != 0);
 
-	tp = &tp_vec[tp_vec_nr++];
+	tp = &tp_array.vec[tp_array.nr_entries++];
 	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 
 	text_poke_int3_finish();
-- 
2.45.2

