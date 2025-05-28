Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46593269B1C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419872; cv=none; b=pLCt2fa/hjIk1hqa/y1cWaw2AwU+S2ccsE2yf3vNki9fI9MIJuVM8sMYcRelP3eXmZ4BdlLmxIve7tt3H9GRcFQqEbKfDmbOLldysMscsMnUAPvIHhSBOvP3KxwWsQPHGV3+Vq4HPI09zcjeRA8LNCTflHD3Y4tvXyFL8gEdW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419872; c=relaxed/simple;
	bh=4C0sfQFfvCrKmZOsZyByxBgJQJjyZD52JsOF/htWank=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMHvT+Kh3pY+z8zp+SQ8AV9ocTdN572jpVXKBi1Xk1zfhWIl/uJ/8PDe0OxPm4FVd2Y2FacWPGFSyl2oi523qCguDy+MSrgYNk+GpcM63aWEttzj7OgzzMRNF56wnpRGXVzp1BwUL8emY3PjBt1t6LvGrHmk9cvktsD7con8UVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOZv0fqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOZv0fqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DF2C4CEEB;
	Wed, 28 May 2025 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419869;
	bh=4C0sfQFfvCrKmZOsZyByxBgJQJjyZD52JsOF/htWank=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dOZv0fqwkTysHecrEUoZhFcX+wdpimeGs+siUeGJMJl1e3LDoer1N/PQFB8zJfuqy
	 raIx3+HsvnqSL6UsbsrSG0ck++NjWUNeB4mivg3z/2PbHnKjw03XKWHBcrp1ghtxsn
	 bu8rIDH31iFgbRpm+wZmSKU5UUqxkp8ak6ViCMSXuc+N8Bx7ycGqSxwlwXD1cK/sP4
	 laxdT7xScEzYTIe86vhAW7UWr/UfSQdGRkMpsneMN/zTWsC58j7ZwhkS99L7/MZyMv
	 rcvoEF+ftfPo2WZjJeaeQU/aYS2rk6xbCiM2Y9XM9xw3muNVAeB20Dj10etvDP8p6S
	 CquwNUdYgd8Jg==
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
Subject: [PATCH 23/43] sched/smp: Use the SMP version of try_to_wake_up()
Date: Wed, 28 May 2025 10:09:04 +0200
Message-ID: <20250528080924.2273858-24-mingo@kernel.org>
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
 kernel/sched/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 73f035c21fbe..850f39fe5b8f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4198,7 +4198,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
 			break;
 
-#ifdef CONFIG_SMP
 		/*
 		 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be
 		 * possible to, falsely, observe p->on_cpu == 0.
@@ -4277,9 +4276,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 			psi_ttwu_dequeue(p);
 			set_task_cpu(p, cpu);
 		}
-#else /* !CONFIG_SMP: */
-		cpu = task_cpu(p);
-#endif /* !CONFIG_SMP */
 
 		ttwu_queue(p, cpu, wake_flags);
 	}
-- 
2.45.2

