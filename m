Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE26222B585
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168534; cv=none; b=kJZmvkKqYed3gp5GdHJiiqhAhljzz+7Nfipk1R4KXNyfyEwVenMdhynuea4d2EM8volNti+Pm6Tkb3sAXS0nnPnT1WUPM3v+SOZypW854VKW2WMkCN1kpSGNLAO5r0KtZ6QgAv55knmIo/JgpMpdh9J7IZk3w8W/sWj5mk56X64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168534; c=relaxed/simple;
	bh=mxduIR0UIOcfSzgudKU9hHk8lNuRDrIi6rjN++/rAQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMa1h+0eYOH51ub95YqM2d29kd4l7mvYZKZeHsHbN9wNJWnOMlBtWRBgALhjFczjRKQ/ezx/RvFnad0x2xPrXmV7GcJ0+T7NOBoR/j9AOAEVuZx6yGX2t4/1rqGmOaAMAtrBhVzBE70nsIhSb+1jHkcjDBoBdMzzx4FbcZfHrpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpINxB00; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpINxB00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83FBC4CEEB;
	Fri, 28 Mar 2025 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168533;
	bh=mxduIR0UIOcfSzgudKU9hHk8lNuRDrIi6rjN++/rAQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpINxB00aHZc/ilLTWdpeOoI8NMT0fcuv/pb27qoRNPHllB7qVYaj8Cmh+BzzKs+y
	 AFYJoEvijIPhbaL694VQlDx8F9AHP2yFYzV10WjWwH6NS+SrrdYjdBOx+869h3N/Az
	 gwNwSaV4H8pMCcsGm42c7wtC+1qoU8KueSXJ+3SAOxCYzaVgEs0mts7ParrwV3ffmC
	 7+ODt7l9TWsiV62u3VKKvndRSmhrgB3PoVFhvzg80TvaxJWzMPebUsowhq8NA1UEXl
	 vhxGb0geLQwbhdHyshPhKSSO6tpVDYXLZ7/E5+1pU5cKT5g/bAT2cuIkapAm8Fqd7G
	 af1NqMQXgcRQA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 37/49] x86/alternatives: Move text_poke_array completion from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to smp_text_poke_batch_process()
Date: Fri, 28 Mar 2025 14:26:52 +0100
Message-ID: <20250328132704.1901674-38-mingo@kernel.org>
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

Simplifies the code and improves code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14769	   1017	   4112	  19898	   4dba	alternative.o.before
  14742	   1017	   4112	  19871	   4d9f	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 1df8fac6740d..5293929488f0 100644
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

