Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B923535A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168561; cv=none; b=kY55A3ZXyww5FID3yja/KI8hM4Ork70YAXpV+r5+tRgDRF1QH3ZZqVdPwbh3FeiMb9WrNNbup17VdhkTF5blL2fIO4FCjeoaY4mm8VYZvekEi6OsjraNAbfruJvEHrylJ7hzeu/eD/qjMfg8eoK8k12SKkTjM0J8JQVHvYyeGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168561; c=relaxed/simple;
	bh=jaYn7tBzB3JSleDRcXcYRL1mMA34lR0DbCUN5pyM02o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKdPkGHnD6RirdnNpeKlqm5xjnAuE9AT1DuIQezK/FPBS0ldMkIiGR6HarLJzKfy/65td6tWdK0h1630HwIWCnAHKf8mSYPTM1Sq61F1yC/dBupMWruIYFLyn9t7QDgighdpJ91gQxxtbKFHZQ0XxTrXgDm7aJiRP/M333hTvRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6IGMAks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6IGMAks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1375C4CEE5;
	Fri, 28 Mar 2025 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168560;
	bh=jaYn7tBzB3JSleDRcXcYRL1mMA34lR0DbCUN5pyM02o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6IGMAks17Mo+kSamOGz3q9MPsz2BKzxkEetcOTqm/ATTF1ZFec0g/9BzIUH4vv1a
	 EFv/NsO4CVf3aW/9I3y1ZX8DfBJr4aaqIzdCgmDDHT9veOObAThHCdVaGCt/MPJOP+
	 wgz4orcBnIg06sq6R8SwvE6OTIzdX24yoPyh0CxmDA5hnPnTOpmLeB71VE0pAFnfwU
	 hx8xAsWJpGTOYLG/2XWk9P0F4biYEIMzhVM7AoT1ScRsKJ/J3IFuO6LyeWfpMTp4KX
	 FTLeBgBbQYTTDW2slVMkp8M5r7c01+lSt5jN8EKvcml9zzOzO2fAcpOgjPnyRESqxD
	 tulYGmUu+jc2A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 48/49] x86/alternatives: Update the comments in smp_text_poke_batch_process()
Date: Fri, 28 Mar 2025 14:27:03 +0100
Message-ID: <20250328132704.1901674-49-mingo@kernel.org>
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

 - Capitalize 'INT3' consistently,

 - make it clear that 'sync cores' means an SMP sync to all CPUs,

 - fix typos and spelling.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6de97646b4d6..a855db342c6a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2561,24 +2561,24 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 
 /**
  * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
- * @text_poke_array.vec:		vector of instructions to patch
+ * @text_poke_array.vec: vector of instructions to patch
  * @text_poke_array.nr_entries:	number of entries in the vector
  *
- * Modify multi-byte instruction by using int3 breakpoint on SMP.
- * We completely avoid stop_machine() here, and achieve the
- * synchronization using int3 breakpoint.
+ * Modify multi-byte instructions by using INT3 breakpoints on SMP.
+ * We completely avoid using stop_machine() here, and achieve the
+ * synchronization using INT3 breakpoints and SMP cross-calls.
  *
  * The way it is done:
  *	- For each entry in the vector:
- *		- add a int3 trap to the address that will be patched
- *	- sync cores
+ *		- add an INT3 trap to the address that will be patched
+ *	- SMP sync all CPUs
  *	- For each entry in the vector:
  *		- update all but the first byte of the patched range
- *	- sync cores
+ *	- SMP sync all CPUs
  *	- For each entry in the vector:
- *		- replace the first byte (int3) by the first byte of
+ *		- replace the first byte (INT3) by the first byte of the
  *		  replacing opcode
- *	- sync cores
+ *	- SMP sync all CPUs
  */
 static void smp_text_poke_batch_process(void)
 {
@@ -2606,13 +2606,13 @@ static void smp_text_poke_batch_process(void)
 	cond_resched();
 
 	/*
-	 * Corresponding read barrier in int3 notifier for making sure the
+	 * Corresponding read barrier in INT3 notifier for making sure the
 	 * text_poke_array.nr_entries and handler are correctly ordered wrt. patching.
 	 */
 	smp_wmb();
 
 	/*
-	 * First step: add a int3 trap to the address that will be patched.
+	 * First step: add a INT3 trap to the address that will be patched.
 	 */
 	for (i = 0; i < text_poke_array.nr_entries; i++) {
 		text_poke_array.vec[i].old = *(u8 *)text_poke_addr(&text_poke_array.vec[i]);
@@ -2685,7 +2685,7 @@ static void smp_text_poke_batch_process(void)
 	}
 
 	/*
-	 * Third step: replace the first byte (int3) by the first byte of
+	 * Third step: replace the first byte (INT3) by the first byte of the
 	 * replacing opcode.
 	 */
 	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
-- 
2.45.2

