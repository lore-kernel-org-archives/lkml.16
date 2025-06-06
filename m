Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D618289E3D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228152; cv=none; b=WamS8FtrnOC7FxW18mNv+m7EPuhZM0RNXkRc1ei2TBFpurhUwSVVf0HC/E7xTYRO7YsWMqkMf1L6vKwNrN0Q8siLs5I1dvp/ApLB78P/otoiedI5MSdDN7opeePctnKOj9sU1DhKZ/D5wtmThjlibN2u2HXaUg2FYyzfC0Z0698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228152; c=relaxed/simple;
	bh=Big0fK1d467fZdCDLKWMU7ohRMBKp9xjnw253JEPITo=;
	h=Message-ID:Date:From:To:Cc:Subject; b=MsMkQQzbNdEbhrbkJooujcfYYGAJ4E7j30BmGLkoBHnEqn/cINY223xW33HlNtRyeWj3pm7aHEtZt8UJAILFv/ZtlpI+Kh94h8vIBH5LRHdOGotYiYLhasdExPYX0ycd2sD0PCByadI9W9F5+cY+xZXbHXKti/C/XyDZ7GeY0XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B1EC4CEEB;
	Fri,  6 Jun 2025 16:42:31 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uNaAb-0000000Fx9u-1ACH;
	Fri, 06 Jun 2025 12:43:53 -0400
Message-ID: <20250606164229.056794577@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 06 Jun 2025 12:42:29 -0400
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

[ Resending as my scripts messed up the first patch email addresses
  and the sending crashed ]

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

