Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABE1E1DED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108927; cv=none; b=djmHJlRmwYW3obOnMNZPGTYrXqoL3W+lvKa/BT51nZN8ylr/FkIOGfDW5FLwQ1sURun+InUsZ9YFnDrc7jmeTXVZTr5xwG/WasfhZXVhhygly38b5aMKb7va0iCt3dpQjlO85FyM4Yr/lYunOAniz696qh52VenSaO4nqHrrcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108927; c=relaxed/simple;
	bh=7ALMOuG7jWpUDlRjq+Q/UOkbY2mXJBUhKxrusBFu4c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZYJ3KJ3ByrJYTwRLsgQNCzWWzET6+roSFuSVsUFveNKporPsPag7Y8FyUPIRxmaISG7js/NGuTH8hLbPfyKlJpFRCmEd2SJVumWuC9u666EMT2QD49Ys8VEfrffj+CZpWsCS2V8CL+e+U6sbS1fA3DG5sp9yPCQyId8K2xvQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIrwVTo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIrwVTo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D645AC4CEDD;
	Thu, 27 Mar 2025 20:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108926;
	bh=7ALMOuG7jWpUDlRjq+Q/UOkbY2mXJBUhKxrusBFu4c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XIrwVTo7JFihxY0SJr9/wguPGqmXiAnB93a0eQ7SsGeU+fJC5vfSwo7nOM/bzc1DA
	 YhLdpo8v7HZC39hSo1iFxoOlpJsQS5fttNbtD0xrmseBZrRkAERMQhAyxqXUPnYbQl
	 zmi6hV0/0XWI0nvOu6ttGGOBWcxz4Xa2PZy4zdpO7epIeHjC6qOBkEVc23AG74R+Ai
	 vc7IS0YLxunAJTUMhMUFzQVgu8GM97fskaZNHEiA+mDy46+hO5Hq+FKG9HUPXBoSRu
	 /2jTw+LjTkBdkKkENUlzcWIK/+qkcvG80KCkCmmWPROE22bCSTytsDjSv90X6OYVLq
	 Uj8OpnkCnh3BA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 36/41] x86/alternatives: Remove the mixed-patching restriction on text_poke_int3()
Date: Thu, 27 Mar 2025 21:53:49 +0100
Message-ID: <20250327205355.378659-37-mingo@kernel.org>
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

At this point text_poke_int3(addr, opcode, len, emulate) is equivalent to:

	text_poke_int3_queue(addr, opcode, len, emulate);
	text_poke_int3_finish();

So remove the restriction on mixing single-instruction patching
with multi-instruction patching.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e1cc3e109feb..2807d35c7676 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2893,9 +2893,6 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
  */
 void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	/* Batch-patching should not be mixed with single-patching: */
-	WARN_ON_ONCE(tp_array.nr_entries != 0);
-
 	text_poke_int3_loc_add(addr, opcode, len, emulate);
 
 	text_poke_int3_finish();
-- 
2.45.2

