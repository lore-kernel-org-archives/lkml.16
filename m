Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D107280CF9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350101; cv=none; b=I2M9CeZuo0/0hpmRTJtQkjewe7sKa/H7rMR2mt4vP/UsOt70THFH6+G+uvE9hC1vf0KGT0peMy0zZjef3eoUY7DX0Qfne5MCEYEG91W0ySFOEjfNzTdLz4QiVFJXvOU9zhS2SKbzbzVk7HZ3qAjDZFafYwJxmgmA+XK8SfvXH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350101; c=relaxed/simple;
	bh=vUDBtPg+Mh3+eH/O9J1+/SzTJ1auFi1dBubNFPEun/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8QaWMWEm9MzMlW8DeAnDhT7JIqYJQVGjrOQEuEZg6tlQBbJ1BoVtE9H6su7HFEeK0NbA++AtldJ+v6QmZAxlt3TpEOPg9HIjs2e11hObbMInQdxh3kodCgJPgOhpo+SNuFhRsKcwaXtfVtNtPnTosw8KqJzexRka2e3TA3kneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj6+N2Yu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj6+N2Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE98C4CEE2;
	Fri, 11 Apr 2025 05:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350101;
	bh=vUDBtPg+Mh3+eH/O9J1+/SzTJ1auFi1dBubNFPEun/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj6+N2YuXyexDlgZtHIGregTb0OZ46WJ8escvBVgHZ5Q+CWcGWhILs2Rr0NVtY9Z/
	 BwNaWa0DWVkseb/NmlxQcQD2i/Duj6GIrHrkNunyuHLZUrCykynyc/LoWFedinblnY
	 /FQuMjVe+p+57EdYcXMdRNb1SNT8ceo82ULY/hCbramDVBsTR3TQ7mvSMPqfdk2U9X
	 wWT0gk3z0bBs38eZaitLQHA8qFA7iFF18MHIyuamd5J3X8jsvr9bu3atJTZtxc6/Tc
	 h8OVWqPS/dV0oUxkyo8JgB81ssMA5EVwLI9iC6XjXJjWwp1FFZDiTHFT5vCV1tsHrp
	 WOfv1MXqEhNuA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 12/53] x86/alternatives: Update comments in int3_emulate_push()
Date: Fri, 11 Apr 2025 07:40:24 +0200
Message-ID: <20250411054105.2341982-13-mingo@kernel.org>
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

The idtentry macro in entry_64.S hasn't had a create_gap
option for 5 years - update the comment.

(Also clean up the entire comment block while at it.)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index c8eac8cf4737..7e3527385708 100644
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

