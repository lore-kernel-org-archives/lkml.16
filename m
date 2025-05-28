Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563412222C5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=QIZgD8tu3K4scws35QcdJ79OL6U4KZ21zsaBEV9ud0LaCz3TSdT6YtvhTDx2OqjJrzxEePHg++iI4l9O69NCLsSnNW2Oz7fk/k6uNPY5dmShiiRSHhuo6k2vjQ+0fJexgOGWmXt5zzc2KMhFgoUN1d4Is4PtgMKRTA9xd3pQRy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=xR0jVlXSxsK9CirUkZLv3Ir0KWpeqtR+1zrUmcndo5o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=U+6FaULqI+mXc0YDoJwbLc2TRreTpS/tKwgxKiFl+0/zfwlhK2xQ0Z+sT7skKO6WgoFfVMRQknuv1G67aHK/yGTR8ML4bpht2webvdoSzizN2pc82A+u3ZBaEHINIb6M+iWXmvIhY1Hab9uYrzrKgI9iHOEBUfgffEl8gVoV0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD14C4CEED;
	Wed, 28 May 2025 22:26:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000Ap19-2Ngu;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222730.420688871@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 07/10] ring-buffer: Simplify reset_disabled_cpu_buffer() with use of guard()
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Use guard(raw_spinlock_irqsave)() in reset_disabled_cpu_buffer() to
simplify the locking.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250527144623.77a9cc47@gandalf.local.home
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index c912ce4c8c89..58cca10f482b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6113,21 +6113,16 @@ rb_reset_cpu(struct ring_buffer_per_cpu *cpu_buffer)
 /* Must have disabled the cpu buffer then done a synchronize_rcu */
 static void reset_disabled_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
+	guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
 
 	if (RB_WARN_ON(cpu_buffer, local_read(&cpu_buffer->committing)))
-		goto out;
+		return;
 
 	arch_spin_lock(&cpu_buffer->lock);
 
 	rb_reset_cpu(cpu_buffer);
 
 	arch_spin_unlock(&cpu_buffer->lock);
-
- out:
-	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
 }
 
 /**
-- 
2.47.2


