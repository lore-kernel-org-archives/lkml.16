Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DB2BD5A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350191; cv=none; b=sruEU3UT+STtBxGosAZpbBg1Ox4aeQtOkxc6ZFzKwRijMeIPcu1bWxdW7ul9GCFRNo3in0bo+S2BJ7j+pGe6NxObPHMQaHZYH7a8FumSxsZBPgNgr1+HOWh5LL6bB6pbdN65FiBHQz3CjfMiqKjOsXlOZ+dghdz3NjZdCSaU7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350191; c=relaxed/simple;
	bh=egCr3mkvet3/AXmCOBCu30nw3QjIoKNyGxc4UXsVQsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1GDEiTbhiBl2gY4uFLWJ9FjIIAPP5ql0+/ko7SeT+KFGvMuyelyZQtgNNAnnjDkqtFZtSTk1dwUibpCpbvT6gz3znmeQURV8ZgMfLj5Mx/vFPyETIIE8rZul0tuWxlIBt3gbd2UsVnoZBeLGWy6BWtmVEn0iapdw0nOjw+Q9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awMgx7WE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awMgx7WE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DF6C4CEE2;
	Fri, 11 Apr 2025 05:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350191;
	bh=egCr3mkvet3/AXmCOBCu30nw3QjIoKNyGxc4UXsVQsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=awMgx7WEAuauQIn+TqQMWMJpMpZ3ir8lsSu+s71IofVRRRgimhgQRoeCmlr9+Zzqu
	 equVfDQC71iGaRUtUnsqiWFBU5GCtLqv9Pw2dBR44BqRZ2m5dPyfa5Xvnv6sq5cCTS
	 mVf3AfRG5p1xl3qCDP43QatEMhzav/MqV8bj8GMJCFA+c9m9ugbmI8JAfov39/ZSe5
	 bV9GVlcXx0jlJ+vqhonU281NW0IGfD2c3yTvIx4jikDBUlyS9xPBksvjH8Dq7W7NvW
	 NUJITfJ73bdU6PBb295/Pz9tkOWLcFOMXqop6HYE97+WlFp7yONngwAqBLGF2RUu2i
	 3l/8EQi0y5HGQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 50/53] x86/alternatives: Update the comments in smp_text_poke_batch_process()
Date: Fri, 11 Apr 2025 07:41:02 +0200
Message-ID: <20250411054105.2341982-51-mingo@kernel.org>
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

 - Capitalize 'INT3' consistently,

 - make it clear that 'sync cores' means an SMP sync to all CPUs,

 - fix typos and spelling.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c0be0663425e..9ee6f879bce5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2561,24 +2561,26 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 /**
  * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
- * @text_poke_array.vec:		vector of instructions to patch
- * @text_poke_array.nr_entries:	number of entries in the vector
  *
- * Modify multi-byte instruction by using int3 breakpoint on SMP.
- * We completely avoid stop_machine() here, and achieve the
- * synchronization using int3 breakpoint.
+ * Input state:
+ *  text_poke_array.vec: vector of instructions to patch
+ *  text_poke_array.nr_entries: number of entries in the vector
+ *
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
@@ -2606,13 +2608,13 @@ static void smp_text_poke_batch_process(void)
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
@@ -2685,7 +2687,7 @@ static void smp_text_poke_batch_process(void)
 	}
 
 	/*
-	 * Third step: replace the first byte (int3) by the first byte of
+	 * Third step: replace the first byte (INT3) by the first byte of the
 	 * replacing opcode.
 	 */
 	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
-- 
2.45.2

