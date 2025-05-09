Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5C292092
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796380; cv=none; b=W9F7PBGbQUbTv9fTYUFE/6E6VBb/dqYQNMI45dlI6H0PnH7ftHS7guSRd1Romv8bjRW/vjPA9QF6xEFbXFsjOcxfhDCWSFoD+PuJ1ZQDsjbkac4eLUl7zgxrk8w8XEGwcKG2rwOJlWBDOXrsEIhZ2bwx8lvL3oQ7RAZYnQdhLAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796380; c=relaxed/simple;
	bh=wJ9ipE6e2LkBVZBuk9cIGc5UX7gHXqIZ5mEVNHd9v7s=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rIFm3VqVDRn8qKzPgeI29NFYJAr69ubi8RTio9vlm9eNyWO1PfDnHdSm5yhIynNmJtBsGe/zRuXy2it9XqbcOOtrCMlEVd3KquGDbWPeXgwJAYpuEsJJehef2TCjqwWk4FGzDtgKvM4yFRVAHBQfLho3JoCzF4eI+DNKdjYArfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D3EC4CEF1;
	Fri,  9 May 2025 13:12:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXP-00000002btH-1q1L;
	Fri, 09 May 2025 09:13:15 -0400
Message-ID: <20250509131315.289970442@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 11/31] ftrace: Comment that ftrace_func_mapper is freed with
 free_ftrace_hash()
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The structure ftrace_func_mapper only contains a single field and that is
a ftrace_hash. It is used to abstract it out from a normal hash to control
users of how it gets modified.

The freeing of a ftrace_func_mapper structure is:

  free_ftrace_hash(&mapper->hash);

Without context, this looks like a bug. It should be commented that it is
not a bug and it is freed this way.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/20250416165420.5c717420@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 014cd2cedae3..1af952cba48d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5208,8 +5208,12 @@ struct ftrace_func_map {
 	void				*data;
 };
 
+/*
+ * Note, ftrace_func_mapper is freed by free_ftrace_hash(&mapper->hash).
+ * The hash field must be the first field.
+ */
 struct ftrace_func_mapper {
-	struct ftrace_hash		hash;
+	struct ftrace_hash		hash;	/* Must be first! */
 };
 
 /**
@@ -5344,6 +5348,7 @@ void free_ftrace_func_mapper(struct ftrace_func_mapper *mapper,
 			}
 		}
 	}
+	/* This also frees the mapper itself */
 	free_ftrace_hash(&mapper->hash);
 }
 
-- 
2.47.2


