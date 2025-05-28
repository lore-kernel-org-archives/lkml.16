Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1B2459EA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419796; cv=none; b=Gc+3rF+Hq5M3um59T479wRvBW+Y3h4mMNvxS1H412AjKSZPK6zCQGBYxIcYVlXJR/J2glVD8Hi8OJ6oSYqrz4JhfTwoaBoACTEOLT7mcnNUgb89H/D0uVbsb0Tc20XUDlhp+0adh+x7v9rVyBoukDgoL/rYnxprmHS1yfbrlpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419796; c=relaxed/simple;
	bh=aHNjuT+pVXde7vagc9ohxmkVnGnBYIIpr8O000cJReU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWZabxsgd3yuQvMljlPpi5uTgmEZ/Hy2EXodDTxnU6SioIlQ3R/0YNXygilbNAIFeB+F8NG+3OphqtkeWYjrwYLElwDpl7K8+vC/GKULlwKqVtuZ9ZaYqU1dGquWW9V72NFn2QlKpc2cKMotlNRL0hjsnzTOP0P08md1TYn+Q7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqs8g7+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqs8g7+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AC3C4CEF0;
	Wed, 28 May 2025 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419795;
	bh=aHNjuT+pVXde7vagc9ohxmkVnGnBYIIpr8O000cJReU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uqs8g7+345gBU4LRzjilwc57vFuv5iAmjItNZfc5qb4iXPDBd0SqgC8AA9GJ7S97c
	 H8Ny+5nSpUlexxE+I2rtRF2izr6Mvf9A2+kM84CC2ElJo1EWZQK5FmkyuDtHjdnJUU
	 ktZMysdXtWM3LFQU7pF0wHwFYFS5xYFWwP+vBVRcICpkqT3ymiL/71vc/x20Uhlkph
	 2+MduEVQB2AZ4jmAHIQebN1pF0ClaB61PRDK6qjoRLFHXpyIyaGd5i+LgoZ1dU4Seq
	 6sp5eX829+cPHFyWVb6FBFTN8pUjJpvGUkMsAnLIaqUvvJFkD0NrX7uk/CpwTMAWxY
	 NDOUPzX4xLGyQ==
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
Subject: [PATCH 02/43] sched: Clean up and standardize #if/#else/#endif markers in sched/clock.c
Date: Wed, 28 May 2025 10:08:43 +0200
Message-ID: <20250528080924.2273858-3-mingo@kernel.org>
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
 kernel/sched/clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
index a09655b48140..3406145925b1 100644
--- a/kernel/sched/clock.c
+++ b/kernel/sched/clock.c
@@ -471,7 +471,7 @@ notrace void sched_clock_idle_wakeup_event(void)
 }
 EXPORT_SYMBOL_GPL(sched_clock_idle_wakeup_event);
 
-#else /* CONFIG_HAVE_UNSTABLE_SCHED_CLOCK */
+#else /* !CONFIG_HAVE_UNSTABLE_SCHED_CLOCK: */
 
 void __init sched_clock_init(void)
 {
@@ -489,7 +489,7 @@ notrace u64 sched_clock_cpu(int cpu)
 	return sched_clock();
 }
 
-#endif /* CONFIG_HAVE_UNSTABLE_SCHED_CLOCK */
+#endif /* !CONFIG_HAVE_UNSTABLE_SCHED_CLOCK */
 
 /*
  * Running clock - returns the time that has elapsed while a guest has been
-- 
2.45.2

