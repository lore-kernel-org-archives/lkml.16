Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D092B1E5732
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481655; cv=none; b=TwIxqb9ySNdkXp95qGQFLk2m5t2XE33bHdGCZuKBjdoF7cGrfxPqtR2aJ88tsOmmJmkHcOJqajvI8VwlqPXPzZ6/UZC+Mf7/m+hGT1GYvURQwrKu9ewdwb/AQQb90ycmVICOaKK5MBdPoohNryawKqrGZOApNZrdVJfEds2o0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481655; c=relaxed/simple;
	bh=CvDKZ8XDMiR2a/y1KZg2z41sHTyV/p7YvJahkPRDXP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncvU9W/QbP9X25wK9UXFyIx9mv5P349th5N9BQiK8ZVYvruHUpopgDhnT1oYIGuNxN6LdPsA+QrnOMIe4EP4YiF5QMDrRIqTw3ZcZFd3jk5RtZnHdlDgp48yKysPKYYOVQkOOsdrhF3V0nYBx+k3TFYBKhiux++EIk7Ep9t0Zq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPOa2XCT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPOa2XCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EE6C4CEE8;
	Tue,  1 Apr 2025 04:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481655;
	bh=CvDKZ8XDMiR2a/y1KZg2z41sHTyV/p7YvJahkPRDXP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fPOa2XCT3Lid6qLd6UObxUDdHOIesbAChTFwZgUujnODn/bhNbNChzgj/DxHnr4ES
	 OuVMye39/aGsOVFJ/CBmo0AjK9tDM5bK9Tn54p25fQzaRLHZubhPKStlNjCKCGmh41
	 QMuGGdP6vfCbl0kRFPVNrbn7YgNimzbqzRnmCgkZUK2z6VZ5NVOZdLFbm9mus+ER6L
	 g9sZX0rBxsLlIt3koJpBg36IU7G2vQI5b4xc7eFET5beYKuHzHd6K3L7UP87cfp0pl
	 EdgiO5WuXnBTtuoTqzRy4e3lRWtQpL5xB0hpyQtVSczsIIZjT3vtl/nneh0WiROy5K
	 8tWkBHhpmsIGg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 11/11] rcu-tasks: Always inline rcu_irq_work_resched()
Date: Mon, 31 Mar 2025 21:26:46 -0700
Message-ID: <e84f15f013c07e4c410d972e75620c53b62c1b3e.1743481539.git.jpoimboe@kernel.org>
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

Thanks to CONFIG_DEBUG_SECTION_MISMATCH, empty functions can be
generated out of line.  rcu_irq_work_resched() can be called from
noinstr code, so make sure it's always inlined.

Fixes: 564506495ca9 ("rcu/context-tracking: Move deferred nocb resched to context tracking")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/d1eca076-fdde-484a-b33e-70e0d167c36d@infradead.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/rcupdate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index f8159f8a7d73..120536f4c6eb 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -132,7 +132,7 @@ static inline void rcu_sysrq_end(void) { }
 #if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK))
 void rcu_irq_work_resched(void);
 #else
-static inline void rcu_irq_work_resched(void) { }
+static __always_inline void rcu_irq_work_resched(void) { }
 #endif
 
 #ifdef CONFIG_RCU_NOCB_CPU
-- 
2.48.1

