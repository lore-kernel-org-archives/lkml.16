Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA61DDA3D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108882; cv=none; b=CSUOyvqXyARNnFL3ECxhI6LoihU0OK2YYwYqTSvOEy4PAc6qkAxf6sq7vgTEhb2fNxEDenstJqZW05rOenAq0Dq0riWsLHeZOupFyTS0hTAIhABGuXpOekmak4fax8fVFou0Zdw0IbbjcvRGNHKtRMYTajKe/S+8Xh18/QrHcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108882; c=relaxed/simple;
	bh=py9hVGE7uEo18V6K/13DP1+9IePOV54O177MZwqQcAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lr6+BMJksJ9j+EXjJnqyPTvXpZsqu6ndAqvxwr8Yu4+Wnu9m0f++H3eQ/22BsG53OlcanzgLyBNbNy4mVDPMo8sRTo7HhCUqzamcf+Yr/feOwHNb2ruLn1QBTu8BmpxhKB/h//wzLaqBuXEjytlYp6LJbGYp7UxH4Uj3lSo3fKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAC7xaBY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAC7xaBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD43C4CEEB;
	Thu, 27 Mar 2025 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108881;
	bh=py9hVGE7uEo18V6K/13DP1+9IePOV54O177MZwqQcAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAC7xaBYAF0eDTa82rXU5sJxVbzfnL9ih8L+rVZGBZfcNKYosp/xsEvqdmEuA62TV
	 5hNCmCPafAi/5A+eqv2HqUp/anzf0OCiScL+xsZOkfaO3vvF1h+XK48GJpn1QU7w5b
	 sVuH9oiTQF3LPSClUIpprFz4usl23ExCS0jVgOXr+DWoUnHbbljYskBhCD9XDNe1JZ
	 8vyvtZaFKQsvSLMbKSNeb/f0XRUaS2vHDhi3YmLpUP/sf/K9m4/3IfrU1jwkeCKTFZ
	 5c4ud4PYbZpGBRVGQ5kNOsJGdkBj9HuLTb3ZKjGqVRkCF6fKN1801Ff2gsjbL42Q+n
	 OPUwXLaX2IWKQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 17/41] x86/alternatives: Rename 'struct text_poke_loc' to 'struct text_poke_int3_loc'
Date: Thu, 27 Mar 2025 21:53:30 +0100
Message-ID: <20250327205355.378659-18-mingo@kernel.org>
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

Make it clear that this structure is part of the INT3 based
patching facility, not the regular text_poke*() MM-switch
based facility.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 64355aa25402..62aead1bd671 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2455,7 +2455,7 @@ void text_poke_sync(void)
  * this thing. When len == 6 everything is prefixed with 0x0f and we map
  * opcode to Jcc.d8, using len to distinguish.
  */
-struct text_poke_loc {
+struct text_poke_int3_loc {
 	/* addr := _stext + rel_addr */
 	s32 rel_addr;
 	s32 disp;
@@ -2467,7 +2467,7 @@ struct text_poke_loc {
 };
 
 struct int3_patching_desc {
-	struct text_poke_loc *vec;
+	struct text_poke_int3_loc *vec;
 	int nr_entries;
 };
 
@@ -2494,14 +2494,14 @@ static __always_inline void put_desc(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_int3_addr(struct text_poke_loc *tp)
+static __always_inline void *text_poke_int3_addr(struct text_poke_int3_loc *tp)
 {
 	return _stext + tp->rel_addr;
 }
 
 static __always_inline int patch_cmp(const void *key, const void *elt)
 {
-	struct text_poke_loc *tp = (struct text_poke_loc *) elt;
+	struct text_poke_int3_loc *tp = (struct text_poke_int3_loc *) elt;
 
 	if (key < text_poke_int3_addr(tp))
 		return -1;
@@ -2513,7 +2513,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct int3_patching_desc *desc;
-	struct text_poke_loc *tp;
+	struct text_poke_int3_loc *tp;
 	int ret = 0;
 	void *ip;
 
@@ -2544,7 +2544,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	 */
 	if (unlikely(desc->nr_entries > 1)) {
 		tp = __inline_bsearch(ip, desc->vec, desc->nr_entries,
-				      sizeof(struct text_poke_loc),
+				      sizeof(struct text_poke_int3_loc),
 				      patch_cmp);
 		if (!tp)
 			goto out_put;
@@ -2592,8 +2592,8 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	return ret;
 }
 
-#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct text_poke_loc))
-static struct text_poke_loc tp_vec[TP_VEC_MAX];
+#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct text_poke_int3_loc))
+static struct text_poke_int3_loc tp_vec[TP_VEC_MAX];
 static int tp_vec_nr;
 
 /**
@@ -2617,7 +2617,7 @@ static int tp_vec_nr;
  *		  replacing opcode
  *	- sync cores
  */
-static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entries)
+static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_entries)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2762,7 +2762,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 	}
 }
 
-static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
+static void text_poke_int3_loc_init(struct text_poke_int3_loc *tp, void *addr,
 			       const void *opcode, size_t len, const void *emulate)
 {
 	struct insn insn;
@@ -2843,7 +2843,7 @@ static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
  */
 static bool tp_order_fail(void *addr)
 {
-	struct text_poke_loc *tp;
+	struct text_poke_int3_loc *tp;
 
 	if (!tp_vec_nr)
 		return false;
@@ -2873,7 +2873,7 @@ void text_poke_int3_finish(void)
 
 void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_loc *tp;
+	struct text_poke_int3_loc *tp;
 
 	text_poke_int3_flush(addr);
 
@@ -2894,7 +2894,7 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
  */
 void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_loc tp;
+	struct text_poke_int3_loc tp;
 
 	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
 	text_poke_int3_batch(&tp, 1);
-- 
2.45.2

