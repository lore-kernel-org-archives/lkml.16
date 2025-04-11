Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FFB28EA52
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350115; cv=none; b=CMukezobcLHgVa3AmnlM4xRwXGX1obCTWqAxZexNglIs45RDvaQmlE1aNVAQeHyOS4TPGbx2JzWG7MIZzOH4y+bu8ADwc5253Dr3t5O1r7nqlGjyQvp5KJwVQmrtxBq+cRe/hAD3pOQoemUK1+y7N4fQ1SFlTx/0homWpYxJV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350115; c=relaxed/simple;
	bh=2yK7MrqUmq0bK+hOiG8TcLoKYtO5neIrToE++cf+tug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ery66Bc8KUv9xBX4DOwwluZalWc9r4eeeiwlCnrtUnekWLtH5bDZntTcqrP/7tKyOdLBRAbTU45xg4TdUe1bNWBObW78Dc7OAaje23YFC4pXLA1T0Gkx1tabfD8DQ+SjILr2kx8jV9TSXxOjeUnbZRAQzC8i0ToEskmjaeUyunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKRANRXt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKRANRXt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F498C4CEE2;
	Fri, 11 Apr 2025 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350115;
	bh=2yK7MrqUmq0bK+hOiG8TcLoKYtO5neIrToE++cf+tug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKRANRXtNayXHoT5eOBMvPPQaTyckzepgnuZnbSNq/RLHSYY3R7RhJt1soakL4Jmg
	 pU8ioDwWuxuO0st7HpN5elVsnlU+RshUtfSwMJSBUFEUtLeX0cIb9B58YWm9AW36Y6
	 0/HzZMVwBFbMUmLqlxtDhEJ/UOHo6Bo6iCgBJZ7u8fZbcpnOmO+H7+j4PNH/dWFdeQ
	 ZraghlBDgjOF9gtTEpoC1iJDxPz2tXjd4KBLjIGapadjEYTjJllIBV20+JtGhQbxWt
	 J/qpFU0hN4BYj7g7YF/wUiZRiKs0G9GimJjSHWS6egRKepSQ89F3oxEt5aEhrEQCcQ
	 vvGRbYQ/RV+Sw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 18/53] x86/alternatives: Rename 'struct text_poke_loc' to 'struct smp_text_poke_loc'
Date: Fri, 11 Apr 2025 07:40:30 +0200
Message-ID: <20250411054105.2341982-19-mingo@kernel.org>
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

Make it clear that this structure is part of the INT3 based
SMP patching facility, not the regular text_poke*() MM-switch
based facility.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e909f2859d0d..8bd5842e626e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2455,7 +2455,7 @@ void text_poke_sync(void)
  * this thing. When len == 6 everything is prefixed with 0x0f and we map
  * opcode to Jcc.d8, using len to distinguish.
  */
-struct text_poke_loc {
+struct smp_text_poke_loc {
 	/* addr := _stext + rel_addr */
 	s32 rel_addr;
 	s32 disp;
@@ -2467,7 +2467,7 @@ struct text_poke_loc {
 };
 
 struct int3_patching_desc {
-	struct text_poke_loc *vec;
+	struct smp_text_poke_loc *vec;
 	int nr_entries;
 };
 
@@ -2494,14 +2494,14 @@ static __always_inline void put_desc(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_addr(struct text_poke_loc *tp)
+static __always_inline void *text_poke_addr(struct smp_text_poke_loc *tp)
 {
 	return _stext + tp->rel_addr;
 }
 
 static __always_inline int patch_cmp(const void *key, const void *elt)
 {
-	struct text_poke_loc *tp = (struct text_poke_loc *) elt;
+	struct smp_text_poke_loc *tp = (struct smp_text_poke_loc *) elt;
 
 	if (key < text_poke_addr(tp))
 		return -1;
@@ -2513,7 +2513,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct int3_patching_desc *desc;
-	struct text_poke_loc *tp;
+	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
 
@@ -2544,7 +2544,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	 */
 	if (unlikely(desc->nr_entries > 1)) {
 		tp = __inline_bsearch(ip, desc->vec, desc->nr_entries,
-				      sizeof(struct text_poke_loc),
+				      sizeof(struct smp_text_poke_loc),
 				      patch_cmp);
 		if (!tp)
 			goto out_put;
@@ -2592,8 +2592,8 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	return ret;
 }
 
-#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct text_poke_loc))
-static struct text_poke_loc tp_vec[TP_VEC_MAX];
+#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
+static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
 static int tp_vec_nr;
 
 /**
@@ -2617,7 +2617,7 @@ static int tp_vec_nr;
  *		  replacing opcode
  *	- sync cores
  */
-static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int nr_entries)
+static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned int nr_entries)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2762,7 +2762,7 @@ static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int n
 	}
 }
 
-static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
+static void text_poke_int3_loc_init(struct smp_text_poke_loc *tp, void *addr,
 			       const void *opcode, size_t len, const void *emulate)
 {
 	struct insn insn;
@@ -2843,7 +2843,7 @@ static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
  */
 static bool tp_order_fail(void *addr)
 {
-	struct text_poke_loc *tp;
+	struct smp_text_poke_loc *tp;
 
 	if (!tp_vec_nr)
 		return false;
@@ -2873,7 +2873,7 @@ void smp_text_poke_batch_finish(void)
 
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_loc *tp;
+	struct smp_text_poke_loc *tp;
 
 	smp_text_poke_batch_flush(addr);
 
@@ -2894,7 +2894,7 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_loc tp;
+	struct smp_text_poke_loc tp;
 
 	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
 	smp_text_poke_batch_process(&tp, 1);
-- 
2.45.2

