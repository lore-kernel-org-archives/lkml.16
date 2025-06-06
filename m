Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE21A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227037; cv=none; b=CnVjwDKR9kK9xU4rw+F7ZdZ6CnuZSNE/QJu/4CCq5/+L5h3dl7UnZjOGUfFx8bUOucbLJtGQjrS+dfSsF+xYIlKrDGgKH92rYDLaL4qILIohiQA3HbL94im1LzS6U/mZYT8AOkwbotjnsBmTpZyW1hysuGracrWildeUdGfFZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227037; c=relaxed/simple;
	bh=0stof6QFOE46hLM2pFqm0Nm4BC/nkP/IjekkdZqIOGU=;
	h=Message-ID:Date:From:To:Cc:Subject; b=VO/HuNIHGHmFMz8OHFfHh6ZFBya17mr6lZzXMEeNFWjwUKiOAUj92DDl4c9bIe+3Kg0CWe6rGDmPyboQvCE+RxZG2hagtcDqNQ4EZbZoDZx0nxLd5wUSl/BXunPFE497M0EULtejwtsJ7PMmHdg16Uf+AXUaNMGbBaEBkUqsWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07654C4CEEB;
	Fri,  6 Jun 2025 16:23:57 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uNZsc-0000000Fwfp-2IPP;
	Fri, 06 Jun 2025 12:25:18 -0400
Message-ID: <20250606162457.314220565@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 06 Jun 2025 12:24:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/3] tracing: Fixes for 6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes:

- Fix regression of waiting a long time on updating trace event filters

  When the faultable trace points were added, it needed task trace RCU
  synchronization. This was added to the tracepoint_synchronize_unregister()
  function. The filter logic always called this function whenever it
  updated the trace event filters before freeing the old filters.
  This increased the time of "trace-cmd record" from taking 13 seconds
  to running over 2 minutes to complete.

  Move the freeing of the filters to call_rcu*() logic, which brings the
  time back down to 13 seconds.

- Fix ring_buffer_subbuf_order_set() error path lock protection

  The error path of the ring_buffer_subbuf_order_set() released the
  mutex too early and allowed subsequent accesses to setting the
  subbuffer size to corrupt the data and cause a bug.

  By moving the mutex locking to the end of the error path, it prevents
  the reentrant access to the critical data and also allows the function
  to convert the taking of the mutex over to the guard() logic.

- Remove unused power management clock events

  The clock events were added in 2010 for power management. In 2011
  arm used them. In 2013 the code they were used in was removed.
  These events have been wasting memory since then.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 28e6aecb1a79e178d870aee0b71f97cca669fd9b


Dmitry Antipov (1):
      ring-buffer: Fix buffer locking in ring_buffer_subbuf_order_set()

Steven Rostedt (2):
      tracing: Fix regression of filter waiting a long time on RCU synchronization
      tracing: PM: Remove unused clock events

----
 include/trace/events/power.h       |  47 -----------
 kernel/trace/ring_buffer.c         |   4 +-
 kernel/trace/trace_events_filter.c | 164 ++++++++++++++++++++++++++++---------
 3 files changed, 128 insertions(+), 87 deletions(-)
