Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDD922371C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471190; cv=none; b=giNt1KAvwl0UVA1TJMhWm/R9m/OiQ2yN3ZdrH/i8K/8djWmoNBKCZ2gmtqSw9KkjGayEm93LFbVk//rpO0rx0RFwlicpdQ2URqNlvMbGAkQ7GQcdjb17vKxWnf7WweijUslJBpzFeUeUFohYFa0yvO4Qs8AUm9p2QXe7HfxU2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471190; c=relaxed/simple;
	bh=U8Bcmh8UVfm+NFcUlSKdEiT3iUt0gxDN8wwdX7ZyfEM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rW7LpEfx7CZvS8x+7KNwgSclMOeVg3fSt2CK1GQcZYY2288y2k3vpFmcFe/jRJJHK4gm3gcX8BhcNJm1LQxSt908og5llqpYUP6NwtUDBoqgOoVAbZm/HAnlQe2M8Ckbq8Xt5JjY0bsl53ttL+W8CDVlXkr8M+kNhUfjZGCLXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99527C4CEED;
	Wed, 28 May 2025 22:26:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000Ap2C-3oIZ;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222730.759686745@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 09/10] ring-buffer: Make ring_buffer_{un}map() simpler with guard(mutex)
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Convert the taking of the buffer->mutex and the cpu_buffer->mapping_lock
over to guard(mutex) and simplify the ring_buffer_map() and
ring_buffer_unmap() functions.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Vincent Donnefort <vdonnefort@google.com>
Link: https://lore.kernel.org/20250527122009.267efb72@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 931bbcc6640f..ef1cca8125df 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7161,36 +7161,34 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
 	unsigned long flags, *subbuf_ids;
-	int err = 0;
+	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return -EINVAL;
 
 	cpu_buffer = buffer->buffers[cpu];
 
-	mutex_lock(&cpu_buffer->mapping_lock);
+	guard(mutex)(&cpu_buffer->mapping_lock);
 
 	if (cpu_buffer->user_mapped) {
 		err = __rb_map_vma(cpu_buffer, vma);
 		if (!err)
 			err = __rb_inc_dec_mapped(cpu_buffer, true);
-		mutex_unlock(&cpu_buffer->mapping_lock);
 		return err;
 	}
 
 	/* prevent another thread from changing buffer/sub-buffer sizes */
-	mutex_lock(&buffer->mutex);
+	guard(mutex)(&buffer->mutex);
 
 	err = rb_alloc_meta_page(cpu_buffer);
 	if (err)
-		goto unlock;
+		return err;
 
 	/* subbuf_ids include the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-		err = -ENOMEM;
-		goto unlock;
+		return -ENOMEM;
 	}
 
 	atomic_inc(&cpu_buffer->resize_disabled);
@@ -7218,35 +7216,29 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		atomic_dec(&cpu_buffer->resize_disabled);
 	}
 
-unlock:
-	mutex_unlock(&buffer->mutex);
-	mutex_unlock(&cpu_buffer->mapping_lock);
-
-	return err;
+	return 0;
 }
 
 int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
 	unsigned long flags;
-	int err = 0;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return -EINVAL;
 
 	cpu_buffer = buffer->buffers[cpu];
 
-	mutex_lock(&cpu_buffer->mapping_lock);
+	guard(mutex)(&cpu_buffer->mapping_lock);
 
 	if (!cpu_buffer->user_mapped) {
-		err = -ENODEV;
-		goto out;
+		return -ENODEV;
 	} else if (cpu_buffer->user_mapped > 1) {
 		__rb_inc_dec_mapped(cpu_buffer, false);
-		goto out;
+		return 0;
 	}
 
-	mutex_lock(&buffer->mutex);
+	guard(mutex)(&buffer->mutex);
 	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
 
 	/* This is the last user space mapping */
@@ -7261,12 +7253,7 @@ int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)
 	rb_free_meta_page(cpu_buffer);
 	atomic_dec(&cpu_buffer->resize_disabled);
 
-	mutex_unlock(&buffer->mutex);
-
-out:
-	mutex_unlock(&cpu_buffer->mapping_lock);
-
-	return err;
+	return 0;
 }
 
 int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
-- 
2.47.2


