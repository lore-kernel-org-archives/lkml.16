Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6510215F48
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001226; cv=none; b=rP461nh2QzoisnJ4IvVOBXsX3v0Xsot+BGjlBdwIe3dmyC8w/g9RyhOcqEHf45d+Y2vgdikvzUKvy+QaF88qDz9cGWQdNDqS2o5E+cGBzOFHiFBwYk2Pkgai8T/Oz5NTI7Nmx2HQd45rxvuJXers8Q6bWI/GBUME0VamOilMoAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001226; c=relaxed/simple;
	bh=EBaTiX+dfxsPN83en/R/JsxwKPbYDZy60fWfphErIg8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BHNDjuaR4WA+jX0QhT3r5y5Kl5ASeFV4eGk8WlEeTzBEXH0tIb3P30Blag08BTrvpEkn1j5YCco5aH4cyyR3/m0Zxk1fSWqLqMCtWqaYaqUFiWYZkPO1p/SIHWiefvdMRrkcGloR1+fj+OhiBvnw2c/bIqc6G/kSEdFxeyvexWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66953C4CEEE;
	Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYi-0000000Db7i-1sTw;
	Fri, 18 Apr 2025 14:35:28 -0400
Message-ID: <20250418183528.298934811@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 2/7] ftrace: Reinitialize hash to EMPTY_HASH after freeing
References: <20250418183446.383784216@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

There's several locations that free a ftrace hash pointer but may be
referenced again. Reset them to EMPTY_HASH so that a u-a-f bug doesn't
happen.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250417110933.20ab718b@gandalf.local.home
Fixes: 0ae6b8ce200d ("ftrace: Fix accounting of subop hashes")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 43394445390c..d0e4a902bb40 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1297,6 +1297,8 @@ void ftrace_free_filter(struct ftrace_ops *ops)
 		return;
 	free_ftrace_hash(ops->func_hash->filter_hash);
 	free_ftrace_hash(ops->func_hash->notrace_hash);
+	ops->func_hash->filter_hash = EMPTY_HASH;
+	ops->func_hash->notrace_hash = EMPTY_HASH;
 }
 EXPORT_SYMBOL_GPL(ftrace_free_filter);
 
@@ -3443,6 +3445,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 				  size_bits);
 		if (ret < 0) {
 			free_ftrace_hash(*filter_hash);
+			*filter_hash = EMPTY_HASH;
 			return ret;
 		}
 	}
@@ -3472,6 +3475,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 				     subops_hash->notrace_hash);
 		if (ret < 0) {
 			free_ftrace_hash(*notrace_hash);
+			*notrace_hash = EMPTY_HASH;
 			return ret;
 		}
 	}
-- 
2.47.2


