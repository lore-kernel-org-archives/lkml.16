Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084020126B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108939; cv=none; b=oUiavxm6XV/ufWswySdoSmnjbMuNu/ow0kjtM2Guzz4sWHEfZehgSMyZrQFGn22a2IJuSHGAyTNAAFK7omU5TzxBjJPXZOOyQ8tQaxen5+xJZwZjGDAmBmNVLdD2tW9G7XhYe3x6Y8/mU/sHrwiBPCThmw0AIFb88f/2uF/D9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108939; c=relaxed/simple;
	bh=0GUOSXJuYhO7n4hvtyZ3fk4YLaL5zvqwT4xfK0SfvHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqIsHTJWUamH9dKKRxxXFRqGZI3qf/ONdfOKPC33cFJxD2Y5TryPD8NDXxcbNSWK+Hxh96N3rijJ8vWKktBaXmUIAmqhhzoQvN/tUeJutfYHOHWNtkz65hlfgx9ax4EtYOk+Ys8D88NU5hgzWStV7c8tguSDfKMYWtS3xpLVqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAvncNBN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAvncNBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BB4C4CEE8;
	Thu, 27 Mar 2025 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108938;
	bh=0GUOSXJuYhO7n4hvtyZ3fk4YLaL5zvqwT4xfK0SfvHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAvncNBNq9VwnE/UJI1luNP2nXXgizMWNhpdLIVc4zZ0q8APYe0kZmyn3emw+Dfnv
	 TpdIr+p4+VQeANCHMcROHBjf5xhurmqnOFtJu4XDM7Ma9bTpnPPzwUq0Og5KxDLemG
	 sXuvsE07PyhIGh8IEwL1oEyqn8eLEywsvCMWrT85nkcspw0fYPufIQVdEnZEZyLIdz
	 1Lj2E5aQ2ApI6nNV9i5+WmESzNc1b3H0wSRTPXAPBO05woWs1Chk6VtXNJnCwVrH4+
	 VffwsA+4EKrccE/YFovrlPGuCWD7V9yWN8wdvXd38uX17+ddb3QVAjrfMHH6N8/7K9
	 EmOynwKl54FsA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 41/41] x86/alternatives: Simplify tp_addr_ordered()
Date: Thu, 27 Mar 2025 21:53:54 +0100
Message-ID: <20250327205355.378659-42-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use direct 'void *' pointer comparison, there's no
   need to force the type to 'unsigned long'.

 - Remove the 'tp' local variable indirection

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 32d3707d7963..7367c829a4fb 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2838,8 +2838,6 @@ static void text_poke_int3_loc_add(void *addr, const void *opcode, size_t len, c
  */
 static bool tp_addr_ordered(void *addr)
 {
-	struct text_poke_int3_loc *tp;
-
 	WARN_ON_ONCE(!addr);
 
 	if (!tp_array.nr_entries)
@@ -2851,8 +2849,7 @@ static bool tp_addr_ordered(void *addr)
 	 * is violated and we must first flush all pending patching
 	 * requests:
 	 */
-	tp = &tp_array.vec[tp_array.nr_entries-1];
-	if ((unsigned long)text_poke_int3_addr(tp) > (unsigned long)addr)
+	if (text_poke_int3_addr(tp_array.vec + tp_array.nr_entries-1) > addr)
 		return false;
 
 	return true;
-- 
2.45.2

