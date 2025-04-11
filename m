Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972927EC68
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350082; cv=none; b=Oh8xWnjo9gvOlrHWygNrUqZndhmTTxRynvjg+JrWBAQW8yeKzcYqOSXIG99BQoJdvyWstrr6376tzd/EGoKsJAQl206cYxgmwjHT0THrQ8miL/IvdifAR6oQEQlph+cvdJBkrqyAKv3nj1RXfGSR5tnqtAVZzDoJf6NkaLSFUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350082; c=relaxed/simple;
	bh=eH4uwFqoC9JgVc1kv7VNnXR333bL5REyM/EgEQ04P/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxowmoPdyMlahnQc3VotVPnuZgVnVfm3yLphSfCD9tgv1bvZ4cYCik2wRUGP7gqT4OsfpgeO7gWPePzm6bhdtcP+nqe/E9KVYEQWQ5F2h0KlaW1SrLXnDMYyq6Vix2ED/6yZCTO6UCEX9qoYYhYB3CTnl5ctT+J1qLY5D6hEcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgX7uXqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgX7uXqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4EEC4CEE9;
	Fri, 11 Apr 2025 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350082;
	bh=eH4uwFqoC9JgVc1kv7VNnXR333bL5REyM/EgEQ04P/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgX7uXqXRTOj42RdPRWlSHsGJndFDWvhf5eHkyfnleGF32ZsbgCOuV7tVu1Q0x0OE
	 jBr4w6IUPFgFW2DinSCoYHQWX8dVCIfXLiX4mE24arUv7MwPDPhAH0wchKTV4QnXgH
	 GFxK5uJMYjlqqtYcxA7HSqqI3A8eNI2ZRgqtxVmQaea4hYiABbpEDTjWfJbGXQ4sG5
	 s9GCYHPjaJHKRh0ZdSCvHRXodEhWrN8dv1eHh5Ch9EhmnlRQiyWDCBspB/B6/iwknq
	 iW4EzC9Sd7X0+4rallopGqzAcK8mtRsKYvB+piZSiSxc9w2AWIxOdS9twuA+BC2et2
	 4qpaifQETAGSA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 04/53] x86/alternatives: Rename 'bp_refs' to 'int3_refs'
Date: Fri, 11 Apr 2025 07:40:16 +0200
Message-ID: <20250411054105.2341982-5-mingo@kernel.org>
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
 arch/x86/kernel/alternative.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4e932e95c744..cb9ac69694fb 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2476,14 +2476,14 @@ struct int3_patching_desc {
 	int nr_entries;
 };
 
-static DEFINE_PER_CPU(atomic_t, bp_refs);
+static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static struct int3_patching_desc bp_desc;
 
 static __always_inline
 struct int3_patching_desc *try_get_desc(void)
 {
-	atomic_t *refs = this_cpu_ptr(&bp_refs);
+	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
@@ -2493,7 +2493,7 @@ struct int3_patching_desc *try_get_desc(void)
 
 static __always_inline void put_desc(void)
 {
-	atomic_t *refs = this_cpu_ptr(&bp_refs);
+	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	smp_mb__before_atomic();
 	raw_atomic_dec(refs);
@@ -2529,9 +2529,9 @@ noinstr int poke_int3_handler(struct pt_regs *regs)
 	 * Having observed our INT3 instruction, we now must observe
 	 * bp_desc with non-zero refcount:
 	 *
-	 *	bp_refs = 1		INT3
+	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
-	 *	write INT3		if (bp_refs != 0)
+	 *	write INT3		if (int3_refs != 0)
 	 */
 	smp_rmb();
 
@@ -2638,7 +2638,7 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
 	 * ensure reading a non-zero refcount provides up to date bp_desc data.
 	 */
 	for_each_possible_cpu(i)
-		atomic_set_release(per_cpu_ptr(&bp_refs, i), 1);
+		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
 
 	/*
 	 * Function tracing can enable thousands of places that need to be
@@ -2760,7 +2760,7 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
 	 * unused.
 	 */
 	for_each_possible_cpu(i) {
-		atomic_t *refs = per_cpu_ptr(&bp_refs, i);
+		atomic_t *refs = per_cpu_ptr(&int3_refs, i);
 
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
-- 
2.45.2

