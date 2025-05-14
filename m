Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669A2040AB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229953; cv=none; b=jGEAoNCc0eqiUexR0TNVabYcOflBxTDaqe5vC9dSt2HlHAWj9uUAWbo1sJfuhqesFwb9o8Ge88ANslf1XuKy3LllJPArEQRA4JF0Z5IzZaE/jBIEOGceEXPMuxwtKfiGop4hXAxsSRoLwsGvtwxk/JeKUq3SARewWtxzyJwql0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229953; c=relaxed/simple;
	bh=+J0yhj8FYVwPcp516nHwK8B3U7OSGell9aeuY+L3lys=;
	h=Message-ID:Date:From:To:Cc:Subject; b=W61Ul+RDrQpJOm4zgdwIFywGW3rG/OdqhSL+DmRGMKtgQPyNiKSmx0sanaae1/Vwazj9CSxoJ957T3bjfH/GGyZHcLjyT6QjuMZUAsGZehbaAcW4FV2aalhTEJypRyVmp5BJO4ys7Vyyua6FV8/HGaDS516IkqWt3RfJ/+t8gSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0FEC4CEE9;
	Wed, 14 May 2025 13:39:12 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uFCKi-00000005IES-0dlC;
	Wed, 14 May 2025 09:39:40 -0400
Message-ID: <20250514133831.110736154@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 14 May 2025 09:38:31 -0400
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

tracing fixes for 6.15:

- Fix sample code that uses trace_array_printk()

  The sample code for in kernel use of trace_array (that creates an instance
  for use within the kernel) and shows how to use trace_array_printk() that
  writes into the created instance, used trace_printk_init_buffers(). But
  that function is used to initialize normal trace_printk() and produces the
  NOTICE banner which is not needed for use of trace_array_printk(). The
  function to initialize that is trace_array_init_printk() that takes the
  created trace array instance as a parameter.

  Update the sample code to reflect the proper usage.

- Fix preemption count output for stacktrace event

  The tracing buffer shows the preempt count level when an event executes.
  Because writing the event itself disables preemption, this needs to be
  accounted for when recording. The stacktrace event did not account for
  this so the output of the stacktrace event showed preemption was disabled
  while the event that triggered the stacktrace shows preemption is enabled
  and this leads to confusion. Account for preemption being disabled for the
  stacktrace event.

  The same happened for stack traces triggered by function tracer.

- Fix persistent ring buffer when trace_pipe is used

  The ring buffer swaps the reader page with the next page to read from the
  write buffer when trace_pipe is used. If there's only a page of data in
  the ring buffer, this swap will cause the "commit" pointer (last data
  written) to be on the reader page. If more data is written to the buffer,
  it is added to the reader page until it falls off back into the write
  buffer.

  If the system reboots and the commit pointer is still on the reader page,
  even if new data was written, the persistent buffer validator will miss
  finding the commit pointer because it only checks the write buffer and
  does not check the reader page. This causes the validator to fail the
  validation and clear the buffer, where the new data is lost.

  There was a check for this, but it checked the "head pointer", which was
  incorrect, because the "head pointer" always stays on the write buffer and
  is the next page to swap out for the reader page. Fix the logic to catch
  this case and allow the user to still read the data after reboot.


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 2285fb6d4d72a833d6e5ffbbe2f5ff594f0398cc


Steven Rostedt (2):
      tracing: samples: Initialize trace_array_printk() with the correct function
      ring-buffer: Fix persistent buffer when commit page is the reader page

pengdonglin (2):
      ftrace: Fix preemption acounting for stacktrace trigger command
      ftrace: Fix preemption accounting for stacktrace filter command

----
 kernel/trace/ring_buffer.c          | 8 +++++---
 kernel/trace/trace_events_trigger.c | 2 +-
 kernel/trace/trace_functions.c      | 6 +-----
 samples/ftrace/sample-trace-array.c | 2 +-
 4 files changed, 8 insertions(+), 10 deletions(-)
