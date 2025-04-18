Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B656C22332D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001226; cv=none; b=BbR1O7MjWPmrL22F9uHPImPot3rNEeN4oqErn16EOUYgNEZO8kotC2Ptu2Er1GxV+mdcA78ZiRNSCs0mS/yF3IQ4tEk6eU2BqdenspjMsz9L36b4x1OKa4rH53QqFHmZyOJCSGwuqyTfKJkBeIIoD/+Dkk7+z+KFxOMqfA2VeJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001226; c=relaxed/simple;
	bh=r0SQoApptaGCEw9GVPwWUvpqDazv+2Ns4VY1iNZ7W/0=;
	h=Message-ID:Date:From:To:Cc:Subject; b=ux0qvSLp2mT+xIbI4+gyTbw4PoKihxvtir4hftvgSmVqKqpeROe8kz+oz68Pt6M4L1HWHU0J/lTV2iNt8Vyd3DYI9XPLlil4w2wS7h/TMrgNH1rhCCScwT3Rz9RPsTMMN5n0NnC050HwjuvcBu86bA2kG2rUHv9jVh67sAdRPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B88CC4CEE2;
	Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYi-0000000Db6i-0PyV;
	Fri, 18 Apr 2025 14:35:28 -0400
Message-ID: <20250418183446.383784216@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/7] tracing: Fixes for v6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes for v6.15

- Initialize hash variables in ftrace subops logic

  The fix that simplified the ftrace subops logic opened a path where some
  variables could be used without being initialized, and done subtly where
  the compiler did not catch it. Initialize those variables to the
  EMPTY_HASH, which is the default hash.

- Reinitialize the hash pointers after they are freed

  Some of the hash pointers in the subop logic were freed but may still be
  referenced later. To prevent use-after-free bugs, initialize them back to
  the EMPTY_HASH.

- Free the ftrace hashes when they are replaced

  The fix that simplified the subops logic updated some hash pointers, but
  left the original hash that they were pointing to where they are no longer
  used. This caused a memory leak. Free the hashes that are pointed to by
  the pointers when they are replaced.

- Fix size initialization of ftrace direct function hash

  The ftrace direct function hash used by BPF initialized the hash size
  incorrectly. It checked the size of items to a hard coded 32, which made
  the hash bit size of 5. The hash size is supposed to be limited by the bit
  size of the hash, as the bitmask is allowed to be greater than 5. Rework
  the size check to first pass the number of elements to fls() and then
  compare that to FTRACE_HASH_MAX_BITS before allocating the hash.

- Fix format output of ftrace_graph_ent_entry event

  The field depth of the ftrace_graph_ent_entry event is of size 4 but the
  output showed it as unsigned long and use "%lu". Change it to unsigned int
  and use "%u" in the print format that is displayed to user space.

- Fix the trace event filter on strings

  Events can be filtered on numbers or string values. The return value
  checked from strncpy_from_kernel_nofault() and strncpy_from_user_nofault()
  was used to determine if reading the strings would fault or not. It would
  return fault if the value was non zero, which is basically meant that it
  was always considering the read as a fault.

- Add selftest to test trace event string filtering

  In order to catch the breakage of the string filtering, add a self test to
  make sure that it continues to work.


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: d481ee35247d2a01764667a25f6f512c292ba42d


Ilya Leoshkevich (1):
      ftrace: Fix type of ftrace_graph_ent_entry.depth

Menglong Dong (1):
      ftrace: fix incorrect hash size in register_ftrace_direct()

Steven Rostedt (5):
      ftrace: Initialize variables for ftrace_startup/shutdown_subops()
      ftrace: Reinitialize hash to EMPTY_HASH after freeing
      ftrace: Free ftrace hashes after they are replaced in the subops code
      tracing: Fix filter string testing
      tracing: selftests: Add testing a user string to filters

----
 kernel/trace/ftrace.c                              | 27 +++++++++++++++-------
 kernel/trace/trace_entries.h                       |  4 ++--
 kernel/trace/trace_events_filter.c                 |  4 ++--
 .../ftrace/test.d/filter/event-filter-function.tc  | 20 ++++++++++++++++
 4 files changed, 43 insertions(+), 12 deletions(-)
