Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A096280A3D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350199; cv=none; b=FRxxn2WPycN5JWRJCKKOhCMIk7uRwV+rZrD00VISXVP/y8Pp9FoY7C8pH3btnCS1wjuJiX+dVPGkOKYkEUdT9wymq+e/3TG5+rVji4VcMEOTks8gZEgkL/Y3NRXb3xSawqAnk2MjRsty0ky0MAN1FOrtJ+eJLtiuV9PbeIncaus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350199; c=relaxed/simple;
	bh=UIdMzgbZmy/Hx3MCBOeO26dCBR19yi0+Lbwoq7DqXQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOoeH+CknRqvlcpM49Y4nmna+s3yA0mC9Z+8lixo08VCEa8QMqwoKcM4rOtDVb8r2yVSoTxkjvCjIMz2QnBWmljdvob3+GKvtDV2V/NpiYtvmpngwlGfomVjr3A8s5p52Bq65GlIqUOBw1f9vdxRwvzKvlTZHmzvOTv/x9ifXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6pKshpj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6pKshpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9847C4CEE5;
	Fri, 11 Apr 2025 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350198;
	bh=UIdMzgbZmy/Hx3MCBOeO26dCBR19yi0+Lbwoq7DqXQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6pKshpjB/tan7xD5mLSJxsixIBlKk7k9TyyU4g4bJ0WYB+SmMVzY1SsPTSIjoNX/
	 B4BnIztTVRZ2ZAfHugqCCAkXGgEAMTQQj3+93qXhhBP4lWu2Yr3SCrR3NxKNExarwZ
	 enBW8/IDhn5hF57zWLumae335uOqECi3A/e8uEENCP4CAh3hBlP0BuCCBVjEQezJYb
	 AbYjXUofdG67XbDdawULmYrdqH3YnMlitpBS9OHXpMaQmP72xA82bBnRN+AEeg0Fs5
	 gzqoem86DvWQB84fuDuKu8JAOeVvNCgQ+is6rdDB7dTwnQ++MfglWjZT8upAFFoZHi
	 BnAy+ZjSkXvsg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 53/53] x86/alternatives: Make smp_text_poke_batch_process() subsume smp_text_poke_batch_finish()
Date: Fri, 11 Apr 2025 07:41:05 +0200
Message-ID: <20250411054105.2341982-54-mingo@kernel.org>
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

From: Nikolay Borisov <nik.borisov@suse.com>

Simplify the alternatives interface some more by moving the
poke_batch_finish check into poke_batch_process and renaming the latter.
The net effect is one less function name to consider when reading the
code.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20250403153956.1913607-1-nik.borisov@suse.com
---
 arch/x86/kernel/alternative.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 604dd608d281..f785d2335812 100644
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
 
@@ -2507,7 +2507,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 		return 0;
 
 	/*
-	 * Discount the INT3. See smp_text_poke_batch_process().
+	 * Discount the INT3. See smp_text_poke_batch_finish().
 	 */
 	ip = (void *) regs->ip - INT3_INSN_SIZE;
 
@@ -2565,7 +2565,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 }
 
 /**
- * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
+ * smp_text_poke_batch_finish() -- update instructions on live kernel on SMP
  *
  * Input state:
  *  text_poke_array.vec: vector of instructions to patch
@@ -2587,12 +2587,15 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
  *		  replacing opcode
  *	- SMP sync all CPUs
  */
-static void smp_text_poke_batch_process(void)
+void smp_text_poke_batch_finish(void)
 {
 	unsigned char int3 = INT3_INSN_OPCODE;
 	unsigned int i;
 	int do_sync;
 
+	if (!text_poke_array.nr_entries)
+		return;
+
 	lockdep_assert_held(&text_mutex);
 
 	/*
@@ -2832,12 +2835,6 @@ static bool text_poke_addr_ordered(void *addr)
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
@@ -2854,7 +2851,7 @@ void smp_text_poke_batch_finish(void)
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
-		smp_text_poke_batch_process();
+		smp_text_poke_batch_finish();
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 }
 
-- 
2.45.2

