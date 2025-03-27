Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B41DC19F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108848; cv=none; b=K9ureQ22jn7xUMi5igmoJu3yB/db05CFhA6mFHD3HukNRRABUhXfAMLT5U0zBdOybAXQFsO2DQf+rqiNg3FnfLUYY3FHYEByh5qd9bdlLTuz8bEltUnVl0FYELqYbjREE48DSsrAfI3/IpEfFmHGwGwNRI2I8Pt336HHxBzjDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108848; c=relaxed/simple;
	bh=zFMYNqC2tRZgktx72IknhXRNiWbs7PKD/NbUgJ+kXso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWl7B5EZhaHe92y9z6sf+Sdlm6peoi5twgFHmBdiATwdiT3gaKT48PLLIEYAkGE5lSeRzSoZ2/DNgfUDGYDn57knPSpbaGFc7ICjrti3pyImvjf9TzKMSo91LSIu+eajLhVvl7vJkujQwIxtoTS5nYuTR+Uj0lpTHg6q8xEnTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ek9ZsdA3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek9ZsdA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05213C4CEDD;
	Thu, 27 Mar 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108847;
	bh=zFMYNqC2tRZgktx72IknhXRNiWbs7PKD/NbUgJ+kXso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ek9ZsdA35lbHXYiRY5xgIUTy0qjbL4QvMWX06TIVhSX6j6IFhUxSulgW6oAN5RW8q
	 wj8sWERmRhXPlKV4SykzPO/uzm246YrQ8aL7iYOKNVLK25Zw+7TBMGwh8TMFSdvC9P
	 L3Wt/q8neAu8QwdB39nzqxCvZ1T/NqYBQyhLF0kyKKFb0g67+g9QEwYjFOjy3Tz2N9
	 OohEBNY1vH61/bZ11leMYADwQ+gXgUke7WnLLg7r6rVsHuu2vrNLVyral9SkfLeHAP
	 BhDWqNNCU35yPnZg0kjKBSl43xwqNtLoB3qQIpL+QDH8thTbvpEro7PP8LUYd9kMG+
	 jkNYY2IpxAfcQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 03/41] x86/alternatives: Rename 'text_poke_bp_batch()' to 'text_poke_int3_batch()'
Date: Thu, 27 Mar 2025 21:53:16 +0100
Message-ID: <20250327205355.378659-4-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cb9ac69694fb..b0fa770b7460 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2467,7 +2467,7 @@ struct text_poke_loc {
 	u8 len;
 	u8 opcode;
 	const u8 text[POKE_MAX_OPCODE_SIZE];
-	/* see text_poke_bp_batch() */
+	/* see text_poke_int3_batch() */
 	u8 old;
 };
 
@@ -2540,7 +2540,7 @@ noinstr int poke_int3_handler(struct pt_regs *regs)
 		return 0;
 
 	/*
-	 * Discount the INT3. See text_poke_bp_batch().
+	 * Discount the INT3. See text_poke_int3_batch().
 	 */
 	ip = (void *) regs->ip - INT3_INSN_SIZE;
 
@@ -2602,7 +2602,7 @@ static struct text_poke_loc tp_vec[TP_VEC_MAX];
 static int tp_vec_nr;
 
 /**
- * text_poke_bp_batch() -- update instructions on live kernel on SMP
+ * text_poke_int3_batch() -- update instructions on live kernel on SMP
  * @tp:			vector of instructions to patch
  * @nr_entries:		number of entries in the vector
  *
@@ -2622,7 +2622,7 @@ static int tp_vec_nr;
  *		  replacing opcode
  *	- sync cores
  */
-static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries)
+static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entries)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
@@ -2866,7 +2866,7 @@ static bool tp_order_fail(void *addr)
 static void text_poke_flush(void *addr)
 {
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
-		text_poke_bp_batch(tp_vec, tp_vec_nr);
+		text_poke_int3_batch(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
 	}
 }
@@ -2902,5 +2902,5 @@ void __ref text_poke_bp(void *addr, const void *opcode, size_t len, const void *
 	struct text_poke_loc tp;
 
 	text_poke_loc_init(&tp, addr, opcode, len, emulate);
-	text_poke_bp_batch(&tp, 1);
+	text_poke_int3_batch(&tp, 1);
 }
-- 
2.45.2

