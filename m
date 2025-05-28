Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CE2222D1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=MsF/eYH1phcdX46aKuqWINOYfmGvvdLjK9qDkm3f3nFdRDrpOzYR3N928Ix17NqJDFFz3Mv940N/znx2NYoGBXxlevNxTzsLY05Wc9LVOEjZnXK4AFl7xv8O0eu4L8v+2ZmMMwbmJspWvXygr1R6Jpg0rSQqJSefRwlBiMi76Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=jZzDn7oxDj4fzCSUFFrLZKm14MUPfbJ+RUxTk8MOn/k=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=eQ3KSBKY0jrJ7f7KP8g9k2JX7h1GtqtCUFKVhYuDJQdiaRmsc6iQaYV3h1WMIK8ko+wV03qLshvRTh44xcOy3Ma++pg9kvwxdPD3QdhjR7dZ595xkH3OAhBj+afVCPinOaOTXQmB54x5Ym0TbyyNj2yzmMOjucQ99wrgNP55P5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFDAC4AF0D;
	Wed, 28 May 2025 22:26:28 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000Aozy-0zsc;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222730.087873560@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 05/10] ring-buffer: Removed unnecessary if() goto out where out is the next
 line
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

In the function ring_buffer_discard_commit() there's an if statement that
jumps to the next line:

	if (rb_try_to_discard(cpu_buffer, event))
		goto out;
 out:

This was caused by the change that modified the way timestamps were taken
in interrupt context, and removed the code between the if statement and
the goto, but failed to update the conditional logic.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250527155116.227f35be@gandalf.local.home
Fixes: a389d86f7fd0 ("ring-buffer: Have nested events still record running time stamp")
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index e40f5c6d7908..a01fc42f2a13 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4685,10 +4685,7 @@ void ring_buffer_discard_commit(struct trace_buffer *buffer,
 	RB_WARN_ON(buffer, !local_read(&cpu_buffer->committing));
 
 	rb_decrement_entry(cpu_buffer, event);
-	if (rb_try_to_discard(cpu_buffer, event))
-		goto out;
-
- out:
+	rb_try_to_discard(cpu_buffer, event);
 	rb_end_commit(cpu_buffer);
 
 	trace_recursive_unlock(cpu_buffer);
-- 
2.47.2


