Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904A2920AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796380; cv=none; b=Wlx4PTka3Eq5TPjudJ5qegit1/P+tQFmtqoD1f2O31mBrHefHE9QJpxVWTVu5BcKMctHFEtBYUPko7gRvZ1uUX3GRBY31ItPcBw0bzzy1jmwSYFOjEAjpXXDlBkZ9+3dR7WGWXm2mPEuOT2D6T5QQ/zkLCaOk9d3L9JfN4FQEr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796380; c=relaxed/simple;
	bh=2xgcDWQ1Wm6asJEBC/4gPWKZccRqj0GwASpqR3U/o7Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=b4j8XH2/XhHh3QF+pQhKEtrTZsYciREMVxdnswqG+5mxPWfbXUP3ZQWtAygdyE86mne6uXWWpynUerziB6wpW2yeWNgjnWzIBDrYdprJRcGYgKP44t3h9O+faPbQUTdwO3vtqzuzM7qKG66ZUhrXzlJbI5yNqD3o+2qnhYv5f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7ABC4CEF1;
	Fri,  9 May 2025 13:13:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXP-00000002btm-2XWq;
	Fri, 09 May 2025 09:13:15 -0400
Message-ID: <20250509131315.459424785@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tomas Glozar <tglozar@redhat.com>
Subject: [for-next][PATCH 12/31] tracing/osnoise: Allow arbitrarily long CPU string
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Tomas Glozar <tglozar@redhat.com>

Allocate kernel memory for processing CPU string
(/sys/kernel/tracing/osnoise/cpus) also in osnoise_cpus_write to allow
the writing of a CPU string of an arbitrary length.

This replaces the 256-byte buffer, which is insufficient with the rising
number of CPUs. For example, if I wanted to measure on every even CPU
on a system with 256 CPUs, the string would be 456 characters long.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250425091839.343289-1-tglozar@redhat.com
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_osnoise.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index e732c9e37e14..6819b93309ce 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -2302,7 +2302,7 @@ osnoise_cpus_read(struct file *filp, char __user *ubuf, size_t count,
  * osnoise_cpus_write - Write function for "cpus" entry
  * @filp: The active open file structure
  * @ubuf: The user buffer that contains the value to write
- * @cnt: The maximum number of bytes to write to "file"
+ * @count: The maximum number of bytes to write to "file"
  * @ppos: The current position in @file
  *
  * This function provides a write implementation for the "cpus"
@@ -2320,10 +2320,11 @@ osnoise_cpus_write(struct file *filp, const char __user *ubuf, size_t count,
 {
 	cpumask_var_t osnoise_cpumask_new;
 	int running, err;
-	char buf[256];
+	char *buf __free(kfree) = NULL;
 
-	if (count >= 256)
-		return -EINVAL;
+	buf = kmalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 
 	if (copy_from_user(buf, ubuf, count))
 		return -EFAULT;
-- 
2.47.2


