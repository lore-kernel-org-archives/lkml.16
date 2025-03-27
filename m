Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849C1F4CA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108893; cv=none; b=erbB2KbCrPbGGnUBnKSy0r1OhiaqidD7luO7yTBi91Eq31a7HY0muceXN87n6ZccDPcUe7JisyI6xsDvBlcK3adBGFlkPDLzc4/MG/RWkxVonEDSsYrTaXFK68445YuLUxxVzWXN6qpCG1mjbhub3iWiASDFLRlZ+s5ZAPhlXx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108893; c=relaxed/simple;
	bh=2DZAbxn4eU3D1we1tIjKqz9zqdYULwjE7sxoLgezx0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5NP2lVk/ULUCLvvqN87gRx8i9oopU0YQWjBn2jFQc9ZHtv+Jz9sS7oeVwZHEmH6BeVUjsBLPoZxuSbX/oLtXMIZdV82LgEr3TZ9Tg88GTgMquGAz0PAvXJzu7dH9TUjPuGRF+wS8rHtrVcUVWGWxeytnII8sqNBLrmb7wLWAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rih2p4VE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rih2p4VE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CC2C4CEED;
	Thu, 27 Mar 2025 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108893;
	bh=2DZAbxn4eU3D1we1tIjKqz9zqdYULwjE7sxoLgezx0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rih2p4VEKvnrKSd6+tHE0tUFZHHdaTMfNjqPgVYuVA4T3bZ5lbrVXMUfyv81ruU5A
	 xef4Nvux13Tx/iJefMe6kkl8MoMmdpfx7ae0dUEIhSaGyBV69eDSRPMdTkHN9XMRfE
	 zVgi+31xd3MPoVdd6PLWg+3t9R3rRD+QeGzom6P9V1+Pv2QN/oRKfgdLRbwA/x+K5Y
	 hfIFfVYNsNfvofVzV3ybIQAPbPrX1rm+lKuuQaybCiJv/0fsxICSpVxdWOeE8/araH
	 zk3ugLv0PSECx/VwpgfK2EGjew8lLOTyU5hQ/MIRr/xEuYABhyl5E+e1fY7ZVaP3pm
	 J37ccbgESYGOQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 22/41] x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
Date: Thu, 27 Mar 2025 21:53:35 +0100
Message-ID: <20250327205355.378659-23-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tp_order_fail() uses inverted logic: it returns true in case something
is false, which is only a plus at the IOCCC.

Instead rename it to regular parity as 'tp_addr_ordered()',
and adjust the code accordingly.

Also add a comment explaining how the address ordering should be
understood.

No change in functionality intended.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 883c2146ce54..938e8e70a379 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2843,28 +2843,34 @@ static void text_poke_int3_loc_init(struct text_poke_int3_loc *tp, void *addr,
  * We hard rely on the tp_vec being ordered; ensure this is so by flushing
  * early if needed.
  */
-static bool tp_order_fail(void *addr)
+static bool tp_addr_ordered(void *addr)
 {
 	struct text_poke_int3_loc *tp;
 
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
 	if ((unsigned long)text_poke_int3_addr(tp) > (unsigned long)addr)
-		return true;
+		return false;
 
-	return false;
+	return true;
 }
 
 static void text_poke_int3_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
+	if (tp_vec_nr == TP_VEC_MAX || !tp_addr_ordered(addr)) {
 		text_poke_int3_batch(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
 	}
-- 
2.45.2

