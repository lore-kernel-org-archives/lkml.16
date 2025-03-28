Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391AB231A3B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168551; cv=none; b=XIsO+QLB1qAA9BiflTWwknk+jT/ni88RjmWHgAMJQwPiDipP8hvl6LQqDDK63okofCPwXpHQGgDcGPEOik6AOWtQCAQ+n/XWJveIiwi6vk+tQZlL9Q5yYEuMYsPMGG3rHQPtY48NAP3RNJ+us50ijCPX6veLbYMG5uaHQ4SZyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168551; c=relaxed/simple;
	bh=+4TEvDCl9pn5l0P3G7gieMO9jEV4OUzziwSnm8xIndY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYp48pWFqZZL8wxZI/lwqQ7VLrfXiUuEiBa38SREQUrk7+iwEErQnq2Cp/4iz3mN3kRq6liSFtIRGgDv2GJmR8SZEUdefaimc4mAAfAcZcEx0iTnLaAY4bURK5qI6kHWgyNbbeL5DG5JupFdI53JP4/f+8USS2bQJXAhnGLNtIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtjj+sFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtjj+sFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B87C4CEE5;
	Fri, 28 Mar 2025 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168551;
	bh=+4TEvDCl9pn5l0P3G7gieMO9jEV4OUzziwSnm8xIndY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtjj+sFzGoMZMaZ+Ophyla+bb6OEWlTup/vOmb80V6YTsu62ceX8w8G+TbZdbRfbx
	 Rq64KeDTZOAghArmp8VwpC0FNLKntR9hcMbYgr4SnDkah6braluIQJTXvkPy9F36id
	 +l2emSF6GX2byMTJA0WOaKiFTAtFBXU03VB4MSp73zpxRzKS6F8vHoQ1eVeQJ3JHmx
	 GFkGKvreWE4TGpzvDjFLXnLDJXtONviMhIbrWhxp6apzY1uSIDHoJ1J4yh1HLAfN7C
	 I/9q8Y3QfuepF8nDZNsOCdMngDMUjI4ZdwoBFMMxDaPavNZ7d4/YC8afqWPvXu00Bj
	 Vf5qFwsGKC+Ew==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 44/49] x86/alternatives: Rename 'POKE_MAX_OPCODE_SIZE' to 'TEXT_POKE_MAX_OPCODE_SIZE'
Date: Fri, 28 Mar 2025 14:26:59 +0100
Message-ID: <20250328132704.1901674-45-mingo@kernel.org>
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

Join the TEXT_POKE_ namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 4 ++--
 arch/x86/kernel/alternative.c        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 6834e652d26c..53ac94743e5d 100644
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
index 04c536d36765..d724ae8913da 100644
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

