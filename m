Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92525219314
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829804; cv=none; b=hC7ZvvjGjGimYlW+lcC6fan0ffXw8tUo1B9B+lV0q8mwhQASvPblNEaqp/JKlYSm7RdJsSjIkPnTcDRnWtuuPhmUPQLF/gTZCXI1qqG4fVCga1XMNcmZBAKvyBJ1ibcSo+FWkMgJW9MLmr0DPncHu3fBrQsXqoysRhhQmXPotMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829804; c=relaxed/simple;
	bh=RvCEpwROrm3ebb3hmiUNpMcC9Wh4HeiUfZy9w1Of2ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ei3mDnaWavCj67MSJRd+3QpURf51rEAxpYkD0uKZXd+S2fQLj6nZMfmpYivP/clFDnqxAxzGuyQiptOA7myQYYlTN4WBPWPYYSSIzDBjlXNnEFdyA4DI8NFBUNvHtpWkkfpLQpHupeK2HmuC/S8MdDKcgM5RFo/auEc1ZvjJNjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 5B71B140B41;
	Fri, 13 Jun 2025 15:49:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id A035520016;
	Fri, 13 Jun 2025 15:49:43 +0000 (UTC)
Date: Fri, 13 Jun 2025 11:49:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL] tracing: Fixes for v6.16
Message-ID: <20250613114942.61ee3dc5@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A035520016
X-Stat-Signature: u36rwdjh6oobdowo89j9ytu95zry1gai
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+kz781oh8MP4KQiEx3amz3udQHRlBf0wY=
X-HE-Tag: 1749829783-110251
X-HE-Meta: U2FsdGVkX1/RGGFi29s6x8j8P6e7CxCBmPpoaUG7GCzKyyBsE2Wc6oaWfBTxrKhMq6KKeH01YGETjAX4C83wEtAie/3lKWGj6HKmGGoMfLsAWjnQWrG1pkcQGpXC7kIimmLhSzYi058b9T8+FdIARlkO4X1U4H1i+I6rLwF4lIdaf4RAaeBtxr2apDxFlTNShyNAITNIBpOpjCx+idqL1+/Q8gbcKcHFBCkvCNle8hmbv6yvkMb8nh1kHPP1480fGvmsDfMl4rtlCXVPUXbgi30phhvDcsoB0btNZ0YpBG/EKSVgDJhwjvP9hq62mZHJIGG60WEj/zcZ+5KXKxQsf3TVKpndlPDY



Linus,

tracing fix for 6.16:

- Do not free "head" variable in filter_free_subsystem_filters()

  The first error path jumps to "free_now" label but first frees the newly
  allocated "head" variable. But the "free_now" code checks this variable,
  and if it is not NULL, it will iterate the list. As this list variable
  was already initialized, the "free_now" code will not do anything as it
  is empty. But freeing it will cause a UAF bug. The error path should
  simply jump to the "free_now" label and leave the "head" variable alone.


Please pull the latest trace-v6.16-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.16-rc1

Tag SHA1: 3dec58ebef0af8431ecffae2b1814a11b86dbde1
Head SHA1: 8a157d8a00e815cab4432653cb50c9cedbbb4931


Steven Rostedt (1):
      tracing: Do not free "head" on error path of filter_free_subsystem_filters()

----
 kernel/trace/trace_events_filter.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
---------------------------
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index ea8b364b6818..08141f105c95 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1437,10 +1437,8 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 	INIT_LIST_HEAD(&head->list);
 
 	item = kmalloc(sizeof(*item), GFP_KERNEL);
-	if (!item) {
-		kfree(head);
+	if (!item)
 		goto free_now;
-	}
 
 	item->filter = filter;
 	list_add_tail(&item->list, &head->list);
