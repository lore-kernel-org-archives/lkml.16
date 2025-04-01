Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D91E260C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481655; cv=none; b=u4TyqxdRqC+aGm3YC7GlPxIif8Lz41M9NL9b7zGucsmAUCs9AelUj0gVtp0lHDy1tIbeDrbYDldLwATDaCdKkBnNwYVeUNDoniMLgri4VxFYsLGt772T5FQQtregxJN2X+B9iQGEyWF9VsqPEka4QobMlWRRnedpJyveLzqPgcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481655; c=relaxed/simple;
	bh=o0Rq4fqnpT0WXFQ926+2MYLgQbCiJYmR5gSGR2GmX5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMdnpfOCvtrj6CQXK9AwuM3Md8y5/7CLRu5Ta++ROXmln0+FnXLh1VQVyRnMhWgBxDd+tzdbsPDsJt6GkVXv4WL2bYNaC/twQCRXA+YnzfDfFZ6Qsp3chgfhZOc7Wtb4kC4FBRDSacupujTm3qKgEmPX1m8KsCztXDsSbq83Xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBf7EGI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBf7EGI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D633C4CEED;
	Tue,  1 Apr 2025 04:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481654;
	bh=o0Rq4fqnpT0WXFQ926+2MYLgQbCiJYmR5gSGR2GmX5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pBf7EGI8B0GQjXMUr6iuhmA6R/b6cAKZCVK64vnixsdmz0FROCHrAPZOOdPDQrOJx
	 RLHl82xrisV0L7JSw4qt/ISlRbAQTyIUBHXwdjhkSaorqTFFSK/NPgl0kccnbPna17
	 XT0Qel+Okrzf+p0P900oLuMqmh6YOnU266+xO9poIvI7hQrH2Q+d+fEk43obKIcGOz
	 WCi+YjQKYgpadu0/pdG1Y0FMxAjfccQLLuQRJpDnneJ61OA+PJ7z8Rv63XSKUfD7eP
	 YCk/QckzobkTf3p61RfapzHXw2tMaeZa6CtdOUZb5hHOWIAlT0rj84FXQRZxzCKZQF
	 ya4dyeZk1d5Mw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 09/11] sched/smt: Always inline sched_smt_active()
Date: Mon, 31 Mar 2025 21:26:44 -0700
Message-ID: <1d03907b0a247cf7fb5c1d518de378864f603060.1743481539.git.jpoimboe@kernel.org>
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

sched_smt_active() can be called from noinstr code, so it should always
be inlined.  The CONFIG_SCHED_SMT version already has __always_inline.
Do the same for its !CONFIG_SCHED_SMT counterpart.

Fixes the following warning:

  vmlinux.o: error: objtool: intel_idle_ibrs+0x13: call to sched_smt_active() leaves .noinstr.text section

Fixes: 321a874a7ef8 ("sched/smt: Expose sched_smt_present static key")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202503311434.lyw2Tveh-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/sched/smt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched/smt.h b/include/linux/sched/smt.h
index fb1e295e7e63..166b19af956f 100644
--- a/include/linux/sched/smt.h
+++ b/include/linux/sched/smt.h
@@ -12,7 +12,7 @@ static __always_inline bool sched_smt_active(void)
 	return static_branch_likely(&sched_smt_present);
 }
 #else
-static inline bool sched_smt_active(void) { return false; }
+static __always_inline bool sched_smt_active(void) { return false; }
 #endif
 
 void arch_smt_update(void);
-- 
2.48.1

