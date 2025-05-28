Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3174248F7E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419936; cv=none; b=GkzKpPDSjNJ3jRDSF2MPwGL1EiNUUYAng6+TETVSbbqG4e2kViWXWpusV4im4SdYLZDaViVuFutFMo7JznXYE76mM+AeGtSOVsGwRXkoyQLXtcIdEAaIqJZeKjGvQ7MjANy0m6NSHWFkeBzRrqIDi1nLnbOFasE3CBiYI15X3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419936; c=relaxed/simple;
	bh=62s0reeWfQxHXuwxdD7E6S/pqUe7Ku+24A1AX4kVVyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvNJQB3C4+ZLIyCOHQSjwxvUMIcBl1pTTK2UGo/Vm1zx8OLdwD9CAm/i/ZGPaLrwre2IXviHQ1j+usQogzE/5Z6bCuxsFXA0jYeiH294jq/QeZ0VdH7GAeaH1XTUGIeDovYMHYYtqNmo+CXy7uyMbC+EBdDib1cb2odL6QwHTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhfmmbIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhfmmbIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BB5C4CEE7;
	Wed, 28 May 2025 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419936;
	bh=62s0reeWfQxHXuwxdD7E6S/pqUe7Ku+24A1AX4kVVyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhfmmbIfoYDzdqQxgcfyn9hrgIGqd9X4BZpUa2h7K1I4DKh8LnCFEKn5SGOJBx0/1
	 coxcOspA2NhJzz0mFIf2TDZaneKyGiRBje2MMyr0CT32ZbONCCRGjQC6ph4wSbyl5X
	 IA4qA4zhKV2A1xFZIdUaJNOeoZ+zflHyHKms4CQPi5Pt6eBiorxLEhWB3BuIKagBSR
	 BSKW/XepqrYIlKv9Ekpn7Wn8B8NeJi1l4+Ibe0wnHgyMb50AwsEQNAXkcBHLfMztX7
	 VJ6wAFmHxgLMgJJUKJaHg74xePOGZiGgIbKfHlCtwwigweCY7GEivq+WQcuxZ4QKqx
	 OuJ513gqIRw2Q==
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
Subject: [PATCH 42/43] sched/smp: Use the SMP version of add_nr_running()
Date: Wed, 28 May 2025 10:09:23 +0200
Message-ID: <20250528080924.2273858-43-mingo@kernel.org>
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

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

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
 kernel/sched/sched.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 20d9da03d947..e6d637015d0c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2672,10 +2672,8 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 		call_trace_sched_update_nr_running(rq, count);
 	}
 
-#ifdef CONFIG_SMP
 	if (prev_nr < 2 && rq->nr_running >= 2)
 		set_rd_overloaded(rq->rd, 1);
-#endif
 
 	sched_update_tick_dependency(rq);
 }
-- 
2.45.2

