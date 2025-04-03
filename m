Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1124C080
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694814; cv=none; b=H4DfMXE2xsoL9PnWrUk5Iyd25rQBjs2+6bvSO+rsu4AD3XmhWWV9lxXTfc4BH5bkmFg/QAG8PxCDV81RuN6x8odgYt8k/r4WPHCYif9/7shbQXBRXucKUlOBtCCrQwORvzAWfSwohhKd5GIYOGbWzH3cbd7WrMyRPzjtvXzLwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694814; c=relaxed/simple;
	bh=pIRKI7CBLzZ3p36rX1diRC/hFsidvLLQl9VLylm8QSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBxyTWKleBN1gbZ8KQ0gqXBn1VU6rhdOCG5xuhV1pwUTwVxd/n7+NaA15OOJV8EWjXagVMSDrkf4x2vL+n6jFsiwLskR0wi6ln/jkhqaNGSCpZ28UoX++nLYS1tLUnnS1GI8h7oSCUp7GOBmm9Gw38kNXX+g7lRAtUn4k5rtXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Tmeged81; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Tmeged81; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Tmeged81";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Tmeged81"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0657B211B8;
	Thu,  3 Apr 2025 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743694811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+Co8y1KxxwNK3eZtKvsPFfo93SjJWf/xgLUzAl05ZoI=;
	b=Tmeged813mhV6q7hJg/LOByxhQmgqN/xliAkS54M0OiWqg/G6T2P+GGvSz2CTpjnzqS9OU
	tF7vOK0Iog2q8kbxg2ZLDkAGi41/llB5henDgrjS2aj2lP8oQKpDCehdVlQ+aV5LkCX8S6
	rrdLb3mFUAmPwNi3bm/z0MQrsKVMiQk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743694811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+Co8y1KxxwNK3eZtKvsPFfo93SjJWf/xgLUzAl05ZoI=;
	b=Tmeged813mhV6q7hJg/LOByxhQmgqN/xliAkS54M0OiWqg/G6T2P+GGvSz2CTpjnzqS9OU
	tF7vOK0Iog2q8kbxg2ZLDkAGi41/llB5henDgrjS2aj2lP8oQKpDCehdVlQ+aV5LkCX8S6
	rrdLb3mFUAmPwNi3bm/z0MQrsKVMiQk=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB72713A2C;
	Thu,  3 Apr 2025 15:40:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q4qcJtqr7mexbQAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Thu, 03 Apr 2025 15:40:10 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: mingo@kernel.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/alternatives: Make smp_text_poke_batch_process subsume smp_text_poke_batch_finish
Date: Thu,  3 Apr 2025 18:39:56 +0300
Message-ID: <20250403153956.1913607-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Simplify the alternatives interface some more by moving the
poke_batch_finish check into poke_batch_process and renaming the latter.
The net effect is one less function name to consider when reading the
code.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 arch/x86/kernel/alternative.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5b1a6252a4b9..a5ecaebe1ea9 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2434,7 +2434,7 @@ struct smp_text_poke_loc {
 	u8 len;
 	u8 opcode;
 	const u8 text[TEXT_POKE_MAX_OPCODE_SIZE];
-	/* see smp_text_poke_batch_process() */
+	/* see smp_text_poke_batch_finish() */
 	u8 old;
 };
 
@@ -2507,7 +2507,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 		return 0;
 
 	/*
-	 * Discount the INT3. See smp_text_poke_batch_process().
+	 * Discount the INT3. See smp_text_poke_batch_finish().
 	 */
 	ip = (void *) regs->ip - INT3_INSN_SIZE;
 
@@ -2565,7 +2565,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 }
 
 /**
- * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
+ * smp_text_poke_batch_finish() -- update instructions on live kernel on SMP
  *
  * Input state:
  *  text_poke_array.vec: vector of instructions to patch
@@ -2587,12 +2587,16 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
  *		  replacing opcode
  *	- SMP sync all CPUs
  */
-static void smp_text_poke_batch_process(void)
+void smp_text_poke_batch_finish(void)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
 	int do_sync;
 
+
+	if (!text_poke_array.nr_entries)
+		return;
+
 	lockdep_assert_held(&text_mutex);
 
 	/*
@@ -2832,12 +2836,6 @@ static bool text_poke_addr_ordered(void *addr)
 	return true;
 }
 
-void smp_text_poke_batch_finish(void)
-{
-	if (text_poke_array.nr_entries)
-		smp_text_poke_batch_process();
-}
-
 /**
  * smp_text_poke_batch_add() -- update instruction on live kernel on SMP, batched
  * @addr:	address to patch
@@ -2854,7 +2852,7 @@ void smp_text_poke_batch_finish(void)
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
-		smp_text_poke_batch_process();
+		smp_text_poke_batch_finish();
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 }
 
-- 
2.43.0

