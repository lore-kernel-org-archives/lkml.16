Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629029188D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796379; cv=none; b=h63BbaC3pjj0xpnGLXagiql5ZEebtLnu6ScWVZpknMNswE5C8Ak4VppRLU4HVcn4L2+I88Xv8W/2QYlwUo2Z5muQz5Xjnp4sOsGxxKsrXatit1DdS3rf9OxdB7olLvRq7owSrQCz7MRNzSLIY1ZvDxyENbxLKY5zP7QEdZrGD9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796379; c=relaxed/simple;
	bh=FySwLMTTHapApbkpXbk0tTrB6EUHbUQ9d5aoxVDHLMs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Jla3xLhd2uY9Hbmeqo7klcwHeCpKWlKCNC9U7RZXyhkYRdhPR5OsmceeIpPj4cMJ3WJzeGmw0qR8jfyulqKQqErf4C1cYSfXVCFiFZWq+aS+rpUsGMwdmcdEKXg2IsNUHUUord3XNDcbV4/R8NC3ombr+cbKvG9LN1A0hwzcpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4D6C4CEEE;
	Fri,  9 May 2025 13:12:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXP-00000002bsk-17f0;
	Fri, 09 May 2025 09:13:15 -0400
Message-ID: <20250509131315.118353893@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:59 -0400
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
Subject: [for-next][PATCH 10/31] ftrace: Expose call graph depth as unsigned int
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Ilya Leoshkevich <iii@linux.ibm.com>

Depth is stored as int because the code uses negative values to break
out of iterations. But what is recorded is always zero or positive. So
expose it as unsigned int instead of int.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Link: https://lore.kernel.org/20250412221847.17310-3-iii@linux.ibm.com
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_entries.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_entries.h b/kernel/trace/trace_entries.h
index 4ef4df6623a8..de294ae2c5c5 100644
--- a/kernel/trace/trace_entries.h
+++ b/kernel/trace/trace_entries.h
@@ -97,11 +97,11 @@ FTRACE_ENTRY_PACKED(fgraph_retaddr_entry, fgraph_retaddr_ent_entry,
 	F_STRUCT(
 		__field_struct(	struct fgraph_retaddr_ent,	graph_ent	)
 		__field_packed(	unsigned long,	graph_ent,	func		)
-		__field_packed(	int,		graph_ent,	depth		)
+		__field_packed(	unsigned int,	graph_ent,	depth		)
 		__field_packed(	unsigned long,	graph_ent,	retaddr		)
 	),
 
-	F_printk("--> %ps (%d) <- %ps", (void *)__entry->func, __entry->depth,
+	F_printk("--> %ps (%u) <- %ps", (void *)__entry->func, __entry->depth,
 		(void *)__entry->retaddr)
 );
 
@@ -124,13 +124,13 @@ FTRACE_ENTRY_PACKED(funcgraph_exit, ftrace_graph_ret_entry,
 		__field_struct(	struct ftrace_graph_ret,	ret	)
 		__field_packed(	unsigned long,	ret,		func	)
 		__field_packed(	unsigned long,	ret,		retval	)
-		__field_packed(	int,		ret,		depth	)
+		__field_packed(	unsigned int,	ret,		depth	)
 		__field_packed(	unsigned int,	ret,		overrun	)
 		__field(unsigned long long,	calltime		)
 		__field(unsigned long long,	rettime			)
 	),
 
-	F_printk("<-- %ps (%d) (start: %llx  end: %llx) over: %d retval: %lx",
+	F_printk("<-- %ps (%u) (start: %llx  end: %llx) over: %u retval: %lx",
 		 (void *)__entry->func, __entry->depth,
 		 __entry->calltime, __entry->rettime,
 		 __entry->depth, __entry->retval)
@@ -146,13 +146,13 @@ FTRACE_ENTRY_PACKED(funcgraph_exit, ftrace_graph_ret_entry,
 	F_STRUCT(
 		__field_struct(	struct ftrace_graph_ret,	ret	)
 		__field_packed(	unsigned long,	ret,		func	)
-		__field_packed(	int,		ret,		depth	)
+		__field_packed(	unsigned int,	ret,		depth	)
 		__field_packed(	unsigned int,	ret,		overrun	)
 		__field(unsigned long long,	calltime		)
 		__field(unsigned long long,	rettime			)
 	),
 
-	F_printk("<-- %ps (%d) (start: %llx  end: %llx) over: %d",
+	F_printk("<-- %ps (%u) (start: %llx  end: %llx) over: %u",
 		 (void *)__entry->func, __entry->depth,
 		 __entry->calltime, __entry->rettime,
 		 __entry->depth)
-- 
2.47.2


