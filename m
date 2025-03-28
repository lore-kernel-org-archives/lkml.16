Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF90190485
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138266; cv=none; b=XZK6xhu6ys3gP43V6dSOw0GPOMxN5GjqJ1PaFXsoux6hkE9g9liGleIebCug4GsstUxc+GjKsBWnGZH+IHS3gcnFfuCIGRucCA46BXH6TnRL6HPsQxK29bYbsCaCYTFK1/PC1Dy1OiAYHmNvm3KXRkad+67UDYV2yeLSGux3CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138266; c=relaxed/simple;
	bh=EgH+zS8m02VBfvYvd5mItGroGZUXJBXJ8xd4n5yOAJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFJ7ZwkwhY6X2Sp7G3siXxq8rImwjl5D0L2szAezASaZ/Bk7eRl9ns35hg49XH1EWQuAs5QUQhq3orSahpdk9u4tutG9tRx4sBV6HMsZ5vGJ1MJSfkGDGguNd2MKxNeC0XAbjQTMRkZ4SN5KB7si9G1X9H4Ig54oVk2pjM8i9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+FhOJ5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+FhOJ5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF21AC4CEE9;
	Fri, 28 Mar 2025 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743138266;
	bh=EgH+zS8m02VBfvYvd5mItGroGZUXJBXJ8xd4n5yOAJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T+FhOJ5RjOfPjBGz7/Xw2airX0wkhF8X0njb21yb5BXBPGklPT4YfgNX7RP4p25yj
	 y5cOP2/2PeJ0hwryVQlBI0grU0DCTETQBvVp+erpyh6Kd6aLeP+uFFSYW1thGXwCOD
	 FOqRSztajWOohZvr8sfETYr7ssl5YVBlVSo25Nrhn6wE+0DWGrIkoxTvU91Tb07krt
	 6OgbxLPTOhsn4IxlsfWiW5JWYUOp5ZKd/KBNOgzEzTXC+tRGapDysg7ia7SijjZYb2
	 q52SNcwP3edM3ho7VWB2VTjJ+3q3A4M1bT6zje4Ae0ecibaJDRo0vmLvAamMR84wW5
	 59yi9To09nKnw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] objtool: Fix seg fault in ignore_unreachable_insn()
Date: Thu, 27 Mar 2025 22:04:21 -0700
Message-ID: <5df4ff89c9e4b9e788b77b0531234ffa7ba03e9e.1743136205.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743136205.git.jpoimboe@kernel.org>
References: <cover.1743136205.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check prev_insn before dereferencing it.

Fixes: bd841d6154f5 ("objtool: Fix CONFIG_UBSAN_TRAP unreachable warnings")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/d86b4cc6-0b97-4095-8793-a7384410b8ab@app.fastmail.com
Reported-by: Ingo Molnar <mingo@kernel.org>
Closes: https://lore.kernel.org/Z-V_rruKY0-36pqA@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3bf29923d5c0..29de1709ea00 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4037,7 +4037,7 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	 * It may also insert a UD2 after calling a __noreturn function.
 	 */
 	prev_insn = prev_insn_same_sec(file, insn);
-	if (prev_insn->dead_end &&
+	if (prev_insn && prev_insn->dead_end &&
 	    (insn->type == INSN_BUG ||
 	     (insn->type == INSN_JUMP_UNCONDITIONAL &&
 	      insn->jump_dest && insn->jump_dest->type == INSN_BUG)))
-- 
2.48.1

