Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23D296171
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350129; cv=none; b=YN7ytdaULB2hFD4cDm5liUKMLyODkuPFPNrTSIxnx57nA6gsig2Ei7o/jAFh/yuhMzUn0jIW52KmyXJnq7o4BOEKHsclC62fYW0anbCogA11JQguvfGI+hpDJgsdzy3U1bBccfiSMo7wnrq07RRUFZBViPnkBk8t7pbjuzsjvqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350129; c=relaxed/simple;
	bh=lyCApSzB3Dokghhd8Ey2R2XphdhSMxBO52IMlu4kvkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfAJCPXlHlLWOejV6P66FC3TKzh9oMbdyIhnoQ7UBuG5s/eLejsxIRsShkkeZN+JesVJIkEyZYeoxFRw0CHEmLOaHZ6dEQ1GUxvXnXytuDKqX8BA5cog9k9EzLIRBNRNZWes6CGOLdVyXr4nyl/RGZTH81M+36G0nZ2eASoZJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9/Ca+yI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9/Ca+yI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CEDC4CEE2;
	Fri, 11 Apr 2025 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350129;
	bh=lyCApSzB3Dokghhd8Ey2R2XphdhSMxBO52IMlu4kvkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B9/Ca+yIO/vAdTeKVy6GNTc4noqRrS3JNtbg0rRdDUFbREyUA2fCEHUJB6bRXuBKu
	 gOPpnb5Tqpo1/FFT9lX/hw4sE9XvSTDzJ/RyP5NTBxGoAvXWhhvL/2IO75eVhI51EL
	 ZX8zi/mbjN/Ik4iLBxRGTbkzlVQm0NwshawaRyBUp2PAyyrMRJASq/MUpOYl8HKNys
	 hQ26Nh6CajU584ECH5Aie82Mf6viGd1but7nw1Q0mqQHeBMrtH9KjJtHFeVneOVRh4
	 yiABXcm4NI8942mPT2xhbApbci4qzUkM/S6eruXIeTRG+0Hh1PYsL7FKRKzaorOjfn
	 YMc9Rs27Ldl/g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 24/53] x86/alternatives: Simplify smp_text_poke_single() by using tp_vec and existing APIs
Date: Fri, 11 Apr 2025 07:40:36 +0200
Message-ID: <20250411054105.2341982-25-mingo@kernel.org>
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

Instead of constructing a vector on-stack, just use the already
available batch-patching vector - which should always be empty
at this point.

This will allow subsequent simplifications.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d4eb20aa8d7c..09c6be8900d3 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2904,8 +2904,13 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct smp_text_poke_loc tp;
+	struct smp_text_poke_loc *tp;
+
+	/* Batch-patching should not be mixed with single-patching: */
+	WARN_ON_ONCE(tp_vec_nr != 0);
+
+	tp = &tp_vec[tp_vec_nr++];
+	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 
-	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
-	smp_text_poke_batch_process(&tp, 1);
+	smp_text_poke_batch_finish();
 }
-- 
2.45.2

