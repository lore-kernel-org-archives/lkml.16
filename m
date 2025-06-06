Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA728A1C8
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228152; cv=none; b=YR2wr7Y1+DsoFJ384TQsjgD8L/AFuRayjKnrl6sc9x9PQYnjXANibRgtuyZXfioXdY36hjAa/XYuUhfGC+IUa01Tduf71StLOKeSnhpECO90WPkPUEmj21sW094kCOX7Kr34ZFq326Mc1enkSuTx/VusMaLdA0SR3VqF2wNoiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228152; c=relaxed/simple;
	bh=Zh4DYLLc6LRnPaiVi1pXn4qtE4dSZzifVgcG+mx9aQM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=CDU4Ksh/c3QXZj1ZUecp4EvPKft1qaIbl3/ACjOHOBgMr4BEaLm+2odusMox6eyWBM3HWs0wt/LcNFfE3gCceNK9BxgEAaHNkYkpDEf9h6tNUIXQfWq/vP372D1OX/hJTUc1AvpgsGCm/uzbpbYPOqa7arXUTRzqwMsGVVMjKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044B1C4CEF2;
	Fri,  6 Jun 2025 16:42:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uNaAb-0000000FxBO-3Izn;
	Fri, 06 Jun 2025 12:43:53 -0400
Message-ID: <20250606164353.637944319@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 06 Jun 2025 12:42:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 Kajetan Puchalski <kajetan.puchalski@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [for-linus][PATCH 3/3] tracing: PM: Remove unused clock events
References: <20250606164229.056794577@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The events clock_enable, clock_disable, and clock_set_rate were added back
in 2010. In 2011 they were used by the arm architecture but removed in
2013. These events add around 7K of memory which was wasted for the last 12
years.

Remove them.

Link: https://lore.kernel.org/all/20250529130138.544ffec4@gandalf.local.home/

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Kajetan Puchalski <kajetan.puchalski@arm.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Link: https://lore.kernel.org/20250605162106.1a459dad@gandalf.local.home
Fixes: 74704ac6ea402 ("tracing, perf: Add more power related events")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/power.h | 47 ------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 9253e83b9bb4..6c631eec23e3 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -337,53 +337,6 @@ DEFINE_EVENT(wakeup_source, wakeup_source_deactivate,
 	TP_ARGS(name, state)
 );
 
-/*
- * The clock events are used for clock enable/disable and for
- *  clock rate change
- */
-DECLARE_EVENT_CLASS(clock,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id),
-
-	TP_STRUCT__entry(
-		__string(       name,           name            )
-		__field(        u64,            state           )
-		__field(        u64,            cpu_id          )
-	),
-
-	TP_fast_assign(
-		__assign_str(name);
-		__entry->state = state;
-		__entry->cpu_id = cpu_id;
-	),
-
-	TP_printk("%s state=%lu cpu_id=%lu", __get_str(name),
-		(unsigned long)__entry->state, (unsigned long)__entry->cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_enable,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_disable,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_set_rate,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
 /*
  * The power domain events are used for power domains transitions
  */
-- 
2.47.2


