Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216CD1FF1D6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108920; cv=none; b=d8hWDK4QSGZuyJghbwa8XEOo6XTbufRQqFoQuzLjov558tfPSwheaPQqd0zdc4TwLjQJqDGBe2QG5r8czW8gnJCXWTIt+G/CQ38u6CavruqpPfU3m/Y+YjaqFz0S6UDAchjDJxOV/aQtKwCsLYyc33lO33dv6inJ0acIJstINzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108920; c=relaxed/simple;
	bh=ONkCbb0X17pJcuDecoMQku1CkhbCOHuD9g7WoFvQdLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uF1TzLYqI9m9fLB1uOjBlaLePyfyk9rkfcXoD65Z21GE6ye2kzkZi/ZzYeItXupdh/FQMMhsPViLAtx6272cseKMG+jOUphi1v8dhViOf0me/BWQ42OpvQtKjMkbt6kO5y1uanRYQE6q+45/AfIMUtB3Z6wijndFh8k6cjVcFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIH8WHxu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIH8WHxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA06FC4CEEA;
	Thu, 27 Mar 2025 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108919;
	bh=ONkCbb0X17pJcuDecoMQku1CkhbCOHuD9g7WoFvQdLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OIH8WHxu54I04RN3wXOUMG9VJpAgpHEehd7a38Jtk7UUIEcgFoZ8md/RhiHfglbYh
	 Liy5Vr0S92RBSMucYqjsHeoaPbZkAUSFXB3BMwx73JzVtHSMODmZB5Czov0vG7dcB6
	 cIg8RTalz2+XJUKFwCtYJCgXXc1cDsVRwrLm4sr3k7ya92uTWpXqhfWY/g/9OL8FqW
	 eRnki22AzZXj6+NMf6Lm42AFEMm1nAB4SlvPLK30A2q00Xq56Je6cUB8B74sXnsYrW
	 qnVNihFiE46BpV2fU4/RpKZyxL/YC8ajRNV4Jlu8vfTachB+9khTjEwhVmNN45YsoT
	 VANIVXKFTxSmw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 33/41] x86/alternatives: Rename 'text_poke_int3_batch()' to 'text_poke_int3_batch_process()'
Date: Thu, 27 Mar 2025 21:53:46 +0100
Message-ID: <20250327205355.378659-34-mingo@kernel.org>
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

Make it clear in the name that this is the function that does
the actual batch processing (patching).

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 40e86b41bb86..6c3850527bd5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2462,7 +2462,7 @@ struct text_poke_int3_loc {
 	u8 len;
 	u8 opcode;
 	const u8 text[POKE_MAX_OPCODE_SIZE];
-	/* see text_poke_int3_batch() */
+	/* see text_poke_int3_batch_process() */
 	u8 old;
 };
 
@@ -2532,7 +2532,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 		return 0;
 
 	/*
-	 * Discount the INT3. See text_poke_int3_batch().
+	 * Discount the INT3. See text_poke_int3_batch_process().
 	 */
 	ip = (void *) regs->ip - INT3_INSN_SIZE;
 
@@ -2590,7 +2590,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 }
 
 /**
- * text_poke_int3_batch() -- update instructions on live kernel on SMP
+ * text_poke_int3_batch_process() -- update instructions on live kernel on SMP
  * @tp_array.vec:		vector of instructions to patch
  * @tp_array.nr_entries:	number of entries in the vector
  *
@@ -2610,7 +2610,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
  *		  replacing opcode
  *	- sync cores
  */
-static void text_poke_int3_batch(void)
+static void text_poke_int3_batch_process(void)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2856,7 +2856,7 @@ static bool tp_addr_ordered(void *addr)
 void text_poke_int3_finish(void)
 {
 	if (tp_array.nr_entries) {
-		text_poke_int3_batch();
+		text_poke_int3_batch_process();
 		tp_array.nr_entries = 0;
 	}
 }
@@ -2866,7 +2866,7 @@ static void text_poke_int3_flush(void *addr)
 	lockdep_assert_held(&text_mutex);
 
 	if (tp_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !tp_addr_ordered(addr)) {
-		text_poke_int3_batch();
+		text_poke_int3_batch_process();
 		tp_array.nr_entries = 0;
 	}
 }
-- 
2.45.2

