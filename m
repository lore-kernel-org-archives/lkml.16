Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605E1DDC1A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970674; cv=none; b=aCvouFG/imyo3ohiI+CtjnOLGaqJHdvt90Sl3s2uDZTZLeL4Uut3U+T/m98zGs+74Xaq0JNw3fXiLhaFTyyzhQ3eKMrb8qlZC5tClmTBgUUTi4tlPFvSec27Ior7KHxXenrK9sSgHJbRWe71h4SoQTWX+5B9Rogq0h55zsu8vCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970674; c=relaxed/simple;
	bh=3SmGaj4dkxjHIqOv4YsRxaHyjciKTKc+dVkeo5BBZ08=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=V04mBypnKgIUSoIBOKJCmPXP9VT30NmbbetEPxHaU1gsAfC9Azq5s905b8GVownPadcVRR+QUxM54RGUgkrN/lahXfp19tcrDjjNk9gNLmfu/9rdUTV9P+qyD/Qqof9h7oHyTLcOG+MPNEOQTgsLkHJSrWDVP4WLmQQW+LDdZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BF5C4CEEF;
	Tue,  3 Jun 2025 17:11:14 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uMVBd-0000000E412-0MrW;
	Tue, 03 Jun 2025 13:12:29 -0400
Message-ID: <20250603171228.935644320@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 03 Jun 2025 13:11:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [for-linus][PATCH 4/5] genirq/matrix: Remove unused irq_matrix_alloc_reserved tracepoint
References: <20250603171149.582996770@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The tracepoint irq_matrix_alloc_reserved was added but never used.
Remove it.

Link: https://lore.kernel.org/all/20250529130138.544ffec4@gandalf.local.home/

Cc: Juergen Gross <jgross@suse.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/20250529135739.26e5c075@gandalf.local.home
Fixes: ec0f7cd273dc4 ("genirq/matrix: Add tracepoints")
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/irq_matrix.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/trace/events/irq_matrix.h b/include/trace/events/irq_matrix.h
index 267d4cbbf360..93244078b4e6 100644
--- a/include/trace/events/irq_matrix.h
+++ b/include/trace/events/irq_matrix.h
@@ -138,14 +138,6 @@ DEFINE_EVENT(irq_matrix_global_update, irq_matrix_assign_system,
 	TP_ARGS(bit, matrix)
 );
 
-DEFINE_EVENT(irq_matrix_cpu, irq_matrix_alloc_reserved,
-
-	TP_PROTO(int bit, unsigned int cpu,
-		 struct irq_matrix *matrix, struct cpumap *cmap),
-
-	TP_ARGS(bit, cpu, matrix, cmap)
-);
-
 DEFINE_EVENT(irq_matrix_cpu, irq_matrix_reserve_managed,
 
 	TP_PROTO(int bit, unsigned int cpu,
-- 
2.47.2


