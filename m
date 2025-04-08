Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47B263F44
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100488; cv=none; b=PeVfEtNZNYBs1dmgy4wyMwr26vA/Cs2G2M4XmgxUhw+fDHJFoiFkOz4IOsw9ZLHMlvYgT6KQaotDPUauHS+ykmKtIkc5P5f9CL+EgvQTHpWG1X3WBTE0VzoAsx5HdIhix1Cj1C+hKFSeTzf1XV5ly4iKZKim5CPEQK937vUsl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100488; c=relaxed/simple;
	bh=BFxGxGhS95knSx6gCE3mMHsG8u8tZ7dQkfm8+7hymJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N47kxaTltBNowI1F3nrHwub2K6iOWiyCVghE2sfT5HQFnZy1YQ1ZM/6neGyWc7Xb6zV48GdSrrGY8+0i9d2tAtz9X5iwY/Jdx6S2K0Ju6E2nPqQLpitv7X8rGvdXBC1m0QwblUKdwNMLh1qt/AeDeYk9roLqf7v+g1vvwQ035PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mb25JYUz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mb25JYUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E738C4CEED;
	Tue,  8 Apr 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100487;
	bh=BFxGxGhS95knSx6gCE3mMHsG8u8tZ7dQkfm8+7hymJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mb25JYUzXC7p940p6v1/j8cT9iPgXtp0r39GL1FJl11uIQivXLKjjV6RmXGHZ2fNi
	 vTXnVD7dF8/2gAXuHvIInETgGFKt+03BFdAC4Z9UVdj+nZD2m+w4nszfEilUVpDL9x
	 d2vl4mR343+c/hR56aqRFBXJzhszcrUFiO/Oec02ZX7Q9V5kMDt5Jfrfz12hQHugjP
	 24lhL/9sD9q1eNyNFA5HWDshHLu+U87ig4Z2GyXugd786u4ita9/KD/oCHKYSIWA/V
	 vnM4/EaNxzpVmlFPizrqbz/LVum00WCBKq+T0OpNreq9UENMddAqFG96BEp4hQtFYa
	 m4lHMuU34cZ1A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 2/5] objtool, x86/hweight: Remove ANNOTATE_IGNORE_ALTERNATIVE
Date: Tue,  8 Apr 2025 01:21:15 -0700
Message-ID: <e2be2dfe46dbe432375f2fafcb1dbdce1143af99.1744098446.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744098446.git.jpoimboe@kernel.org>
References: <cover.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since objtool's inception, frame pointer warnings have been manually
silenced for __arch_hweight*() to allow those functions' inline asm to
avoid using ASM_CALL_CONSTRAINT.

The potentially dubious reasoning for that decision over nine years ago
was that since !X86_FEATURE_POPCNT is exceedingly rare, it's not worth
hurting the code layout for a function call that will never happen on
the vast majority of systems.

However, those functions actually started using ASM_CALL_CONSTRAINT with
the following commit:

  194a613088a8 ("x86/hweight: Use ASM_CALL_CONSTRAINT in inline asm()")

And rightfully so, as it makes the code correct.  ASM_CALL_CONSTRAINT
will soon have no effect for non-FP configs anyway.

With ASM_CALL_CONSTRAINT in place, ANNOTATE_IGNORE_ALTERNATIVE no longer
has a purpose for the hweight functions.  Remove it.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/arch_hweight.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
index cbc6157f0b4b..b5982b94bdba 100644
--- a/arch/x86/include/asm/arch_hweight.h
+++ b/arch/x86/include/asm/arch_hweight.h
@@ -16,8 +16,7 @@ static __always_inline unsigned int __arch_hweight32(unsigned int w)
 {
 	unsigned int res;
 
-	asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
-				"call __sw_hweight32",
+	asm_inline (ALTERNATIVE("call __sw_hweight32",
 				"popcntl %[val], %[cnt]", X86_FEATURE_POPCNT)
 			 : [cnt] "=" REG_OUT (res), ASM_CALL_CONSTRAINT
 			 : [val] REG_IN (w));
@@ -46,8 +45,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 {
 	unsigned long res;
 
-	asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
-				"call __sw_hweight64",
+	asm_inline (ALTERNATIVE("call __sw_hweight64",
 				"popcntq %[val], %[cnt]", X86_FEATURE_POPCNT)
 			 : [cnt] "=" REG_OUT (res), ASM_CALL_CONSTRAINT
 			 : [val] REG_IN (w));
-- 
2.49.0

