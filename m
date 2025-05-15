Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B42989BB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299488; cv=none; b=BdH5rADGIuOAb9Ae6u6bIQ+xxCizeYDJHppWj1244zUrLZi2t28R22aR9828uKcGsMW07GiAhiIBUJQh1RH+0Ih1ns+D+kEW356dz3PnPcnbWoKHXxQmUg65rcqhzpfTxRP0Aa362uBSlLnmb3/+2GrcUwR/nvDtB/ez8h5VQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299488; c=relaxed/simple;
	bh=gYDGA0xaefmc2y/RBqUcQXigAUipGLSgbAnA6gAXO9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVOqzpRmEY6urC2eFGWS5ZNJFoSl3NPDJwo9YxvwCGEyRSEHcHDZk5x/xFqkWnWvXnEG4T//iGi8B0KVuT/ZVICSYjzd52XoFW7QC3T1DSucuMFE75L191jSN0njudcOI0r0CEKeNEh6ZcNPIEJRjgcBAXBzI6dnjOxy5u7Vl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKFT4kZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKFT4kZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BB0C4CEE7;
	Thu, 15 May 2025 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299488;
	bh=gYDGA0xaefmc2y/RBqUcQXigAUipGLSgbAnA6gAXO9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FKFT4kZ4FNGH3gu04Li43VdZJBabqgAz2flT9/jvuuqLuSAYIF+7NaKyQe+QXfnlp
	 DyQ5TNZ0MTiM6Et2ZO2DOh9gdfUMwJkqvw3jZCaTm+nGhvD/N5i3+8pdEx2gHOb3PB
	 hg0aqKUorsctqRCrpgBYWo1X4dk8YMwDpXADBm/0Mprju0SdMV3uz3h9vNn5lYnhIX
	 UvUeKlYPxinnqugTixHw6lK2nvAJ0vdLhuWEVhEbbSvnpfqamcZCO3tl+3ASVZO6jK
	 MNEHfdpY2GbEZnQ+53pS6K2oI5eBpROHDbPYcvTQxE6z74fRYDSKL4o6yiG8qGX8Kn
	 AezBzP0KjBHFg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 15/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
Date: Thu, 15 May 2025 10:57:05 +0200
Message-ID: <20250515085708.2510123-16-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515085708.2510123-1-mingo@kernel.org>
References: <20250515085708.2510123-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Uros Bizjak <ubizjak@gmail.com>

Adjust the constraints to the non-alternatives asm() statement.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: "Ahmed S . Darwish" <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmail.com
---
 arch/x86/include/asm/percpu.h | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index b0d03b6c279b..64c2e715af63 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -335,13 +335,10 @@ do {									\
 	old__.var = _oval;						\
 	new__.var = _nval;						\
 									\
-	asm_inline qual (						\
-		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
-			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
-		: ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),	\
-				"+a" (old__.low), "+d" (old__.high))	\
-		: "b" (new__.low), "c" (new__.high),			\
-		  "S" (&(_var))						\
+	asm qual ("cmpxchg8b " __percpu_arg([var])			\
+		: "+m" (__my_cpu_var(_var)),				\
+		  "+a" (old__.low), "+d" (old__.high)			\
+		: "b" (new__.low), "c" (new__.high)			\
 		: "memory");						\
 									\
 	old__.var;							\
@@ -364,15 +361,12 @@ do {									\
 	old__.var = *_oval;						\
 	new__.var = _nval;						\
 									\
-	asm_inline qual (						\
-		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
-			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
+	asm qual ("cmpxchg8b " __percpu_arg([var])			\
 		CC_SET(z)						\
-		: ALT_OUTPUT_SP(CC_OUT(z) (success),			\
-				[var] "+m" (__my_cpu_var(_var)),	\
-				"+a" (old__.low), "+d" (old__.high))	\
-		: "b" (new__.low), "c" (new__.high),			\
-		  "S" (&(_var))						\
+		: CC_OUT(z) (success),					\
+		  [var] "+m" (__my_cpu_var(_var)),			\
+		  "+a" (old__.low), "+d" (old__.high)			\
+		: "b" (new__.low), "c" (new__.high)			\
 		: "memory");						\
 	if (unlikely(!success))						\
 		*_oval = old__.var;					\
-- 
2.45.2

