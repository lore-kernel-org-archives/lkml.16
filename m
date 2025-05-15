Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E24296716
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299456; cv=none; b=HV1Q2UDoObUPWnv8LY1qPGTJ1OiYqE4mPgHychkYFb4ioAc8e4rQ93yVRCQB5NO83oTwXdKOqpr2IqJZq02S+TFLH9SkgLVqLC52Mrq7/IBdiOpqpeehelXQ1YhCo+fr3EzwScDrtexSJsaQYOJoileYA1ESif+TgxMIS6OSdas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299456; c=relaxed/simple;
	bh=KBbEoUPAFEjvEFchsDK6DS/acJAUILeDFlhNx002Pj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVC6iIHk+EZF9z0g9giDYslLgtDpnM3Ed0aV2IWfU1iaS0JrWkbKs1GoAjHLxtvr6JBoSd3Wn8Zj9t3F+TzPPEhj3+mC4yyo6ugQ+MAV9+i4YSByxIoJzjSdasJgzNgcL/35ONdZSA7mFBmqWkwJOl5H6rc9llYohJ3bgEjn9GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJnTh0Lb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJnTh0Lb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC7CC4CEE9;
	Thu, 15 May 2025 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299455;
	bh=KBbEoUPAFEjvEFchsDK6DS/acJAUILeDFlhNx002Pj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJnTh0Lbs1LS5gYBRVJLWRhQG7DoeT3i5K33abRSrY5aBXuQiCP4UcujMqe9IAJN1
	 NN8hTp4Nq4gdxdDXPtey1fqqzqtLgPpuf+gDUeQ0yon3gwV3DeMlQvLf1qwzZs/lCV
	 zgi31t9vaaZjhJUqmA12c2riC8VMOYZtjmsE4h4TLFCa6n7uJAHsBv9U9wMUmrlWbQ
	 TX5S/cFxm+LelrhcHC74nlbfplmRyrwLKfzRdGkg4Lle07CJUSPkX4TUZFQAwD8PEC
	 fOTYIgezKuVz5VpFQ6aou/nieE15M5gWpRn8ECy4sMXgl9ZNfejJftMppM9YWO2uDK
	 mr5Cun1z98mBw==
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
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 06/15] x86/cpu: Remove the CONFIG_X86_INVD_BUG quirk
Date: Thu, 15 May 2025 10:56:56 +0200
Message-ID: <20250515085708.2510123-7-mingo@kernel.org>
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

Now that support for 486 CPUs is gone, remove this
quirk as well.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-7-mingo@kernel.org
---
 arch/x86/Kconfig.cpu    | 4 ----
 arch/x86/kernel/traps.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index abe4596ffa47..246a221c32e2 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -224,10 +224,6 @@ config X86_F00F_BUG
 	def_bool y
 	depends on M586MMX || M586TSC || M586
 
-config X86_INVD_BUG
-	def_bool y
-	depends on M486SX || M486
-
 config X86_ALIGNMENT_16
 	def_bool y
 	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 94c0236963c6..8d08c58b3fe2 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1346,13 +1346,6 @@ DEFINE_IDTENTRY(exc_coprocessor_error)
 
 DEFINE_IDTENTRY(exc_simd_coprocessor_error)
 {
-	if (IS_ENABLED(CONFIG_X86_INVD_BUG)) {
-		/* AMD 486 bug: INVD in CPL 0 raises #XF instead of #GP */
-		if (!static_cpu_has(X86_FEATURE_XMM)) {
-			__exc_general_protection(regs, 0);
-			return;
-		}
-	}
 	math_error(regs, X86_TRAP_XF);
 }
 
-- 
2.45.2

