Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBAB223710
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168516; cv=none; b=g2KU+I0EE+6QGnGMbJMVVGB/5576O3UziWxsWWIJjA43mlXZpCnmUA25El6u1l43nU20MCYtpFFnB4OEG/4o/eQ2yi557cEcGviNh8LRDIjXUcbChIAZAWZhVXDO2RCKBprm7iFqdIYIq8G75G5uZcqiNShnxtjYYYW0j5aBtIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168516; c=relaxed/simple;
	bh=EZlry9YGM4+MhtQBNcg39fAOXvL+lWRdpnTzqvT2UhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jmt5SBz2Iu1ORqrKtqBwOisR7Q+Q8+JUoEANfTwbDfU5k+dOqQYBDxDO3yXbzpXIl7ZDWNdZuzIiJ1fcdABnpVdv0eywTV5Pd7bHc+cFQPQRDIVNdq7yHsAyyNN32uvmKYyh9obg1JKIsB3aGStV+Lk3JbLx1dWM9ND6YJcDDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNSFqfGV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNSFqfGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A472CC4CEE4;
	Fri, 28 Mar 2025 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168516;
	bh=EZlry9YGM4+MhtQBNcg39fAOXvL+lWRdpnTzqvT2UhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNSFqfGVTfKvfOjWziOFlNdh669b3TdSpU+laAE0LFq1TsZA6dhWxj1k97IROAACA
	 7lJg8vcJmerTTbeXF1ASYKaJN3bi76D8z1NVPW6mPLGDaTlS5W5VgMoxt9XpVI58SM
	 PMHdPS/QHHBkRU0yTr2qm+5SmY3L+heWIZVp/j4457qQ6sC0WQegnWMZq9XCSWidTN
	 ee4KA/xi1tQaizkDkMCOlbqNy4fzNc89Wa+4d8SlkFrDHES076vBqqBGiiXwA5xSR3
	 qyYUpBVjgWrg2TWXfSAl/4alw8UsR9DenUYNPhiYt0NjzYzN54PkpNXSicyFVHzgVn
	 eZVCD1R67Utgg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 30/49] x86/alternatives: Simplify smp_text_poke_int3_trap_handler()
Date: Fri, 28 Mar 2025 14:26:45 +0100
Message-ID: <20250328132704.1901674-31-mingo@kernel.org>
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

Remove the 'desc' local variable indirection and use
text_poke_array directly.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 12f0fd35773d..57d7032eca41 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2511,7 +2511,6 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 {
-	struct smp_text_poke_array *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2531,9 +2530,6 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 
 	if (!try_get_text_poke_array())
 		return 0;
-	desc = &text_poke_array;
-
-	WARN_ON_ONCE(desc->vec != text_poke_array.vec);
 
 	/*
 	 * Discount the INT3. See smp_text_poke_batch_process().
@@ -2543,14 +2539,14 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	/*
 	 * Skip the binary search if there is a single member in the vector.
 	 */
-	if (unlikely(desc->nr_entries > 1)) {
-		tp = __inline_bsearch(ip, desc->vec, desc->nr_entries,
+	if (unlikely(text_poke_array.nr_entries > 1)) {
+		tp = __inline_bsearch(ip, text_poke_array.vec, text_poke_array.nr_entries,
 				      sizeof(struct smp_text_poke_loc),
 				      patch_cmp);
 		if (!tp)
 			goto out_put;
 	} else {
-		tp = desc->vec;
+		tp = text_poke_array.vec;
 		if (text_poke_addr(tp) != ip)
 			goto out_put;
 	}
-- 
2.45.2

