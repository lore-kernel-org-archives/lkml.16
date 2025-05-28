Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE0222585
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=FJ/YoUymNsz7sZIO7AjI1ospwRZrjcRlKajklpdgyBnySx81sLwpLj2wPTPMWaGOw5DYWpVHcrY3Cq40FBFOSEX+N+cr9qfAtRZgWk/j07eZbCQbUkcmADP1Q2I2Kb6G8pz3nVRdp5djgCwc6gJ1fFWBVwAjnjCY/D7O/SkY7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=G9Oggep7KMEniKM/9/dQzsFFXEJn/Af57KWOcQMTfTk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GqE8BhEWSgxoVG6GoOmAFgnCHyAeJwtGLdWQFnjcFb98vh7rPQU/9bpg8Y2uPfG31kD5zYD7KcNmAzHhZgR/mnieRApPWisb+cPfUk70N3EeziFdsqYSGbXO8lJM7K/v7h90UNzLB3iYYr9eSA6NxEaVWJKQ7BRnOxFlzLOTQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278B1C4CEF6;
	Wed, 28 May 2025 22:26:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000Ap0f-1gg8;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222730.255593191@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 06/10] ring-buffer: Remove jump to out label in ring_buffer_swap_cpu()
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The function ring_buffer_swap_cpu() has a bunch of jumps to the label out
that simply returns "ret". There's no reason to jump to a label that
simply returns a value. Just return directly from there.

This goes back to almost the beginning when commit 8aabee573dff
("ring-buffer: remove unneeded get_online_cpus") was introduced. That
commit removed a put_online_cpus() from that label, but never updated all
the jumps to it that now no longer needed to do anything but return a
value.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250527145753.6b45d840@gandalf.local.home
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a01fc42f2a13..c912ce4c8c89 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6315,37 +6315,33 @@ int ring_buffer_swap_cpu(struct trace_buffer *buffer_a,
 
 	if (!cpumask_test_cpu(cpu, buffer_a->cpumask) ||
 	    !cpumask_test_cpu(cpu, buffer_b->cpumask))
-		goto out;
+		return -EINVAL;
 
 	cpu_buffer_a = buffer_a->buffers[cpu];
 	cpu_buffer_b = buffer_b->buffers[cpu];
 
 	/* It's up to the callers to not try to swap mapped buffers */
-	if (WARN_ON_ONCE(cpu_buffer_a->mapped || cpu_buffer_b->mapped)) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (WARN_ON_ONCE(cpu_buffer_a->mapped || cpu_buffer_b->mapped))
+		return -EBUSY;
 
 	/* At least make sure the two buffers are somewhat the same */
 	if (cpu_buffer_a->nr_pages != cpu_buffer_b->nr_pages)
-		goto out;
+		return -EINVAL;
 
 	if (buffer_a->subbuf_order != buffer_b->subbuf_order)
-		goto out;
-
-	ret = -EAGAIN;
+		return -EINVAL;
 
 	if (atomic_read(&buffer_a->record_disabled))
-		goto out;
+		return -EAGAIN;
 
 	if (atomic_read(&buffer_b->record_disabled))
-		goto out;
+		return -EAGAIN;
 
 	if (atomic_read(&cpu_buffer_a->record_disabled))
-		goto out;
+		return -EAGAIN;
 
 	if (atomic_read(&cpu_buffer_b->record_disabled))
-		goto out;
+		return -EAGAIN;
 
 	/*
 	 * We can't do a synchronize_rcu here because this
@@ -6382,7 +6378,6 @@ int ring_buffer_swap_cpu(struct trace_buffer *buffer_a,
 out_dec:
 	atomic_dec(&cpu_buffer_a->record_disabled);
 	atomic_dec(&cpu_buffer_b->record_disabled);
-out:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ring_buffer_swap_cpu);
-- 
2.47.2


