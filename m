Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7630298CAD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350146; cv=none; b=cIhOZfgN0QYzpTbWeWGYZMafswIpdMwGlyo9HyLMHb3ibxWZAHqfYLzBUmLNf+ML7pWS5yiiOuZC9/yQsEWyaCJqS2HFTJPWxi/xZdiJDqMwu++M5QTc0OtHw0+Svd2rMs5kSjq4b2MQ4oHB3ZHX0vU+eaqmgsgMBUkLxgHnhqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350146; c=relaxed/simple;
	bh=WP0YunJFC2OWDdeHhznrBy/YZJ/p/c2BbJj5MQAcuSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHYgVkgukAgWxe4Uk0MjzxxJbacrvwFpzLo5oHmuJl/rCK0hrilLIOHkQWZvGa1+1rAqBJ8gc8nfMZJqzJIiWFcS871ttxr/jibCAWKytIB3IVOLyD7rsr86uaTsk096j1u8Wmk2Tzes+uGVAhQqoLRremM4RA8bAFhxn3DQkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqHJDdrW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqHJDdrW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5954FC4CEE2;
	Fri, 11 Apr 2025 05:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350146;
	bh=WP0YunJFC2OWDdeHhznrBy/YZJ/p/c2BbJj5MQAcuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqHJDdrWIRbB8rxsVg+9coG+4As0KL43dw8fDyUjUgGYLK1V7/KjZmidjwecFUhew
	 OU3YQKgBue/Pgkb1j5eum1b1cXZxCRMIjJBtsvU+B8bSBKGd0IPoOMfzWMlTpbO6PG
	 Rxxjrk5ImsJNdGbf3PQ8XsTahZbbzUZzdslRtikvHNKViTxtFANCAeJeTNLf1UHcFi
	 R30pzh/63wBGUom6Lr/hmJ/MAHs6vKu6ND0I7OqU34l5R4earlnq9ZaISc5MMHpI4B
	 RkrRPqoMOIaPydFVnMw84bNeymVoPtK8FbjWsrcG+2S3KmVlZ5bzG+TIE80dlN52Wd
	 yDNcxPiUc+VIw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 31/53] x86/alternatives: Simplify try_get_text_poke_array()
Date: Fri, 11 Apr 2025 07:40:43 +0200
Message-ID: <20250411054105.2341982-32-mingo@kernel.org>
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

There's no need to return a pointer on success - it's always
the same pointer.

Return a bool instead.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4ab9d227e306..357d708a3d4f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2475,15 +2475,14 @@ static struct smp_text_poke_array {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static __always_inline
-struct smp_text_poke_array *try_get_text_poke_array(void)
+static __always_inline bool try_get_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
-		return NULL;
+		return false;
 
-	return &text_poke_array;
+	return true;
 }
 
 static __always_inline void put_text_poke_array(void)
@@ -2530,9 +2529,9 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
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

