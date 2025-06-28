Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B5A19CCFC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751118594; cv=none; b=CHBSOOMPYK28hzqW4GtILm8RVQY37i4rNwxOvIhugr1YpaWGq+e3SvXH4283LUwIYC6+MQNWuLO6qjc6/AoVKr6Tgrd05Ua3Xd2hVFM+oTQ8wtIhZZBOJz9qaOqOK12v2SzMWwmjI53AJQTPSRSLjc7KbNJ3i18S+7AzjZNjQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751118594; c=relaxed/simple;
	bh=fSvO1M9MezBgM/md1SG05e2kzGPFHIvZAWZohJrby2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pFqQK8gNnqQluEjpY9Dwiw/f7TSuwL1Dh3INDyyBkihETwnVHb/0SeFhO7rhos2mSf4AH6qQEZwUFQFBVT9JHYeNDwgTVze/uIiFKi71/yRb7GMBJC4cxf1bAlzntifZnyggHZANM/7bEaNGPZd/7w1uWUYvnc1/DRWT3hZfyYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id AD1B959BDC;
	Sat, 28 Jun 2025 13:49:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 9EC446000C;
	Sat, 28 Jun 2025 13:49:48 +0000 (UTC)
Date: Sat, 28 Jun 2025 09:49:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Edward Adam Davis <eadavis@qq.com>
Subject: [GIT  PULL] tracing: Fixes for v6.16
Message-ID: <20250628094947.6d5d88cc@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9t1eojuts6broz4ywmjm4yk7yy11hkyo
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9EC446000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18GBzKXorw3nDj249daPpkxPQbJUwk6uCo=
X-HE-Tag: 1751118588-757600
X-HE-Meta: U2FsdGVkX1+aWVxb4Sy0jdaHIAX2OPAQvp3pCVU4JFwgnCyM7ywelRy3kCSgwK+p/LVi1dE8NsgXSWtvkpznh5lrCkvalm8/F+Yox471PQBi07S8aAGDooqmJENwWUNLX6sOJT/IP3SQAJ7oaXj3CTmk4nQchvW4Wkzy6r5F2D75oCrt1i45ZbJ4FkpjGka9i7uYbNiTB0/kcuIimjHBsiu+DS0lGwziFF0Qd1CODtDYvbE+K196CUT/1NRjjNUiZ2wnhJ5WCla04FiL/ycA/ydjNVMOe5/lsZi2kGSV2ST8vi+JMya0RhNhG0zokkpT+QW2Uh2LQFqOJc3CR5xCxQzmf+ZTABPgMwDzF7phquZRBadPMqxi4AaydDkfpmgliExukr0yMnVDt9iD5C96Sw+4zII2MCYgVi3JZpuGZsZbmWKHyCQkr6bsexVFg1DaIaQN48lIJfW0jUnqbVeCrCt1Ix9FJwt/fMZ+Es/sJrrF5lMcwwep6qgdthpgmkVHNtuRBkUH1WsbShGkEMhRCIvPVjRbRDQWzxAaXRItzZY=


Linus,

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
  any of the allocations fail it will not try to free any of them twice


Please pull the latest trace-v6.16-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.16-rc3

Tag SHA1: 361daeb581d92db7327cbdb0b00bce50057101f8
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
