Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8628A3FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350113; cv=none; b=lpGr4LjdOQayMl49huKGEhP521U/hi3mJwrVSb8iF13dJ6Q7HbeqzGrA9ldIErc3Lhs2hXpN5kqKlxOxWqmG6RdNj6556Z94BAHtlVlT2btttUWhBXGEYtGjGCqB2tjWAR+caKNPYRlH7mMlrHFWmRy+VowFFqegXbNad39mHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350113; c=relaxed/simple;
	bh=Ydt1QgZ0OJMPUJMz1VBZGyYSU8ydyyPAyASBpNkUvfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRqvgilcsARfeGuufsZES0u6w2Sde7iRlDu+tbUW2ldjIw+RFFejRc6+E8dcO9HpaI4WH87bjBRd5DRies9ZyBAbsUmGWAilF9l4mgWwTcvLf25zEqBL6AyOW6FTsNlbJiYgZvOMzAya47Y1ZyNUGzDrIGwcPkZ+/Xr7qtRReDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWvz111D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWvz111D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14134C4CEEA;
	Fri, 11 Apr 2025 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350113;
	bh=Ydt1QgZ0OJMPUJMz1VBZGyYSU8ydyyPAyASBpNkUvfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NWvz111DRqFlfLM0C5MEmeWZGZ6IUbcG19lADOh7oHdw7sdNMpIoalLzTbXJxlfLQ
	 WscTcdBEzEiGkjzHhMevzXW8HHYWTCuOjvyJdWL+NBQTyMNiQtmH0tOqcw+GPcYzk/
	 LeQ6phCNWVSxianbH58tkJ51fBZld8FkdOjRb8rlZrEarBtzlqVHOnW6xUfEek726L
	 6gQ9QwRbyPIliZToIOS+bJiSJMDDB3KKQ37jgG4In/W1fwLoyh1DduzXr+p1bUP6+U
	 0YcHGhCu9TyyCvYuek1KuA1RJ9PKAsi+iDazJwD+2ayAo9pT8kwRkXx4G1HHYa8jVR
	 vjDHl6ijfK3qQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 17/53] x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
Date: Fri, 11 Apr 2025 07:40:29 +0200
Message-ID: <20250411054105.2341982-18-mingo@kernel.org>
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

This name is actively confusing as well, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_loc_init()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to text_poke_int3_loc_init() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 1c8316e8b7f1..e909f2859d0d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2762,7 +2762,7 @@ static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int n
 	}
 }
 
-static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
+static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
 			       const void *opcode, size_t len, const void *emulate)
 {
 	struct insn insn;
@@ -2878,7 +2878,7 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
 	smp_text_poke_batch_flush(addr);
 
 	tp = &tp_vec[tp_vec_nr++];
-	text_poke_loc_init(tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 }
 
 /**
@@ -2896,6 +2896,6 @@ void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, cons
 {
 	struct text_poke_loc tp;
 
-	text_poke_loc_init(&tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
 	smp_text_poke_batch_process(&tp, 1);
 }
-- 
2.45.2

