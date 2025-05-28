Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB1222566
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=Lv1iCRljUinOyGnY/5Q58T6x+di1YZ+exLPbafrUatrPoANwZ5saamfwO55Kg+ecK8MxWxVKToMqxQJsrfVChKCYQNOlbkXoaxSqo/iwxKWZb3RtUmohITn9zI6/l+T1qCCeOOvrW2mOWUaM5DJiQq8WZRR7gGJrQvhTjVpv2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=CtF3ZpsikHvLYRw54+HBfRlC8X1EQ0vEmZWVRxaWnXo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rZVm+pqDUdlFPetHD1KM8RHVlScs8XlEUflAHIgVcsz3FYhYbFUfuILld2dGtPKjDwmPRAiaSeDJBd5NJGZryyhscO0QuWPFx/+xGg0U0w0fs+JRQaxZKCDUABHkFz3daTHwKCX5C1wuCPvJCP7QcVC9/gGXzY9FesNUIVIhJo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BD2C4CEF0;
	Wed, 28 May 2025 22:26:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000Ap1f-369A;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222730.589774070@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 08/10] ring-buffer: Simplify ring_buffer_read_page() with guard()
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The function ring_buffer_read_page() had two gotos. One was simply
returning "ret" and the other was unlocking the reader_lock.

There's no reason to use goto to simply return the "ret" variable. Instead
just return the value.

The jump to the unlocking of the reader_lock can be replaced by
guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock).

With these two changes the "ret" variable is no longer used and can be
removed. The return value on non-error is what was read and is stored in
the "read" variable.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250527145216.0187cf36@gandalf.local.home
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 58cca10f482b..931bbcc6640f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6531,38 +6531,37 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	struct buffer_data_page *bpage;
 	struct buffer_page *reader;
 	unsigned long missed_events;
-	unsigned long flags;
 	unsigned int commit;
 	unsigned int read;
 	u64 save_timestamp;
-	int ret = -1;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
-		goto out;
+		return -1;
 
 	/*
 	 * If len is not big enough to hold the page header, then
 	 * we can not copy anything.
 	 */
 	if (len <= BUF_PAGE_HDR_SIZE)
-		goto out;
+		return -1;
 
 	len -= BUF_PAGE_HDR_SIZE;
 
 	if (!data_page || !data_page->data)
-		goto out;
+		return -1;
+
 	if (data_page->order != buffer->subbuf_order)
-		goto out;
+		return -1;
 
 	bpage = data_page->data;
 	if (!bpage)
-		goto out;
+		return -1;
 
-	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
+	guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
 
 	reader = rb_get_reader_page(cpu_buffer);
 	if (!reader)
-		goto out_unlock;
+		return -1;
 
 	event = rb_reader_event(cpu_buffer);
 
@@ -6596,7 +6595,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 		if (full &&
 		    (!read || (len < (commit - read)) ||
 		     cpu_buffer->reader_page == cpu_buffer->commit_page))
-			goto out_unlock;
+			return -1;
 
 		if (len > (commit - read))
 			len = (commit - read);
@@ -6605,7 +6604,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 		size = rb_event_ts_length(event);
 
 		if (len < size)
-			goto out_unlock;
+			return -1;
 
 		/* save the current timestamp, since the user will need it */
 		save_timestamp = cpu_buffer->read_stamp;
@@ -6663,7 +6662,6 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 		if (reader->real_end)
 			local_set(&bpage->commit, reader->real_end);
 	}
-	ret = read;
 
 	cpu_buffer->lost_events = 0;
 
@@ -6690,11 +6688,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 	if (commit < buffer->subbuf_size)
 		memset(&bpage->data[commit], 0, buffer->subbuf_size - commit);
 
- out_unlock:
-	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
-
- out:
-	return ret;
+	return read;
 }
 EXPORT_SYMBOL_GPL(ring_buffer_read_page);
 
-- 
2.47.2


