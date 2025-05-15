Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6874C296155
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299058; cv=none; b=BufBFS6bvywakJbiWbYsoZIdDqNDPRtaZsHoG8pdrq0L3uw6xfeQNrG/ZnaW0M0Y0gV11y8HhfNQ3FE3b2HpWLDcAgcKaWdXXTxKRGslfwrP1FnldH49YUR6uny7zruCkk8LrN01ul0cVulfZllG/C0Tjph+z9MTvmkCFf7Hcik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299058; c=relaxed/simple;
	bh=ychNC1BGYbTZjE6Ig7J+O6EPWv3Ym+c9iiXv0ZSgH9g=;
	h=Message-ID:Date:From:To:Cc:Subject; b=TJ+/gpYotKBwWxlAavlzt8I1CJ7m5nhUyeSE2rSjpUtMFDOoAUdkpGk6Ml8eFmmFtMi4a67NCD1+F6yvXWn+6w4EWlknoHvEj7yqP1L2+xYIV3HFKwloc05wk+fcpQqBUDxeoOstsCTDiea5K8hr82gK3rHfbouJqMN3Xm4lY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DFDC4CEEF;
	Thu, 15 May 2025 08:50:57 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uFUJK-00000005XZi-47HR;
	Thu, 15 May 2025 04:51:26 -0400
Message-ID: <20250515085109.352233527@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 15 May 2025 04:51:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/4] tracing: Updates for v6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: 2632a2013f58f0aab4b9fd042e67d78740ba0996


Masami Hiramatsu (Google) (1):
      tracing: Record trace_clock and recover when reboot

Steven Rostedt (2):
      tracepoint: Have tracepoints created with DECLARE_TRACE() have _tp suffix
      tracing/sched: Use __string() instead of fixed lengths for task->comm

Yury Norov (1):
      tracing: Cleanup upper_empty() in pid_list

----
 Documentation/trace/tracepoints.rst                |  17 ++-
 include/linux/tracepoint.h                         |  38 +++++--
 include/trace/bpf_probe.h                          |   8 +-
 include/trace/define_trace.h                       |  17 ++-
 include/trace/events/sched.h                       | 124 ++++++++++-----------
 include/trace/events/tcp.h                         |   2 +-
 kernel/trace/pid_list.c                            |   8 +-
 kernel/trace/trace.c                               |  17 +++
 tools/testing/selftests/bpf/progs/raw_tp_null.c    |   2 +-
 .../testing/selftests/bpf/progs/raw_tp_null_fail.c |   2 +-
 .../selftests/bpf/progs/test_module_attach.c       |   4 +-
 .../selftests/bpf/progs/test_tp_btf_nullable.c     |   4 +-
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c |   8 +-
 13 files changed, 149 insertions(+), 102 deletions(-)
