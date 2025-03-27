Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B76383
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034060; cv=none; b=cjuT8Z3wkQ3rr7t7//PHJd6iNLG1a4kNVlMF31pC6+UdmtRAAbuuwUC99KOYNT+WgT290itTVDdX25qhoExd1/PXQJa6EZ+6fk66jjT+E1nLCZvRmLgSdTVQB0xdCX+lO3Ql2PGjUcQaiUY9dPKJmawoPtXFLW9Ys0RbwpBVRP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034060; c=relaxed/simple;
	bh=8Q9f9qqW4PgE8fV9DUYaT9qf7eH8WzntnWhy53wu+/0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=pfYiJNUF0kpQMWrtnQQZrrT6cF/0xKl3NueBhsqpLfNm85ud+p1vuzEp4Oo8usCW1etUri6RDBidCZPgkCZishk0V7eZKEPFz0S9n42R1n9A8rdjth9jS9CkxU2WcBUQrI3LMT3PX+CSWosPmR5MP5PtW2XDlrt4281c8SvIlLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E5AC4CEEB;
	Thu, 27 Mar 2025 00:07:40 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1txanM-00000002uzO-1E73;
	Wed, 26 Mar 2025 20:08:28 -0400
Message-ID: <20250327000828.145418880@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 26 Mar 2025 20:08:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Siddarth G <siddarthsgml@gmail.com>
Subject: [for-next][PATCH 2/2] tracing: Replace strncpy with memcpy for fixed-length substring copy
References: <20250327000811.879041980@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Siddarth G <siddarthsgml@gmail.com>

checkpatch.pl reports the following warning:
WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy
(see: https://github.com/KSPP/linux/issues/90)

In synth_field_string_size(), replace strncpy() with memcpy() to copy 'len'
characters from 'start' to 'buf'. The code manually adds a NUL terminator
after the copy, making memcpy safe here.

Link: https://lore.kernel.org/20250325181232.38284-1-siddarthsgml@gmail.com
Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events_synth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
index 6d592cbc38e4..969f48742d72 100644
--- a/kernel/trace/trace_events_synth.c
+++ b/kernel/trace/trace_events_synth.c
@@ -207,7 +207,7 @@ static int synth_field_string_size(char *type)
 	if (len == 0)
 		return 0; /* variable-length string */
 
-	strncpy(buf, start, len);
+	memcpy(buf, start, len);
 	buf[len] = '\0';
 
 	err = kstrtouint(buf, 0, &size);
-- 
2.47.2


