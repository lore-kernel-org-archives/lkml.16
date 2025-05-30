Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91703207DFE
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613536; cv=none; b=P6mFrrbnrqCjdmLCDj6npNPn5tF8+NMT+PnzdKAmBMcAQCdIG4Fz5NRqSFt4DJbI2qLgffASeArHd7sCDUnE9DntgrniL5e/7wYieSQdJed46zy13TpfxhLzmeioLp6MPXweqWEaqvHt+9DqqZLIEIOHcF09N5taplP96gGETek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613536; c=relaxed/simple;
	bh=t1GyjOELfVl8vfv7hnE/YTwAPdG60czzFl9MT01ZeJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=of+uKhWY4XFyUZ4dCTFHKZLSMHqkUKOcNxHsAqFh4vEeWum3GT8b0HwkcNKRpPkxCo6gFkDHwxIiPzjFzThEEhWHDV5HD6ZV8XyCsrArXf1s5OYvVgjjE3nPqXw/IdhTpW/2qB21SvWcvi+TqciYAy8Rti8dgYVyBtpzrDECMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390A4C4CEE9;
	Fri, 30 May 2025 13:58:55 +0000 (UTC)
Date: Fri, 30 May 2025 09:59:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [GIT PULL] ring-buffer: Updates for v6.16
Message-ID: <20250530095958.494ad94e@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

ring-buffer changes for v6.16:

- Allow the persistent ring buffer to be memory mapped

  In the last merge window there was issues with the implementation of
  mapping the persistent ring buffer because it was assumed that the
  persistent memory was just physical memory without being part of the
  kernel virtual address space. But this was incorrect and the persistent
  ring buffer can be mapped the same way as the allocated ring buffer is
  mapped.

  The meta data for the persistent ring buffer is different than the normal
  ring buffer and the organization of mapping it to user space is a little
  different. Make the updates needed to the meta data to allow the
  persistent ring buffer to be mapped to user space.

- Fix cpus_read_lock() with buffer->mutex and cpu_buffer->mapping_lock

  Mapping the ring buffer to user space uses the cpu_buffer->mapping_lock.
  The buffer->mutex can be taken when the mapping_lock is held, giving the
  locking order of: cpu_buffer->mapping_lock -->> buffer->mutex. But there
  also exists the ordering:

      buffer->mutex -->> cpus_read_lock()
      mm->mmap_lock -->> cpu_buffer->mapping_lock
      cpus_read_lock() -->> mm->mmap_lock

  causing a circular chain of:

      cpu_buffer->mapping_lock -> buffer->mutex -->> cpus_read_lock() -->>
         mm->mmap_lock -->> cpu_buffer->mapping_lock

  By moving the cpus_read_lock() outside the buffer->mutex where:
  cpus_read_lock() -->> buffer->mutex, breaks the deadlock chain.

- Do not trigger WARN_ON() for commit overrun

  When the ring buffer is user space mapped and there's a "commit overrun"
  (where an interrupt preempted an event, and then added so many events it
   filled the buffer having to drop events when it hit the preempted event)
  a WARN_ON() was triggered if this was read via a memory mapped buffer.
  This is due to "missed events" being non zero when the reader page ended
  up with the commit page. The idea was, if the writer is on the reader page,
  there's only one page that has been written to and there should be no
  missed events. But if a commit overrun is done where the writer is off the
  commit page and looped around to the commit page causing missed events, it
  is possible that the reader page is the commit page with missed events.

  Instead of triggering a WARN_ON() when the reader page is the commit page
  with missed events, trigger it when the reader page is the tail_page with
  missed events. That's because the writer is always on the tail_page if
  an event was interrupted (which holds the commit event) and continues off
  the commit page.

- Reset the persistent buffer if it is fully consumed

  On boot up, if the user fully consumes the last boot buffer of the
  persistent buffer, if it reboots without enabling it, there will still be
  events in the buffer which can cause confusion. Instead, reset the buffer
  when it is fully consumed, so that the data is not read again.

- Clean up some goto out jumps

  There's a few cases that the code jumps to the "out:" label that simply
  returns a value. There used to be more work done at those labels but now
  that they simply return a value use a return instead of jumping to a
  label.

- Use guard() to simplify some of the code

  Add guard() around some locking instead of jumping to a label to do the
  unlocking.

- Use free() to simplify some of the code

  Use free(kfree) on variables that will get freed on error and use
  return_ptr() to return the variable when its not freed. There's one
  instance where free(kfree) simplifies the code on a temp variable that was
  allocated just for the function use.


Please pull the latest trace-ringbuffer-v6.16 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-ringbuffer-v6.16

Tag SHA1: 194e7d78d0b586b1b28d37331894919d07f82d1c
Head SHA1: 99d232804405e35d7a9af1536a057578a1442e81


Masami Hiramatsu (Google) (1):
      tracing: Reset last-boot buffers when reading out all cpu buffers

Steven Rostedt (9):
      ring-buffer: Move cpus_read_lock() outside of buffer->mutex
      ring-buffer: Do not trigger WARN_ON() due to a commit_overrun
      ring-buffer: Allow reserve_mem persistent ring buffers to be mmapped
      ring-buffer: Removed unnecessary if() goto out where out is the next line
      ring-buffer: Remove jump to out label in ring_buffer_swap_cpu()
      ring-buffer: Simplify reset_disabled_cpu_buffer() with use of guard()
      ring-buffer: Simplify ring_buffer_read_page() with guard()
      ring-buffer: Make ring_buffer_{un}map() simpler with guard(mutex)
      ring-buffer: Simplify functions with __free(kfree) to free allocations

----
 kernel/trace/ring_buffer.c | 213 ++++++++++++++++++++++++---------------------
 kernel/trace/trace.c       |  26 +++++-
 2 files changed, 134 insertions(+), 105 deletions(-)
---------------------------
