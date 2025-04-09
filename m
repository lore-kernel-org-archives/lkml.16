Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3772561AB;
	Wed,  9 Apr 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201436; cv=none; b=VkkSau3kr3btpk5cu8Ztddk8PBwOVTElm0yB66TwE5nKsYyotqJ0om4XVRav+IOeE48UpwQ4J9xgsguR7adfLlnkxF8YAdZpaAz/DsZHKD+i8daPD7BFPwFgjGce4UJbrpakyV2knQPOrsNeM/azZ1Sahhq13vkqO6Gy8CSzMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201436; c=relaxed/simple;
	bh=JOBzAnyTqjob7MJ+GM20OnLwahmfN9DGHPDLc4EZINI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pb7WnXS/OcpzTPoyrogPEXNKWdS3+pJeFU8xSMtIcwslLqAuUaHjXDsr3pbgqQ7VEBNqGfO2NagKr55QKLtCEb5W3fuHI8ycrUyfXcdX3QCRqUV8fLPITyvNsMO799fhwa/rDa93AaJMAbcylenpWEfzN/bGPera10i6xD8ovVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l37ZS0Pw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l37ZS0Pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6058C4CEE3;
	Wed,  9 Apr 2025 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201436;
	bh=JOBzAnyTqjob7MJ+GM20OnLwahmfN9DGHPDLc4EZINI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l37ZS0PwDMEwv/jTE7sNaXKvNdasDXPL91N36tkIYUz86YshPPfPLEgOEVCAlMZl8
	 AMmuY5c8DfvYgIKFFbkIzyl+zwi1S4zpX4tmmBjfD4RXuqBXc9bS0babTxjiDtMlvT
	 RmksVPSJryLKhMSarcfGUNyKb+P0a7s2YQ8psWX4eOblAgDpja/7ymqBPFuWmmliR6
	 LjdK9FElNfjP3fkLitUdWDobwnhfW0EI7Xs3zr6ZPdch54mk05tnKDm1ceIyG+di6J
	 Rsl8yHgGCHzHVa+wik6iwXQHmm8llderMEHuQfGoWCxEQo+Lv40VE0xASp6y4K79KP
	 ttNuhgFvIqdoQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Connor O'Brien" <connoro@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 05/10] [RESEND] sched: open-code max_rt_runtime definition
Date: Wed,  9 Apr 2025 14:22:57 +0200
Message-Id: <20250409122314.2848028-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with clang using "make W=1" normally produces warnings about unused
const variables, but clang does not warn about those in header files.
In case of rt.c it also doesn't warn because this gets included by
from build_policy.c.

Enabling the same warning on gcc also warns about it in included files,
so we end up with a warning when all users of max_rt_runtime are
hidden because both CONFIG_RT_GROUP_SCHED and CONFIG_SYSCTL are
disabled:

kernel/sched/rt.c:9:18: error: 'max_rt_runtime' defined but not used [-Werror=unused-const-variable]

It's not possible to avoid the warning by moving max_rt_runtime
into one of the #ifdef sections, but since it is itself defined
as MAX_BW, simply open-coding that is an easy workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/sched/rt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fa03ec3ed56a..89edb24e63ea 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -5,8 +5,6 @@
  */
 
 int sched_rr_timeslice = RR_TIMESLICE;
-/* More than 4 hours if BW_SHIFT equals 20. */
-static const u64 max_rt_runtime = MAX_BW;
 
 /*
  * period over which we measure -rt task CPU usage in us.
@@ -2778,7 +2776,7 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 	/*
 	 * Bound quota to defend quota against overflow during bandwidth shift.
 	 */
-	if (rt_runtime != RUNTIME_INF && rt_runtime > max_rt_runtime)
+	if (rt_runtime != RUNTIME_INF && rt_runtime > MAX_BW)
 		return -EINVAL;
 
 	mutex_lock(&rt_constraints_mutex);
@@ -2890,7 +2888,7 @@ static int sched_rt_global_validate(void)
 	if ((sysctl_sched_rt_runtime != RUNTIME_INF) &&
 		((sysctl_sched_rt_runtime > sysctl_sched_rt_period) ||
 		 ((u64)sysctl_sched_rt_runtime *
-			NSEC_PER_USEC > max_rt_runtime)))
+			NSEC_PER_USEC > MAX_BW)))
 		return -EINVAL;
 
 	return 0;
-- 
2.39.5

