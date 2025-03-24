Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC531F30D1
	for <linux-kernel@vger.kernel.org>; Mon, 24 Mar 2025 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742853387; cv=none; b=o0DlHoLHnr9zyLLzSFdnoRKTxSCadk5Epj75nSk+LNIUBDQ63PEAI+qCV2SME/NNT78j3XTfqGv7tHsawExlTZzrdtnpdOZfbjaM9cyDJZMklqPB9Bou0kkeM82HZf0wHn1A++DBEuyolqguFiWAMUtfGtum9vfXo/Jm9sUoiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742853387; c=relaxed/simple;
	bh=dUwaxkgMT9R5Wn3IYDUsEuC6EQW97fKgnW3SaT+Ibmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbCxWLvWjgCH3kcGCGtjPW4w6PVg7EyjpCeRO4KdAIc98gq711KxUeSkKpAuv1Vmw6sdlol7Gz5YshvOJy0Lnuu0TM6N+6DtiEL6bAXnDucuVRAYKcq1A0E8VsBKN6CakdWESnpFBpoujsWVTLxCTbevqaNbW/9mk9wSh6QVT94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkWnhlAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkWnhlAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A0AC4CEED;
	Mon, 24 Mar 2025 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742853387;
	bh=dUwaxkgMT9R5Wn3IYDUsEuC6EQW97fKgnW3SaT+Ibmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkWnhlACiT0b8G2Avl+J2nV9dPXN87lYjbXPsvrsVWYTo1yGI89m7juUB3rz7AvyH
	 N/YwQB7qGxyG8lVObsBUcN4+ECk+3srZsk5ojoOmg4KmNZrTuHVHjQfVMllLz5ljwo
	 p+HGeAw5mrNqLd0UzIJTx6lEqDS/EJfr6RiNccwEgY+eQSlWWRi+zgX2cCXPMwoRBJ
	 1YkjSjDR6jVYsdiFtD3fRUh5gJqgIdHliP4N1MJFcFL9rsYs1OANQzcEShC4gl1oRs
	 45q0H44FKrzjvJ/h2W3+gOVHSKbnW95XM5HJzpxdnGMZyHCz3wBkPqmIZbNlPRB/lN
	 Ova3sCTZvxCmA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 13/22] objtool: Remove redundant opts.noinstr dependency
Date: Mon, 24 Mar 2025 14:56:03 -0700
Message-ID: <0ead7ffa0f5be2e81aebbcc585e07b2c98702b44.1742852847.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1742852846.git.jpoimboe@kernel.org>
References: <cover.1742852846.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The --noinstr dependecy on --link is already enforced in the cmdline arg
parsing code.  Remove the redundant check.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 03ec485a376a..f4b9fcc395eb 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -340,12 +340,7 @@ static void init_insn_state(struct objtool_file *file, struct insn_state *state,
 	memset(state, 0, sizeof(*state));
 	init_cfi_state(&state->cfi);
 
-	/*
-	 * We need the full vmlinux for noinstr validation, otherwise we can
-	 * not correctly determine insn_call_dest(insn)->sec (external symbols
-	 * do not have a section).
-	 */
-	if (opts.link && opts.noinstr && sec)
+	if (opts.noinstr && sec)
 		state->noinstr = sec->noinstr;
 }
 
-- 
2.48.1

