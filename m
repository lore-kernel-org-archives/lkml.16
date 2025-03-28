Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10118224B1E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168523; cv=none; b=bgFXP7gor55U9TNptn5cKmym6yQJKTwOmZg5K7J/hnDnZvhz8jlzodn+u5QOKJMP3xfleF3OFTFb8sbiocIibMMKQ4zR62EZbzOjnS9YrtrqV6HN0hN1HPj2850Ps+YRgP1Ln8KAXsgQOupZVpNYiUeQCKWfqTLHLYhfjC6pFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168523; c=relaxed/simple;
	bh=UpTa7HbnLutWCablTZi3Ycvpp3cytPgIcdTdr0TMsb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovvxw2pv6rcoV8ujrr5Yy6gyaEVieJSZmkmVwuusT9jWDDMEjySSQrEWDtCw10+MuDEXs2DDBXWRVy3fS8W9vYU7e2qTR54zptOrwVpqHx1H1VA+eHL3xnOZT/RuDfnSueHNWMmhl/ecIkbj28YEg5EoeUO70KRf3+reQ7Z8iV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjzUUxYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjzUUxYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9002FC4CEE4;
	Fri, 28 Mar 2025 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168521;
	bh=UpTa7HbnLutWCablTZi3Ycvpp3cytPgIcdTdr0TMsb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjzUUxYllBLSh4Ll5420EkwL5zUrV0/z3CvlSER927Q7Fpo4gcaTlO73x21qqS9IF
	 ZoNYEw5DUdLGV1bVMrMzUV+ZmX6aRQhKVVZVCqrpKroTjV99d3ZZuZ2IH6TZUmhL7A
	 v4TgK8L7QMMiZ2b8Breoy0F2DZaA0mX20VsHZwflP3ycT6/kKBz69XB9Xnf0dWgsjv
	 ZjVo/DSJxxmLdtiNUYqTaaBknr3IMYGHqQ4a199kMb4qSuhHsHLjnon6kcmUliYf1m
	 +fNCypoxg4kJMlrTLWTY1h1UIfOuSUBZ2lxVK/6MSNjfSobnzu2Y4rRM7NruBqHt/c
	 /jAKK8++EHIZw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 32/49] x86/alternatives: Rename 'int3_refs' to 'text_poke_array_refs'
Date: Fri, 28 Mar 2025 14:26:47 +0100
Message-ID: <20250328132704.1901674-33-mingo@kernel.org>
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

Make it clear that these reference counts lock access
to text_poke_array.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 34d3c69595a0..566b857d210d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2473,11 +2473,11 @@ static struct smp_text_poke_array {
 	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
 } text_poke_array;
 
-static DEFINE_PER_CPU(atomic_t, int3_refs);
+static DEFINE_PER_CPU(atomic_t, text_poke_array_refs);
 
 static bool try_get_text_poke_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&text_poke_array_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return false;
@@ -2487,7 +2487,7 @@ static bool try_get_text_poke_array(void)
 
 static __always_inline void put_text_poke_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&text_poke_array_refs);
 
 	smp_mb__before_atomic();
 	raw_atomic_dec(refs);
@@ -2522,9 +2522,9 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	 * Having observed our INT3 instruction, we now must observe
 	 * text_poke_array with non-zero refcount:
 	 *
-	 *	int3_refs = 1		INT3
+	 *	text_poke_array_refs = 1		INT3
 	 *	WMB			RMB
-	 *	write INT3		if (int3_refs != 0)
+	 *	write INT3		if (text_poke_array_refs != 0)
 	 */
 	smp_rmb();
 
@@ -2623,7 +2623,7 @@ static void smp_text_poke_batch_process(void)
 	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
 	 */
 	for_each_possible_cpu(i)
-		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
+		atomic_set_release(per_cpu_ptr(&text_poke_array_refs, i), 1);
 
 	/*
 	 * Function tracing can enable thousands of places that need to be
@@ -2745,7 +2745,7 @@ static void smp_text_poke_batch_process(void)
 	 * unused.
 	 */
 	for_each_possible_cpu(i) {
-		atomic_t *refs = per_cpu_ptr(&int3_refs, i);
+		atomic_t *refs = per_cpu_ptr(&text_poke_array_refs, i);
 
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
-- 
2.45.2

