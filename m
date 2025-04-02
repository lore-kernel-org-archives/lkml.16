Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B722046B7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587163; cv=none; b=Cg8VoFXYVMGD7z1UKmmhbDLA+NlSHRJ7DOm6Sga1anVUfOUcfUS4Zhe0zePc/sRfDMAXsdGLU2dEpxMRPaC3o9CDpmHsgxLF87m+4itUe553OAPgsFKqJUsjAQ4H8Agi6OdasIn75y7WnFXpMXIvObsvWT9nhF1Q3Odw3SMvGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587163; c=relaxed/simple;
	bh=98a0dpTp/y6SCUe1WeenUGwrztXboJxBLAkYY1lT0f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUtWMeAwDuW+rGnEkaGvBbGuj89FrMzkrOc73GrwcQxELv0+KUczfCXzBkz+nWeJEtp5PljJX7I/35XaOPY34Yt8pLWC2XS1HZv1hrU/gcS7TQtDIEDLvNmL2A4PM1lZpzBs2swwJiOFD6mFtsTo110jRo8q1V0i9nv9K/ukEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQduRNhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQduRNhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94894C4CEDD;
	Wed,  2 Apr 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587162;
	bh=98a0dpTp/y6SCUe1WeenUGwrztXboJxBLAkYY1lT0f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JQduRNhNUj7TSO2NdvsC9ApY+JLG3ZljOjrzOz1bOaJRpkPZWgxJ4L35uO82AHf+E
	 BIcIR/C/1fWIHNhILGhqO3tdxjT9asLNdVqMYxHN4q6x4WWvS7ArYORBbQUzn8wYyd
	 ERm/VD7OyS7D9L8jmJlx4aYp8c2guaUj31uKiES9RVywwr9EDMqsKk8/t4qATbqAsS
	 nz4g2WbnP7MmW6SSQTUcDMNEXLh9/2rjYh2fW7WnvHlyvH9YdfBAbqENtTaL+x/bRL
	 +TryIrBvMBLtz7tkI4kITvucrc0Y53gptK6rbnz48l2HpyyJ3hxEhT5w4s6fd9EFo9
	 Fxb1lDVPpyEMA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 1/7] x86/mm: Add 'mm' argument to unuse_temporary_mm()
Date: Wed,  2 Apr 2025 11:45:34 +0200
Message-ID: <20250402094540.3586683-2-mingo@kernel.org>
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

From: Peter Zijlstra <peterz@infradead.org>

In commit 209954cbc7d0 ("x86/mm/tlb: Update mm_cpumask lazily")
unuse_temporary_mm() grew the assumption that it gets used on
poking_mm exclusively. While this is currently true, lets not hard
code this assumption.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.322525475@infradead.org
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5b1a6252a4b9..cfffcb80f564 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2161,14 +2161,14 @@ static inline struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 __ro_after_init struct mm_struct *text_poke_mm;
 __ro_after_init unsigned long text_poke_mm_addr;
 
-static inline void unuse_temporary_mm(struct mm_struct *prev_mm)
+static inline void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm)
 {
 	lockdep_assert_irqs_disabled();
 
 	switch_mm_irqs_off(NULL, prev_mm, current);
 
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(text_poke_mm));
+	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
 
 	/*
 	 * Restore the breakpoints if they were disabled before the temporary mm
@@ -2275,7 +2275,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * instruction that already allows the core to see the updated version.
 	 * Xen-PV is assumed to serialize execution in a similar manner.
 	 */
-	unuse_temporary_mm(prev_mm);
+	unuse_temporary_mm(text_poke_mm, prev_mm);
 
 	/*
 	 * Flushing the TLB might involve IPIs, which would require enabled
-- 
2.45.2

