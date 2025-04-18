Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13308225A40
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001227; cv=none; b=Cg4d+D+h2QOLoKR9H+T/E4BLqYqIO/H2oERtPsm873MiYC5TwrNHr5FwW1cpQwCB2CwKS7ARJi54AMMADVvy0BGv2IR7aFFgQlVbUnVJDqzm1Ilqa/IclzcEB86uxF0NkRp4DeKoYt/YvsTda8AZ5LWZjyic3y77fMtdphff/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001227; c=relaxed/simple;
	bh=uhtNNEK3AzOJ+nkTlNvjXHmDg+41VU+N5ya7K2e9R9Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=biDQ4BIJjQzDFSkPFl5te6u1TFRyJjUd6iGlE3j0xRdG65g2YgNhELB3G1WE/BK1o086ixCP/lrekzD8ftV8HHVGFOmCYG4Zfyggg2O1Z/Wdz1Xtt7IahdXzkP89ZVpK0iuoou2QLWw/zMxCAAqbYj8GuUt6t07/BvEbjuF++ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C5FC4CEF0;
	Fri, 18 Apr 2025 18:33:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYi-0000000Db8C-2bP4;
	Fri, 18 Apr 2025 14:35:28 -0400
Message-ID: <20250418183528.469164383@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 3/7] ftrace: Free ftrace hashes after they are replaced in the subops code
References: <20250418183446.383784216@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The subops processing creates new hashes when adding and removing subops.
There were some places that the old hashes that were replaced were not
freed and this caused some memory leaks.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250417135939.245b128d@gandalf.local.home
Fixes: 0ae6b8ce200d ("ftrace: Fix accounting of subop hashes")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index d0e4a902bb40..41dcfcf8b40a 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3609,6 +3609,9 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
 			}
 		}
 
+		free_ftrace_hash(temp_hash.filter_hash);
+		free_ftrace_hash(temp_hash.notrace_hash);
+
 		temp_hash.filter_hash = *filter_hash;
 		temp_hash.notrace_hash = *notrace_hash;
 	}
@@ -3703,8 +3706,11 @@ static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 	}
 
 	ret = rebuild_hashes(&filter_hash, &notrace_hash, ops);
-	if (!ret)
+	if (!ret) {
 		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
+		free_ftrace_hash(filter_hash);
+		free_ftrace_hash(notrace_hash);
+	}
 
 	if (ret) {
 		/* Put back the original hash */
-- 
2.47.2


