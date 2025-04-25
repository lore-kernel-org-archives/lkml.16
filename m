Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088D2405ED
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570594; cv=none; b=fqWBRGcnwK6211MPkGeF54IcDfEM4JFkwweuQCe8gLTjvP4Sr9+GqHG96509gfI5n6wc24SMiQLIoTTGLcL7cIY0ETFeLlgsq6UvkvVKTNXV/Xdk7BdF8m97NtynwauJiY74XJ2/PoyT3TEvTJq6qmPYuwEgKUvmT57oVFXxSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570594; c=relaxed/simple;
	bh=H8+xtiVtHrfrCZRjSrPB/Hj9vn3IESIhdZ5/u8JIxgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/lae6UJNdYTNJjjrBT4we7JXL7HdC8JfFkubRC+IUs1bolJdaoGUWhntwOaDB6+HbTJ8vlHzr8Ygo5IFROZ92+LGfKTiYeieJoif0f1iOxl30ucwyvLuZtDUzPI1iSRnbIgsBFBSEGpnCcoRIFrJ3yDTNbcfhGxgPpyAZFrnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0RF6+og; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0RF6+og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257C1C4CEE4;
	Fri, 25 Apr 2025 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570594;
	bh=H8+xtiVtHrfrCZRjSrPB/Hj9vn3IESIhdZ5/u8JIxgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a0RF6+ogWddDRbGfTikZ6DAmUrCYzU8xRfptmroiAuMvFvoy3r5ielFeJpDot5P41
	 kqJ55PnNLQDHTYoXqbg9cZIMypqc21aZX9ENeHxaEQ2efS91b5GZcEK7ppmq//66HF
	 0jdc8akmrxeFMSq9yqyhMaQHXFAGmhe5ZfUdtUCeikY5ht9kRiIUz2ItO5zNPtP+/3
	 lG00ssCOIviB5RHnqS6hKzQA9tDADUPXe1b/pB0+PVheUwI+Mkm2L+7jeN8b7Vmsqc
	 JPtnrvq39mOf9ip7u0zbhrQ5ZBEWztOiOu+gz9iwpv1rvWi90gw1eRY/5NrTtz7aZP
	 gBpyWqHrbohMg==
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 14/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
Date: Fri, 25 Apr 2025 10:42:11 +0200
Message-ID: <20250425084216.3913608-15-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425084216.3913608-1-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TODO: review the constraints.

NOT-Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/percpu.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 5fe314a2e73e..275c76a031ee 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -334,8 +334,7 @@ do {									\
 	new__.var = _nval;						\
 									\
 	asm_inline qual (						\
-		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
-			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
+		"cmpxchg8b " __percpu_arg([var])			\
 		: ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),	\
 				"+a" (old__.low), "+d" (old__.high))	\
 		: "b" (new__.low), "c" (new__.high),			\
@@ -363,8 +362,7 @@ do {									\
 	new__.var = _nval;						\
 									\
 	asm_inline qual (						\
-		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
-			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
+		"cmpxchg8b " __percpu_arg([var])			\
 		CC_SET(z)						\
 		: ALT_OUTPUT_SP(CC_OUT(z) (success),			\
 				[var] "+m" (__my_cpu_var(_var)),	\
-- 
2.45.2

