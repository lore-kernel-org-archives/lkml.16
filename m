Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A121D584
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168494; cv=none; b=MHGSxHfZ0CbCcl7cFZCqBVCJ8Vs6i+HKwtCNf4Djl/47jTVu8WzdR3AVdBuuBs2gN9eI2T9Yu2QJI06QVI8B4n/Jbbk9kzdOpOE4qr2oRwq9iLU+YSzGU15rYWv6rwyVsUXqMybp1+/q6u64MQRSir3I+ZEZLYrekykbGaSI64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168494; c=relaxed/simple;
	bh=1MjuidLYoRQbBQZBlQfNFXuF6K0GxTisnjnQj3c/rfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QynVEwy3dFfolECt5qkkWoUuOrlooCWFF+kvmgl2kNu/QToGcl7tdUo6nnjjF1v9Ek3nJcqkkEZwxSQYEzdFW5CDKKoPw31o+ipbF8xTaEsfRu0DpNtw1bjJIvAq2dLqihNFExQlRUX3lV+GN4owV9TrdAejE/B+ErYcUDs4Zsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUaj1hlT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUaj1hlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D8AC4CEE5;
	Fri, 28 Mar 2025 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168494;
	bh=1MjuidLYoRQbBQZBlQfNFXuF6K0GxTisnjnQj3c/rfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUaj1hlTHzOgyyea6rjfjOE8v9Jl6QWS5kLfwtA9ZIPD/UetuFGgj4O15xjXTsaCZ
	 TjOPlk/EGsrvd9UH2q9etrU6YDl7E33kjP8/wFlNSoIcI3W4fNoFqAI7aqJRSzA9L5
	 XLaW0KuwEClEMwQeG13jYuWXuc0SCElFK+KY42Gfh85nnZtkMI0Vnh08YwBPSJ+o0Q
	 UN4GVYayB86j9FaoUxc76wtQcKNQtmmgjvuqPZWfSUt8SzWiH9YV6zqU2Qsi1r1eqC
	 W1Cll7j3L6+VFLf6YVA86VckLl6w9qIsRJs5gu9LDwla8U91UTMd+Ou4owtv9rIuIB
	 FXzUdiGODHNGw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 21/49] x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
Date: Fri, 28 Mar 2025 14:26:36 +0100
Message-ID: <20250328132704.1901674-22-mingo@kernel.org>
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

tp_order_fail() uses inverted logic: it returns true in case something
is false, which is only a plus at the IOCCC.

Instead rename it to regular parity as 'text_poke_addr_ordered()',
and adjust the code accordingly.

Also add a comment explaining how the address ordering should be
understood.

No change in functionality intended.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5fe54f3c6211..66778dac257f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2843,28 +2843,34 @@ static void text_poke_int3_loc_init(struct smp_text_poke_loc *tp, void *addr,
  * We hard rely on the tp_vec being ordered; ensure this is so by flushing
  * early if needed.
  */
-static bool tp_order_fail(void *addr)
+static bool text_poke_addr_ordered(void *addr)
 {
 	struct smp_text_poke_loc *tp;
 
 	if (!tp_vec_nr)
-		return false;
+		return true;
 
 	if (!addr) /* force */
-		return true;
+		return false;
 
-	tp = &tp_vec[tp_vec_nr - 1];
+	/*
+	 * If the last current entry's address is higher than the
+	 * new entry's address we'd like to add, then ordering
+	 * is violated and we must first flush all pending patching
+	 * requests:
+	 */
+	tp = &tp_vec[tp_vec_nr-1];
 	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
-		return true;
+		return false;
 
-	return false;
+	return true;
 }
 
 static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
+	if (tp_vec_nr == TP_VEC_MAX || !text_poke_addr_ordered(addr)) {
 		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
 	}
-- 
2.45.2

