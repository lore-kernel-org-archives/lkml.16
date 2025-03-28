Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9C1A0BF1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196780; cv=none; b=l1BkdRyH08hG2HZseps0B+saQMmY3653UTgshFJH3PQvpHm3BCXyE3eTn48XPO/FqB3/3hC7Fb5fZrWsD97U3YpWuwYNbkr0IxmZ6l74Flg+viAv8wnPIbcfUJL5hwwzDEoXzVwh74xfRQ5MNnaZw21k37gTdc30Qmy4SzXjYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196780; c=relaxed/simple;
	bh=s5btmg4so1djPIgLxWaq+A1cA7iuSJ3YgSJla80Zv8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CZyYJmfRH2onUTC8mtGz5nKb9URpRzHTTXk/bDcg/Y0wjCgY8DQGh3sS7APaiChg6pwSLNlGfHxm6xZDY4gGTMZlKsTFUyxdYCjzO9Oz3AdGDO2mP41CVjV4zVyPn8mlsuHcIqyQsuIL2PuZEtZR/EqUCgsMM4W4rKQLOkqy0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618D9C4CEE4;
	Fri, 28 Mar 2025 21:19:39 +0000 (UTC)
Date: Fri, 28 Mar 2025 17:20:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: [GIT PULL v3] latency tracing: Documentation fix for previous pull
 request
Message-ID: <20250328172030.286d5a47@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

It was reported that there was a documentation issue with the latency tree
just after I sent the pull request. It was fixed and I replied that there
was an update, but the original one was pulled instead. I probably should
have deleted the older tag, which would have made it obvious that there was
a never version.

Anyway, this is the commit that was suppose to be added, with a new change
log:

Documentation fix for runtime verifier

The runtime verifier documents that were created were not referenced
in the indices, which caused warning when building the documentation
tree. Those documents are now added to the rv indices.


Please pull the latest trace-latency-v6.15-3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-latency-v6.15-3

Tag SHA1: cc878e7c98d50f2525ae669e1e5bad70478532ae
Head SHA1: 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b


Gabriele Monaco (1):
      Documentation/rv: Add sched pages to the indices

----
 Documentation/tools/rv/index.rst | 1 +
 Documentation/trace/rv/index.rst | 1 +
 2 files changed, 2 insertions(+)
---------------------------
commit 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b
Author: Gabriele Monaco <gmonaco@redhat.com>
Date:   Thu Mar 27 09:12:40 2025 +0100

    Documentation/rv: Add sched pages to the indices
    
    The pages Documentation/tools/rv/rv-mon-sched.rst and
    Documentation/trace/rv/monitor_sched.rst were introduced but not
    included in any index.
    
    Add them to the respective indices.
    
    Cc: Jonathan Corbet <corbet@lwn.net>
    Link: https://lore.kernel.org/20250327081240.46422-1-gmonaco@redhat.com
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Fixes: 03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")
    Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/Documentation/tools/rv/index.rst b/Documentation/tools/rv/index.rst
index 8fd16d91d639..64ba2efe2e85 100644
--- a/Documentation/tools/rv/index.rst
+++ b/Documentation/tools/rv/index.rst
@@ -15,6 +15,7 @@ Runtime verification (rv) tool
    rv-mon
    rv-mon-wip
    rv-mon-wwnr
+   rv-mon-sched
 
 .. only::  subproject and html
 
diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 15fa966102c0..e80e0057feb4 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -12,3 +12,4 @@ Runtime Verification
    da_monitor_instrumentation.rst
    monitor_wip.rst
    monitor_wwnr.rst
+   monitor_sched.rst
