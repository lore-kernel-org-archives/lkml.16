Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4822F380
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140225; cv=none; b=nQROg/PKDw0GRriqfoUoGBXKPHivKqhbLsU3Kgp2RxGuY5CL2HRwMdLj+Hbwrdn2gV56tHPTUrOhvF6PdVuc8z3MFno5Rl2//FtBrvtvFhwKdlqZ4L6oJ30jLQeoj3AbMl//mMDnwQILu3o5szcWZ+qD5ViVRVmOV/hdpGmar4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140225; c=relaxed/simple;
	bh=TXaR3PXscB0IR2zu2ykA6NDQs55O4UuGlAU5yWSXoiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ve8XutkxwJFQE531ipCFGmKaeguc54NVCpXnfMpB6mQzTIlMcLpBxJXVwcHeDHKKd1QZmfJy72r7mRLzaom7+A+kzFWdIa+8JuVkQo3wJ9eTRYf2GVdBQzWsqvSXhxuUwBvbm/zcPRtyPhb8cpjo6KdunOJuJ87095SMoEu6VrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZIidSr/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZIidSr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE7BC4CEDD;
	Sun,  9 Feb 2025 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140225;
	bh=TXaR3PXscB0IR2zu2ykA6NDQs55O4UuGlAU5yWSXoiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZIidSr/P6waR4fDq5bCpnMDJ/9CJnNUWMNJm2VsqNQoj5A+V+IecPyfvvCnFJedQ
	 uWCQySMec2pbxlzt6O3nszier5u2Q+MhW9zH3TeiMwbTiCDWRfw/XwHw3bNvSV07nT
	 jv1IUqSyzNgavbpRXwQVNK3kpXQJlEM2E1O6k7UsmMzeAXDxEdDooxhJtVZdCBp5e3
	 75BhwkH7VaYwBbSZneZEvagRZTWxuJ1rgjsyXEWTEDxRKmBNuM+GfxL+ON9wYrEroQ
	 jrp4RdT8Zf3ab8qNiYvPZRVUQ/ghWDBWrSO4qEyw8aF8L/Nf9r2hdzQlcn7LgoI4Ih
	 YxlqbBf8xueMw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 4/6 v2] tick/nohz: Move nohz_full related fields out of hot task struct's places
Date: Sun,  9 Feb 2025 23:30:02 +0100
Message-ID: <20250209223005.11519-5-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250209223005.11519-1-frederic@kernel.org>
References: <20250209223005.11519-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nohz_full is a feature that only fits into rare and very corner cases.
Yet distros enable it by default and therefore the related fields are
always reserved in the task struct.

Those task fields are stored in the middle of cacheline hot places such
as cputime accounting and context switch counting, which doesn't make
any sense for a feature that is disabled most of the time.

Move the nohz_full storage to colder places.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9632e3318e0d..10a9aa41b43a 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1088,13 +1088,7 @@ struct task_struct {
 #endif
 	u64				gtime;
 	struct prev_cputime		prev_cputime;
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
-	struct vtime			vtime;
-#endif
 
-#ifdef CONFIG_NO_HZ_FULL
-	atomic_t			tick_dep_mask;
-#endif
 	/* Context switch counts: */
 	unsigned long			nvcsw;
 	unsigned long			nivcsw;
@@ -1411,6 +1405,14 @@ struct task_struct {
 	struct task_delay_info		*delays;
 #endif
 
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
+	struct vtime			vtime;
+#endif
+
+#ifdef CONFIG_NO_HZ_FULL
+	atomic_t			tick_dep_mask;
+#endif
+
 #ifdef CONFIG_FAULT_INJECTION
 	int				make_it_fail;
 	unsigned int			fail_nth;
-- 
2.46.0

