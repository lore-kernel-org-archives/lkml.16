Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFCE21C176
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168514; cv=none; b=giMtvWWu7UZglkEsp77kHG3/Rsol3Hwlvgm7FepGaBRe+GveNZ/erICMJuGR3+gqYVxIOn3zfayeoQkspenCfqYQVtEB+UTSRP/wu3jt0MVnlMN8CncYIZ+bAjwP5XIv4CIlrLguBjcbRvv8+TJci9xMbDmtZj9ZU8Mkk+GEOQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168514; c=relaxed/simple;
	bh=Xa2f3D7B4w1wZ6w2TtyrZD+X50/h41Gn+1E7MilGMBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaO25Zk1IKvfbSCO/kkl5w/hAasNdTIZAYgSxJch12UMscRa+dw2A5fUCaYA+IiHU/gnKHu7dhsBSaihBkzcOxlJTRCMCI7XHiX5mRkOXZDsbHHoT9iXvtGU57V4dWKnJo7lvOmnIUw4ssvvbCqfkjb1rBDlc7o4yjSNbn9kkXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcDYX5zQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcDYX5zQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367F9C4CEE4;
	Fri, 28 Mar 2025 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168514;
	bh=Xa2f3D7B4w1wZ6w2TtyrZD+X50/h41Gn+1E7MilGMBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcDYX5zQVMUyRCOITCnSsJ2LtnNoULUVn1tKRRhETxoJSGS4tAcnpAl6sQ9FrGGPH
	 kWNVIXIrVsrfk38ktzrqVY0IiyA3JlGcZngCFH50SxdAhTjhFmc07CqZkv0EHATGpb
	 FK9HGIMG7t/xdneLlJoQVfqqaqCVbsSydaY/Sm4RLMs1/qmLXcrQa5mSr/bgP6pgXp
	 BEfmZ7m1hC/DJnpEaOWC5DinZ+voYJK/YPpCBDnECqv1P9Gsjzy43le4DEbxkuIuBM
	 +MS8VMefLUr6cU6QDqKjJ7o1mwuLS9tVYMXVEy7MbLI4Xxte/HVryAIWXr1dTxb30W
	 /z1hywaO6RCTQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 29/49] x86/alternatives: Simplify try_get_text_poke_array()
Date: Fri, 28 Mar 2025 14:26:44 +0100
Message-ID: <20250328132704.1901674-30-mingo@kernel.org>
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

There's no need to return a pointer on success - it's always
the same pointer.

Return a bool instead.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 202720228c98..12f0fd35773d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2475,15 +2475,14 @@ static struct smp_text_poke_array {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static __always_inline
-struct smp_text_poke_array *try_get_text_poke_array(void)
+static bool try_get_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
-		return NULL;
+		return false;
 
-	return &text_poke_array;
+	return true;
 }
 
 static __always_inline void put_text_poke_array(void)
@@ -2530,9 +2529,9 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	 */
 	smp_rmb();
 
-	desc = try_get_text_poke_array();
-	if (!desc)
+	if (!try_get_text_poke_array())
 		return 0;
+	desc = &text_poke_array;
 
 	WARN_ON_ONCE(desc->vec != text_poke_array.vec);
 
-- 
2.45.2

