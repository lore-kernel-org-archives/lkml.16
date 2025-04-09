Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF88BEA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239001; cv=none; b=ChY/t5KnX5vbDDz1bkUREBrEY/+AX9dLpbB5mq70CGE8G0wUbdyYRJSTzJ7l2T9S5oZvYfiMC1/sliaugoDlZnGcgM5DboPwqHyJKus7dVtscIU63pCE0QG5pKdtH2HFrr9fEArqQ4lf3idLHQy1Ii3EAk3K3XQiKemWv4riiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239001; c=relaxed/simple;
	bh=STjl6Kh5LzdDlzauV0JBdbzDc2HZyLLeYWYkMp84MOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aPS3gvgATtbvMgeR4nH7ysI0m3Qj0NdMMDD++uw7YGZxw66ACTUT0pP38bJt9SptDufZlVDuylTUt4hwhUoskyty7hx+4rXgY2H9gqvtLPJyW4o6aBbLwqc1LiV7E37MgszN5zu/hjOCbC2/VDIhwELQwbQqIgb3GigbHpkoMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQh+cu+x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQh+cu+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06F7C4CEE2;
	Wed,  9 Apr 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744239001;
	bh=STjl6Kh5LzdDlzauV0JBdbzDc2HZyLLeYWYkMp84MOM=;
	h=From:To:Cc:Subject:Date:From;
	b=NQh+cu+xu+/7a6bescZcVHH3tqsfKw3tnw6x9t3PAZdj3y+fZ92iPIr1XudRwLVcq
	 u08fFPHTglh0hn8NtTo2zxop6I4iWysF78Rfvo8p4N4HTf8rTYZqXANEXgY2xLYL2p
	 pACWtiZpddU7GeaxfcQrsp3+X0LGG9hLqTR63ED6Ey1MrXbS1uf+YsXRo8W0ibHVcT
	 9EjHGqFQD7zgyK3A/GfMuZ3qGZDJ90vckcEUEBdwt9J3D1doS0Z1DJ/1JVnrhOEaAh
	 i+OBr4Eyccju0B55Ha2k171mHIX9wrowc+B/DJ9ixW0Z65GrtPf8imf9SPpMXpop34
	 Nw0kcJrcWqhpw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] objtool: Fix false "ignoring unreachables" warning
Date: Wed,  9 Apr 2025 15:49:36 -0700
Message-ID: <5eb28eeb6a724b7d945a961cfdcf8d41e6edf3dc.1744238814.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to try to automatically disable unreachable warnings if
they've already been manually disabled due to CONFIG_KCOV quirks.

This avoids a spurious warning with a KCOV kernel:

  fs/smb/client/cifs_unicode.o: warning: objtool: cifsConvertToUTF16.part.0+0xce5: ignoring unreachables due to jump table quirk

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202504090910.QkvTAR36-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/arch/x86/special.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 403e587676f1..06ca4a2659a4 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -126,7 +126,7 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	 * indicates a rare GCC quirk/bug which can leave dead
 	 * code behind.
 	 */
-	if (reloc_type(text_reloc) == R_X86_64_PC32) {
+	if (!file->ignore_unreachables && reloc_type(text_reloc) == R_X86_64_PC32) {
 		WARN_INSN(insn, "ignoring unreachables due to jump table quirk");
 		file->ignore_unreachables = true;
 	}
-- 
2.49.0

