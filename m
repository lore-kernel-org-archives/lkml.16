Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7324291881
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796378; cv=none; b=o+SLphBlSLcphmujNBHYvY5usUJtP+YkLZjcitdAaL8dMdncYkydVCi0s07ErrdnFVfDHZGbpOM3uEJ8QQZvOSSfJ9eUEtdkUf0c+wBlJJC3fFwelWp3AXzorI+M2MDIXjoDHPoCYaPogMOSpolrNdNgzyHCFdp0oY8pZCY6oRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796378; c=relaxed/simple;
	bh=8rec8zMYyPtWG77kE1jVUaH5/n35o46IbwU7XIWi2r8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rSMSxfwtIfmrvZS2s5dYwKQO+q83EeFoIv/U6pyo2wJQbqr4XObWpW7jo2ljE5eIxcZ1YvUvfEM1ohQYfHK3jKOUNOpo/9/Wpxorywx1YN7OV3zzHF38VBHgHQze8vMcatpLBtA1LweRVEilLkdxVCAMVJgnaM3++JIIMxO+X38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB27C4CEEE;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXN-00000002boI-36Ru;
	Fri, 09 May 2025 09:13:13 -0400
Message-ID: <20250509131313.599215203@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 01/31] tracing: Update function trace addresses with module addresses
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Now that module addresses are saved in the persistent ring buffer, their
addresses can be used to adjust the address in the persistent ring buffer
to the address of the module that is currently loaded.

Instead of blindly using the text_delta that only works for core kernel
code, call the trace_adjust_address() that will see if the address matches
an address saved in the persistent ring buffer, and then uses that against
the matching module if it is loaded.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250506111648.5df7f3ec@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_output.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index b9ab06c99543..aab6816f0249 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1086,11 +1086,11 @@ enum print_line_t trace_nop_print(struct trace_iterator *iter, int flags,
 }
 
 static void print_fn_trace(struct trace_seq *s, unsigned long ip,
-			   unsigned long parent_ip, long delta,
-			   unsigned long *args, int flags)
+			   unsigned long parent_ip, unsigned long *args,
+			   struct trace_array *tr, int flags)
 {
-	ip += delta;
-	parent_ip += delta;
+	ip = trace_adjust_address(tr, ip);
+	parent_ip = trace_adjust_address(tr, parent_ip);
 
 	seq_print_ip_sym(s, ip, flags);
 	if (args)
@@ -1119,8 +1119,7 @@ static enum print_line_t trace_fn_trace(struct trace_iterator *iter, int flags,
 	else
 		args = NULL;
 
-	print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta,
-		       args, flags);
+	print_fn_trace(s, field->ip, field->parent_ip, args, iter->tr, flags);
 	trace_seq_putc(s, '\n');
 
 	return trace_handle_return(s);
@@ -1706,7 +1705,7 @@ static enum print_line_t trace_print_print(struct trace_iterator *iter,
 
 	trace_assign_type(field, iter->ent);
 
-	ip = field->ip + iter->tr->text_delta;
+	ip = trace_adjust_address(iter->tr, field->ip);
 
 	seq_print_ip_sym(s, ip, flags);
 	trace_seq_printf(s, ": %s", field->buf);
@@ -1792,7 +1791,7 @@ trace_func_repeats_print(struct trace_iterator *iter, int flags,
 
 	trace_assign_type(field, iter->ent);
 
-	print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, NULL, flags);
+	print_fn_trace(s, field->ip, field->parent_ip, NULL, iter->tr, flags);
 	trace_seq_printf(s, " (repeats: %u, last_ts:", field->count);
 	trace_print_time(s, iter,
 			 iter->ts - FUNC_REPEATS_GET_DELTA_TS(field));
-- 
2.47.2


