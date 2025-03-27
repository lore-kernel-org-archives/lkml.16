Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8097210F6A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071405; cv=none; b=GD2efFSsrjhSFJEaV69xLPrJyrrZS6+tDyOl7GblClUznSev99fnnAXLxeTrSYleJuV2EDOpwHAyaTjodFRNUMNCZeQstOidaJfitpN33KD9kzh8ticMUUB1eixAvk7DokcjBDWgiSIRdxlxpOAajAk6DYx+WQdqYM+R/3yWQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071405; c=relaxed/simple;
	bh=tLoDff4noC9eDpa+e8BeKdNFYnRcpSD+Synn8gBfa78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REcNfP1yMwJujfJgHcxSnwh34FCuextRFAYqAY9SHN0jVsR7wysWsDINPWXL9p6hraslkqHFlF12ipcfxOrEG9qpO6W+rOz0FmAz20SD6gXxcRC69uOXP5Ekj6YQjwVBwbeFacrV2XeAD398FG/dyiLYRw924SCnk+tAQEN5Y7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOxdaWMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOxdaWMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03286C4CEEB;
	Thu, 27 Mar 2025 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071405;
	bh=tLoDff4noC9eDpa+e8BeKdNFYnRcpSD+Synn8gBfa78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oOxdaWMZ+xxyG/nIb3n9dzfYhJC+cY6vH6WdqUc+dCBfDzeoKHXpzo5HjTef6Nqf3
	 0AlPTeSIwmpljFw2sfUCIyqARRyyv3a8DvoLWdDlKK3c1Wp6f0QxoSmaDl4++OWehp
	 nOvX9u7uI8L3SJGc/p41Ldm/niieTrTmNZN6w8oL2vjMUWT7XBmjTUS89ppTxeZjeU
	 t/t5WOB6q9sWK1/WQFSqwYpYqj76fFnmVM6bEtO9XFvQDQWg26r4b0qVmZWktkoaa7
	 eBOWaZ7BikTNP1XNKDXYO5klMSPFbG4UG0rXwgJvnrhrR0iznOKu0P/F5N6tXd99rI
	 6KpgSGinfp04w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 02/14] bugs/core: Pass down the condition string of WARN_ON_ONCE(cond) warnings to __WARN_FLAGS()
Date: Thu, 27 Mar 2025 11:29:41 +0100
Message-ID: <20250327102953.813608-3-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing this will allow architecture code to store and print out
this information as part of the WARN_ON and BUG_ON facilities.

The format of the string is '[condition]', for example:

  WARN_ON_ONCE(idx < 0 && ptr);

Will get the '[idx < 0 && ptr]' string literal passed down as 'cond_str'
in __WARN_FLAGS().

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 include/asm-generic/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index af76e4a04b16..c8e7126bc26e 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -110,7 +110,7 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #define WARN_ON_ONCE(condition) ({				\
 	int __ret_warn_on = !!(condition);			\
 	if (unlikely(__ret_warn_on))				\
-		__WARN_FLAGS("",				\
+		__WARN_FLAGS("["#condition"] ",			\
 			     BUGFLAG_ONCE |			\
 			     BUGFLAG_TAINT(TAINT_WARN));	\
 	unlikely(__ret_warn_on);				\
-- 
2.45.2

