Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D2221F2E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471188; cv=none; b=CqWK5wnu7DsmIS9bdvv6Rl00l+jvXugDKmKdiJoPKOdjotBiv0wqlC7XdO+ylr8lI7MHs0c5m+MutoU5W1nHC6NJsRIzvk4f8KZrw16K3QGaeF++VlgVfklS0APcoPykxQp16qL2ShzvNzDpRXRO1CECDwSzVryk2K1E8SgkYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471188; c=relaxed/simple;
	bh=MZjUkKHS1vCjdXkfYflxs7Zno0iAOCiqgPK5E4whLTY=;
	h=Message-ID:Date:From:To:Cc:Subject; b=DZoa2DygKyh+e6vVz+qFT8e7Sfnu/d+38UNqeeeKKx5vJ0c/VR721ZaxCW3avJ8eE6cVfPAtNMgQl2vFlLDhGUmF+aLIgCEk9wDEXx+Pp0xcCGAdzP8s6RlnAUM0smzUhN+ZN6iyFHUbRpioo17mNQgK32sAwHIe4sCM5VqsndY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46007C4CEE3;
	Wed, 28 May 2025 22:26:28 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFB-0000000AoxW-1bEI;
	Wed, 28 May 2025 18:27:29 -0400
Message-ID: <20250528222704.623477429@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 00/10] ring-buffer: Updates for v6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ring-buffer/for-next

Head SHA1: 1e83735aeb8330a23dd6020cd917ef12dd7ee56e


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
