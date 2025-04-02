Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2705155382
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629448; cv=none; b=Z0KARuK8Oo0rcHvTYBPcW3iIHuo/xb6x7NqU1AhM9VtAfuZR3ayFtFEI6U3P41qeI3otaDcyFGQDtjS6qJtrOqkEMP5eUNx5qa2UEZBkpkE1IwIR6FGyfvdld6dUFanmj6x6r7yfQfoMdtzPOEH0BFmwev/tizRXePPgvAI3DIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629448; c=relaxed/simple;
	bh=V4vWgrhcPlTL+IlnF/DWzr4BPRSHXX+vE3gzWBsRK4s=;
	h=Message-ID:Date:From:To:Cc:Subject; b=fqXa2+b6i+Xjhl5VcjOtXpdawMS3iKXX3Cs3vIbfH4MyQzsTAl0rV6KfyiSsUZELJKOIb9EBRnlRkhZ1SUO0PvlTPGSIYiygAOQgyBHJ0UjjPYT9Gr695Kikb9hKC70P7z5vSm0RAsj7YYPlbFF3YcqUYcgICyWZ2zVs535eVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0BDC4CEE5;
	Wed,  2 Apr 2025 21:30:48 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u05ge-00000006YAR-1IYm;
	Wed, 02 Apr 2025 17:31:52 -0400
Message-ID: <20250402213136.747061769@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 02 Apr 2025 17:31:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/2] tracing: More fixes for v6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


More tracing fixes for 6.15

- Fix mcount sorttable building for different endian type target

  When modifying the ELF file to sort the mcount_loc table in the
  sorttable.c code, the endianess of the file and the host is used
  to determine if the bytes need to be swapped when calculations are
  done. A change was made to the sorting of the mcount_loc that read
  the values from the ELF file into an array and the swap happened
  on the filling of the array. But one of the calculations of the
  array still did the swap when it did not need to. This caused building
  on a little endian machine for a big endian target to not find
  the mcount function in the 'nm' table and it zeroed it out, causing
  there to be no functions available to trace.

- Add goto out_unlock jump to rv_register_monitor() on error path

  One of the error paths in rv_register_monitor() just returned the
  error when it should have jumped to the out_unlock label to release
  the mutex. 

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: fc0585c7faa9fffa0ecdd6e2466e3293cd3239ac


Gabriele Monaco (1):
      rv: Fix missing unlock on double nested monitors return path

Vasily Gorbik (1):
      scripts/sorttable: Fix endianness handling in build-time mcount sort

----
 kernel/trace/rv/rv.c | 3 ++-
 scripts/sorttable.c  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
