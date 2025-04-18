Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E522655E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001227; cv=none; b=K/3qi+A8OcupLJtxAbc+dCYzaKsCO4pWcFwYSEYz3OowhPV9oIk06JHncxLuWwwR8eL22GStuUwMyo01YaeCstRv847FwOREppHVtEvva/svTZeNTUkIjPMR39hf6N6r3frpyYMf9d/+514QL+kDp7ULI0LqcFH/n6A45xdfaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001227; c=relaxed/simple;
	bh=jf0DU+6h9rnSZB7DYtznNBJdGDCP6iBZN4msHkgK7vE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HxAoSgrn4+UAh5OTvEOLBNDRUcoffJvR2iHABVkdc3oBR669fZAlRjir5WDgJBLxZWdQCirrMVXul2Ffql6deMe8JtQQjAedilQ6VeBSiQMdNjM6czqlhZfSlpwP9EDph/nOUZqsW9E2vIRDv7ylG857YOWmf/pm1VE0REVMUqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C737DC4CEED;
	Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYi-0000000Db8g-3KMX;
	Fri, 18 Apr 2025 14:35:28 -0400
Message-ID: <20250418183528.642049027@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Menglong Dong <dongml2@chinatelecom.cn>
Subject: [for-linus][PATCH 4/7] ftrace: fix incorrect hash size in register_ftrace_direct()
References: <20250418183446.383784216@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Menglong Dong <menglong8.dong@gmail.com>

The maximum of the ftrace hash bits is made fls(32) in
register_ftrace_direct(), which seems illogical. So, we fix it by making
the max hash bits FTRACE_HASH_MAX_BITS instead.

Link: https://lore.kernel.org/20250413014444.36724-1-dongml2@chinatelecom.cn
Fixes: d05cb470663a ("ftrace: Fix modification of direct_function hash while in use")
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 41dcfcf8b40a..61130bb34d6c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5964,9 +5964,10 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	/* Make a copy hash to place the new and the old entries in */
 	size = hash->count + direct_functions->count;
-	if (size > 32)
-		size = 32;
-	new_hash = alloc_ftrace_hash(fls(size));
+	size = fls(size);
+	if (size > FTRACE_HASH_MAX_BITS)
+		size = FTRACE_HASH_MAX_BITS;
+	new_hash = alloc_ftrace_hash(size);
 	if (!new_hash)
 		goto out_unlock;
 
-- 
2.47.2


