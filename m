Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BC182BC
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739025570; cv=none; b=alZuCIS6kWY8+QrNyVPTtrUbcCUheYE0Tc/aUu41rQIzVTpKHpPfS0rrQU8qOtRJyUPBmaOtb1p9FtZ+Pg0XIiQ4oar/w9feuqlXGLsdRg+GMvacPLxGOgTtAaXZa4eJm7KtnikZ4XNWF21gZkz+9iTHFoALqw8RSin1JVB8K5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739025570; c=relaxed/simple;
	bh=rwqtgUf9JnD69b2BfEjhKYVa48SUbWggqHe3Wp8kEYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s+nsKmo7ozIxurbA/qLZzxMxdStOrGMyY4JQozugANRoTRpO2XHCzkgUJMyrJKlOMCKo2ATiTjGKldqWlAtm6X94OdiFX8a/NzZlxDxG4H5AeQ+sPR1m96pPIEGYggaGV8U9nQbKdem8akhlWbCxjhowSDH8gtRsoY5+oCPhKQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A396C4CED6;
	Sat,  8 Feb 2025 14:39:28 +0000 (UTC)
Date: Sat, 8 Feb 2025 09:39:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [GIT PULL] ftrace: Fix function graph notrace setting
Message-ID: <20250208093927.3be357ae@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit



Linus,

function graph fix of notrace functions:

When the function graph tracer was restructured to use the global section
of the meta data in the shadow stack, the bit logic was changed. There's a
TRACE_GRAPH_NOTRACE_BIT that is the bit number in the mask that tells if
the function graph tracer is currently in the "notrace" mode. The
TRACE_GRAPH_NOTRACE is the mask with that bit set. But when the code was
restructured, the TRACE_GRAPH_NOTRACE_BIT was used when it should have
been the TRACE_GRAPH_NOTRACE mask. This made notrace not work properly.


Please pull the latest ftrace-v6.14-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ftrace-v6.14-rc1

Tag SHA1: 9f1894050febeedc75e6cbaef2bd02ea6094a9d9
Head SHA1: c8c9b1d2d5b4377c72a979f5a26e842a869aefc9


Steven Rostedt (1):
      fgraph: Fix set_graph_notrace with setting TRACE_GRAPH_NOTRACE_BIT

----
 kernel/trace/trace_functions_graph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---------------------------
commit c8c9b1d2d5b4377c72a979f5a26e842a869aefc9
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Sat Feb 8 00:15:11 2025 -0500

    fgraph: Fix set_graph_notrace with setting TRACE_GRAPH_NOTRACE_BIT
    
    The code was restructured where the function graph notrace code, that
    would not trace a function and all its children is done by setting a
    NOTRACE flag when the function that is not to be traced is hit.
    
    There's a TRACE_GRAPH_NOTRACE_BIT which defines the bit in the flags and a
    TRACE_GRAPH_NOTRACE which is the mask with that bit set. But the
    restructuring used TRACE_GRAPH_NOTRACE_BIT when it should have used
    TRACE_GRAPH_NOTRACE.
    
    For example:
    
     # cd /sys/kernel/tracing
     # echo set_track_prepare stack_trace_save  > set_graph_notrace
     # echo function_graph > current_tracer
     # cat trace
    [..]
     0)               |                          __slab_free() {
     0)               |                            free_to_partial_list() {
     0)               |                                  arch_stack_walk() {
     0)               |                                    __unwind_start() {
     0)   0.501 us    |                                      get_stack_info();
    
    Where a non filter trace looks like:
    
     # echo > set_graph_notrace
     # cat trace
     0)               |                            free_to_partial_list() {
     0)               |                              set_track_prepare() {
     0)               |                                stack_trace_save() {
     0)               |                                  arch_stack_walk() {
     0)               |                                    __unwind_start() {
    
    Where the filter should look like:
    
     # cat trace
     0)               |                            free_to_partial_list() {
     0)               |                              _raw_spin_lock_irqsave() {
     0)   0.350 us    |                                preempt_count_add();
     0)   0.351 us    |                                do_raw_spin_lock();
     0)   2.440 us    |                              }
    
    Cc: stable@vger.kernel.org
    Cc: Masami Hiramatsu <mhiramat@kernel.org>
    Cc: Mark Rutland <mark.rutland@arm.com>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Link: https://lore.kernel.org/20250208001511.535be150@batman.local.home
    Fixes: b84214890a9bc ("function_graph: Move graph notrace bit to shadow stack global var")
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 54d850997c0a..136c750b0b4d 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -198,7 +198,7 @@ int trace_graph_entry(struct ftrace_graph_ent *trace,
 	 * returning from the function.
 	 */
 	if (ftrace_graph_notrace_addr(trace->func)) {
-		*task_var |= TRACE_GRAPH_NOTRACE_BIT;
+		*task_var |= TRACE_GRAPH_NOTRACE;
 		/*
 		 * Need to return 1 to have the return called
 		 * that will clear the NOTRACE bit.
