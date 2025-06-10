Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1E246761
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585835; cv=none; b=pVhIl+gjLMpbrqddaScw6JI5jdeHpQBeJnaj8FY/y4U8uDvwQ0Y64qOGRT5ox0vVuVgcpR7NO4oCAxrpB2znQDdARXfiifeV9Tb0T32W2E7MM1T/LswPqXQd5EimR8fn82EJ874ifDbO+3ZyjGVt9hLGlqfrB0MDD0smo/5v/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585835; c=relaxed/simple;
	bh=BHQ1cxkHMBlurx28SDKq+1wlzSkDpAGSR6Bm/QCfYmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Akz6Cxi+APUaudMoKc75Tskf2c2v1OVkkJcXZ0hkC0Wisfhpdhp3rIVpmw+iug0syBBfoIPidS1o8FtqhOQ0w19l1u6haeUancjD2NdUooD7YnzsxxBvmBr5mn1hVb+U1v2q2fC3weYEfY+t5Nr2it7AYluQe2yRZu+qi2Xc2O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 8F69E120F01;
	Tue, 10 Jun 2025 20:03:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id C887F2002B;
	Tue, 10 Jun 2025 20:03:49 +0000 (UTC)
Date: Tue, 10 Jun 2025 16:05:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [for-linus][PATCH] tracing: Do not free "head" on error path of
 filter_free_subsystem_filters()
Message-ID: <20250610160520.09368df2@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C887F2002B
X-Stat-Signature: 9bg6s6ws9z3ju1no94ctkmq7zhabgsgr
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19rYp7i4w59CAh6gBETZdxV9pI8PCk+lZc=
X-HE-Tag: 1749585829-692791
X-HE-Meta: U2FsdGVkX1/aDMdE0KTx4C0aDwVvHZ6RApQNe54al5CcYd1IO7dBoK7G/12Q8CCN8YbCujXME4d3fNBpfVCZXvudwjHDSF0bwHSNmOLbGR1qh25kllg0bXN4GL26rzombZ1IDLE8XBwrxj0RyMGUzaJIyw+TsxBo3KPfydgE7dqX3CifjlZ+aHvS/qkzcGWQ+UmK/YGcNwFeO7X/5VV/tz/n2UwiK5Z2xu+xa6mkdCKiwOiteSivbDU/pwDTEqyCIhrNuyinQo1hEI20vVeKaiRHK1omVSgCVsAh19qKMOrtT0TDzbA3tH28uFLx3JEGXhNKWBEr2ZRRWP5cPjSn+bFtk817sxQF5iyuIs0xgXOpKZIV8iBaWvAFEWfkllhMtAasrrv5IGuUS1g8Xm8Ez965XGB7JgnF3TtBFgyH4pDaG2PZtVFdFlKt8Bx+1ulNczlE2EeD7N/mGQFDU5CWb67or+yniztNc0o6SgavyNAhd1kT2T8ifoT1sfUzeomoMNkjwQdDYnXsdzh7csLBuPGQ7DoaG4EF1P93MrZv7kJhiZlwiOu63GAvlTS4qEmU


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 8a157d8a00e815cab4432653cb50c9cedbbb4931


Steven Rostedt (1):
      tracing: Do not free "head" on error path of filter_free_subsystem_filters()

----
 kernel/trace/trace_events_filter.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
---------------------------
commit 8a157d8a00e815cab4432653cb50c9cedbbb4931
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Tue Jun 10 09:33:48 2025 -0400

    tracing: Do not free "head" on error path of filter_free_subsystem_filters()
    
    The variable "head" is allocated and initialized as a list before
    allocating the first "item" for the list. If the allocation of "item"
    fails, it frees "head" and then jumps to the label "free_now" which will
    process head and free it.
    
    This will cause a UAF of "head", and it doesn't need to free it before
    jumping to the "free_now" label as that code will free it.
    
    Cc: Masami Hiramatsu <mhiramat@kernel.org>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Link: https://lore.kernel.org/20250610093348.33c5643a@gandalf.local.home
    Fixes: a9d0aab5eb33 ("tracing: Fix regression of filter waiting a long time on RCU synchronization")
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/r/202506070424.lCiNreTI-lkp@intel.com/
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

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
