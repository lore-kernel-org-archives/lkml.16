Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24224DD1B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419806; cv=none; b=u15z5aUDHFKri6XK3BOjxsnME1FQ3aw+bSrA72OOQJHcwlg8/qobHoK7s42gz6VSM+Y0CCpERLPFVrgrG0Lz2CfKes9uxNmXo8go13SoapxwVQaGmtsp01PJvaXgH5zud8cVh7s+L4kSkM6haLhAwu4piOT3BkYmK4qNfReY8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419806; c=relaxed/simple;
	bh=+K51kWrxWCvbKfp493M0b+C5HU6KPSTl/Y8J4sAULk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eToaoTHT8zEnitNUM1UI/Jf5NfYL3jL2P7/elc5zjigJT2XLg3LOT1MYS6TRzaVI2PNdiap3/gEEPi8Yc+IO34Oo1+7XrFol36U7ZQZVJhaFFoxbocmOS0DFkH/zQJlscN34yYApCSNm+/9TxL0sOvF+8qt3kNarDPBRKSEl88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZdsq/U5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZdsq/U5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129B2C4CEEF;
	Wed, 28 May 2025 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419806;
	bh=+K51kWrxWCvbKfp493M0b+C5HU6KPSTl/Y8J4sAULk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZdsq/U5w+iYXqJpnN0hTJ7UTg9x7a1jN6608OPjt+kKTXmT/SIEuCZPrHFquVVyj
	 +dyq+DXeUmFdetg+AlJLYr7SEYaA2g5WZe2N/t1b1qWWobgDp9+SsE/REEMpGBcXzy
	 iVwytzS2A0Rip6IpXKngZ2MSlEChyHNB2ILjznWO8FR86elCmKk3lpwdNfsAbuR4zN
	 ajJWys9a7okVeilK7N47dD6CFU7nH7iRIdOid1rzGhYtuQktpFlunPZNZzcM3PkTjw
	 i/hVa2uge/cKvI3IA1EaqS3HYQIZ7Ot1FogQk1L07kXpbQivv359uRiuHO5BJtAekv
	 OEKBoPghvnIFA==
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
Subject: [PATCH 05/43] sched: Clean up and standardize #if/#else/#endif markers in sched/cpupri.h
Date: Wed, 28 May 2025 10:08:46 +0200
Message-ID: <20250528080924.2273858-6-mingo@kernel.org>
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
 kernel/sched/cpupri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cpupri.h b/kernel/sched/cpupri.h
index d6cba0020064..f9c18e77d6a6 100644
--- a/kernel/sched/cpupri.h
+++ b/kernel/sched/cpupri.h
@@ -26,4 +26,4 @@ int  cpupri_find_fitness(struct cpupri *cp, struct task_struct *p,
 void cpupri_set(struct cpupri *cp, int cpu, int pri);
 int  cpupri_init(struct cpupri *cp);
 void cpupri_cleanup(struct cpupri *cp);
-#endif
+#endif /* CONFIG_SMP */
-- 
2.45.2

