Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2F1C4A16
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168468; cv=none; b=ot9zgUi9ch/WlOmK6Vnn4BcdyBi6RJnaYl6Z0qTAo8F1igfjyAZi22QPZZaBek90Pe/BalVscCUIMk9mNZKfTcOT+oh/Qg/OaumH8tYYdym1ht7CaE/5wQets33EB9x0uF21vXTKIxNddJiNxoak80aCsukzGM7Tvi3eWXMOXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168468; c=relaxed/simple;
	bh=h6wSVJK60rUteIznqhWfFi3ILoiAB1JaIPfXXCevsxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHTh0+g2gWaMxHRLcwP1nPTaaq5cooTF3mWR83oc2j/4x5lh2BJiV6Uk6fpCtsdcqnXvYhrQZqOy25RUqy4I/GxkMdClYLD3NH1Owm7WqYStpymzI22UDFhb73xK7BRbuSsIrRt/XzvL5nzX1eFdAiSPWi0dHaa3yK/41ORRUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoCyUysD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoCyUysD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91568C4CEEA;
	Fri, 28 Mar 2025 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168467;
	bh=h6wSVJK60rUteIznqhWfFi3ILoiAB1JaIPfXXCevsxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RoCyUysDNsMgYcx+fgVhyNXG9HaMuUm4Rq5J4CLnXvUyPNTaLol/RqgJpkYaj3qCZ
	 gf+/43s7n+NunTezRkcCkVh/6HWMjoJwlMduaSd/me2KNMGHV6D8RknHNB5y32lQMt
	 6JYQ1FellJfw5gHaV0bcZauLYE2u6rPIAX8OO3p+al3WGy0QPgNcuMc/8rc6zYO8VG
	 dNfPjHS594j4weLsRXHD33dbHFL+xlQVP8MEaNvT8QvGwCDnRLI9RiNsg7NjuSraIS
	 LPu7lwUxJ1ihJ75DEaiV5Nxk/a7ClC1f+v2/lb/DZFZuiROEy7Zdfd9wPQ16svRUC1
	 CnD/uFZglKsJw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 10/49] x86/alternatives: Update comments in int3_emulate_push()
Date: Fri, 28 Mar 2025 14:26:25 +0100
Message-ID: <20250328132704.1901674-11-mingo@kernel.org>
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

The idtentry macro in entry_64.S hasn't had a create_gap
option for 5 years - update the comment.

(Also clean up the entire comment block while at it.)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 7f296a05c5fe..b7e8fb8f3648 100644
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

