Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693441FECC1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108915; cv=none; b=CqjyAe6524i14O2wvy8KMuAhaTIyIcbgLCjg14FJd2//lNKflAgWqiwbrlEt5dLiGq4k/qiiAz7yOdHoQP0IvUp5vCGoQAgqkQUorJA/FFtsUSd+pXq16uf5ZOIWxD4jrkl4+5toC3JTcguH0mOfDtuqSWeRakrsE0IRlPy6Mk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108915; c=relaxed/simple;
	bh=U010mwqqgTBeBus61i+2bfeywY135xwU5UXbS6BSstM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4yLEqd0AudmC41r8FHAwRCcng/93K56BCftyqidAo1leTQX4Kogy875qDre5QHe+WseppoZDo96OpFUPrHQuW7i/MpvbLLWV8eI4SiMDuOxBPhVhr/hceKJy62hFeAShE2iHmDloMhbrZjzWhtRwYVW2mWHO+9Az5aSWYJ16E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFEecOr4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFEecOr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3618C4CEEB;
	Thu, 27 Mar 2025 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108914;
	bh=U010mwqqgTBeBus61i+2bfeywY135xwU5UXbS6BSstM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FFEecOr4bWgZTRx7Kor/dy46f8GNEJKYgy7kgc5WHZ4iJ5h0RTUCCBVm4c6hucoaS
	 pI1ktmE25UVDTVq+YoDbKkTIvvoDIo11v0rgdCiKCYsTrAnnR4DGMQuz/fzmjC2Ug6
	 LHfv9gTjPwpYZQDPAQe3e2oPAz37rp2OcTSFha0PvUFgB0t+zLhOQveuMeEKYwePB0
	 vr2wrhd4frd3owxYLzrYGJFS3nvb98QhcGA6qFfDfufQsaEMEcBMSTaBJV2Ye0rzws
	 lDD34ftmA7aMhLJostwhPOeqK8FvS0mjrfPszhxjyFmOCfbMHEkyNztsVBf1u0Jwyl
	 zMEZUZxKSMcbQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 31/41] x86/alternatives: Simplify text_poke_int3_handler()
Date: Thu, 27 Mar 2025 21:53:44 +0100
Message-ID: <20250327205355.378659-32-mingo@kernel.org>
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

Remove the 'desc' local variable indirection and use
tp_array directly.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 244119066672..9402826e2903 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2511,7 +2511,6 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct text_poke_int3_array *desc;
 	struct text_poke_int3_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2531,9 +2530,6 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 
 	if (!try_get_tp_array())
 		return 0;
-	desc = &tp_array;
-
-	WARN_ON_ONCE(desc->vec != tp_array.vec);
 
 	/*
 	 * Discount the INT3. See text_poke_int3_batch().
@@ -2543,14 +2539,14 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	/*
 	 * Skip the binary search if there is a single member in the vector.
 	 */
-	if (unlikely(desc->nr_entries > 1)) {
-		tp = __inline_bsearch(ip, desc->vec, desc->nr_entries,
+	if (unlikely(tp_array.nr_entries > 1)) {
+		tp = __inline_bsearch(ip, tp_array.vec, tp_array.nr_entries,
 				      sizeof(struct text_poke_int3_loc),
 				      patch_cmp);
 		if (!tp)
 			goto out_put;
 	} else {
-		tp = desc->vec;
+		tp = tp_array.vec;
 		if (text_poke_int3_addr(tp) != ip)
 			goto out_put;
 	}
-- 
2.45.2

