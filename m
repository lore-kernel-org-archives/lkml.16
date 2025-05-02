Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5822B9A9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197203; cv=none; b=TOx0mrN7KADKcyrwz2jPGcTm+PDX+6vSF4BkyqoEMjkkANJt/f++EHpjSaspzNnJVhgv9qloG4FhKexRWlKkt3CQaU9BMux2jGXjluXGLl+4v0yOxFZdwN54BB5JwJNvhNstA7EsUopCooxSvTIon9HBrMRlY6p9/IpmQuZiNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197203; c=relaxed/simple;
	bh=yBuoyGD3IirnRYt2nJUc2XNTrOQGxG835wQJMTgtji0=;
	h=Message-ID:Date:From:To:Cc:Subject; b=Z7kXf5B7i43hIqjAY1/t1KamoPs1+IIteo19k49O3Bg4VJ2s/kV8v8sZs0ZnaOSRcHNQKqdtIctUngChJmM9RbHygXuUkz1hYCuTEQWsXG+r0Xe2vsCXFGW/UtE9Tw1kn3yJFIFvpSrINeQi9BJcJBpowdfGBLoeiI81+ElCbow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC87C4CEEB;
	Fri,  2 May 2025 14:46:42 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uArf9-000000032u0-0PUK;
	Fri, 02 May 2025 10:46:51 -0400
Message-ID: <20250502144607.785079223@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 02 May 2025 10:46:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/4] tracing: Fixes for v6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing updates for v6.15

- Fix read out of bounds bug in tracing_splice_read_pipe()

  The size of the sub page being read can now be greater than a page. But
  the buffer used in tracing_splice_read_pipe() only allocates a page size.
  The data copied to the buffer is the amount in sub buffer which can
  overflow the buffer. Use min((size_t)trace_seq_used(&iter->seq), PAGE_SIZE)
  to limit the amount copied to the buffer to a max of PAGE_SIZE.

- Fix the test for NULL from "!filter_hash" to "!*filter_hash"

  The add_next_hash() function checked for NULL at the wrong pointer level.

- Do not use the array in trace_adjust_address() if there are no elements

  The trace_adjust_address() finds the offset of a module that was stored in
  the persistent buffer when reading the previous boot buffer to see if the
  address belongs to a module that was loaded in the previous boot. An array
  is created that matches currently loaded modules with previously loaded
  modules. The trace_adjust_address() uses that array to find the new offset
  of the address that's in the previous buffer.  But if no module was
  loaded, it ends up reading the last element in an array that was never
  allocated. Check if nr_entries is zero and exit out early if it is.

- Remove nested lock of trace_event_sem in print_event_fields()

  The print_event_fields() function iterates over the ftrace_events list and
  requires the trace_event_sem semaphore held for read. But this function is
  always called with that semaphore held for read. Remove the taking of the
  semaphore and replace it with lockdep_assert_held_read(&trace_event_sem);

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 0a8f11f8569e7ed16cbcedeb28c4350f6378fea6


Colin Ian King (1):
      ftrace: Fix NULL memory allocation check

Jeongjun Park (1):
      tracing: Fix oob write in trace_seq_to_buffer()

Steven Rostedt (2):
      tracing: Fix trace_adjust_address() when there is no modules in scratch area
      tracing: Do not take trace_event_sem in print_event_fields()

----
 kernel/trace/ftrace.c       | 2 +-
 kernel/trace/trace.c        | 9 ++++++---
 kernel/trace/trace_output.c | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)
