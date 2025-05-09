Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F672918D5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796379; cv=none; b=V+BNJUITRpiLPjeu3r2PEDJwhlWODiX2uxHW4VMiPQiCaGHNxYPCJSiu54nesC8BcEwvaWm6uRfmiWE3bG7bobgrISRSJRvRIl79COQbU7KBVH5RxTixFo4IyyxwTIWb94eXd2Rp8IotcRhnv3kXCsS/59O3NjdFNg19U9bL/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796379; c=relaxed/simple;
	bh=M6W2vb58uFOUcQ+8LnVusimQhoqu4ku91G803QbGz7A=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=iNxOw+89pFyG4rOVQ4F26FXpONDqAyEQgi7qtoz+8lmWcNt3C2FDrFhChbfoWh+viUfToeT1FAXTKek2T+A992iIcVsdpTri+3/IwMRaOS/dsMrK+J0Cc1q5JmmWFEV7cZIKzqGUf+N4SQPrWgKz4SabIXJhVJs8dzsOuqFudfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C562FC4CEF3;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXO-00000002bpm-12z4;
	Fri, 09 May 2025 09:13:14 -0400
Message-ID: <20250509131314.097898419@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 04/31] tracing: Adjust addresses for printing out fields
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Add adjustments to the values of the "fields" output if the buffer is a
persistent ring buffer to adjust the addresses to both the kernel core and
kernel modules if they match a module in the persistent memory and that
module is also loaded.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250325185619.54b85587@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_output.c | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 73037efdb45f..e7ebad177679 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -938,6 +938,9 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 			 struct list_head *head)
 {
 	struct ftrace_event_field *field;
+	struct trace_array *tr = iter->tr;
+	unsigned long long laddr;
+	unsigned long addr;
 	int offset;
 	int len;
 	int ret;
@@ -974,8 +977,8 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 		case FILTER_PTR_STRING:
 			if (!iter->fmt_size)
 				trace_iter_expand_format(iter);
-			pos = *(void **)pos;
-			ret = strncpy_from_kernel_nofault(iter->fmt, pos,
+			addr = trace_adjust_address(tr, *(unsigned long *)pos);
+			ret = strncpy_from_kernel_nofault(iter->fmt, (void *)addr,
 							  iter->fmt_size);
 			if (ret < 0)
 				trace_seq_printf(&iter->seq, "(0x%px)", pos);
@@ -984,8 +987,8 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 						 pos, iter->fmt);
 			break;
 		case FILTER_TRACE_FN:
-			pos = *(void **)pos;
-			trace_seq_printf(&iter->seq, "%pS", pos);
+			addr = trace_adjust_address(tr, *(unsigned long *)pos);
+			trace_seq_printf(&iter->seq, "%pS", (void *)addr);
 			break;
 		case FILTER_CPU:
 		case FILTER_OTHER:
@@ -1015,24 +1018,25 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 					break;
 				}
 
-				if (sizeof(long) == 4)
+				addr = *(unsigned int *)pos;
+				if (sizeof(long) == 4) {
+					addr = trace_adjust_address(tr, addr);
 					trace_seq_printf(&iter->seq, "%pS (%d)",
-							 *(void **)pos,
-							 *(unsigned int *)pos);
-				else
+							 (void *)addr, (int)addr);
+				} else {
 					trace_seq_printf(&iter->seq, "0x%x (%d)",
-							 *(unsigned int *)pos,
-							 *(unsigned int *)pos);
+							 (unsigned int)addr, (int)addr);
+				}
 				break;
 			case 8:
-				if (sizeof(long) == 8)
+				laddr = *(unsigned long long *)pos;
+				if (sizeof(long) == 8) {
+					laddr = trace_adjust_address(tr, (unsigned long)laddr);
 					trace_seq_printf(&iter->seq, "%pS (%lld)",
-							 *(void **)pos,
-							 *(unsigned long long *)pos);
-				else
-					trace_seq_printf(&iter->seq, "0x%llx (%lld)",
-							 *(unsigned long long *)pos,
-							 *(unsigned long long *)pos);
+							 (void *)(long)laddr, laddr);
+				} else {
+					trace_seq_printf(&iter->seq, "0x%llx (%lld)", laddr, laddr);
+				}
 				break;
 			default:
 				trace_seq_puts(&iter->seq, "<INVALID-SIZE>");
-- 
2.47.2


