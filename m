Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C271DE8A7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108857; cv=none; b=o5CiTzEspikHrtP7ecigDeU+9cqXm1u/Mb5+5fjs37k9UyvWGPPYgQsHB2uFVSiJTOb2cdwAxIYashZx8en4Ue07kFph5T4aM3Mg0k99jbKPuCerp60RjMm7UXWrYlW8eFK77Qrd8v5zyb93VY9JMZ0/PLDNqsGopSxeb1ZMk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108857; c=relaxed/simple;
	bh=+yld2kPw3Y0nsfuTsZpxBfmxj6LEFhkqSvSMpKQ2p4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ur0L9DRTZi+WeLCRFn865ViOK7YXAXp2yYrOdEyE8xwkgx6ThmRv048dI9Y27v0zkoSHddH+waJTIrnO8T+MwDZDXX3EKOVZUxkSqbsflPBJ/4WvJxL7Ji4IR8SCRR729b/FByjsnPe48rLEesj36JMmER0hzskTyK4ij2Lz39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jF9Hg5up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jF9Hg5up"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C170C4AF0B;
	Thu, 27 Mar 2025 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108857;
	bh=+yld2kPw3Y0nsfuTsZpxBfmxj6LEFhkqSvSMpKQ2p4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jF9Hg5upi8SnWDkNd7UuOK5i19+z14+zKHj5lroNd5x1Euy8e6Bon8bzTnHWG7SM7
	 q9N3Xb5lCsCQsJSl1YEk7AV8wakwGeZTIAX+wN1C2ArZQKtRwTIp0wUwF+dcJ6wjoM
	 JSRNGgZZwp1ZSIBPAhEDNpXmCpm0EnL36aIAzDinQCwkFXn5DdTzQpGgcqHCiidJ9l
	 fqEv0tHl/8PoFHuQqPhvaTCYY+OoTBHnkf6C032JB17oYVTuF0KuwYDmw3BtYSxERl
	 iAM683HYklZflnI9mB/O6YW8bMc9QgG4ndiuqsj6UlNcAyi84jA0jHHmMQR3YSvTTp
	 KqER0v979q2Bw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/41] x86/alternatives: Rename 'text_poke_addr' to 'text_poke_int3_addr'
Date: Thu, 27 Mar 2025 21:53:20 +0100
Message-ID: <20250327205355.378659-8-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f4baeeaa6c0c..100b606d7dde 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2499,7 +2499,7 @@ static __always_inline void put_desc(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_addr(struct text_poke_loc *tp)
+static __always_inline void *text_poke_int3_addr(struct text_poke_loc *tp)
 {
 	return _stext + tp->rel_addr;
 }
@@ -2508,9 +2508,9 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 {
 	struct text_poke_loc *tp = (struct text_poke_loc *) elt;
 
-	if (key < text_poke_addr(tp))
+	if (key < text_poke_int3_addr(tp))
 		return -1;
-	if (key > text_poke_addr(tp))
+	if (key > text_poke_int3_addr(tp))
 		return 1;
 	return 0;
 }
@@ -2555,7 +2555,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 			goto out_put;
 	} else {
 		tp = desc->vec;
-		if (text_poke_addr(tp) != ip)
+		if (text_poke_int3_addr(tp) != ip)
 			goto out_put;
 	}
 
@@ -2660,8 +2660,8 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 	 * First step: add a int3 trap to the address that will be patched.
 	 */
 	for (i = 0; i < nr_entries; i++) {
-		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
-		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
+		tp[i].old = *(u8 *)text_poke_int3_addr(&tp[i]);
+		text_poke(text_poke_int3_addr(&tp[i]), &int3, INT3_INSN_SIZE);
 	}
 
 	text_poke_sync();
@@ -2677,7 +2677,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 
 		if (len - INT3_INSN_SIZE > 0) {
 			memcpy(old + INT3_INSN_SIZE,
-			       text_poke_addr(&tp[i]) + INT3_INSN_SIZE,
+			       text_poke_int3_addr(&tp[i]) + INT3_INSN_SIZE,
 			       len - INT3_INSN_SIZE);
 
 			if (len == 6) {
@@ -2686,7 +2686,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 				new = _new;
 			}
 
-			text_poke(text_poke_addr(&tp[i]) + INT3_INSN_SIZE,
+			text_poke(text_poke_int3_addr(&tp[i]) + INT3_INSN_SIZE,
 				  new + INT3_INSN_SIZE,
 				  len - INT3_INSN_SIZE);
 
@@ -2717,7 +2717,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 		 * The old instruction is recorded so that the event can be
 		 * processed forwards or backwards.
 		 */
-		perf_event_text_poke(text_poke_addr(&tp[i]), old, len, new, len);
+		perf_event_text_poke(text_poke_int3_addr(&tp[i]), old, len, new, len);
 	}
 
 	if (do_sync) {
@@ -2742,7 +2742,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 		if (byte == INT3_INSN_OPCODE)
 			continue;
 
-		text_poke(text_poke_addr(&tp[i]), &byte, INT3_INSN_SIZE);
+		text_poke(text_poke_int3_addr(&tp[i]), &byte, INT3_INSN_SIZE);
 		do_sync++;
 	}
 
@@ -2857,7 +2857,7 @@ static bool tp_order_fail(void *addr)
 		return true;
 
 	tp = &tp_vec[tp_vec_nr - 1];
-	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
+	if ((unsigned long)text_poke_int3_addr(tp) > (unsigned long)addr)
 		return true;
 
 	return false;
-- 
2.45.2

