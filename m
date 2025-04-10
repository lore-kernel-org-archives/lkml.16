Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775781F8721
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318739; cv=none; b=UvHMGfxTxISVQYEQmnlXVkARVI0aIzaRhASPrK8ue53IjBRiD/4D2OUZtURv+ECLT3sPEkA6P+suSwjEp6yBaq3STdSUganXDC868vUiN2h4xai7lZii5hPwjZaN82Nb1t5mI55rNqwU4mDn+0lUItT3OflEI22haccIlBGNQe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318739; c=relaxed/simple;
	bh=tVc7TLj1ZbQsJPBIjhKOIdCuVtGQ4lCfdRS5WfWJg5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kK+LnNKPONK4+kC0rU7hoiEaXlq9Y5IDBQtArLaPKOW5AKkg0aP7/1r8WsufeCv+GAXXC4qUWGut1a4Lfuxz1zPesmHg8UuDZnFNZGjvZQRDTTwyD1U3wK6objLWFMrKsJuyCrmMHy3INq+P9uAqJGM+y9e19m5tQR/66QxK/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoRCVCUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoRCVCUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B524BC4CEDD;
	Thu, 10 Apr 2025 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744318738;
	bh=tVc7TLj1ZbQsJPBIjhKOIdCuVtGQ4lCfdRS5WfWJg5o=;
	h=From:To:Cc:Subject:Date:From;
	b=CoRCVCUveS5x1NzTLDWLrRko/++/vdOsntxiC1fVMafL0MvuFMdpuRc6eiTK8K5DK
	 dAGjKlxU5zuPnTpCSnhQCqgLAzbEdt1AGhTxB/Uc7ZtSoatO+pwJAIINaC6RfAErVw
	 s5u7NLs63auVSbAPvCkE2FxoZjMJyqbAw4Vl7pxGz6r8zNazlYMdOj/pn7hJN0cO+7
	 Yrl/14ovBCf8pApxiN91LUgFDsqjSYwWVg9YiT67XEK0f6Gc9w+zhyo4xqoLPmRH8X
	 kaDWOLDTkrr9YO5KvjUFpBaFJ2NV5SiabVdQLaHW4VNs5/lZO/kWnSsoipt/LjX5jC
	 nT6u5lE4Np6YA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2] objtool, x86/hweight: Remove ANNOTATE_IGNORE_ALTERNATIVE
Date: Thu, 10 Apr 2025 13:58:35 -0700
Message-ID: <e7070dba3278c90f1a836b16157dcd34ccd21e21.1744318586.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
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

This was originally posted with the RFC series:

  https://lore.kernel.org/cover.1744098446.git.jpoimboe@kernel.org

But it's actually a standalone patch which can be merged independently.

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

