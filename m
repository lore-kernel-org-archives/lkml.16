Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C4187553
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168448; cv=none; b=HXVmCshO9IIE6woROqO9Y0Y/ciQSqBZRe32+fJ/3iYB/mOjAJY0hUSm7GfvaXfePISxaDC25K6eBRrN5l7lVXkSXg6OlDv/Sh3LCfTDOODPsGjguMipCJdce9OWo6WYJZu1//NIBR/+xP2qMOBXPQrSgx1yudPFV9DUKRc3iviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168448; c=relaxed/simple;
	bh=eH4uwFqoC9JgVc1kv7VNnXR333bL5REyM/EgEQ04P/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pp3ferUTloX9Qjv9whcLT7HdTJ8uxM8LE86suh1dyXAt6gXwYBIJ9xkiA6wUkTmyFWYyDmbW/QLlaDkfCrRey+33gBMXungSb2u3w2rY3KackjKEbeWJzQjo6VYLtq2LY5yNbJfpkP6RS801WeKe+fk9A+Ld9+sc7nYgWZD7tT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePJKZ/P9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePJKZ/P9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13C3C4CEE5;
	Fri, 28 Mar 2025 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168447;
	bh=eH4uwFqoC9JgVc1kv7VNnXR333bL5REyM/EgEQ04P/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePJKZ/P9dyz1VoMXkNDx7NK1NHbAJKW4iFYRrUbyzQZbi5TgrvEAuuXwcHdszxZfv
	 df4LlX4wpxeAaprZ/S+Z3QU63HBXLZRhsTsjgEWDWAupq9w7QJPkf/RNwGSANTb/8B
	 a0Ue/42zLtbgbtDrb/ryMgp4012HBPW73KDcVmYH0evc3l5nL7ivbJuO2g39oqytYx
	 gDpO7+KHLUMbJnQ3vnOJ8fGJ1aY8VC0O5eTGUfUnMGqwWTvdXozrKtPmHARpRxdf7Z
	 TpdFD+J6phc4o4LYWsRO0J4LaLXpY8v3vHjfjmXCc7RrfFdqELSsVow0fZwT1wwvB0
	 bwnO7MSBhgyiA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 02/49] x86/alternatives: Rename 'bp_refs' to 'int3_refs'
Date: Fri, 28 Mar 2025 14:26:17 +0100
Message-ID: <20250328132704.1901674-3-mingo@kernel.org>
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

