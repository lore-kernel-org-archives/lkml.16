Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720927EC92
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350084; cv=none; b=tMAH5nCfdHhhP4WxJMYG9ry5nbMfKE/D5uPfmONJ85t9AVGSZhcu1N4a2GN1J5YX04Jdup0V3gfkUUNUheHS3zcKrnaHXzyD3mFV9OwG6onOTJT63kS1T3SFPlFPP+PSt4BGsIfx5dE7RcXFxr3R9xFZmaJ+DN/SgKNcjRr5IA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350084; c=relaxed/simple;
	bh=7JfDcVoLgx2cHFr+F4A6UUUHRHLY28KYtLPQwaCZdD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kf9iXoEgj5l/rahUNR1eSGZ1vQxVo6ZyJjdzqYfKWZi6bNT2sY/okGmQZ1O0CC8VoDgfJX0tPK+DiRU+nbwxkB0yCURkG4EEr1Rqiuaseyr28XaA/3AhDqkNyqvZvcP2u4M/V6bqOtTeXtQPavZaNF4E4zrzQSyycSlzankhyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQPCmPB7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQPCmPB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E27DC4CEE2;
	Fri, 11 Apr 2025 05:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350084;
	bh=7JfDcVoLgx2cHFr+F4A6UUUHRHLY28KYtLPQwaCZdD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQPCmPB7rxVqSiJYRCW264eCfrS/DwYfnoe5iMhi1pO8FXjVA7EBtYIDQhmEPyPOF
	 v4/K+C15AAqnK2VHr+yA5TXHCfPAu3nEp98DK04ZxeLFGVWJjW3uKSvgEx9n3uNB60
	 sYU5qvCHWDhdK6lGkoVN0BWXn3QJJDc1vDztmrMI7fTcPdn1UK+Ze11emHw1M7/QoW
	 khJmK2wDkx4WUPC11sI+rhvY5baiYkH2bU0qxjq/a+Lfv3a09SO1TdVZPuApSgGZQJ
	 10aIPMRTjRX+7r/hnqIfmCvUHrIXaEn3aiTmd3f4AxLT7dvQG73R5nJ0jxKx8R2DMI
	 BU4+PmxBwrpaQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/53] x86/alternatives: Rename 'text_poke_bp_batch()' to 'smp_text_poke_batch_process()'
Date: Fri, 11 Apr 2025 07:40:17 +0200
Message-ID: <20250411054105.2341982-6-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cb9ac69694fb..7305c29bc8d1 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2467,7 +2467,7 @@ struct text_poke_loc {
 	u8 len;
 	u8 opcode;
 	const u8 text[POKE_MAX_OPCODE_SIZE];
-	/* see text_poke_bp_batch() */
+	/* see smp_text_poke_batch_process() */
 	u8 old;
 };
 
@@ -2540,7 +2540,7 @@ noinstr int poke_int3_handler(struct pt_regs *regs)
 		return 0;
 
 	/*
-	 * Discount the INT3. See text_poke_bp_batch().
+	 * Discount the INT3. See smp_text_poke_batch_process().
 	 */
 	ip = (void *) regs->ip - INT3_INSN_SIZE;
 
@@ -2602,7 +2602,7 @@ static struct text_poke_loc tp_vec[TP_VEC_MAX];
 static int tp_vec_nr;
 
 /**
- * text_poke_bp_batch() -- update instructions on live kernel on SMP
+ * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
  * @tp:			vector of instructions to patch
  * @nr_entries:		number of entries in the vector
  *
@@ -2622,7 +2622,7 @@ static int tp_vec_nr;
  *		  replacing opcode
  *	- sync cores
  */
-static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries)
+static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int nr_entries)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2866,7 +2866,7 @@ static bool tp_order_fail(void *addr)
 static void text_poke_flush(void *addr)
 {
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
-		text_poke_bp_batch(tp_vec, tp_vec_nr);
+		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
 	}
 }
@@ -2902,5 +2902,5 @@ void __ref text_poke_bp(void *addr, const void *opcode, size_t len, const void *
 	struct text_poke_loc tp;
 
 	text_poke_loc_init(&tp, addr, opcode, len, emulate);
-	text_poke_bp_batch(&tp, 1);
+	smp_text_poke_batch_process(&tp, 1);
 }
-- 
2.45.2

