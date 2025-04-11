Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A69280CE8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350099; cv=none; b=YfRdj2E1hRDikIzkkSLs1UNPWnB3NskQzeEoxv9YVoQhuyQLBd06qsHNTfDb5Ro94bFTtb05xUGNNhb8RDWXNbcNyNvWAtgVX2ARrp/graO6KMlkvuQvo/znDYIAUJQvG5TTTJGkgEadHkmtzlZwQD1i/81fOk/O0NoCJVtCFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350099; c=relaxed/simple;
	bh=3mQOlLDjRBuCITwE6LPt/v5yxBFYbFUjrysRyHnj2gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzGysFpr1HyBjW6OO+18PEU/SDr45d7pJ6m1o0AK7SuTL7L5hOf6RtxTRtU2wLNuxjsg8ZnpOxPZN6uG384Mgo/yeQ7Nx4p/CfxBQ8e6FgR/OnJOI5bhvb0OrLo+x67M4cPGT2u2l2agudyONpVaraU9pAKwtXCJ3yK3/MxEvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1t0IbEt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1t0IbEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B857EC4CEE5;
	Fri, 11 Apr 2025 05:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350098;
	bh=3mQOlLDjRBuCITwE6LPt/v5yxBFYbFUjrysRyHnj2gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1t0IbEttU4MHkZrCF8O0LJC3rx+ZptZA2U1Heo5r+4irGDw1t1vys9zY1UWRok3y
	 50PaMf1+TvUqjFsXfQ1W8i9wClBEkRKPBRvTkkhS8M+z+JFDYPoHZ0hSVHJ8OuarE+
	 ghhDZg3vamZIZ7eOwslLNzx88IfmPADw+ZKpVPUXBhGJgzBRfs5uUEt9DciwFEDvh5
	 cSwfEU2EcF3VkwBS6cj/XIdYwkoMMCNrxKw9OODjv33If9MT8W1+qs6pL8FyLTsB2W
	 7v0YpNtR4ZuPMcHcrDvwfxM9bOljRwiQCSVzrm5uBT+bFcRknHkpQ4ff4wJKGp9lb3
	 CuDtqKMFAu9+w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 11/53] x86/alternatives: Remove duplicate 'text_poke_early()' prototype
Date: Fri, 11 Apr 2025 07:40:23 +0200
Message-ID: <20250411054105.2341982-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
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
index 2a630d1931ea..dff53eb8c6dd 100644
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

