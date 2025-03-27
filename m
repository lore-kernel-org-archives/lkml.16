Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626A1FF1A1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108918; cv=none; b=JYylLJP3pX2cQ78nCBkOHKDSIxZJ4sFIt2ITj0ghJWNjxRlchLKjU+yhcwYfPXvk+J4MdkrhV1iuYJ4gPeFMccvpNm2srs/vxg/DtPTk6bX3wMxsiBNt5wthYfS+N1EsWaniuYKNxge+HGK+r59qIfKXvf1cUg8OlU5qLCFZwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108918; c=relaxed/simple;
	bh=4zd+rCZ5QeklxftUChVjGc316W9QQBg9XQs4mwfg6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRlin5tg87RFDH6yha/3DPus68EaoOgmOsepiTQ+yOKDpuKmgq+CXCepXPrcLsqDH0Kjxq1IzRPFtbgkK/HViEblUPdBonHFeXr/cdpTZl83gHDt6Wx+kInT+Q8HUJN3atj8v/W85DvfCEfWsVWpOWxy2iMHH6Hpob7LKCUjvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM4UHPdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM4UHPdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1CCC4CEE8;
	Thu, 27 Mar 2025 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108917;
	bh=4zd+rCZ5QeklxftUChVjGc316W9QQBg9XQs4mwfg6cM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PM4UHPdwhFAbtoRzU/ilvTqDWwxAc1t8OV0Jh9jDaTHDWGJjp0Q68vNrYTahSbQjP
	 TAt7/ayg7hjlfshFoQI2CGMkyql7dHm/PRP3Au9HB6SHYPP5vakEPpNddIWv4ZOMOe
	 PWu1CnlEB8ObVKkOIoqBR0p1murA1M30R52pLZoTOrPYpWS8l3+5vHjsiRC3cygUn/
	 VkVN0etsFnJQuOgNLpAIYBasLJsJMpX9g/OdZV+Pu6nOhi3vnqZjeKwa6lo+xaHkgN
	 9EqMlDGx8gZsJ08kTOwklP5P/LbVwE1Ptz9C46MvnWNW3ypQvZIVYvAmLs91YFSisX
	 CW/g9NVWO+7pg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 32/41] x86/alternatives: Simplify text_poke_int3_batch()
Date: Thu, 27 Mar 2025 21:53:45 +0100
Message-ID: <20250327205355.378659-33-mingo@kernel.org>
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

This function is now using the tp_array state exclusively,
make that explicit by removing the redundant input parameters.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 9402826e2903..40e86b41bb86 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2591,8 +2591,8 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 
 /**
  * text_poke_int3_batch() -- update instructions on live kernel on SMP
- * @tp:			vector of instructions to patch
- * @nr_entries:		number of entries in the vector
+ * @tp_array.vec:		vector of instructions to patch
+ * @tp_array.nr_entries:	number of entries in the vector
  *
  * Modify multi-byte instruction by using int3 breakpoint on SMP.
  * We completely avoid stop_machine() here, and achieve the
@@ -2610,7 +2610,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
  *		  replacing opcode
  *	- sync cores
  */
-static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_entries)
+static void text_poke_int3_batch(void)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2618,9 +2618,6 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 
 	lockdep_assert_held(&text_mutex);
 
-	WARN_ON_ONCE(tp != tp_array.vec);
-	WARN_ON_ONCE(nr_entries != tp_array.nr_entries);
-
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_tp_array() to
 	 * ensure reading a non-zero refcount provides up to date tp_array data.
@@ -2640,16 +2637,16 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 
 	/*
 	 * Corresponding read barrier in int3 notifier for making sure the
-	 * nr_entries and handler are correctly ordered wrt. patching.
+	 * tp_array.nr_entries and handler are correctly ordered wrt. patching.
 	 */
 	smp_wmb();
 
 	/*
 	 * First step: add a int3 trap to the address that will be patched.
 	 */
-	for (i = 0; i < nr_entries; i++) {
-		tp[i].old = *(u8 *)text_poke_int3_addr(&tp[i]);
-		text_poke(text_poke_int3_addr(&tp[i]), &int3, INT3_INSN_SIZE);
+	for (i = 0; i < tp_array.nr_entries; i++) {
+		tp_array.vec[i].old = *(u8 *)text_poke_int3_addr(&tp_array.vec[i]);
+		text_poke(text_poke_int3_addr(&tp_array.vec[i]), &int3, INT3_INSN_SIZE);
 	}
 
 	text_poke_sync();
@@ -2657,15 +2654,15 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 	/*
 	 * Second step: update all but the first byte of the patched range.
 	 */
-	for (do_sync = 0, i = 0; i < nr_entries; i++) {
-		u8 old[POKE_MAX_OPCODE_SIZE+1] = { tp[i].old, };
+	for (do_sync = 0, i = 0; i < tp_array.nr_entries; i++) {
+		u8 old[POKE_MAX_OPCODE_SIZE+1] = { tp_array.vec[i].old, };
 		u8 _new[POKE_MAX_OPCODE_SIZE+1];
-		const u8 *new = tp[i].text;
-		int len = tp[i].len;
+		const u8 *new = tp_array.vec[i].text;
+		int len = tp_array.vec[i].len;
 
 		if (len - INT3_INSN_SIZE > 0) {
 			memcpy(old + INT3_INSN_SIZE,
-			       text_poke_int3_addr(&tp[i]) + INT3_INSN_SIZE,
+			       text_poke_int3_addr(&tp_array.vec[i]) + INT3_INSN_SIZE,
 			       len - INT3_INSN_SIZE);
 
 			if (len == 6) {
@@ -2674,7 +2671,7 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 				new = _new;
 			}
 
-			text_poke(text_poke_int3_addr(&tp[i]) + INT3_INSN_SIZE,
+			text_poke(text_poke_int3_addr(&tp_array.vec[i]) + INT3_INSN_SIZE,
 				  new + INT3_INSN_SIZE,
 				  len - INT3_INSN_SIZE);
 
@@ -2705,7 +2702,7 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 		 * The old instruction is recorded so that the event can be
 		 * processed forwards or backwards.
 		 */
-		perf_event_text_poke(text_poke_int3_addr(&tp[i]), old, len, new, len);
+		perf_event_text_poke(text_poke_int3_addr(&tp_array.vec[i]), old, len, new, len);
 	}
 
 	if (do_sync) {
@@ -2721,16 +2718,16 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 	 * Third step: replace the first byte (int3) by the first byte of
 	 * replacing opcode.
 	 */
-	for (do_sync = 0, i = 0; i < nr_entries; i++) {
-		u8 byte = tp[i].text[0];
+	for (do_sync = 0, i = 0; i < tp_array.nr_entries; i++) {
+		u8 byte = tp_array.vec[i].text[0];
 
-		if (tp[i].len == 6)
+		if (tp_array.vec[i].len == 6)
 			byte = 0x0f;
 
 		if (byte == INT3_INSN_OPCODE)
 			continue;
 
-		text_poke(text_poke_int3_addr(&tp[i]), &byte, INT3_INSN_SIZE);
+		text_poke(text_poke_int3_addr(&tp_array.vec[i]), &byte, INT3_INSN_SIZE);
 		do_sync++;
 	}
 
@@ -2859,7 +2856,7 @@ static bool tp_addr_ordered(void *addr)
 void text_poke_int3_finish(void)
 {
 	if (tp_array.nr_entries) {
-		text_poke_int3_batch(tp_array.vec, tp_array.nr_entries);
+		text_poke_int3_batch();
 		tp_array.nr_entries = 0;
 	}
 }
@@ -2869,7 +2866,7 @@ static void text_poke_int3_flush(void *addr)
 	lockdep_assert_held(&text_mutex);
 
 	if (tp_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !tp_addr_ordered(addr)) {
-		text_poke_int3_batch(tp_array.vec, tp_array.nr_entries);
+		text_poke_int3_batch();
 		tp_array.nr_entries = 0;
 	}
 }
-- 
2.45.2

