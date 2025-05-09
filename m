Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80429189A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796379; cv=none; b=WWgG8Wupf20StORJco72WaDx4ilvXyojq34wGhCQZ+we392eRvXSIXUWB7oRvKLzplzHoTpQsW/Bi9hpTV/cE5rWQvO7twdunPOkUN8yxm9DEbxVk0C8MBkPKUyLzCIJvRCzOfOcVSvUMh8pVcniAhZcVDICIWigpmcRJhOluEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796379; c=relaxed/simple;
	bh=HituxbUAVh1vLtMD8XS8+Wr9KmT3hEqvbhv7vTTM2A0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=cbCLHLvpILkSpMUhDNrRxFObXj+04K8fBUgwbcBGbPe7To5SelNj+SrbhBRcKfRM19w0TNiBpRc7wzZV0foXb1Uvo8Zf5qaPj97fXaCAzuiN93yjQb7oMyRXrM/xmG+WFisuMTlsvAv6zsOo7KjLls93vve+JeJGX5PVeRCSwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B3C4CEE4;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXO-00000002bqG-1lI8;
	Fri, 09 May 2025 09:13:14 -0400
Message-ID: <20250509131314.271971264@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 05/31] tracing: Show preempt and irq events callsites from the offsets in
 field print
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

When the "fields" option is set in a trace instance, it ignores the "print fmt"
portion of the trace event and just prints the raw fields defined by the
TP_STRUCT__entry() of the TRACE_EVENT() macro.

The preempt_disable/enable and irq_disable/enable events record only the
caller offset from _stext to save space in the ring buffer. Even though
the "fields" option only prints the fields, it also tries to print what
they represent too, which includes function names.

Add a check in the output of the event field printing to see if the field
name is "caller_offs" or "parent_offs" and then print the function at the
offset from _stext of that field.

Instead of just showing:

  irq_disable: caller_offs=0xba634d (12215117) parent_offs=0x39d10e2 (60625122)

Show:

  irq_disable: caller_offs=trace_hardirqs_off.part.0+0xad/0x130 0xba634d (12215117) parent_offs=_raw_spin_lock_irqsave+0x62/0x70 0x39d10e2 (60625122)

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250506105131.4b6089a9@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_output.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index e7ebad177679..0b3db02030a7 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1019,6 +1019,17 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 				}
 
 				addr = *(unsigned int *)pos;
+
+				/* Some fields reference offset from _stext. */
+				if (!strcmp(field->name, "caller_offs") ||
+				    !strcmp(field->name, "parent_offs")) {
+					unsigned long ip;
+
+					ip = addr + (unsigned long)_stext;
+					ip = trace_adjust_address(tr, ip);
+					trace_seq_printf(&iter->seq, "%pS ", (void *)ip);
+				}
+
 				if (sizeof(long) == 4) {
 					addr = trace_adjust_address(tr, addr);
 					trace_seq_printf(&iter->seq, "%pS (%d)",
-- 
2.47.2


