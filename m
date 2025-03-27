Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757D1D61B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108864; cv=none; b=c1uojjyCmGu5H+6WJJoMOLTWJ8/5FoTHQYhwkqWWuPIrO/0A4nxbjtHdOnO5jc6zN6dn/GlrRpPwbEFualOGStjpbwI1Q1vgWOXAnoS+vJYi4DxnobhvR1bYuvIJGlk+JEZKiYKmAc9T06Kbu6pBp/uKN1coWWCg6QsgMOiSK7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108864; c=relaxed/simple;
	bh=ZQOoyR3wsGdwSEhqaaiJ6uePJiLwWRAzr9gDlLkjMDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q31qn2qlpuedOMVRLSOe6Bgk20/5MfjLpCLyzj3KXt0XaKfG/q/Xt4wYcHJYugPH1B4KbIpnK3aCw9P9EBFX8EDnHJvACUAsIatphzRMBWAeLSrDnytSdeu5eujJtEM5fnca/phkdsTyxDlYIaVnU/1f4B1NU3r2Y2ZMw1YvTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmqn+48C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmqn+48C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB61C4CEE8;
	Thu, 27 Mar 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108864;
	bh=ZQOoyR3wsGdwSEhqaaiJ6uePJiLwWRAzr9gDlLkjMDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jmqn+48CeAz0hAVFuogVf2G5gr1iYmEqgUKjFgaF43urgrNIxApe+VycHhpsfm7qc
	 ULsrIoEdD8T9xaFZSeRIbe3xurj5xGTscCMuuHuU/I38d5VaqnCQHJNbCFqNb0j6nS
	 /uwsaVkN4hkZ5SVWgXuGb/r88XfPWQlMw64wymy+8b7gk30BoAiqWjwIpTzgYYUeD8
	 zr8PqSw7qL2TiDvjY/ipvvt1e9rH7tuaTVIl+V2ZgQ5ep1eoYsE1sqhBhTWUCu8KKK
	 S5ICImgyOjigmAPWppGI09Y+AEXEorF18TUaqOwV+YxtYQEiZpEx6RDoNzK777TovT
	 qxxs0b7N4YKMA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 10/41] x86/alternatives: Remove duplicate 'text_poke_early()' prototype
Date: Thu, 27 Mar 2025 21:53:23 +0100
Message-ID: <20250327205355.378659-11-mingo@kernel.org>
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

It's declared in <asm/text-patching.h> already.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 44b8e2826808..7d14c8abd3aa 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -176,7 +176,6 @@ extern s32 __return_sites[], __return_sites_end[];
 extern s32 __cfi_sites[], __cfi_sites_end[];
 extern s32 __ibt_endbr_seal[], __ibt_endbr_seal_end[];
 extern s32 __smp_locks[], __smp_locks_end[];
-void text_poke_early(void *addr, const void *opcode, size_t len);
 
 /*
  * Matches NOP and NOPL, not any of the other possible NOPs.
-- 
2.45.2

