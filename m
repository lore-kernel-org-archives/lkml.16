Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937529AB0F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350156; cv=none; b=JCGTivkqafS7ZD520kGRiVgDEF8JU8907YlVnlp4c/3iG4REH/NStd1pANHBR5VsU/F809BMrrxgYpzamOZH1db4gJklIGgaUWFzEUorR5I85jsjRX1Ev5aqDfUcmYH8+Qf3r6HFGTArhwYRZ0C1F4Aho30RBEMC9xCr+fIsN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350156; c=relaxed/simple;
	bh=lktWMWsyBreqWNLqEhBiEo/wBoVvh7RxDk06AUoYyn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKRTiGycerIS25FXi5/YaZrkAR5HFG2DrCr2g4u6ILuOhAYKCOq12Qm7+zVGinHW5mrkat8wl3XSGXLwXliHhR2c2crjxafWa8ZZAxdUaxrqh9wYmP4Zi09Ehf9kEVfwE/uXu9ZweP3BZwCgoEjlBcbfgf8moJC3sebKYdwKhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJtiEEbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJtiEEbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC343C4CEE9;
	Fri, 11 Apr 2025 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350155;
	bh=lktWMWsyBreqWNLqEhBiEo/wBoVvh7RxDk06AUoYyn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJtiEEbFAFB4LHagFiVhAOaLhevNpyfWDVx5GK/6PcsPgzpI4rRMruaK8SSVpbZCi
	 vV2XnOo87TOBomq0R9oSDau9/1xmwRocspQ2HfGENUT2V4HPt60RWbCo4Tjk98Ho1z
	 SmeNrbc9RVJmgvHEeY/aCIeho2Z1SLNn83Q6eO88efaSzAdZhlZjni0N4RI8Oe0BB9
	 XKY2DSqHrkkFfM1ATUFT6fgySYatL83MsFWdvnd2EZ6/1fO1pNRHR6MJxj/Qdplhs1
	 oAjUNBf6ILN3n6/DcdN6PP7C+B+PMONr+YMFwSGivhX+6q/O7+q3TcHpZBPOWQXtyl
	 0iBbd52SsObPw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 35/53] x86/alternatives: Move the text_poke_array manipulation into text_poke_int3_loc_init() and rename it to __smp_text_poke_batch_add()
Date: Fri, 11 Apr 2025 07:40:47 +0200
Message-ID: <20250411054105.2341982-36-mingo@kernel.org>
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

This simplifies the code and code generation a bit:

   text	   data	    bss	    dec	    hex	filename
  14802	   1029	   4112	  19943	   4de7	alternative.o.before
  14784	   1029	   4112	  19925	   4dd5	alternative.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 08ac3c7ad6f8..eb0da270043b 100644
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

