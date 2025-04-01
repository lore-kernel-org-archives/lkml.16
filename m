Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCA1C863F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481652; cv=none; b=js9RVs+eIpKc4QwWhlPUrdNSPODfDPR4iQLOgE/fvjF0IQCBeYkc4eMbB9e9zCNYnUFd3p6WXtxa9dLQ9wI6bpolQwBY54oQApzatN1HiSDauBdQmUbF5JIs/bNABhF9si2MLfskjdcvFPQySBuWsqW/TwQaxn+jUEEC2esa4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481652; c=relaxed/simple;
	bh=IjOKdxlBYugNhuleDznGFP9F/v+6SATan/Ji53JS+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2R/foFCPsntT/PRF2gWKh4tL6R+MxsNSdHw7kh5XgWRbZ753DYWvHM4UhigZOMuf2QUmC5Z3ym+fj050JbxhF7vHRkkZhG8UN6/DKb55jZJOu4T+v0VpBHB8h9Gm6nMFq6IyP0mC5HDazc2QmTXOL6HOqKTs0/ph0HxU8qu0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZ2qtfEO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZ2qtfEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AB8C4CEE8;
	Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481652;
	bh=IjOKdxlBYugNhuleDznGFP9F/v+6SATan/Ji53JS+9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZ2qtfEOT2yevbrixKL9g3TQwQt9eZMwv2yWjYYVaghMkDKZ4PhmDGZOOKchn+8G5
	 3WtiyPUO0+stiHUNJcVb4goC6YGvjHa1EXVPDtpNSmoeGahp+ioU7AFdiwvpXYpxSU
	 tlQxJclkpJUkGdI0inyBJxXkYuS8uriOhXvs2CI0f3kFCQoJKVjv3s+KhQr0S8wk8u
	 MPVJlJnGtIOHJ9+vPGsd+1H0zf4zT02fWwrUbkCWnlbTbZ9ptTbUpIOWZTwcehvgIX
	 gZ0W8FkhBz9CyUXXVxmJ+UNLlMeugkW40tIfDc8EsZGcURceUeO7agCGYQ0vFbSOOq
	 gXOvgw7hhfdiQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 03/11] objtool: Append "()" to function name in "unexpected end of section" warning
Date: Mon, 31 Mar 2025 21:26:38 -0700
Message-ID: <692e1e0d0b15a71bd35c6b4b87f3c75cd5a57358.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Append with "()" to clarify it's a function.

Before:

  vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock

After:

  vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock(): unexpected end of section .text.cdns_mrvl_xspi_setup_clock

Fixes: c5995abe1547 ("objtool: Improve error handling")
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e6c4eefe295b..bd0c78bfe90c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3761,7 +3761,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 				return 0;
 
 			WARN("%s%sunexpected end of section %s",
-			     func ? func->name : "", func ? ": " : "",
+			     func ? func->name : "", func ? "(): " : "",
 			     sec->name);
 			return 1;
 		}
-- 
2.48.1

