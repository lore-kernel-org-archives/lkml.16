Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6D1DC070
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108871; cv=none; b=FBrX9yDgAZ/Bn/8AhTK6VjzKHsJ77Aq7VwpdF7BPZshh6uKS+nyx3wwMfzUKC/0RED8qTQpA8Ky8p32jyEdx/suZ52TRpnQ5uoxSBR/z0lfqFWpGtMesxm35bmr+L6Tja46JMYvfslab9QoBJisXA25nsSfNC7PODX68/nqOrdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108871; c=relaxed/simple;
	bh=OB80uW+3JA4RNb7/H8uPhUtnOGne8GtsV2w1ve8kN0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbmrb0e6WN3ar+SjY1+/AwvymlK+BhdZAmLmcmeINWlk5xtI06ITW1Arwhsh83T56hMZ2xBPWJbmsKzHNqXqHOVe80/PW0fiX7zJmKZY1dfWWgU4IYU2kyPIeYLX0KTE5aIkhoNOiKVT58FCqeZa0RVgKabU4NbAcevq6kPgxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZGm+yxj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZGm+yxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC01EC4CEDD;
	Thu, 27 Mar 2025 20:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108871;
	bh=OB80uW+3JA4RNb7/H8uPhUtnOGne8GtsV2w1ve8kN0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nZGm+yxjrVy4QZ/eGJckC6kCFmHwmJZxKzEiAlHE3q9MjUANd5p7Zvt2w5V2iEfqq
	 Y8MtW5kAVrL7iWaWVgMAmKCIhSX5doruhF4zjvYstZotm08GfHBGuIzLS4EPJty4/m
	 oT6VgXW9b2P4razjGc0N/9RFGKdRK6jckSg/DEMg86pyPf2d48ASy2/jxIT4RzeTR3
	 6fDl9cOw7c/ASxdUJVXgLeur/5nSTXJZMht3DZ203uqgjyDtCfGPdfkMI0rezF2aY5
	 cUKmfJNhaROQev5OuSxbNXbtR2oOQkmaI1ISevVbNZICPR0NASpJNQP5iCNRUh9IpB
	 +zQNdDeEBJvKQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 13/41] x86/alternatives: Rename 'text_poke_flush()' to 'text_poke_int3_flush()'
Date: Thu, 27 Mar 2025 21:53:26 +0100
Message-ID: <20250327205355.378659-14-mingo@kernel.org>
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

This name is actually actively confusing, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_flush()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to text_poke_int3_flush() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 557ee2546177..bf8080a68f66 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2858,7 +2858,7 @@ static bool tp_order_fail(void *addr)
 	return false;
 }
 
-static void text_poke_flush(void *addr)
+static void text_poke_int3_flush(void *addr)
 {
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
 		text_poke_int3_batch(tp_vec, tp_vec_nr);
@@ -2868,14 +2868,14 @@ static void text_poke_flush(void *addr)
 
 void text_poke_finish(void)
 {
-	text_poke_flush(NULL);
+	text_poke_int3_flush(NULL);
 }
 
 void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc *tp;
 
-	text_poke_flush(addr);
+	text_poke_int3_flush(addr);
 
 	tp = &tp_vec[tp_vec_nr++];
 	text_poke_loc_init(tp, addr, opcode, len, emulate);
-- 
2.45.2

