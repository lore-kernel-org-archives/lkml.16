Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D755E69
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751118224; cv=none; b=J1GSsCZg9ZXZi2fLu3zWSaA6EPMmJ8g2u9KG2tQMbVekeq22ppTa7v+NYi15FXkejVm61TqU5zG7P1DHeyg7kp9htfAkYvO7UOa+h7Kkrfy4nlwQzEQJ5mKOiDUTx13XtPfjdEitC6qxqvzulohs0YuwJlf+/ba6fnVgSQZxHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751118224; c=relaxed/simple;
	bh=2IVJ2u0/N/KF+rUKA9KPUGiuhrpejuY4G8YWOquji4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aj+cqd9Ou0GlNljObYcEY1Sqq40Y8VM/glDvZ4KgMZq9QcA6r/aJpVkNmrx1wtrty2RaV9ZwOGJl1D4BueMWP+uUdLTXHa+gdgGkxD1/XitMbXeRk1VC7tlHEfhTY/lx4f7UbxclwVtkCc6FcYAGAtCciQc3pMCgV0DtxFi3KvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id E0AD91D7235;
	Sat, 28 Jun 2025 13:43:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 5A91F2002E;
	Sat, 28 Jun 2025 13:43:33 +0000 (UTC)
Date: Sat, 28 Jun 2025 09:43:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Edward Adam Davis <eadavis@qq.com>
Subject: [for-linus][PATCH] tracing: Fix filter logic error
Message-ID: <20250628094332.170bb906@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: n6ywe5u3chgtbr1ug7ur83to64mqdqj7
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 5A91F2002E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19aHdE/CbvbfQ1zL03gges3xooMphwx3Bw=
X-HE-Tag: 1751118213-638324
X-HE-Meta: U2FsdGVkX18S3ibLDsccXPq4kvoiiFhgJxXH245Z1RrDuhNA70pAZorA/gO0bj+Ca7cOtk5VjYYTVSz9DecVM1HZ2dRV8ztROEPEKVS7jBLEPXdthn4Oxur7lXSHbPauom+3GMw9ojTHiKAkzCV3u+0U9R/RFlkYad0I1RcLGOjRuQkzoLUam2QVD0hfOEWs8c62ZrGVkT+rmbEM/TxR8kAsyOq+CXNV6yiirPsuobfgk5L0AIFCfG9lDgOGz4yc8IRqaKEzokb9ffvV2+G8ZwY9VsK7jnGwNX2cyePYchrRc8BBy0BHTUodA3LgEOJvxjIrShm0jwmQVZBbYvYwRoG5uaiaZ7LcUHshkTEzNJfBjxyY7SPjsURbxR9sHYdCpMvnzq0XqN7IfceYX7cOnEsgFcmXgZ4eCXxVeTAHMGAycvMvn0ukYnSsLl4zWcDeXiv/PSrSEE+4TE0AJdKkCsubulvBk+pgqoCU882lKBFitAfa71515lKLCV5vsTVNlOz/sUS25spXUaAa4GkLU/wSPO1+NVmFlp6kzM2plVE=


tracing fixes for v6.16:

- Fix possible UAF on error path in filter_free_subsystem_filters()

  When freeing a subsystem filter, the filter for the subsystem is passed in
  to be freed and all the events within the subsystem will have their filter
  freed too. In order to free without waiting for RCU synchronization, list
  items are allocated to hold what is going to be freed to free it via a
  call_rcu(). If the allocation of these items fails, it will call the
  synchronization directly and free after that (causing a bit of delay for
  the user).

  The subsystem filter is first added to this list and then the filters for
  all the events under the subsystem. The bug is if one of the allocations
  of the list items for the event filters fail to allocate, it jumps to the
  "free_now" label which will free the subsystem filter, then all the items
  on the allocated list, and then the event filters that were not added to
  the list yet. But because the subsystem filter was added first, it gets
  freed twice.

  The solution is to add the subsystem filter after the events, and then if
  any of the allocations fail it will not try to free any of them twice.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 6921d1e07cb5eddec830801087b419194fde0803


Edward Adam Davis (1):
      tracing: Fix filter logic error

----
 kernel/trace/trace_events_filter.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---------------------------
commit 6921d1e07cb5eddec830801087b419194fde0803
Author: Edward Adam Davis <eadavis@qq.com>
Date:   Tue Jun 24 14:38:46 2025 +0800

    tracing: Fix filter logic error
    
    If the processing of the tr->events loop fails, the filter that has been
    added to filter_head will be released twice in free_filter_list(&head->rcu)
    and __free_filter(filter).
    
    After adding the filter of tr->events, add the filter to the filter_head
    process to avoid triggering uaf.
    
    Link: https://lore.kernel.org/tencent_4EF87A626D702F816CD0951CE956EC32CD0A@qq.com
    Fixes: a9d0aab5eb33 ("tracing: Fix regression of filter waiting a long time on RCU synchronization")
    Reported-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=daba72c4af9915e9c894
    Tested-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com
    Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
    Signed-off-by: Edward Adam Davis <eadavis@qq.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 08141f105c95..3885aadc434d 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1436,13 +1436,6 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 
 	INIT_LIST_HEAD(&head->list);
 
-	item = kmalloc(sizeof(*item), GFP_KERNEL);
-	if (!item)
-		goto free_now;
-
-	item->filter = filter;
-	list_add_tail(&item->list, &head->list);
-
 	list_for_each_entry(file, &tr->events, list) {
 		if (file->system != dir)
 			continue;
@@ -1454,6 +1447,13 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 		event_clear_filter(file);
 	}
 
+	item = kmalloc(sizeof(*item), GFP_KERNEL);
+	if (!item)
+		goto free_now;
+
+	item->filter = filter;
+	list_add_tail(&item->list, &head->list);
+
 	delay_free_filter(head);
 	return;
  free_now:
