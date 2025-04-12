Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D797224AE9;
	Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744491823; cv=none; b=JHrFSOr/LktSWjFekx3xQFVocgxZhkE/oayknmIl1WxXA3whoA2h1l6vJG8kHPtXQknuz9Y92BUU6mg1Ffw727b+/MTF6ROEBWLvtMR/H29fJmNPVTZZHYL4/g21oLO8mr28yrwso/bcWrCj2/CidLZAPgYX7cyiU4oGOqqVyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744491823; c=relaxed/simple;
	bh=/7sePx7POrKj9P/1s80fgQXpzWu41bRLoFG3jSTo7ZY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=gCn9mxX0sejaCFAZRVATkrZScOkrUK4IXKnLuMphpzSUUcV162oAmkfZdDE1ieNoB9F2w+V+io5rG+G6u+KE0VkB8GftNSUcZIz45fQNM9PzCAuzUXs+jkMAHBdkSevW/va//dHQCOuCFNrT+JdnU0cHfHeK+H6VnhJwUcXyjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FABC4CEEA;
	Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u3i2I-0000000AEEM-3IYV;
	Sat, 12 Apr 2025 17:05:10 -0400
Message-ID: <20250412210510.639390059@goodmis.org>
User-Agent: quilt/0.68
Date: Sat, 12 Apr 2025 17:04:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 stable@vger.kernel.org,
 Andy Chiu <andybnac@gmail.com>
Subject: [for-linus][PATCH 3/7] ftrace: Properly merge notrace hashes
References: <20250412210446.338481957@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Andy Chiu <andybnac@gmail.com>

The global notrace hash should be jointly decided by the intersection of
each subops's notrace hash, but not the filter hash.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/20250408160258.48563-1-andybnac@gmail.com
Fixes: 5fccc7552ccb ("ftrace: Add subops logic to allow one ops to manage many")
Signed-off-by: Andy Chiu <andybnac@gmail.com>
[ fixed removing of freeing of filter_hash ]
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 1a48aedb5255..8939eeebb02e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3526,16 +3526,16 @@ int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int
 	    ftrace_hash_empty(subops->func_hash->notrace_hash)) {
 		notrace_hash = EMPTY_HASH;
 	} else {
-		size_bits = max(ops->func_hash->filter_hash->size_bits,
-				subops->func_hash->filter_hash->size_bits);
+		size_bits = max(ops->func_hash->notrace_hash->size_bits,
+				subops->func_hash->notrace_hash->size_bits);
 		notrace_hash = alloc_ftrace_hash(size_bits);
 		if (!notrace_hash) {
 			free_ftrace_hash(filter_hash);
 			return -ENOMEM;
 		}
 
-		ret = intersect_hash(&notrace_hash, ops->func_hash->filter_hash,
-				     subops->func_hash->filter_hash);
+		ret = intersect_hash(&notrace_hash, ops->func_hash->notrace_hash,
+				     subops->func_hash->notrace_hash);
 		if (ret < 0) {
 			free_ftrace_hash(filter_hash);
 			free_ftrace_hash(notrace_hash);
-- 
2.47.2


