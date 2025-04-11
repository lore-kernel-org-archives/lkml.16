Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07627EC8F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350158; cv=none; b=W60BM63ui80rt9d+IYvqTFmrpRhH1wkH58R5LITrIaemGqrojUvAcmKJbumvPGQiwQovFPp6E3GXkLN35Ev+hk4yHjy++OGB//FxKZDEhBaJ/8S++BEgqyGQEYae4T4i0HlsZjU0rOi3NazB/AQypJ+IluoapXfBM9+SCBCdZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350158; c=relaxed/simple;
	bh=HGw5sBbPivY24BHzcOkn/hmosqOGzdaca6k0lHUME1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2R9Thr0rCINg3s2BKUewp0VGBFzTHUsPojIT8JO/PkToS7bYlG2DGXJlb2iCgeXeyx9dL5bnnUiS5Up3H/Je0xY7YnletBl/RZyK+jXkLWmXIbk+tpJC8DaAKvGcCz28o0NEne4+kZRfN/JLO0FI/yMf0NNc9CxIvjK6XFM/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBhwWFlJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBhwWFlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49816C4CEE2;
	Fri, 11 Apr 2025 05:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350158;
	bh=HGw5sBbPivY24BHzcOkn/hmosqOGzdaca6k0lHUME1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBhwWFlJfnSoNcR5toAPMp+6QfVkaH4JOSapQItB5z7KD9o9h8S235PEifSPQVTzF
	 f5HiLRuZlkQrPoNNWmRYJUjQzKIVqFBBq3Sj/FiMGxE0NtvkO8Piv0UR0lHszn24k+
	 KOhpKsAgNLP7ijS7sfUBgUzhrCTGiL0/hS86CrMw52Gfze4gpAsFdTcPi1CLbmtBL/
	 UldkNMDBYZmUzH0Ztp+G860b+Jk6Ts9gQiW9Q2BiKZZtk8neQjvvVvi8pCmnIbpQkZ
	 xNxRbYj7vAhSC76lz0TnLfBgHpbSGICDt04XU+gewDjCZQPAIHZK1nWKIG+jn29/sv
	 TsrHNJPYNncyw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 36/53] x86/alternatives: Remove the mixed-patching restriction on smp_text_poke_single()
Date: Fri, 11 Apr 2025 07:40:48 +0200
Message-ID: <20250411054105.2341982-37-mingo@kernel.org>
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

At this point smp_text_poke_single(addr, opcode, len, emulate) is equivalent to:

	smp_text_poke_batch_add(addr, opcode, len, emulate);
	smp_text_poke_batch_finish();

So remove the restriction on mixing single-instruction patching
with multi-instruction patching.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index eb0da270043b..f0bb2158f27b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2892,9 +2892,6 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	/* Batch-patching should not be mixed with single-patching: */
-	WARN_ON_ONCE(text_poke_array.nr_entries != 0);
-
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 	smp_text_poke_batch_finish();
 }
-- 
2.45.2

