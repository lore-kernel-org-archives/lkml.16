Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8772366
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745740021; cv=none; b=jRQzBxAEb+AiiMvzwJL9kgBsqq5N4/xkpdZFPr3rwVmMaPs1SAMjFxFWvtaVBYexapplw1HUjqvzplpfnSIAq9ikFS346doOcfF0YlSpIlzr02YG+Y7sv5nlJfCADbogTQFSYJsY613Sg5eL6H2rnjoNTkau77DmbEix92d5gBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745740021; c=relaxed/simple;
	bh=7QBJXjkV2L56gG6MiEoXjLD3CrApzhdOcD8sdMhPUss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDSt0geBX6AnBiyLKWvWffYhwY9hwyikgyqor3iMn0/6etZcPwUMO8HzBsk0zCGNOnrTi1BNfYRPrT43xE7qZNKhr/tS3K3X8TP8VitK4qGN0U5s8lBe+3haL7VNQPO2aHBAhoZefGCWdwrRMkTjGh0L4cegmmYbfKc9hN+YXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIsffUCP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIsffUCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E10EC4CEE3;
	Sun, 27 Apr 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745740021;
	bh=7QBJXjkV2L56gG6MiEoXjLD3CrApzhdOcD8sdMhPUss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIsffUCPr7wuzn8j7giOGUO7WyCoIxwiEw8ZggA6BkUoGfl7JEe6LZfgB7vDjxpyo
	 rknImkTZSzmcDhHO6OTkoAJS+7HrVYrn2M7gXDu7CwrkpnOnDYQN5hzMjJwMZaojEs
	 OvigwKs8ahk17RXC4C2p+pLAqLst2NHqaIFzSMT1MzE7bhkZ1Ee5/mgApSGTqou8ox
	 PGgqGSbwp0yCy+9Vyz3j8nN1fAZPlHNV/fZgVgTbq+vxAItmHIgjJ5i0l/F5fTTLfh
	 3Xydu4cflnkS4Ydj16YQXOCvBqj8esw1M1D1VrcMqeCxoEmARYPCRQBngLIoTruJ5k
	 b8/DJofLfByKQ==
Date: Sun, 27 Apr 2025 09:46:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH -v2 14/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
Message-ID: <aA3g8BVjYUiBuAT6@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-15-mingo@kernel.org>
 <15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> Please see the attached patch that implements the change.

Thanks! I've turned this into a commit with your SOB, replacing my 
placeholder patch, see below.

	Ingo

===================================>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 25 Apr 2025 16:05:14 +0200
Subject: [PATCH] x86/percpu: Remove !CONFIG_X86_CX8 methods

Adjust the constraints to the non-alternatives asm() statement.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
https://lore.kernel.org/r/15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmail.com
---
 arch/x86/include/asm/percpu.h | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 5fe314a2e73e..bef13b358f7b 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -333,13 +333,10 @@ do {									\
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
@@ -362,15 +359,12 @@ do {									\
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
