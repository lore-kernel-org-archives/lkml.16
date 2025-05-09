Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14A2949E9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=DZ+IgxbBuQCQajBB7mBLfCPBPnjLn7Twl28X1auXDjsRZgB5yebBZBW8lfBHNOsO1VTvCU8HR0wPWl2P4npLkfJaywvi7CQE+yxPmCCuS/fAQGUscVkNhrBgFPjkwIcon+NMfwswLuzeFfJNkRX+49vGEEapThrgoCEnFYxdQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=EeVzafSY4XTLi4pqdsQZL2xG9bFvwuL8mqOrFuJJ6VI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=G7/IcwlEBzeu8+j8hx0VGlssbbwa0Ejv+XXfewr7Natl5q4bd7y4q7d7QHtS92Mc9Se3mIsz6/xRWfxWrkWc3DhEuCQMpVh78MKUoemqZZc8cgA1MqQi+IIWJu9Cm33IAOi8YysM6guLTX6lfGIlTTbDKFskHZnHx7alXQjAIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF47C4CEE4;
	Fri,  9 May 2025 13:13:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXS-00000002c0n-01iI;
	Fri, 09 May 2025 09:13:18 -0400
Message-ID: <20250509131317.861075722@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Devaansh Kumar <devaanshk840@gmail.com>
Subject: [for-next][PATCH 26/31] tracing: Replace deprecated strncpy() with strscpy() for
 stack_trace_filter_buf
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Devaansh Kumar <devaanshk840@gmail.com>

strncpy() is deprecated for NUL-terminated destination buffers and must
be replaced by strscpy().

See issue: https://github.com/KSPP/linux/issues/90

Link: https://lore.kernel.org/20250507133837.19640-1-devaanshk840@gmail.com
Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_stack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 14c6f272c4d8..4c349db381cb 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -542,7 +542,7 @@ static __init int enable_stacktrace(char *str)
 	int len;
 
 	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+		strscpy(stack_trace_filter_buf, str + len);
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.47.2


