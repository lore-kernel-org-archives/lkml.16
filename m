Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1FE238C03
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570570; cv=none; b=CVcurjWwIJhjgTtG8N7unGvW6wtO7/KG/gIS+jyM/e6vKv993GnZN/4KpKkhzEHq8GlPOgpN6JdukI254EHN41jLjLhzFB14GGxx2rSzqoaOY+I2MtcY1p67hrKiTP6ohUnLAIvT/xtPQWYIOUS8SZI9350Xwur0z6uyqLw4y58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570570; c=relaxed/simple;
	bh=n/+P96nTsqxN1IxcGmKU5Dolgdk0u6rIXpz/oA4jPoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9oWJ+/nu1bFFiQol4fjsBJBGUnqNkjFnHSRaj+j0mLy/Fpn+3Gbc5gk8FBwzDu1xNsJKM2hYklAoMhbhklmWXo3QDIt5D5zUnRRwLg+k1ccvgC+KrXqolclAZmyeUlSPBC75a949F25rLqgCzG2lmPM2GjPjLevamz0DTU8ngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XN94qMjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XN94qMjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAB2C4CEE4;
	Fri, 25 Apr 2025 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570570;
	bh=n/+P96nTsqxN1IxcGmKU5Dolgdk0u6rIXpz/oA4jPoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XN94qMjWdAbl5TyH8qfEyjxa0AgPG54XWfErZHDn9HRWK++XZOYbGXJrhFkpb1R6y
	 tViKywTsF1zqS65eug+F35b997zX9uegjbrwYPoa0olr32NYh6zN+5Lz3WFg1hbe36
	 A44qjy0SebJ77i9JsDs/EHo5uKzT7EZixO7e7nuniQxeQLetAeupHFPXxnXRB9StA9
	 xTyl4tx5eAToQgWZZtVUfEVUa8Yt2OPSb+nKCv7omdN+QVH7hZIY9qH8C3+A+gElMQ
	 xPA4bgLGidkYtrH/gHZzRgIhSo8nr2JlLLBV7zjxvqyBywGMxUo1rNJcHDpc8edx74
	 RrkVSjLa4FBCQ==
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
Subject: [PATCH 06/15] x86/cpu: Remove the CONFIG_X86_INVD_BUG quirk
Date: Fri, 25 Apr 2025 10:42:03 +0200
Message-ID: <20250425084216.3913608-7-mingo@kernel.org>
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

Now that support for 486 CPUs is gone, remove this
quirk as well.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig.cpu    | 4 ----
 arch/x86/kernel/traps.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index e9499e58776c..ab4988e06d86 100644
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
index 9f88b8a78e50..8d5bbac04435 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1345,13 +1345,6 @@ DEFINE_IDTENTRY(exc_coprocessor_error)
 
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

