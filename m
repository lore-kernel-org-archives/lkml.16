Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157E20102A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108934; cv=none; b=CAn5xzy2Weh1wpUOn/GWc8afj1WD4rD172o8eg5fjqx9GnC18WfW4VIfArX1coSJ2E/VAtP9Yb8IoJq2tZpwCZpNjzj6VyZZOBvmL09syEe8eoNsbgV/ewc5v+4UmE0ilUbaXNbi5kMKQUe7XBByU9YisPxUw7ji2NtiIRCj4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108934; c=relaxed/simple;
	bh=UjD1AYfZXQ3g8Nnd8gn7w8mDASasb2fkP86nzz+63xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AM6e3FBB1Ed63D+jE+eZC3a2A0Tq7VYZZ5cym0MGzPFrSuzSxYMD5QUxsCepDXAVz09QcOq+QwRqKlqN4tpSU4WFUBltWxuQBqAxRpPLqCcKucnYpgRyNJk+TkXVhlu5CRSV3LiRnxWWkm1w9WI5uF+ec9ISyZiEJbxBu/KoX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoY7SGc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoY7SGc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF392C4CEEA;
	Thu, 27 Mar 2025 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108933;
	bh=UjD1AYfZXQ3g8Nnd8gn7w8mDASasb2fkP86nzz+63xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JoY7SGc7vjsPpmdxhAVyf0VOZOPDfNeGnNsMdHxeOiT9+FuTHNg8LaczKMSTxWuPk
	 7Fmtu7hie5qsbiEb4hKtQXe4kReoP0T/q/zq8sFTPQ1D75Qo5tCJ+i08pufy2CdWd7
	 x289Oop8/7QKi2Uxl79CiMrmylD5bMLGGKh2j62hgK6jWM9AdlUuISvbkj77iZAGTV
	 Ai2btru7uaUs1GrYUqA2AV/25A8O1vxN7lM/mYGH7thT8xXdD3IkDPrw0hBycwVOzp
	 bnPM5VJ1vhkjQEK8zIjebvvLDNhmeSUVDMOITp73iq/BHZ5nzUE2gRJhvoZi0IBqOu
	 FoBbWjcnqMdjg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 39/41] x86/alternatives: Move tp_array completion from text_poke_int3_finish() and text_poke_int3_flush() to text_poke_int3_batch_process()
Date: Thu, 27 Mar 2025 21:53:52 +0100
Message-ID: <20250327205355.378659-40-mingo@kernel.org>
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

Simplifies the code and improves code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14769	   1017	   4112	  19898	   4dba	alternative.o.before
  14742	   1017	   4112	  19871	   4d9f	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ba322a29aefd..1b523496a2f6 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2750,6 +2750,9 @@ static void text_poke_int3_batch_process(void)
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
 	}
+
+	/* They are all completed: */
+	tp_array.nr_entries = 0;
 }
 
 static void text_poke_int3_loc_add(void *addr, const void *opcode, size_t len, const void *emulate)
@@ -2857,20 +2860,16 @@ static bool tp_addr_ordered(void *addr)
 
 void text_poke_int3_finish(void)
 {
-	if (tp_array.nr_entries) {
+	if (tp_array.nr_entries)
 		text_poke_int3_batch_process();
-		tp_array.nr_entries = 0;
-	}
 }
 
 static void text_poke_int3_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !tp_addr_ordered(addr)) {
+	if (tp_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !tp_addr_ordered(addr))
 		text_poke_int3_batch_process();
-		tp_array.nr_entries = 0;
-	}
 }
 
 /**
-- 
2.45.2

