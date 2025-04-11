Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A60727F4F2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350182; cv=none; b=UJEan5p2X9A0nXxfJdztZ9D6yfSTBl0K6BudsC9PubnhIVZRCU+AbJZhJC2t8eWeo4uAaB8Lbad/ovVO9YCSbTU1uLqkS/R/5z1BPn0nuaACDHA0SPRspiXGOFUINSgblzs6ew93oRKT2vSK0dI9cBxBugmdElp8uRqlioojT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350182; c=relaxed/simple;
	bh=1e4YhLREtiY4dPdmIC26xRSMVltPv7w9IgK602p5zzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQpR4eJh5ZzE90ZANjwyjJqZ40NpOqKlR1MtF4QMgI82Jtg1hIrjeOej6yBXYRGRf2hL3C+sTsN9l/LvpHAzkeQBseUme0Th3aQ/8wTKi0K7DhHj+o7Ve4vw5UV9TTY8ElXjuXjiZehmcEk5JBcc8xcNwMIMROmMDl8pIVIR+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoIOL/MP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoIOL/MP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F5BC4CEE2;
	Fri, 11 Apr 2025 05:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350182;
	bh=1e4YhLREtiY4dPdmIC26xRSMVltPv7w9IgK602p5zzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoIOL/MPn28eV2g+gM//gt7TRRGkGAWJiM0XIGE50nf8C+WartAPKrgBAdDINPG+s
	 yDs9dzTbMi8MoI1WloG9pyB6hCXPhDDU+uf0zD2lHv/MB5u7D4m6PXK0vMlQJKYrzd
	 vfj49FLeqVDxeZ9dfrrIYjs4kineGHfyGiag+15BiZhfoDDIwh/AMCrsjfxqIB8AoK
	 Fn04qFlJHd0W+BYFrVUgSaBYSGJmYjs9sYtXDlvrDBebA3SwQuUomfEzWz+MJh2BPY
	 rbAQnYFvUqfAIM8PyzmuuBIlmYhAIxems7uRD1kaZ/jtYvlXnjVmVdnufUyyE1NR59
	 cq2IcmdVX5ugQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 46/53] x86/alternatives: Rename 'POKE_MAX_OPCODE_SIZE' to 'TEXT_POKE_MAX_OPCODE_SIZE'
Date: Fri, 11 Apr 2025 07:40:58 +0200
Message-ID: <20250411054105.2341982-47-mingo@kernel.org>
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

Join the TEXT_POKE_ namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 4 ++--
 arch/x86/kernel/alternative.c        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index d9dbbe9d9667..a45ac8a223f3 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -11,7 +11,7 @@
  * JUMP_LABEL_NOP_SIZE/RELATIVEJUMP_SIZE, which are 5.
  * Raise it if needed.
  */
-#define POKE_MAX_OPCODE_SIZE	5
+#define TEXT_POKE_MAX_OPCODE_SIZE	5
 
 extern void text_poke_early(void *addr, const void *opcode, size_t len);
 
@@ -82,7 +82,7 @@ static __always_inline int text_opcode_size(u8 opcode)
 }
 
 union text_poke_insn {
-	u8 text[POKE_MAX_OPCODE_SIZE];
+	u8 text[TEXT_POKE_MAX_OPCODE_SIZE];
 	struct {
 		u8 opcode;
 		s32 disp;
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4b460dea4f4e..b8e0b1b2383f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2461,7 +2461,7 @@ struct smp_text_poke_loc {
 	s32 disp;
 	u8 len;
 	u8 opcode;
-	const u8 text[POKE_MAX_OPCODE_SIZE];
+	const u8 text[TEXT_POKE_MAX_OPCODE_SIZE];
 	/* see smp_text_poke_batch_process() */
 	u8 old;
 };
@@ -2653,8 +2653,8 @@ static void smp_text_poke_batch_process(void)
 	 * Second step: update all but the first byte of the patched range.
 	 */
 	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
-		u8 old[POKE_MAX_OPCODE_SIZE+1] = { text_poke_array.vec[i].old, };
-		u8 _new[POKE_MAX_OPCODE_SIZE+1];
+		u8 old[TEXT_POKE_MAX_OPCODE_SIZE+1] = { text_poke_array.vec[i].old, };
+		u8 _new[TEXT_POKE_MAX_OPCODE_SIZE+1];
 		const u8 *new = text_poke_array.vec[i].text;
 		int len = text_poke_array.vec[i].len;
 
-- 
2.45.2

