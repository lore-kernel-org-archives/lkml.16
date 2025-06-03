Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543B1D8E07
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970674; cv=none; b=BpjcLoV0o9TBK/fuNHcQtdmyGFB7F8Z5B0IjMZioJIOYl3RIFdygjwgUVET/TYcxuReyUEMMHcLv6QVYEsOpzhsnHaYQo3TA0FMZKiuXgA0ZqASi7v7PVvy+DieOBSpQadC8zllXjXEm9zS2dLMn2Sn5tCHwqTZBpJzoNrjhv7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970674; c=relaxed/simple;
	bh=pDZLLHjJlmlCp/eMBkFgvRVNQcURZbeXXajCoxeVh/I=;
	h=Message-ID:Date:From:To:Cc:Subject; b=PpFBBPWPrMmyfXZsLfNzdup3qWqULFDMu1mv/2eX87ggLVcRWpP2h5Ph5gqHWHRm3F1rciuY3F1mVKvgYMcCBZACQo2+23clUu7O4iDyDOUk0fOV4YyTkR2ccvij22dpROyTqGaYoAYBw16GWbtLxXbo/Kc/qQlx4GFsyzCivCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E69C4CEED;
	Tue,  3 Jun 2025 17:11:13 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uMVBc-0000000E3z3-1eV2;
	Tue, 03 Jun 2025 13:12:28 -0400
Message-ID: <20250603171149.582996770@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 03 Jun 2025 13:11:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/5] tracing: Fixes for v6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes:

- Fix UAF in module unload in ftrace when there's a bug in the module

  If a module is buggy and triggers ftrace_disable which is set when
  an anomaly is detected, when it gets unloaded it doesn't free
  the hooks into kallsyms, and when a kallsyms lookup is performed
  it may access the mod->modname field and crash via UAF.

  Fix this by still freeing the mod_maps that are attached to kallsyms
  on module unload regardless if ftrace_disable is set or not.

- Do not bother allocating mod_maps for kallsyms if ftrace_disable is set

- Remove unused trace events

  When a trace event or tracepoint is created but not used, it still
  creates the code and data structures needed for that trace event.
  This just wastes memory.

  A patch is being worked on to warn when a trace event is created but
  not used: https://lore.kernel.org/linux-trace-kernel/20250529130138.544ffec4@gandalf.local.home/

  Remove the trace events that are created but not used. This does not
  remove trace events that are created but are not used due configs
  not being set. That will be handled later.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 2adb87c9409e11e8bc6c56f8e1e253eb25a7d6ae


Steven Rostedt (3):
      xdp: Remove unused mem_return_failed event
      genirq/matrix: Remove unused irq_matrix_alloc_reserved tracepoint
      fsdax: Remove unused trace events for dax insert mapping

Ye Bin (2):
      ftrace: Fix UAF when lookup kallsym after ftrace disabled
      ftrace: Don't allocate ftrace module map if ftrace is disabled

----
 include/trace/events/fs_dax.h     | 78 ---------------------------------------
 include/trace/events/irq_matrix.h |  8 ----
 include/trace/events/xdp.h        | 26 -------------
 kernel/trace/ftrace.c             | 13 +++++--
 4 files changed, 10 insertions(+), 115 deletions(-)
