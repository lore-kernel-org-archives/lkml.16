Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D226225402
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168524; cv=none; b=lTyzTuyjxINMHOHnz7cJqsp7dzRV+0r4MXc5exfff7KNCE/x2LKTJKjGhLhoL7pbKgdeiaAuJcyZhoe+JIcGPq9/vuKzeVOlCHhHi4NbzvrPunPH7jTST+RwFJi/fgd5HkA2X2EqekASwpf21dORbdu+RQ7NGTHXUGRqFIn+/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168524; c=relaxed/simple;
	bh=8OyhLe7uGzcgXDJMN1x4zhofshkuuXKUaY7vejc0fO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEVrn8tYfKhWvBf16H0d/ERuq1p6PiksWHu72cCNqKk/AiAlBc7VLZ1f7oUCI2rERCf4YOUpFGixa4okzpPNCiw7JzeIOb9agDTEDCwrJOEgSjdGiIuXCBdJXvQoscnnaEH04+7VZTegKan58DArqW8SHy6Zqr12doINky81dFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+/m6tAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+/m6tAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD7FC4CEEA;
	Fri, 28 Mar 2025 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168524;
	bh=8OyhLe7uGzcgXDJMN1x4zhofshkuuXKUaY7vejc0fO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+/m6tAssbkrEzLaEmJ4SnrauqToRmGIQaaUWWEnXZgGOnWwuiy9EisUeU4XAfzT5
	 qDHFhalKU6RrNtO5HXQS4L6VrC9JtpWpKfRe2LOFVLxg9PUIwTmTOJzcjSHaVaElF1
	 kERY2SfFjYbkzfUG37YmdsSlNxST4JmuQ0O1SUvO0X+OuPNOV/ANRxAIYtiMzjpo70
	 JRjjVZw7RxSNjYA56gUSXmieok4gPKRk1er0BHQ2gXOT5vhScEUsUaaMBaCDgBSj4V
	 L7CNSdiguIkMvtDKoZjTFcfCIf/Zn5N+tOR47HJa71B6FJ+ZeklWvpmI1L/9RK6c69
	 7ztIuIVLl29+A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 33/49] x86/alternatives: Move the text_poke_array manipulation into text_poke_int3_loc_init() and rename it to __smp_text_poke_batch_add()
Date: Fri, 28 Mar 2025 14:26:48 +0100
Message-ID: <20250328132704.1901674-34-mingo@kernel.org>
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

This simplifies the code and code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14802	   1029	   4112	  19943	   4de7	alternative.o.before
  14784	   1029	   4112	  19925	   4dd5	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 566b857d210d..f0351abcbfaa 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2752,12 +2752,14 @@ static void smp_text_poke_batch_process(void)
 	}
 }
 
-static void text_poke_int3_loc_init(struct smp_text_poke_loc *tp, void *addr,
-			       const void *opcode, size_t len, const void *emulate)
+static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
+	struct smp_text_poke_loc *tp;
 	struct insn insn;
 	int ret, i = 0;
 
+	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
+
 	if (len == 6)
 		i = 1;
 	memcpy((void *)tp->text, opcode+i, len-i);
@@ -2873,12 +2875,8 @@ static void smp_text_poke_batch_flush(void *addr)
 
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct smp_text_poke_loc *tp;
-
 	smp_text_poke_batch_flush(addr);
-
-	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
-	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
+	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 }
 
 /**
@@ -2894,13 +2892,9 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct smp_text_poke_loc *tp;
-
 	/* Batch-patching should not be mixed with single-patching: */
 	WARN_ON_ONCE(text_poke_array.nr_entries != 0);
 
-	tp = &text_poke_array.vec[text_poke_array.nr_entries++];
-	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
-
+	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 	smp_text_poke_batch_finish();
 }
-- 
2.45.2

