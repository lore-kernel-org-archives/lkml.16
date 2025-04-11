Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F06129B235
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350165; cv=none; b=CyARsCrILVzk+zuIIuwP7ObLu9dpCOFGKGK4tQVHD+T1MIghZeWO69ejt6gAz/PFrvI2h+PXIq9opA4tXr8rHtyEBhQMI7oiK4pFsbTodiSJlxhLI+eebz5WAp7+NKQG8sVe5ZxbPoT7psgeeGMQ8VKkIi5QvlZYAroJ6thmwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350165; c=relaxed/simple;
	bh=lzWWYWlpG9TKB4p/7Blvc6fnd+/o4S0RiKyCG4pICyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qa9BRflLxRFpJXAyV0il3D3ILeD0LndIhYSLxEOiSJiUm4sVx4+iHcy0Qipps6zRtjl7XjAfdYKZ6v5CTaQMJxF9iOMgMVev/ylAjBB8Ee38dwQM4l9GLMthUXw/bJ81Aaa6TXq8+4wYS+ppuNL5BozmFlBErn7d/IRmQrNNnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHgrVPYW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHgrVPYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70523C4CEE2;
	Fri, 11 Apr 2025 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350165;
	bh=lzWWYWlpG9TKB4p/7Blvc6fnd+/o4S0RiKyCG4pICyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHgrVPYWOK+ZiP6CtKTCvxT+I54h2YIXnzUQsmoHKd/+rOVgzgUARqi4QKqbexQ3Z
	 gufbNq8sA8MfwPjcxXXueyILzPpYe70Q1wJkumPbxcmzrqAMWdG1rfRe5+X7jqAOoh
	 0f3orVOBXGyx6QCcO/cLkk4T2Psk31Ep3lszOYa2auRgCxwWC6WwrIL7OaMa2YTyYu
	 5OW37aAXEuQaLxjUvwX+ZX2v+HcHC8RtS1CpK88ABqzCFZ+pdBNW6ky8HjY+HLfx74
	 GqnM57W4DDYff92+TEW/f4lCHt2fyVs4qH96+pXSSQ86dwbWcvTDsnrHkCwdu6ia4l
	 SgMnIFmqt6Rfg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 39/53] x86/alternatives: Move text_poke_array completion from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to smp_text_poke_batch_process()
Date: Fri, 11 Apr 2025 07:40:51 +0200
Message-ID: <20250411054105.2341982-40-mingo@kernel.org>
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

Simplifies the code and improves code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14769	   1017	   4112	  19898	   4dba	alternative.o.before
  14742	   1017	   4112	  19871	   4d9f	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index b47ad0853589..556a82f576cd 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
 	}
+
+	/* They are all completed: */
+	text_poke_array.nr_entries = 0;
 }
 
 static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
@@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
 
 void smp_text_poke_batch_finish(void)
 {
-	if (text_poke_array.nr_entries) {
+	if (text_poke_array.nr_entries)
 		smp_text_poke_batch_process();
-		text_poke_array.nr_entries = 0;
-	}
 }
 
 static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr)) {
+	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr))
 		smp_text_poke_batch_process();
-		text_poke_array.nr_entries = 0;
-	}
 }
 
 /**
-- 
2.45.2

