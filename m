Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABF824DCEE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419803; cv=none; b=C97pQj9ZqICLmaw9xWqAV1roFQA8hiZNN6ClU36MkxJ5uJ5QIqEICKFIVBCZn4C6V+nk7RhIQ03Hts5m5USph/Cu0qjI0aCdofc8Heup8V4mdco0luOHd9MTMrSHGJ2wOf2fusmpn9tyQNEeVMkunhk7zwZRabbU6+dQXB0wBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419803; c=relaxed/simple;
	bh=2yy4uprkjJ9k8z5aYq2LuPZtLWlldXfXM4RXFHPqX4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI/OBwR9QSLyFB5suv9p2IwE4386fyUpw1NiawQd/h1Yp1Zpj6qQSK4ioKybSUBG9ajY+uqmDC+TWO1HN1blYfTodn31rUGdtObStCa2VYb9kk8TwEo7uZf4vxlNxEXXp09E2fDu4cqpZVkWQJnby/Bf7tmjbHfQwN1BlvEgET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2M1bSkh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2M1bSkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84208C4CEEB;
	Wed, 28 May 2025 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419802;
	bh=2yy4uprkjJ9k8z5aYq2LuPZtLWlldXfXM4RXFHPqX4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2M1bSkh0//KRHIiNOVUp5xWktHsdWVQ2UxzqV6N9cQpNDeSlljHm/QbFQ17GvnfA
	 UIsodlxFFNlVakYXws7S0gIeiTbQmdAytXvdcwJxFjtd+dgts6YYrpFbp6eSSMVDHU
	 Fo6G95K1KW3xC4ITZTNkWmb6Wqnkn9SQOjMifT6Lwi2nRHxhEQGUO76sSDmBxhm3z5
	 MvyobJTK3pAehkzFKGQbCdusEzcncL9SLysh3QI30bBBbI4z/wqc9RbaWSeDCcO36y
	 BueAvl/wuXaUYPrZUhHE8EWZiZ54Uc+iStWhMvzjN+C7KEoplqRE2BVv+zfxZEA/i4
	 6a1wX63pr3+XA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 04/43] sched: Clean up and standardize #if/#else/#endif markers in sched/cpufreq_schedutil.c
Date: Wed, 28 May 2025 10:08:45 +0200
Message-ID: <20250528080924.2273858-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/cpufreq_schedutil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 816f07f9d30f..a28d0f94ed6b 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -380,9 +380,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
 	sg_cpu->saved_idle_calls = idle_calls;
 	return ret;
 }
-#else
+#else /* !CONFIG_NO_HZ_COMMON: */
 static inline bool sugov_hold_freq(struct sugov_cpu *sg_cpu) { return false; }
-#endif /* CONFIG_NO_HZ_COMMON */
+#endif /* !CONFIG_NO_HZ_COMMON */
 
 /*
  * Make sugov_should_update_freq() ignore the rate limit when DL
-- 
2.45.2

