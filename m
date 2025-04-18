Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126C226CF9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001227; cv=none; b=TpPugmnte3y6oCIENMgdP5T0iGF2QuqdmrIUp9RkAc98o/QEDkszpyTKRJ3azBwQjCxvybQYP/RqbStiwDr2XQGBGSsXiDS8Js+2ArQEg28e412z7nnrmOgoc2523xB7zv/slC3DiyXZtn1lfw56S34wO24umQ/a33fAGUtxsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001227; c=relaxed/simple;
	bh=kc4nvELlaIu42Fc/h5Y58hmSnnLBUd+sg2L+gOeJlXc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=qkEu87a4foo9x1Zwg/6bXnBJIYolncGa5YyQGB2Qbi97CxPRtZ4MOBHgjn7nyAOyskzjgGJ9f5LyuAWJ7ouICsV9H4mRzSpokMOnbFTtdWQjc4KSsXkCRKC+4htRPqaw5Dfysw7iHrgj1003en6ZhALmqAy0/bIag+1Np4yxO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0031BC4CEEA;
	Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYi-0000000Db9A-43qB;
	Fri, 18 Apr 2025 14:35:28 -0400
Message-ID: <20250418183528.814181179@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [for-linus][PATCH 5/7] ftrace: Fix type of ftrace_graph_ent_entry.depth
References: <20250418183446.383784216@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Ilya Leoshkevich <iii@linux.ibm.com>

ftrace_graph_ent.depth is int, but ftrace_graph_ent_entry.depth is
unsigned long. This confuses trace-cmd on 64-bit big-endian systems and
makes it print a huge amount of spaces. Fix this by using unsigned int,
which has a matching size, instead.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Link: https://lore.kernel.org/20250412221847.17310-2-iii@linux.ibm.com
Fixes: ff5c9c576e75 ("ftrace: Add support for function argument to graph tracer")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_entries.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_entries.h b/kernel/trace/trace_entries.h
index ee40d4e6ad1c..4ef4df6623a8 100644
--- a/kernel/trace/trace_entries.h
+++ b/kernel/trace/trace_entries.h
@@ -80,11 +80,11 @@ FTRACE_ENTRY(funcgraph_entry, ftrace_graph_ent_entry,
 	F_STRUCT(
 		__field_struct(	struct ftrace_graph_ent,	graph_ent	)
 		__field_packed(	unsigned long,	graph_ent,	func		)
-		__field_packed(	unsigned long,	graph_ent,	depth		)
+		__field_packed(	unsigned int,	graph_ent,	depth		)
 		__dynamic_array(unsigned long,	args				)
 	),
 
-	F_printk("--> %ps (%lu)", (void *)__entry->func, __entry->depth)
+	F_printk("--> %ps (%u)", (void *)__entry->func, __entry->depth)
 );
 
 #ifdef CONFIG_FUNCTION_GRAPH_RETADDR
-- 
2.47.2


