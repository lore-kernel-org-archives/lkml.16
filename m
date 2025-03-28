Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D91E04BB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168473; cv=none; b=Mn5cIoXKghsJ7+pvzWN7LMXWbnmjpMq11zho1nuZVohJ8YEvQ5UbR8kQWcsqrU3tLcY+/n8VyfxRbqiqKfo2KnYiJylS+BMSqn+85U3BdM0/4b7pNc0R1/12OZu/034r+SWQN1vvSbbhRj4G/sfEFhO74zrwke4ACXDCv2mozLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168473; c=relaxed/simple;
	bh=wg2c5nr6TjMRQ/IqPjtCcjARvgm7PuxkEkeDA1S1opA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFop2xyqpswpgBlmrT8F7+6r5yZbK0uNu3FbxdYsRmkqk/Mz9o36q+uMKHkle3BMZPMf8tpbl65t6DkgAZDd14HgiA7kOUsa4kZqKeuJaNKUPjrWKoDH7UfXV8l8gSH5T6vBeaflFIWOJsmhgmvn+E2P2e91o2rAFb3L1ctTUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvNZh4gE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvNZh4gE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDF5C4CEE4;
	Fri, 28 Mar 2025 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168472;
	bh=wg2c5nr6TjMRQ/IqPjtCcjARvgm7PuxkEkeDA1S1opA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvNZh4gElrm3cnyAgkXJYO7wjqRmHbZh/zNDyTjz6cBLSES3VvfIruwC37gR1B5+j
	 r5s2DB9hvalCib6HzCBHLmibaUSURHfNDAC8NMrdifWzi3gQirgWl+8AskltDCUpur
	 LMIYkv+y/4gABos2EU+3FIpy4Ws0YXfF3CTj1iW15gSI9zNDscKk5ndFGJkZZsgt5f
	 V8UA78CgXRlwGLxFKVOtLVlzTWKLKxQSLAy5kVjWQM+v98FevSw+0bUGqxM+YnGHq9
	 zeTyfXhAkabYP5VhdciBUlmxrSH3R0/oWcR4kyVRv5WsjOT50itL4eSoiZ1CXLPF8o
	 YJNdDePekOsXA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 12/49] x86/alternatives: Rename 'text_poke_flush()' to 'smp_text_poke_batch_flush()'
Date: Fri, 28 Mar 2025 14:26:27 +0100
Message-ID: <20250328132704.1901674-13-mingo@kernel.org>
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

This name is actually actively confusing, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_flush()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to smp_text_poke_batch_flush() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index edff7714556e..e49c67c3942f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2858,7 +2858,7 @@ static bool tp_order_fail(void *addr)
 	return false;
 }
 
-static void text_poke_flush(void *addr)
+static void smp_text_poke_batch_flush(void *addr)
 {
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
 		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
@@ -2868,14 +2868,14 @@ static void text_poke_flush(void *addr)
 
 void text_poke_finish(void)
 {
-	text_poke_flush(NULL);
+	smp_text_poke_batch_flush(NULL);
 }
 
 void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc *tp;
 
-	text_poke_flush(addr);
+	smp_text_poke_batch_flush(addr);
 
 	tp = &tp_vec[tp_vec_nr++];
 	text_poke_loc_init(tp, addr, opcode, len, emulate);
-- 
2.45.2

