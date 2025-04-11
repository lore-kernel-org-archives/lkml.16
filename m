Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52353293B72
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350125; cv=none; b=mGGQqUb25+VB0Q2AFD40uR3cPIio3l7V0J1N3MVz65TCaX3By+3IYOOEJywVsJltXFHEFCJyBPGIRSjQNTUwXEOYioQ8g/nl/Kj9owcEMJgqieCisIL66CFEHf/nVR90dhqzYGKJKrf2RxqSRg1PPRj+XKAsrCPYm7jTOVgrtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350125; c=relaxed/simple;
	bh=5ve/rJJkqY9+wXdI0eiSUbGq+zG5vSV+XhyvzG//1yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkgxj5v+9xasgj6kkajRlrjQ9F3T+1Y/B32Cy5HAQWFnr4JGuxJng9Kv6nXHr9/XVt4rKVNdoACnf2uGIuMFXgiKULywUWlMEwfJMbPuILGCwK9Ba8mqWUw0YLDgk1ouplMRZL4d3L9QXNqyfyskjusJ5yH4LgfkCZS6nP6j1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR2uGARw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR2uGARw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50DEC4CEE2;
	Fri, 11 Apr 2025 05:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350124;
	bh=5ve/rJJkqY9+wXdI0eiSUbGq+zG5vSV+XhyvzG//1yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR2uGARwcn3CECP5GL0K9EJeifsbLMI+jSKJOoB5xEGPtgN0WdtQKyU7BbAW1fCqO
	 zhZiHGf/Z4zmaTnf74IIV90pNS+JhfaKE5KlyhPjyy4kKJPY2HeMisGRNNiIAEbnDg
	 IhVdBgSLb3+jVTmdew4F/M/pFIaLOA1LRGlF7fmtjYK1UbugTebmOz54AiavV3IsEI
	 mr++I5X5CYrgqfnx0TY7lJl2karI4ccWygELDMIknGXAFmdb66/0RcLkLsjXqrXE5v
	 lY1P+yNbg+wXg+uwNHYSwfaG2+obOFOgt5j9iSl+Z3OYP6gKYJRbr7nqfR23pIYeut
	 PuYMdLGDRL8xw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 22/53] x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
Date: Fri, 11 Apr 2025 07:40:34 +0200
Message-ID: <20250411054105.2341982-23-mingo@kernel.org>
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

tp_order_fail() uses inverted logic: it returns true in case something
is false, which is only a plus at the IOCCC.

Instead rename it to regular parity as 'text_poke_addr_ordered()',
and adjust the code accordingly.

Also add a comment explaining how the address ordering should be
understood.

No change in functionality intended.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d3d250dcefca..c9fd31d512b0 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2841,28 +2841,34 @@ static void text_poke_int3_loc_init(struct smp_text_poke_loc *tp, void *addr,
  * We hard rely on the tp_vec being ordered; ensure this is so by flushing
  * early if needed.
  */
-static bool tp_order_fail(void *addr)
+static bool text_poke_addr_ordered(void *addr)
 {
 	struct smp_text_poke_loc *tp;
 
 	if (!tp_vec_nr)
-		return false;
+		return true;
 
 	if (!addr) /* force */
-		return true;
+		return false;
 
-	tp = &tp_vec[tp_vec_nr - 1];
+	/*
+	 * If the last current entry's address is higher than the
+	 * new entry's address we'd like to add, then ordering
+	 * is violated and we must first flush all pending patching
+	 * requests:
+	 */
+	tp = &tp_vec[tp_vec_nr-1];
 	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
-		return true;
+		return false;
 
-	return false;
+	return true;
 }
 
 static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
+	if (tp_vec_nr == TP_VEC_MAX || !text_poke_addr_ordered(addr)) {
 		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
 	}
-- 
2.45.2

