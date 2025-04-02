Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE7F23814A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587179; cv=none; b=tYZ7lAQmgU9K+PTCp0v/AaDmFdMluwr13HI956jL3frSQ18UPi306zmcNTS7M2OKVcvh6Te/+cF+bSkwSbEwf4vPTD69j+Ymnksk7EokuacJ/72pJJKLWUYpuR52oEgm6Ec9FdMn5Mc2R9xr3Y80e/+sZxJ/hyT1YlrsrvrODAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587179; c=relaxed/simple;
	bh=wwJkv9MVllRwnbE94gJpES5xAIsuRO9xRorGgHss54k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVOGIdf2WfiH3/e6E3pVqcYsgMBppwL7+koq3wVWIi8z+69JPbEUTybfbEtAUSN3n/shas+Eh6YkwuLOTH3Zt0GZuJALF1DcftOo0R/juSPJgLcdPCoBgTRux4k+ZqcRA7OWZ7YFbw+51O4oncXvRvAkWGdA2guws2rAv9i9jgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pl1s3OTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pl1s3OTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D88C4CEED;
	Wed,  2 Apr 2025 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587177;
	bh=wwJkv9MVllRwnbE94gJpES5xAIsuRO9xRorGgHss54k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pl1s3OThcAMerSvAI3QBhdHsE3gmdzUE7h8Ied84vV7yCXxiPnTIvqvM+upZ9V05+
	 7WIzyhq7PjUP7xQ6eQv+dUCD75sF9CK93JqT+7aafDC/EK2j1OptiD9jlYAp2a40fN
	 jhl+6Dq9KjZGpjNsznmLWewVBqxL83bj3ugQvC/ChnPbpT6FF5neUeESvSnOqaOKsg
	 /H9W2jW7kSx2qGA+plcMxMa7LDgLwppEzEx5K4H4ZMilXnzF2JTNC/J0p/oh0/i2+b
	 951hVktRS5e1BBpMgxdBdgF7nMNTfpRyHHsoWOHhIqIybIh9+Jt+qvvTYZ0qlAy3bN
	 ndKe22kNTOCbw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 7/7] x86/mm: Opt-in to IRQs-off activate_mm()
Date: Wed,  2 Apr 2025 11:45:40 +0200
Message-ID: <20250402094540.3586683-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Lutomirski <luto@kernel.org>

We gain nothing by having the core code enable IRQs right before calling
activate_mm() only for us to turn them right back off again in switch_mm().

This will save a few cycles, so execve() should be blazingly fast with this
patch applied!

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.985203915@infradead.org
---
 arch/x86/Kconfig                   | 1 +
 arch/x86/include/asm/mmu_context.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 98bd4935280c..6b90d93fc40e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -149,6 +149,7 @@ config X86
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select BUILDTIME_TABLE_SORT
 	select CLKEVT_I8253
 	select CLOCKSOURCE_WATCHDOG
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 988c11792634..c511f8584ae4 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -190,7 +190,7 @@ extern void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 #define activate_mm(prev, next)			\
 do {						\
 	paravirt_enter_mmap(next);		\
-	switch_mm((prev), (next), NULL);	\
+	switch_mm_irqs_off((prev), (next), NULL);	\
 } while (0);
 
 #ifdef CONFIG_X86_32
-- 
2.45.2

