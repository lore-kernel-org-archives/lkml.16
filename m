Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B37DDAD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743197683; cv=none; b=PNGg7gujoElx/UJBJ4FIIsKh5PNrt9OVz1086RsN+rCgiH7aB94TP2KfdAglnUvzhINDKkWIeaX2KSOsH2I703iLpbYqcz0w2frC/N9Y9DP0GUpLLP1bnWdwCcYtPjGjOfjT+dZz1P7TyWwFXM5wd/wHUl57voMjGFbbf80yZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743197683; c=relaxed/simple;
	bh=F+KKYL0YkyV+WGbYztfAjvdUzsXYSD14Yd5v2R0cO5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=up/iztSrDpzDbYl78tZU6c+PdDVnVogoCSnKatrRsXwryyyvaM/Gzqghc9IAL3N8ivdMwsADfRkAQbX6oT8fnXUyddfIA6Oy5d/wjH/I856BHBgHj+LtXhG2BMqfNzfu5u/yrGzXEZtNX3Nfsx3i/1o/9IiF9XbLfDkNv3bub9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E731C4CEE4;
	Fri, 28 Mar 2025 21:34:42 +0000 (UTC)
Date: Fri, 28 Mar 2025 17:35:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland
 <mark.rutland@arm.com>, Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>, Vincent Donnefort
 <vdonnefort@google.com>
Subject: [GIT PULL v2] ring-buffer: Updates for v6.15
Message-ID: <20250328173533.7fa7810d@gandalf.local.home>
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

I removed the commit that you had issues with (along with a fix for that
commit). This is the rest of that pull request as none of this code had any
dependencies on that work. That code was fixing the persistent buffer to be
memory mapped to user space. That is still disabled with these changes.

After removing those commits, I ran this through my test suite.

ring-buffer updates for v6.15

- Restructure the persistent memory to have a "scratch" area

  Instead of hard coding the KASLR offset in the persistent memory
  by the ring buffer, push that work up to the callers of the persistent
  memory as they are the ones that need this information. The offsets
  and such is not important to the ring buffer logic and it should
  not be part of that.

  A scratch pad is now created when the caller allocates a ring buffer
  from persistent memory by stating how much memory it needs to save.

- Allow where modules are loaded to be saved in the new scratch pad

  Save the addresses of modules when they are loaded into the persistent
  memory scratch pad.

- A new module_for_each_mod() helper function was created

  With the acknowledgment of the module maintainers a new module helper
  function was created to iterate over all the currently loaded modules.
  This has a callback to be called for each module. This is needed for
  when tracing is started in the persistent buffer and the currently loaded
  modules need to be saved in the scratch area.

- Expose the last boot information where the kernel and modules were loaded

  The last_boot_info file is updated to print out the addresses of where
  the kernel "_text" location was loaded from a previous boot, as well
  as where the modules are loaded. If the buffer is recording the current
  boot, it only prints "# Current" so that it does not expose the KASLR
  offset of the currently running kernel.

- Allow the persistent ring buffer to be released (freed)

  To have this in production environments, where the kernel command line can
  not be changed easily, the ring buffer needs to be freed when it is not
  going to be used. The memory for the buffer will always be allocated at
  boot up, but if the system isn't going to enable tracing, the memory needs
  to be freed. Allow it to be freed and added back to the kernel memory
  pool.

- Allow stack traces to print the function names in the persistent buffer

  Now that the modules are saved in the persistent ring buffer, if the same
  modules are loaded, the printing of the function names will examine the
  saved modules. If the module is found in the scratch area and is also
  loaded, then it will do the offset shift and use kallsyms to display the
  function name. If the address is not found, it simply displays the address
  from the previous boot in hex.


Please pull the latest trace-ringbuffer-v6.15-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-ringbuffer-v6.15-2

Tag SHA1: 506231bd8ae8677d720f64f7afe438f21d94147e
Head SHA1: 028a58ec154257e618c27fb0eba8d9e30379bc3d


Feng Yang (1):
      ring-buffer: Fix bytes_dropped calculation issue

Jiapeng Chong (1):
      ring-buffer: Remove the unused variable bmeta

Masami Hiramatsu (Google) (5):
      mm/memblock: Add reserved memory release function
      tracing: Freeable reserved ring buffer
      tracing: Fix a compilation error without CONFIG_MODULES
      tracing: Skip update_last_data() if cleared and remove active check for save_mod()
      tracing: Show last module text symbols in the stacktrace

Steven Rostedt (10):
      ring-buffer: Use kaslr address instead of text delta
      ring-buffer: Add buffer meta data for persistent ring buffer
      ring-buffer: Add ring_buffer_meta_scratch()
      tracing: Have persistent trace instances save KASLR offset
      module: Add module_for_each_mod() function
      tracing: Have persistent trace instances save module addresses
      tracing: Show module names and addresses of last boot
      tracing: Update modules to persistent instances when loaded
      tracing: Initialize scratch_size to zero to prevent UB
      tracing: Use _text and the kernel offset in last_boot_info

----
 include/linux/mm.h          |   1 +
 include/linux/module.h      |   6 +
 include/linux/ring_buffer.h |   8 +-
 kernel/module/main.c        |  13 ++
 kernel/trace/ring_buffer.c  | 247 ++++++++++++++++------------
 kernel/trace/trace.c        | 389 +++++++++++++++++++++++++++++++++++++++++---
 kernel/trace/trace.h        |  24 ++-
 kernel/trace/trace_events.c |  40 +++--
 kernel/trace/trace_output.c |   4 +-
 mm/memblock.c               |  66 ++++++--
 10 files changed, 639 insertions(+), 159 deletions(-)
---------------------------
