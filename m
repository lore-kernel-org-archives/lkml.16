Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60357248F44
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419827; cv=none; b=OeIs58ijBRfYOP2UVhKP8Wqh2WPrOEXFq8/C0ZEw1Dt5HevhSpURbl0zf3cTCtErcTOsNfFfJuRCtlvLYSP7x+A12mkCrsiE14mMY7o29Kwb5VWkW1SwcMSgyjmjjScCCjNb87GTaKghcYlQELW0KoefROoYzFE8ClGMNIaVFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419827; c=relaxed/simple;
	bh=P3OiQqibFlzAx0PMB2tm/D261Zww/xz/JyMwv2Fj7JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SY8eT7nP9P1iy3Op1g3NkCVFw4uAp66/P9of8H2Lqn06OlJMBAFcjBcKMTLduzHLStEgbf9YDcqwzPKujITVxqcyn8AVMViTReQ/p/p/q8fJZtUsGOO/PFLktboy3PnJW16VxHiCM3iIWsbwINHt0tutM0GO2W7wRTvRMx1wnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKRSQtm8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKRSQtm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3983FC4CEE7;
	Wed, 28 May 2025 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419827;
	bh=P3OiQqibFlzAx0PMB2tm/D261Zww/xz/JyMwv2Fj7JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKRSQtm8kpyEmrtQYpAWzB1wLcckvdnzRZO943TCEJIBEmYTzizV2xe8Zi5PCXAMR
	 S92oo7cncp5LBMhYuSuKl4hNzcleWlX0V/1BeY+YBc6jVbzihpwwReMR6alCMYT6LR
	 lCmcrmxENu+IC3MrVTk8uNRddqOpApv1nij6Dn2d8Bow640gUxgu+WJukczaSAMx81
	 SF3stR1OaWlk9+NjoFEpQjMdWB7GnrlB0NPMnswpMIDBdXbLGLlLsKgscxt/fQ4cyG
	 hCsQ3aMIfFoLHzzzPCsRkwSd4OCQW5ZFGiUcXV2dEYZXEqV0pQKwbMYFwpr/b9ngkJ
	 Gi57pXbC8c6pQ==
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
Subject: [PATCH 11/43] sched: Clean up and standardize #if/#else/#endif markers in sched/loadavg.c
Date: Wed, 28 May 2025 10:08:52 +0200
Message-ID: <20250528080924.2273858-12-mingo@kernel.org>
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

 - Fix whitespace noise and other inconsistencies.

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
 kernel/sched/loadavg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/loadavg.c b/kernel/sched/loadavg.c
index c48900b856a2..318a271f9e91 100644
--- a/kernel/sched/loadavg.c
+++ b/kernel/sched/loadavg.c
@@ -333,12 +333,12 @@ static void calc_global_nohz(void)
 	smp_wmb();
 	calc_load_idx++;
 }
-#else /* !CONFIG_NO_HZ_COMMON */
+#else /* !CONFIG_NO_HZ_COMMON: */
 
 static inline long calc_load_nohz_read(void) { return 0; }
 static inline void calc_global_nohz(void) { }
 
-#endif /* CONFIG_NO_HZ_COMMON */
+#endif /* !CONFIG_NO_HZ_COMMON */
 
 /*
  * calc_load - update the avenrun load estimates 10 ticks after the
-- 
2.45.2

