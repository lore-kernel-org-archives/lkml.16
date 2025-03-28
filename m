Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145121B9D6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168480; cv=none; b=c7RO6Zdq0vJtMWM2APmeTZ25r0h6dl8gQkhvkD8YNkbRNCvWldVQAyA3+nRKHZ9ejjQG8R7gayGmHN3ynoS0ULyoO13ReVjCjX9V3KPgScmmS+fXnrwL4vfOt0iee8feDj7l7dWv3agccN57nCh2zuMMcCx6RWZDYajhgoebg6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168480; c=relaxed/simple;
	bh=EmZDIqrK6Py0vyMWn7LpBxXQD66V6MlG1++ohPNXEJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+iJYrnv4hEsHAoy/4kMXwI4H3183mlgTlFp8w/0hmdMemldI+kAPok4CmNF/8L5X5DdFoVMmo29pa2jeaEa6AJFF+ivmpQTYR2pcoeN6309AgsH/VewtxzzXC3xkzMcCbb5P0f7xTsbv3U4hXA57ExIpe0prk6YSpypAr8mgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKWKoVr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKWKoVr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0BBC4CEEB;
	Fri, 28 Mar 2025 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168479;
	bh=EmZDIqrK6Py0vyMWn7LpBxXQD66V6MlG1++ohPNXEJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKWKoVr2wvbDDGFZRq4FPU3dKxO60Qz8/ViZyhz10eEt++zfU8BBZZvdJgjQ2h5qE
	 OYlH6r/9zL7oufnn4Ld7NBKBFQJusCwPZ3i5oSPK8R7FC025m/E1/JNPc+3RtMLoSw
	 s5DMz1aeDEK/Z0mHGs4OnKt2OOcbSIO9/sEzmkBRztqwi9ByvRu8aOE8+Rv/i6mgQA
	 smssT7VmEpziDddtSFkdWWD0Io1Zqxh1cz0mV+B5J2sB9WWEtCyMt515TyBLSacBcN
	 cYdBL2OnhWLK5zZ3IkIoVhlXgL1VAt6yiTMHD0bZEWcLuYxjW/jabWYOrrqxPFz0de
	 +9odhRSguv1xA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 15/49] x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
Date: Fri, 28 Mar 2025 14:26:30 +0100
Message-ID: <20250328132704.1901674-16-mingo@kernel.org>
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
index 3d395128f913..36c7708f40e7 100644
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

