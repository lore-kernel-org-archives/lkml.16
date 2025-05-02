Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F5224633C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197203; cv=none; b=i+FpqYr5jdWGvkibQv3/lxAeynnIwVHJvpo/+blRv8vKqiWBDTEKJ/b53Gg1W06O998pjQV3qcp1ZqiXgftyFPLAEluYCtknfaE/NgKO9NOQlr3iR7qbhKHZSQwRGU5t592TTuZYsDzKIK04/WActkLv+i2cwlrRb39iUNJo85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197203; c=relaxed/simple;
	bh=4VSTUK75e6ExlaSRDWdOhoFJqfP55CWdU0n41/kp+Gg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=LyR2JiKLiiyXH/Stad70R6uZAaw0v88mUGnG2Oux7MbtQ/mvXBQSO6XUCk6p8vVVn8Aw+v/zn3wC/bX5U14HCj5uCrRAQxDHciQrB53csHiI/kTsoEvtlopZGALxfasfVtd7IntZTt5DvDd33IcxflCETYcC8cY8qVoq39U5xSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1908C4CEEE;
	Fri,  2 May 2025 14:46:42 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uArf9-000000032v0-1qy8;
	Fri, 02 May 2025 10:46:51 -0400
Message-ID: <20250502144651.297180675@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 02 May 2025 10:46:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Colin Ian King <colin.i.king@gmail.com>
Subject: [for-linus][PATCH 2/4] ftrace: Fix NULL memory allocation check
References: <20250502144607.785079223@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Colin Ian King <colin.i.king@gmail.com>

The check for a failed memory location is incorrectly checking
the wrong level of pointer indirection by checking !filter_hash
rather than !*filter_hash.  Fix this.

Cc: asami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250422221335.89896-1-colin.i.king@gmail.com
Fixes: 0ae6b8ce200d ("ftrace: Fix accounting of subop hashes")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 61130bb34d6c..6981830c3128 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3436,7 +3436,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 
 		/* Copy the subops hash */
 		*filter_hash = alloc_and_copy_ftrace_hash(size_bits, subops_hash->filter_hash);
-		if (!filter_hash)
+		if (!*filter_hash)
 			return -ENOMEM;
 		/* Remove any notrace functions from the copy */
 		remove_hash(*filter_hash, subops_hash->notrace_hash);
-- 
2.47.2


