Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADDB29D03F;
	Mon,  5 May 2025 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484846; cv=none; b=MKut0S0G7tY4TphAqOGnSZARkMiaxv83VPgBSTGv2c9je7ElGudpXrn6NdxgZvyXRlx56eyJDU2K+tr2gOf4Va6CQ8smKDgh2ddiryNKEaM0AE3kUQN+yIzx5OtOqibacP6DcbfBH+QYk0otVKLk55wEt4euG2VvKKaX3lbQ+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484846; c=relaxed/simple;
	bh=lbq2ZlRyzS2fGbedn9wEUr/1+pe97jl2ILTEXWYuyhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a2AKLbhaaXqjc0BimWQ0Py+JJLcB1ZXEHyqNuY0OnfwZV/GYG3q74WySgrMGHaW5L8w3HlSq2nb/gl/73zz/yBJlxpCJJcA7ZpJ70mLFL8s7+AMXiddAdFPt9G3WolyHrbneHxruhagsDGL+ovh3NmBPiMGIltrgWopwmrcmkW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOAeo1Xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOAeo1Xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40107C4CEE4;
	Mon,  5 May 2025 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484846;
	bh=lbq2ZlRyzS2fGbedn9wEUr/1+pe97jl2ILTEXWYuyhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dOAeo1XsCEnOPxaAxL1o8ZDisVHTeEru+8zV7Bgb/d2AKfcirJDrPAMcrumGvFEuz
	 GRtmDehy9B1fvLtNnCORY9MacGsnIpkpiQZ2eeLfJGapBeJ0S3opm1KUbt68OeIVVG
	 7dhQ4vqFfbRwA5b4dhAogzmPnRhgE0hIs6cKd9TxFCA5zeUr8h2x2mVQccN5QJiOBT
	 55wsVdQpFNFBxrq1LmA2hP+7JDvMr7TeaNr38U0qWsZ9/MPy39YUFY6R+PNd2/VQtK
	 aR2hKLZCp5+MBOSu3NxQrVLlre+oxj+LJaEnguScqpPWuvs0ttPBjxPxc87QbJs1eQ
	 l4kj/XHOGuXaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	peterz@infradead.org
Subject: [PATCH AUTOSEL 6.12 044/486] objtool: Properly disable uaccess validation
Date: Mon,  5 May 2025 18:32:00 -0400
Message-Id: <20250505223922.2682012-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Josh Poimboeuf <jpoimboe@kernel.org>

[ Upstream commit e1a9dda74dbffbc3fa2069ff418a1876dc99fb14 ]

If opts.uaccess isn't set, the uaccess validation is disabled, but only
partially: it doesn't read the uaccess_safe_builtin list but still tries
to do the validation.  Disable it completely to prevent false warnings.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/0e95581c1d2107fb5f59418edf2b26bba38b0cbb.1742852846.git.jpoimboe@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/objtool/check.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d8aea31ee393a..175f8adb1b76d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3352,7 +3352,7 @@ static int handle_insn_ops(struct instruction *insn,
 		if (update_cfi_state(insn, next_insn, &state->cfi, op))
 			return 1;
 
-		if (!insn->alt_group)
+		if (!opts.uaccess || !insn->alt_group)
 			continue;
 
 		if (op->dest.type == OP_DEST_PUSHF) {
@@ -3819,6 +3819,9 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			return 0;
 
 		case INSN_STAC:
+			if (!opts.uaccess)
+				break;
+
 			if (state.uaccess) {
 				WARN_INSN(insn, "recursive UACCESS enable");
 				return 1;
@@ -3828,6 +3831,9 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			break;
 
 		case INSN_CLAC:
+			if (!opts.uaccess)
+				break;
+
 			if (!state.uaccess && func) {
 				WARN_INSN(insn, "redundant UACCESS disable");
 				return 1;
@@ -4303,7 +4309,8 @@ static int validate_symbol(struct objtool_file *file, struct section *sec,
 	if (!insn || insn->ignore || insn->visited)
 		return 0;
 
-	state->uaccess = sym->uaccess_safe;
+	if (opts.uaccess)
+		state->uaccess = sym->uaccess_safe;
 
 	ret = validate_branch(file, insn_func(insn), insn, *state);
 	if (ret)
-- 
2.39.5

