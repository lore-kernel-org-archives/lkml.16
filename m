Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1D293475
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350122; cv=none; b=XObjpJFjYjyQbJQ6vJu1br1JT48jQNB6zuqfw5tYoFvUXEPJk91gw03bBNBGqDclHLMf597Bu1a/0/tQK61rsdwEKvK3WcayflqkjoyVT25sP/tZM9D8G3D9V5mkSgOxbZ941KJjLtPbCkfM/yCwPnrrP4/i72nnx+L5LflTxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350122; c=relaxed/simple;
	bh=Cxr9+BpFDPItZf6/GxwLJEbbqAM3a68chIdZlEEpu00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLSZw9qnFEyzCtJq12dDBrzMKV+JuHZTlv6kiHBV+EcHE0ejOd3bQwfjPeKw04Ty6h2p+ikyhZuxD0oUtuvL22KUgIePwvfjXRkLPigBDenpUwXI8ArJqerB9NIbJ9y6ocxKXN1tNGGn8WzSKRDGjNf9XQaHC7Sv6vD8/6Hepmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6nd6fa+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6nd6fa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB89C4CEE2;
	Fri, 11 Apr 2025 05:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350122;
	bh=Cxr9+BpFDPItZf6/GxwLJEbbqAM3a68chIdZlEEpu00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6nd6fa+o/BuRWZyGJyfVp9kbi/mCQEJRrKFAOkwQBskOinGxBijBX+S2PQSWY/lr
	 0xKmn8Md5CnPcK8JmXe7XRgmMdMbNnfl0dFXqBAhphdc6wjFkeXDj43hf3Wx5pxzY7
	 bfxFOwnmIEuILatyWMsPZVrPHF5iG2y+hPj1zi/gR1yuPg2rger5W1+noZBYZwh1ei
	 jxu6ByAz1UeiO5keBLWdL61T+oUh8+b1wIuHGEJEbnQgeF8vgwEFSxyi//k9dLJoOH
	 Zi0SDE6jvXmo4e4MIdoAcXU3XLpM3ehBAggYZues3wU1g4nO1B3yah6bpcOKjIKTmY
	 X1aesOnVSoq/g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 21/53] x86/alternatives: Add text_mutex) assert to smp_text_poke_batch_flush()
Date: Fri, 11 Apr 2025 07:40:33 +0200
Message-ID: <20250411054105.2341982-22-mingo@kernel.org>
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

It's possible to escape the text_mutex-held assert in
smp_text_poke_batch_process() if the caller uses a properly
batched and sorted series of patch requests, so add
an explicit lockdep_assert_held() to make sure it's
held by all callers.

All text_poke_int3_*() APIs will call either smp_text_poke_batch_process()
or smp_text_poke_batch_flush() internally.

The text_mutex must be held, because tp_vec and tp_vec_nr et al
are all globals, and the INT3 patching machinery itself relies on
external serialization.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cb1723730f1e..d3d250dcefca 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2860,6 +2860,8 @@ static bool tp_order_fail(void *addr)
 
 static void smp_text_poke_batch_flush(void *addr)
 {
+	lockdep_assert_held(&text_mutex);
+
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
 		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
-- 
2.45.2

