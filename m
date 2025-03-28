Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB25F1940A2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168450; cv=none; b=sGPQr8K9MHqbiuPL9yN16MESxp+eFbCe585s9Q8tlo++gW4GncCmr1mhegUqcze7QKvTJzjH5WRgtjnp4eoKATTb0nbFGRDXqQvI/LpgvuBGyyJ64ddyhGqOoQRYpKnMiRzqmzWRhHPlcnted5Rj4bxmm/WDR4P8QiiNn01PoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168450; c=relaxed/simple;
	bh=7JfDcVoLgx2cHFr+F4A6UUUHRHLY28KYtLPQwaCZdD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jET2cgY9UXX4DJK16M0FiJBuFFfB4JtlQkQgJLLQszk9U9MbiB3EgN6vnETX6XfCqSv1NvoJoRpiw2plqUGS2vbiA+aGDpw/aB/zulRw4uSNXfNgvAEtAZDQ4DCjrKik1vsPhcUYvuAE2rM1SUzOYdPHZz+4o8Y7qXKXV3dI/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alPvwGcW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alPvwGcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB75C4CEE5;
	Fri, 28 Mar 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168450;
	bh=7JfDcVoLgx2cHFr+F4A6UUUHRHLY28KYtLPQwaCZdD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=alPvwGcWMAd0YE3HanXlMPA2Xywf033Kbq7EwjBhYwCLKbEa60Epe5BPvfJI8m+ku
	 r9d79bEMiP0fbZQVTYTgYPGBjxDyL8efc/bzHsw76nzLilWK8z2GMjkG7LHN7wkJSn
	 TcCudgX/PB16KmHpuPItYM0Z7LTPi5oCVZHQXGT/HFzFthkAjiBbdKWwUyu7Yfwfyj
	 g83hB0PRtmnos7mvC3Bb4DANo/+rOD0QB2gc9HKCAWV44Q7KoTY8TvgDfS3GKYVQi7
	 fKnhYXFXkTuFOKO9oIBGSgmxWLRPh696uVYBL+XyNbR9Zdzk/IdSfrMY+T5mndHyOa
	 CyUgkTikl6F5Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 03/49] x86/alternatives: Rename 'text_poke_bp_batch()' to 'smp_text_poke_batch_process()'
Date: Fri, 28 Mar 2025 14:26:18 +0100
Message-ID: <20250328132704.1901674-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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

