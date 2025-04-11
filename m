Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E07298CC2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350149; cv=none; b=hxt1AGJ9y5AF6XiURcJIOIEfNdfn4e/CHWVqU9SUHIZd68Q1G3K/8LGO/DppE1yd85P6ydkhGkJ5tpsSfSgyr2XSU5EdXwM6QPQLcdwzLKhMmik4hOKqCf5N9JlkO1bXaoZ39yYQUw5VoF+rNdPK1vFUsgjpyQDtaNCfrw0kfBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350149; c=relaxed/simple;
	bh=956PC3FXixsFDAeLSWwOk0G94ROVX8E2HD5NDUABTno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRXqdYMESe29RSvGSy+g7hWyd35cC0ZYY2ymisW8FrC4T8CahnEJgZr5KWMUAMZ16WaGHv9cndQ/GHmHiHfjd/Ypwk5xmA5Yzv7QOIfDgAyZaCEyAaiNObXbMlUNqHdLBpjwWvfHTCavtB4BopsHBHzm+tcE50ui5kc3goY1dCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtqPnaFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtqPnaFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8093C4CEE9;
	Fri, 11 Apr 2025 05:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350148;
	bh=956PC3FXixsFDAeLSWwOk0G94ROVX8E2HD5NDUABTno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AtqPnaFQHHe6cJQahbhz+mHGRI7aAEFL7HJ2UPsZJ3Ean3N0X24+/WPEHm7164uhB
	 v0R4QYYBnh2x8IArCaVZK8T6qbvBZaQf/Yk5PvfmJGKrPoVp1o3FV/AyRncuhtJSfh
	 SCkzasDpkS2dYYLTo5EClz7jL/gfXV7dB7APNaef5sn3RxtFulj/fj9eguThBdPz1R
	 Lugzyr4IHhKJiIzIQz4UBGkGIBC1Wye+lBI16Y4ehXoGOCvPTnBALnUGUQIbmubULu
	 2ueGc3DpsSa15oNzKLsdSj3nOIvTm6ScwJ9sjviPiyPK5sanJ/VT7tXst6XH8YhcCc
	 4cfz1p/UxLb6w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 32/53] x86/alternatives: Simplify smp_text_poke_int3_handler()
Date: Fri, 11 Apr 2025 07:40:44 +0200
Message-ID: <20250411054105.2341982-33-mingo@kernel.org>
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

Remove the 'desc' local variable indirection and use
text_poke_array directly.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 357d708a3d4f..f94a715d9b2b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2511,7 +2511,6 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct smp_text_poke_array *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2531,9 +2530,6 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 	if (!try_get_text_poke_array())
 		return 0;
-	desc = &text_poke_array;
-
-	WARN_ON_ONCE(desc->vec != text_poke_array.vec);
 
 	/*
 	 * Discount the INT3. See smp_text_poke_batch_process().
@@ -2543,14 +2539,14 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	/*
 	 * Skip the binary search if there is a single member in the vector.
 	 */
-	if (unlikely(desc->nr_entries > 1)) {
-		tp = __inline_bsearch(ip, desc->vec, desc->nr_entries,
+	if (unlikely(text_poke_array.nr_entries > 1)) {
+		tp = __inline_bsearch(ip, text_poke_array.vec, text_poke_array.nr_entries,
 				      sizeof(struct smp_text_poke_loc),
 				      patch_cmp);
 		if (!tp)
 			goto out_put;
 	} else {
-		tp = desc->vec;
+		tp = text_poke_array.vec;
 		if (text_poke_addr(tp) != ip)
 			goto out_put;
 	}
-- 
2.45.2

