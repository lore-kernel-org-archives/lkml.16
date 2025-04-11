Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8F928152F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350106; cv=none; b=Mo4PCD1Fee4bA03J5oghqKiz2dS8DWpDh9Gyf0ccm3U6ymRDIqUss5kXQp4kgCkHRkVOIs14T1GSYNukOtGt5SXU9H6V65+Cz5sZq6w1PZetXrC3L799reiGUFbA1JB+n0whevPPGp3ae0uhq0y887ucGE+RBbNUYDRTyM92a+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350106; c=relaxed/simple;
	bh=Cg7s/jcyanOL3XRhNAy/hzbc+zENA4MFu8XemHbp8/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/tfx8C1puo7nNqMuOt14aG6Io4Z0azH4A/R71oWcuVvfsct40rQaAIJcqToh10tT78VlYcrh+iaJYrKrIgORkUq7WX6t8r5h4sy574uwK/Zxbrkx7aDPOUYi1d0Q8VI3RSx5h4pd8QLmGx5P1/NOsulg+aGyT6u/q1bJhA+idw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZ3x5irb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ3x5irb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A38C4CEE5;
	Fri, 11 Apr 2025 05:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350105;
	bh=Cg7s/jcyanOL3XRhNAy/hzbc+zENA4MFu8XemHbp8/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oZ3x5irbwyowc4ZtE59wkI8vXhrh7mZYQFgHtMU/hangVhACPHqbEQqoWikgNzQc9
	 A+lPJIvUMAG1z+gc1XNq0vvrjaAbtDEzn7q2Ixa6tyNUyvqbJAw9EQBnLnQjiRhHLD
	 XwxL3tsHEVCdRv6We1hQuq7broVgkvvFbYKGMa4mPA5lB3B2lqWij7qTRjBoGrKcLO
	 IGdTw2mleyAlyOKu0i2LYlzcvfWNJSsgFmVYOIr/eh3cXIwX+LF3/M2QQrhj2fKo1J
	 MU7O8Br20lRAmT+hacIjv6EtzPCCYDrQg5kW1k7frqqKAc+29yKnjG3+eyVTS7nuzM
	 XaQbrT7TEbkig==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 14/53] x86/alternatives: Rename 'text_poke_flush()' to 'smp_text_poke_batch_flush()'
Date: Fri, 11 Apr 2025 07:40:26 +0200
Message-ID: <20250411054105.2341982-15-mingo@kernel.org>
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
index f3a04dfd0c37..35a89ead153c 100644
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

