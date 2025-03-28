Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555D221701
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168512; cv=none; b=oFTGQeqYPxLVqG6pF7AWZdvKqMmuxaJ4p5kY+z1KCsUrigjtzxXq53M0XJxd69OIqJcEQyTYr5c4oQCjKL/P8LF/iZnksvHmIaWYO6q7iEvC3BpCtRBK71MDrC8esQ4o/itRZJ3f7rhtua1qMoP3zFkv1w87wNP44vN9HNxgehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168512; c=relaxed/simple;
	bh=JHNktBcDC+hEvClPDgC0pyCSPg52Mir76gPQu3Ybfj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnQRJMq9zsYj9qDBcFggT6XAW7/pK4K/zUZMMD3w3rA0iQ6ldRCulOnbiLghLQKxmoDj47SMRyEJc18/vLzSx+FYnPIJLrFTWTXwEK/CdcjZfybcO85B/Wc8f1SAh2ky/ZTNECANBWPUz6JlAlzdwRfZTk0n5eUQvm7iV6Lo47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3m2Uepb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3m2Uepb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FD7C4AF09;
	Fri, 28 Mar 2025 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168511;
	bh=JHNktBcDC+hEvClPDgC0pyCSPg52Mir76gPQu3Ybfj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3m2Uepbhq3kKKcRh8x2mXkH8w7wE4KUhvLG/jdBkI6yZNMHM5sl7/UJF3OwoI02v
	 A/ctGNEDsGAm1TYsGSJyrT8DAKZOBI6b3mQL4Nw4LfJF2ygSxZYgnhOLLaxCtO2S6n
	 TDGpxWcOMmvseX9PPsKKPh7ULntHJfmOvAYF3iQVaJMrsTVWNlonAfO1VxwRwfGJGj
	 YeiG9FR7d4zkLNhKHhZ8Wxk2N4uIgAZSXvlDvcgeYzvf/Zkj+i+rLRulxwuEzdlzDL
	 47QohiYIkBkevI1U/v8SFcta5o0VAkvGlJK9IEuCl045bkdQKNm+XIZL51i4dHn8vZ
	 XRJB8+BftFBkw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 28/49] x86/alternatives: Rename 'put_desc()' to 'put_text_poke_array()'
Date: Fri, 28 Mar 2025 14:26:43 +0100
Message-ID: <20250328132704.1901674-29-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like with try_get_text_poke_array(), this name better reflects
what the underlying code is doing, there's no 'descriptor'
indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 26bb2a731208..202720228c98 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2486,7 +2486,7 @@ struct smp_text_poke_array *try_get_text_poke_array(void)
 	return &text_poke_array;
 }
 
-static __always_inline void put_desc(void)
+static __always_inline void put_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2590,7 +2590,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	ret = 1;
 
 out_put:
-	put_desc();
+	put_text_poke_array();
 	return ret;
 }
 
-- 
2.45.2

