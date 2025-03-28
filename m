Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E922F16E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168543; cv=none; b=Nu5yU5x2PosTLWJWK9sa4z3sW5g2FzW1Rpx9H8tkgJ5Vw+WmlTkZxNl4BMx9hAI2AV7wx+6kzrNJ7QHU4fM++X0OvmJPKd6OJaXmEeAGhUVCT2+y/IVig9Pi0RI2Q2rB2DbbRWQPDDpmr+iJwQiyEMXiUP8lpOqQvfTMp1MzxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168543; c=relaxed/simple;
	bh=z8thZ30CzrDJ57LgmatHsMKsdMaS7R3hQzYRqZJGI8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3uqGC/kUEekIZVl8VWwdb1oSTpHzXQbwNOSIXHz0TipeHAN7lYDtwGxb9gq1l4x3f7MhKmhoO7j3mQMjxyouL5JLiRjeex2syKKoYU6OtTiyVRcP44r3yqEEXZXYjVYmBebQmIzZWbdfOQTAK2BR89yAFv5vcR30sOm+HHl5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaccyz+8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaccyz+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B995EC4CEE4;
	Fri, 28 Mar 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168543;
	bh=z8thZ30CzrDJ57LgmatHsMKsdMaS7R3hQzYRqZJGI8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gaccyz+8yvbYp/ZyWSj3E56GtVzFy04xKDsXVnTV23mEtuwWd7Nd6E3DMk5ZXQNH2
	 zre+BNROiANBgtqBEaplBkegzA0EWhsRH+9szCzMqL2oa7ZoRIgyIW5Og+MoVaR/kX
	 GJwBUj1sxCpZ6fK+BERcN2p3U/6SJOle6pzfOV9PFfjrJF/ENxMegIVWAeB8wroEqw
	 s5uID9rneRt65uU4I6QaO6N26cgYBYyGxky65l1b4oWQqvhuH+x1DtcF4vxn7oo3v+
	 1i+1WLztDJiRbQ/+18zgIUhvcdmwyzavaUwa0YlW513E9BMppUUmqhan9J6LSLzbBv
	 n9YNkCEEemJJg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 41/49] x86/alternatives: Simplify and clean up patch_cmp()
Date: Fri, 28 Mar 2025 14:26:56 +0100
Message-ID: <20250328132704.1901674-42-mingo@kernel.org>
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

- No need to cast over to 'struct smp_text_poke_loc *', void * is just fine
  for a binary search,

- Use the canonical (a, b) input parameter nomenclature of cmp_func_t
  functions and rename the input parameters from (tp, elt) to
  (tpl_a, tpl_b).

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5823d4764d92..d784738369d5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2498,13 +2498,11 @@ static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tp)
 	return _stext + tp->rel_addr;
 }
 
-static __always_inline int patch_cmp(const void *key, const void *elt)
+static __always_inline int patch_cmp(const void *tpl_a, const void *tpl_b)
 {
-	struct smp_text_poke_loc *tp = (struct smp_text_poke_loc *) elt;
-
-	if (key < text_poke_addr(tp))
+	if (tpl_a < text_poke_addr(tpl_b))
 		return -1;
-	if (key > text_poke_addr(tp))
+	if (tpl_a > text_poke_addr(tpl_b))
 		return 1;
 	return 0;
 }
-- 
2.45.2

