Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3A1DA2E5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108867; cv=none; b=Pp/HrIfCgact8sUOquHi5aYwDRnVlhiHwOQuvNqXo/3ycPZgjOi+w33XE8rHjE7SuXGB+QOTEP65VupBRfJFxA50xucPNnUX21kOBOqpLjLJkiv9Y2CCA8NpL9p75zf49y+Hq8hIOAaTClxB1umX9AoY5DOc3J6LgSvXR3c/Czg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108867; c=relaxed/simple;
	bh=+29BZwd36zi833w/mFjDZURDTxD//gjk8dm4eS5sx0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1br0Yk6cEE1Sa9oZH0N5CpCgr8DEJUHIsZjUYWZQ38DofMczyJSruKyIwtHYl4IBdUQpU+x+8GBHlZt2098rhac5mZBERzln2Z5+E5eMm0Ha/nMXGFnV0EP//W941vRJjBeGEVo9ImHSt6GyB6pEpD1JhzuRLvb6AUD8rP5Vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD/XFozt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD/XFozt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19033C4CEEA;
	Thu, 27 Mar 2025 20:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108867;
	bh=+29BZwd36zi833w/mFjDZURDTxD//gjk8dm4eS5sx0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GD/XFoztk0/cYpZ3HUHvaMGliBhFyQJOL8Ov+xQtVH6oyv7kNDDldf4GmFBWxitch
	 2xhPF1824qt9SRFsrv5f5q2xJ5HnBDyVJJyNh7S55+S/1DS+THZQHs+Feg9RB8nROG
	 elFKlNFclTXf0ihMdByqoYZGWjzokgY5W35qhwEuRFBs1XDE+vJETTGsmbvIRFFPWM
	 u5vBF03w2Jw7bMQq5ZJVUvkGrHYoqccSBFaFNP0QHQGItItkJ/xTtN6hTpWCih53rY
	 GE/0DbUBUMXPh8IQ460Zeqr8irPptzPXdp6PS7S0wza63YJr5ITjC47uwSPNRqDEDu
	 djfKkKEXe28Kw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 11/41] x86/alternatives: Update comments in int3_emulate_push()
Date: Thu, 27 Mar 2025 21:53:24 +0100
Message-ID: <20250327205355.378659-12-mingo@kernel.org>
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

The idtentry macro in entry_64.S hasn't had a create_gap
option for 5 years - update the comment.

(Also clean up the entire comment block while at it.)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 9f6f011f5696..c2dbb0e4d80d 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -142,13 +142,14 @@ static __always_inline
 void int3_emulate_push(struct pt_regs *regs, unsigned long val)
 {
 	/*
-	 * The int3 handler in entry_64.S adds a gap between the
+	 * The INT3 handler in entry_64.S adds a gap between the
 	 * stack where the break point happened, and the saving of
 	 * pt_regs. We can extend the original stack because of
-	 * this gap. See the idtentry macro's create_gap option.
+	 * this gap. See the idtentry macro's X86_TRAP_BP logic.
 	 *
-	 * Similarly entry_32.S will have a gap on the stack for (any) hardware
-	 * exception and pt_regs; see FIXUP_FRAME.
+	 * Similarly, entry_32.S will have a gap on the stack for
+	 * (any) hardware exception and pt_regs; see the
+	 * FIXUP_FRAME macro.
 	 */
 	regs->sp -= sizeof(unsigned long);
 	*(unsigned long *)regs->sp = val;
-- 
2.45.2

