Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B85298CD7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350151; cv=none; b=Qxs1rbguH7XGD2C7VX9cJiUlc71iXjHvVlJEs0Vp4a/75IMNW6rb4n5NaKw/xQlAwY5ORD2h3L29M3P3PO2rQknBJr1V/McuhPJ+XYnFD/qi7asv7pjrYc/UcGE91btooikJUlNoemZxT7E+xcjWCPPptuIyXrdkgnYxCgTJStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350151; c=relaxed/simple;
	bh=mrD1rbGrQKN82oUVMkFYkr3GJMh92Eu93Tf8zWhbpEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnpdMud/WuQr1zcaBSREGmRH+k7OKi+iheBuWFUcID7TxZlYKGQfpix+3Dxdekt9cSn8LfiTydYCnYBvSvJmy/OXsiuTWP7ZTpcG87bSzfl1HXymqH6BtW/89jgUBRhMRb6B3fQVF8Q9r1HP6YSjFPnEmYqpA9Y+IH6KT+pZCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ymbq4C3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ymbq4C3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F45C4CEE5;
	Fri, 11 Apr 2025 05:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350151;
	bh=mrD1rbGrQKN82oUVMkFYkr3GJMh92Eu93Tf8zWhbpEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ymbq4C3TXAbCufiGsXN5PPR6HRdN+LtdwcoTQnmKx8D2LhTZ98ECMZjLMsYQjbYu8
	 e9imqLCJGpRZXZ+R7SOaEUcJekFEECdAJgQZ09fJNTOMnlGcTkl1Gh1WvaLWL/1uU5
	 vlf3L2t6rqLAZ30xW4VSk/XGuzE2ZzEojDuVgKD3t5IKJzdE/zmoMo1X/l2E/PowLE
	 us7hLoOF6SQERFR6ZQhyA60zkRGONphAIEjZ90oo96QqRxUFGHwN/+h4ihNwQc+lFm
	 qX/vN2t4OyfhiSbAOqDqo5dK/7vFb875Ym5TFc++yA313cA2vtrYkfjYSLw5EegbUt
	 h9RpobN3Fn3wg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 33/53] x86/alternatives: Simplify smp_text_poke_batch_process()
Date: Fri, 11 Apr 2025 07:40:45 +0200
Message-ID: <20250411054105.2341982-34-mingo@kernel.org>
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

This function is now using the text_poke_array state exclusively,
make that explicit by removing the redundant input parameters.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f94a715d9b2b..f5db49434020 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2591,8 +2591,8 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 /**
  * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
- * @tp:			vector of instructions to patch
- * @nr_entries:		number of entries in the vector
+ * @text_poke_array.vec:		vector of instructions to patch
+ * @text_poke_array.nr_entries:	number of entries in the vector
  *
  * Modify multi-byte instruction by using int3 breakpoint on SMP.
  * We completely avoid stop_machine() here, and achieve the
@@ -2610,7 +2610,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
  *		  replacing opcode
  *	- sync cores
  */
-static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned int nr_entries)
+static void smp_text_poke_batch_process(void)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2618,9 +2618,6 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	lockdep_assert_held(&text_mutex);
 
-	WARN_ON_ONCE(tp != text_poke_array.vec);
-	WARN_ON_ONCE(nr_entries != text_poke_array.nr_entries);
-
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_text_poke_array() to
 	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
@@ -2640,16 +2637,16 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	/*
 	 * Corresponding read barrier in int3 notifier for making sure the
-	 * nr_entries and handler are correctly ordered wrt. patching.
+	 * text_poke_array.nr_entries and handler are correctly ordered wrt. patching.
 	 */
 	smp_wmb();
 
 	/*
 	 * First step: add a int3 trap to the address that will be patched.
 	 */
-	for (i = 0; i < nr_entries; i++) {
-		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
-		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
+	for (i = 0; i < text_poke_array.nr_entries; i++) {
+		text_poke_array.vec[i].old = *(u8 *)text_poke_addr(&text_poke_array.vec[i]);
+		text_poke(text_poke_addr(&text_poke_array.vec[i]), &int3, INT3_INSN_SIZE);
 	}
 
 	text_poke_sync();
@@ -2657,15 +2654,15 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 	/*
 	 * Second step: update all but the first byte of the patched range.
 	 */
-	for (do_sync = 0, i = 0; i < nr_entries; i++) {
-		u8 old[POKE_MAX_OPCODE_SIZE+1] = { tp[i].old, };
+	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
+		u8 old[POKE_MAX_OPCODE_SIZE+1] = { text_poke_array.vec[i].old, };
 		u8 _new[POKE_MAX_OPCODE_SIZE+1];
-		const u8 *new = tp[i].text;
-		int len = tp[i].len;
+		const u8 *new = text_poke_array.vec[i].text;
+		int len = text_poke_array.vec[i].len;
 
 		if (len - INT3_INSN_SIZE > 0) {
 			memcpy(old + INT3_INSN_SIZE,
-			       text_poke_addr(&tp[i]) + INT3_INSN_SIZE,
+			       text_poke_addr(&text_poke_array.vec[i]) + INT3_INSN_SIZE,
 			       len - INT3_INSN_SIZE);
 
 			if (len == 6) {
@@ -2674,7 +2671,7 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 				new = _new;
 			}
 
-			text_poke(text_poke_addr(&tp[i]) + INT3_INSN_SIZE,
+			text_poke(text_poke_addr(&text_poke_array.vec[i]) + INT3_INSN_SIZE,
 				  new + INT3_INSN_SIZE,
 				  len - INT3_INSN_SIZE);
 
@@ -2705,7 +2702,7 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 		 * The old instruction is recorded so that the event can be
 		 * processed forwards or backwards.
 		 */
-		perf_event_text_poke(text_poke_addr(&tp[i]), old, len, new, len);
+		perf_event_text_poke(text_poke_addr(&text_poke_array.vec[i]), old, len, new, len);
 	}
 
 	if (do_sync) {
@@ -2721,16 +2718,16 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 	 * Third step: replace the first byte (int3) by the first byte of
 	 * replacing opcode.
 	 */
-	for (do_sync = 0, i = 0; i < nr_entries; i++) {
-		u8 byte = tp[i].text[0];
+	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
+		u8 byte = text_poke_array.vec[i].text[0];
 
-		if (tp[i].len == 6)
+		if (text_poke_array.vec[i].len == 6)
 			byte = 0x0f;
 
 		if (byte == INT3_INSN_OPCODE)
 			continue;
 
-		text_poke(text_poke_addr(&tp[i]), &byte, INT3_INSN_SIZE);
+		text_poke(text_poke_addr(&text_poke_array.vec[i]), &byte, INT3_INSN_SIZE);
 		do_sync++;
 	}
 
@@ -2859,7 +2856,7 @@ static bool text_poke_addr_ordered(void *addr)
 void smp_text_poke_batch_finish(void)
 {
 	if (text_poke_array.nr_entries) {
-		smp_text_poke_batch_process(text_poke_array.vec, text_poke_array.nr_entries);
+		smp_text_poke_batch_process();
 		text_poke_array.nr_entries = 0;
 	}
 }
@@ -2869,7 +2866,7 @@ static void smp_text_poke_batch_flush(void *addr)
 	lockdep_assert_held(&text_mutex);
 
 	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr)) {
-		smp_text_poke_batch_process(text_poke_array.vec, text_poke_array.nr_entries);
+		smp_text_poke_batch_process();
 		text_poke_array.nr_entries = 0;
 	}
 }
-- 
2.45.2

