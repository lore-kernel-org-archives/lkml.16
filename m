Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D224A29CB37
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350177; cv=none; b=U2ME3o/e4r//mmylipX89pmLwg/0IVrSMxAIREteWsEJDctjWW45OQ4XTqNq6lhV4B9nCLY5WeyMTTRzwDNWzgYk4PRWiTGWBCs5BxeMX0mYgvwqb57WxFrlyjd2TXVRPuBuO3BzuzdIWADxUkzU8uOEoFQLN8s8oHHTexbkaxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350177; c=relaxed/simple;
	bh=wCp+fBmivejOSZgdsFJX2TiROPoQzwLCwR2oz4Urcog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA+C94vGt9XVI4ssKxb6QftEtuTy6Iuq76CrW3nLP3a2VfU7TnVrRI8O4qpPHhxcCXYvLZZJsb7E3tybh608zEa/5cA4jiI+WrgJhJ98xM7lubPH+5ZzlKDAxaIWRRWExtqekgAHB9qiT9UvhXUahpcOGJj901lYlT0HmsIgrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q87hJNBw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q87hJNBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F1FC4CEE2;
	Fri, 11 Apr 2025 05:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350177;
	bh=wCp+fBmivejOSZgdsFJX2TiROPoQzwLCwR2oz4Urcog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q87hJNBwO0IjPQFlLFkiQwBTWsSR1FKtNmovQPrNqaRusTjVENP2cMDdybJ2+aGn2
	 a6CI9S/fx33KX3PNefxqwbxYli1BD18tcGKpnukIFEJVy3Oo7iMFozpSasHpQehiuy
	 S06jds+71WHW1WvU3y0ufK7SEVhnc10p88nhRt8fe60Jl87baMQkHAP7SYKTihKz+G
	 SVmBt7/y7zEM+J5STcM2SHcw1K/6ffFc1GzrkJvjiYfoAl2Gf6aMsITijDGyEJ3Ayw
	 0/5G7lKdPGg9Vm1nWNhRH2PxskPa7HhwtqT/5TzTTDzbSb6VxQK4PT9EC72hkkr99b
	 X6T1+1KrT1/1Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 44/53] x86/alternatives: Standardize on 'tpl' local variable names for 'struct smp_text_poke_loc *'
Date: Fri, 11 Apr 2025 07:40:56 +0200
Message-ID: <20250411054105.2341982-45-mingo@kernel.org>
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

There's no toilet paper in this code.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f278655f0950..c5abcf95daea 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2493,9 +2493,9 @@ static __always_inline void put_text_poke_array(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tp)
+static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tpl)
 {
-	return _stext + tp->rel_addr;
+	return _stext + tpl->rel_addr;
 }
 
 static __always_inline int patch_cmp(const void *tpl_a, const void *tpl_b)
@@ -2509,7 +2509,7 @@ static __always_inline int patch_cmp(const void *tpl_a, const void *tpl_b)
 
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct smp_text_poke_loc *tp;
+	struct smp_text_poke_loc *tpl;
 	int ret = 0;
 	void *ip;
 
@@ -2538,20 +2538,20 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	 * Skip the binary search if there is a single member in the vector.
 	 */
 	if (unlikely(text_poke_array.nr_entries > 1)) {
-		tp = __inline_bsearch(ip, text_poke_array.vec, text_poke_array.nr_entries,
+		tpl = __inline_bsearch(ip, text_poke_array.vec, text_poke_array.nr_entries,
 				      sizeof(struct smp_text_poke_loc),
 				      patch_cmp);
-		if (!tp)
+		if (!tpl)
 			goto out_put;
 	} else {
-		tp = text_poke_array.vec;
-		if (text_poke_addr(tp) != ip)
+		tpl = text_poke_array.vec;
+		if (text_poke_addr(tpl) != ip)
 			goto out_put;
 	}
 
-	ip += tp->len;
+	ip += tpl->len;
 
-	switch (tp->opcode) {
+	switch (tpl->opcode) {
 	case INT3_INSN_OPCODE:
 		/*
 		 * Someone poked an explicit INT3, they'll want to handle it,
@@ -2564,16 +2564,16 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 		break;
 
 	case CALL_INSN_OPCODE:
-		int3_emulate_call(regs, (long)ip + tp->disp);
+		int3_emulate_call(regs, (long)ip + tpl->disp);
 		break;
 
 	case JMP32_INSN_OPCODE:
 	case JMP8_INSN_OPCODE:
-		int3_emulate_jmp(regs, (long)ip + tp->disp);
+		int3_emulate_jmp(regs, (long)ip + tpl->disp);
 		break;
 
 	case 0x70 ... 0x7f: /* Jcc */
-		int3_emulate_jcc(regs, tp->opcode & 0xf, (long)ip, tp->disp);
+		int3_emulate_jcc(regs, tpl->opcode & 0xf, (long)ip, tpl->disp);
 		break;
 
 	default:
@@ -2755,33 +2755,33 @@ static void smp_text_poke_batch_process(void)
 
 static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct smp_text_poke_loc *tp;
+	struct smp_text_poke_loc *tpl;
 	struct insn insn;
 	int ret, i = 0;
 
-	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
+	tpl = &text_poke_array.vec[text_poke_array.nr_entries++];
 
 	if (len == 6)
 		i = 1;
-	memcpy((void *)tp->text, opcode+i, len-i);
+	memcpy((void *)tpl->text, opcode+i, len-i);
 	if (!emulate)
 		emulate = opcode;
 
 	ret = insn_decode_kernel(&insn, emulate);
 	BUG_ON(ret < 0);
 
-	tp->rel_addr = addr - (void *)_stext;
-	tp->len = len;
-	tp->opcode = insn.opcode.bytes[0];
+	tpl->rel_addr = addr - (void *)_stext;
+	tpl->len = len;
+	tpl->opcode = insn.opcode.bytes[0];
 
 	if (is_jcc32(&insn)) {
 		/*
 		 * Map Jcc.d32 onto Jcc.d8 and use len to distinguish.
 		 */
-		tp->opcode = insn.opcode.bytes[1] - 0x10;
+		tpl->opcode = insn.opcode.bytes[1] - 0x10;
 	}
 
-	switch (tp->opcode) {
+	switch (tpl->opcode) {
 	case RET_INSN_OPCODE:
 	case JMP32_INSN_OPCODE:
 	case JMP8_INSN_OPCODE:
@@ -2790,14 +2790,14 @@ static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len
 		 * next instruction can be padded with INT3.
 		 */
 		for (i = insn.length; i < len; i++)
-			BUG_ON(tp->text[i] != INT3_INSN_OPCODE);
+			BUG_ON(tpl->text[i] != INT3_INSN_OPCODE);
 		break;
 
 	default:
 		BUG_ON(len != insn.length);
 	}
 
-	switch (tp->opcode) {
+	switch (tpl->opcode) {
 	case INT3_INSN_OPCODE:
 	case RET_INSN_OPCODE:
 		break;
@@ -2806,21 +2806,21 @@ static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len
 	case JMP32_INSN_OPCODE:
 	case JMP8_INSN_OPCODE:
 	case 0x70 ... 0x7f: /* Jcc */
-		tp->disp = insn.immediate.value;
+		tpl->disp = insn.immediate.value;
 		break;
 
 	default: /* assume NOP */
 		switch (len) {
 		case 2: /* NOP2 -- emulate as JMP8+0 */
 			BUG_ON(memcmp(emulate, x86_nops[len], len));
-			tp->opcode = JMP8_INSN_OPCODE;
-			tp->disp = 0;
+			tpl->opcode = JMP8_INSN_OPCODE;
+			tpl->disp = 0;
 			break;
 
 		case 5: /* NOP5 -- emulate as JMP32+0 */
 			BUG_ON(memcmp(emulate, x86_nops[len], len));
-			tp->opcode = JMP32_INSN_OPCODE;
-			tp->disp = 0;
+			tpl->opcode = JMP32_INSN_OPCODE;
+			tpl->disp = 0;
 			break;
 
 		default: /* unknown instruction */
-- 
2.45.2

