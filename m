Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7D293B67
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=XLePEXLEGrJSSrnv7/kkWvwU9Q6h6Z7Q6CEvKfX2magvupnztHogj5zZnQQfxhdUDlf+547p2uCaIxT515F6Fag/XMgo8wBD/uhckCAHWwZZPvj3j2RRPtH/XHMd2hej8Y08u0OwS+5AO/BHAKrJLE7kpd9a0xhCQRrilSaVMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=O9kf3HWu7xRO07iMKHCpcIKY+YPtXFMQK7uZxXvdRdA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MpN1sq3Ap4pYWmrNitN4QGDTU8qI6UkILnojK4crtcsi38cP74+XN3FSGXExNV8BPuObG5tmEkIB/E/EPxxn3PkkVfbLeSDb6Fk57T2Oc99uxDxvPYd3Y2iWDutwjZex7FVfSZKGqJeELeb0qF+87wtqJ/qETUSLFhyYF5kbf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E168C4CEEB;
	Fri,  9 May 2025 13:13:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXR-00000002c0I-3W9W;
	Fri, 09 May 2025 09:13:17 -0400
Message-ID: <20250509131317.688383909@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 25/31] tracing: Remove unused buffer_page field from trace_array_cpu
 structure
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The trace_array_cpu had a "buffer_page" field that was originally going to
be used as a backup page for the ring buffer. But the ring buffer has its
own way of reusing pages and this field was never used.

Remove it.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212236.738849456@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 188032d4ab69..4e67ee92e05c 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -184,7 +184,6 @@ struct trace_array;
  */
 struct trace_array_cpu {
 	local_t			disabled;
-	void			*buffer_page;	/* ring buffer spare */
 
 	unsigned long		entries;
 	unsigned long		saved_latency;
-- 
2.47.2


