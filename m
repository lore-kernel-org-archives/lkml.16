Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA92222A8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=ibJevlJw55HtPC9lsANFLTF2rLAolPng1oa2wzzxchjEhJkKcpZf5c9K3vhOa/TTnbaEJNXb3Tw/nctE+5ckg4Cg1F85IgFZsTcXi2sE4ioS0RWoFQXPwbUv6e/u3/Qcu67pEvlsElA90PIYjIxKFYY9dT73r7UBkS3B/BVwBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=x2ZdQ+E55F671MXAJwMZKQca4oYCPqwh6Smyb4/yja4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=hPod/mOtuQFX3lV7vHyJxHF1IZgNrDrG3HmPcA4h0ZIaBr3ARd//sQUJWORwJ/hsbAAiAu2XJYmoDHMm8B6D+G+dvEoFHPFXyMWDv9a4yHeohQa5DixeSF7pgWjBQga2H9P8ULHIyYlaJtO65XiNZa03aVenvmp9IV4tdSA4I+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C449FC4CEEE;
	Wed, 28 May 2025 22:26:28 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFC-0000000AozU-0HV5;
	Wed, 28 May 2025 18:27:30 -0400
Message-ID: <20250528222729.919034654@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 04/10] tracing: Reset last-boot buffers when reading out all cpu buffers
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Reset the last-boot ring buffers when read() reads out all cpu
buffers through trace_pipe/trace_pipe_raw. This prevents ftrace to
unwind ring buffer read pointer next boot.

Note that this resets only when all per-cpu buffers are empty, and
read via read(2) syscall. For example, if you read only one of the
per-cpu trace_pipe, it does not reset it. Also, reading buffer by
splice(2) syscall does not reset because some data in the reader
(the last) page.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/174792929202.496143.8184644221859580999.stgit@mhiramat.tok.corp.google.com
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 73d75cdb7e5b..ecb774cc01ab 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6610,6 +6610,22 @@ static int tracing_wait_pipe(struct file *filp)
 	return 1;
 }
 
+static bool update_last_data_if_empty(struct trace_array *tr)
+{
+	if (!(tr->flags & TRACE_ARRAY_FL_LAST_BOOT))
+		return false;
+
+	if (!ring_buffer_empty(tr->array_buffer.buffer))
+		return false;
+
+	/*
+	 * If the buffer contains the last boot data and all per-cpu
+	 * buffers are empty, reset it from the kernel side.
+	 */
+	update_last_data(tr);
+	return true;
+}
+
 /*
  * Consumer reader.
  */
@@ -6641,6 +6657,9 @@ tracing_read_pipe(struct file *filp, char __user *ubuf,
 	}
 
 waitagain:
+	if (update_last_data_if_empty(iter->tr))
+		return 0;
+
 	sret = tracing_wait_pipe(filp);
 	if (sret <= 0)
 		return sret;
@@ -8167,6 +8186,9 @@ tracing_buffers_read(struct file *filp, char __user *ubuf,
 
 	if (ret < 0) {
 		if (trace_empty(iter) && !iter->closed) {
+			if (update_last_data_if_empty(iter->tr))
+				return 0;
+
 			if ((filp->f_flags & O_NONBLOCK))
 				return -EAGAIN;
 
-- 
2.47.2


