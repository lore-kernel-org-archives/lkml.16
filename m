Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F4291885
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796378; cv=none; b=qz+Y2k065HvatpvojYKwt5NyH/fOJFJbc44HBllqrWy8eitvEz3DiMVg/HtLYcZMjspQDNvAXvoI7itvLy0k+lHvjURvR7BlXMV3IQ1s5Q1cFeDFjxcxaOff7hT/6yIYAflMBxwPAO3cK9Su8lHLIYtH5KX10C+rpOpYj7/m/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796378; c=relaxed/simple;
	bh=80eGUuMKueuJ/ihAj2jSJbQh90YSw31csO4ocx/C2xQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lojJuDq+FiX7sZyE6XpUruhFJeZAJ2ZXrcDxNpfA4T9FjjdLVpBbZTqzyB+EOem+rYbj5KvD+lqqJvWmp6ZnWol5NkfI9eL9kxjHqRfbZXrfRIDRACYTF4/n4m+ajUKpT7whm9+P+yvWpRf4pbNsXxX119KGcyCCmaIVQLE3Oj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E106C4CEF0;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXN-00000002bom-3pDT;
	Fri, 09 May 2025 09:13:13 -0400
Message-ID: <20250509131313.761474477@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 02/31] tracing: Show function names when possible when listing fields
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

When the "fields" option is enabled, the "print fmt" of the trace event is
ignored and only the fields are printed. But some fields contain function
pointers. Instead of just showing the hex value in this case, show the
function name when possible:

Instead of having:

 # echo 1 > options/fields
 # cat trace
 [..]
  kmem_cache_free: call_site=0xffffffffa9afcf31 (-1448095951) ptr=0xffff888124452910 (-131386736039664) name=kmemleak_object

Have it output:

  kmem_cache_free: call_site=rcu_do_batch+0x3d1/0x14a0 (-1768960207) ptr=0xffff888132ea5ed0 (854220496) name=kmemleak_object

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250325213919.624181915@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_output.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index aab6816f0249..73037efdb45f 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1015,14 +1015,24 @@ static void print_fields(struct trace_iterator *iter, struct trace_event_call *c
 					break;
 				}
 
-				trace_seq_printf(&iter->seq, "0x%x (%d)",
-						 *(unsigned int *)pos,
-						 *(unsigned int *)pos);
+				if (sizeof(long) == 4)
+					trace_seq_printf(&iter->seq, "%pS (%d)",
+							 *(void **)pos,
+							 *(unsigned int *)pos);
+				else
+					trace_seq_printf(&iter->seq, "0x%x (%d)",
+							 *(unsigned int *)pos,
+							 *(unsigned int *)pos);
 				break;
 			case 8:
-				trace_seq_printf(&iter->seq, "0x%llx (%lld)",
-						 *(unsigned long long *)pos,
-						 *(unsigned long long *)pos);
+				if (sizeof(long) == 8)
+					trace_seq_printf(&iter->seq, "%pS (%lld)",
+							 *(void **)pos,
+							 *(unsigned long long *)pos);
+				else
+					trace_seq_printf(&iter->seq, "0x%llx (%lld)",
+							 *(unsigned long long *)pos,
+							 *(unsigned long long *)pos);
 				break;
 			default:
 				trace_seq_puts(&iter->seq, "<INVALID-SIZE>");
-- 
2.47.2


