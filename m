Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46A217679
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081241; cv=none; b=hrtLIlRfYCl1pGIYw+7do6RNLdWvDmZmYMwWtwm5IllzAJHG3nd7BkL+TdjV/2EgmXg1ov7oTF3brs696/veHtscioVPweX2tSxuB79BhkRfiBSjGwUOP0cGc8I/83TcjebPIv+HnFOgd4UcVyvRRapaxoMpQSSlWN2dVHqsqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081241; c=relaxed/simple;
	bh=pwPhuqxN4p7G1VvfM/q+6goxKdG41YOV02tZkqZXiAo=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=Li4MEWCnkl6mnge65H/GajxX2l9Nb6lSAbbz6tV79NB4B8FKrwHINZ74ou4Mb1/ZF+TjCOhymfTWLqzmmr04YVo55exdpMnyDEsqR3jYe6cWnMLUxuEywckPS6pzxQGM3f3i2P2UZbk/kz11I0PEMfZWn/7XPcmpt0YrXacuCL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unJETW4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unJETW4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A483EC4CEE8;
	Thu, 27 Mar 2025 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743081241;
	bh=pwPhuqxN4p7G1VvfM/q+6goxKdG41YOV02tZkqZXiAo=;
	h=Date:From:To:Cc:Subject:From;
	b=unJETW4IlQYnLdjuUul/V1Yo/lf0y3Dr6MzM9QJ8G/6DUdJonWwU1QPjOFHWHgMcG
	 mxgd2w8EgD8gynXQFV7nKOfQ/rjI3s/Ul9GjQ2RMnvQZMGqM74svYxb/stbRQKKNMo
	 9Hk3VynMYm9yFg3/lE/eEqP3ajFzU8DhQfxPtP0hz66aCkIoHvbKeZIKZ8AZnAEGq6
	 LhMF7oMuAfIUYVjMWgpBL66CxOZObmFVBjA75Le1UU3puOSDXdfVolmAOoq67HExgH
	 /YQn+vg0ocMtvRtssvm4a9Fy4iwSdHW+3HIxxXI4yIImORGeAsulqOFBvpz8Lsx2LC
	 A/D1fGpPYq6dQ==
Date: Thu, 27 Mar 2025 22:13:57 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masami Hiramatsu (Google) <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Updates for v6.15
Message-Id: <20250327221357.bfa54d31c9f8b9b1e68ffe3d@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Probes updates for v6.15:

- probe-events: Add comments about entry data storing code to clarify
  where and how the entry data is stored for function return events.

- probe-events: Log error for exceeding the number of arguments to help
  user to identify error reason via tracefs/error_log file.

- selftests/ftrace: Improve the ftracetest to add followngs.
  . Expand the tprobe event test to check if it can correctly find
    the wrong format tracepoint name.
  . Add new syntax error test to check whether error_log correctly
    indicates a wrong character in the tracepoint name.
  . Add a new dynamic events argument limitation test case which checks
    max number of probe arguments.


Please pull the latest probes-v6.15 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-v6.15

Tag SHA1: 395caaabf3068c20d718b981763bdfb0680be393
Head SHA1: bb9c6020f4c3a07a90dc36826cb5fbe83f09efd5


Masami Hiramatsu (Google) (5):
      tracing: probe-events: Log error for exceeding the number of arguments
      selftests/ftrace: Expand the tprobe event test to check wrong format
      selftests/ftrace: Add new syntax error test
      selftests/ftrace: Add dynamic events argument limitation test case
      tracing: probe-events: Add comments about entry data storing code

----
 kernel/trace/trace_eprobe.c                        |  2 ++
 kernel/trace/trace_fprobe.c                        |  5 ++-
 kernel/trace/trace_kprobe.c                        |  5 ++-
 kernel/trace/trace_probe.c                         | 28 +++++++++++++++
 kernel/trace/trace_probe.h                         |  1 +
 kernel/trace/trace_uprobe.c                        |  9 +++--
 .../ftrace/test.d/dynevent/add_remove_tprobe.tc    | 14 ++++++++
 .../ftrace/test.d/dynevent/dynevent_limitations.tc | 42 ++++++++++++++++++++++
 .../ftrace/test.d/dynevent/fprobe_syntax_errors.tc |  1 +
 9 files changed, 103 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/dynevent_limitations.tc

