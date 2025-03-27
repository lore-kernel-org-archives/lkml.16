Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A02140E30
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090899; cv=none; b=S2CumLME63ngDc75ZkPW6/t+1NRcrvADx9+GUFZrEmMhKStBsQvF3tZKRq9DWqmoahXkoEjddAgKdpxn1SlDFuYrfHfktOD59YkCDLEXD0PoJMqCObNNOfibR4kPOwV7jl/Bjr58w1M+cTuNteuQ4YP15ls2z0RtBetw1dq3VTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090899; c=relaxed/simple;
	bh=jCxI1gIofnyjTce6fFU98rQzwFpnsQNg1T38z8p0TZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k6UP6ldxiufwsUpNoJfkRES+j5hqNFswTRCpD9Z9mx3Lv/QPjQ3oKPDRbvIW+dmaowljHemp5Bm34YntV/c72jymqUwGKWii0wNHwsSeY4JfpvIkgJTJCKutjCgP1W4WLTRXblKhWMI21I8RcYFy0RxMlRGfyR7IoTi5QQpd+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E89C4CEDD;
	Thu, 27 Mar 2025 15:54:57 +0000 (UTC)
Date: Thu, 27 Mar 2025 11:55:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH] tracing: Use _text and the kernel offset in
 last_boot_info
Message-ID: <20250327115546.21b514b0@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ring-buffer/for-next

Head SHA1: f20423262b368ff860373d28050f0c4b65e82973


Steven Rostedt (1):
      tracing: Use _text and the kernel offset in last_boot_info

----
 kernel/trace/trace.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)
---------------------------
commit f20423262b368ff860373d28050f0c4b65e82973
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Wed Mar 26 22:03:04 2025 -0400

    tracing: Use _text and the kernel offset in last_boot_info
    
    Instead of using kaslr_offset() just record the location of "_text". This
    makes it possible for user space to use either the System.map or
    /proc/kallsyms as what to map all addresses to functions with.
    
    Cc: Masami Hiramatsu <mhiramat@kernel.org>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Link: https://lore.kernel.org/20250326220304.38dbedcd@gandalf.local.home
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 7ca8a0dbd4fa..f14651ea32bd 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -51,7 +51,7 @@
 #include <linux/workqueue.h>
 #include <linux/sort.h>
 
-#include <asm/setup.h> /* COMMAND_LINE_SIZE and kaslr_offset() */
+#include <asm/setup.h> /* COMMAND_LINE_SIZE */
 
 #include "trace.h"
 #include "trace_output.h"
@@ -5995,7 +5995,7 @@ struct trace_mod_entry {
 };
 
 struct trace_scratch {
-	unsigned long		kaslr_addr;
+	unsigned long		text_addr;
 	unsigned long		nr_entries;
 	struct trace_mod_entry	entries[];
 };
@@ -6133,11 +6133,7 @@ static void update_last_data(struct trace_array *tr)
 	kfree_rcu(module_delta, rcu);
 
 	/* Set the persistent ring buffer meta data to this address */
-#ifdef CONFIG_RANDOMIZE_BASE
-	tscratch->kaslr_addr = kaslr_offset();
-#else
-	tscratch->kaslr_addr = 0;
-#endif
+	tscratch->text_addr = (unsigned long)_text;
 }
 
 /**
@@ -6996,7 +6992,7 @@ static void show_last_boot_header(struct seq_file *m, struct trace_array *tr)
 	 * should not be the same as the current boot.
 	 */
 	if (tscratch && (tr->flags & TRACE_ARRAY_FL_LAST_BOOT))
-		seq_printf(m, "%lx\t[kernel]\n", tscratch->kaslr_addr);
+		seq_printf(m, "%lx\t[kernel]\n", tscratch->text_addr);
 	else
 		seq_puts(m, "# Current\n");
 }
@@ -9461,10 +9457,8 @@ static void setup_trace_scratch(struct trace_array *tr,
 	tr->scratch = tscratch;
 	tr->scratch_size = size;
 
-#ifdef CONFIG_RANDOMIZE_BASE
-	if (tscratch->kaslr_addr)
-		tr->text_delta = kaslr_offset() - tscratch->kaslr_addr;
-#endif
+	if (tscratch->text_addr)
+		tr->text_delta = (unsigned long)_text - tscratch->text_addr;
 
 	if (struct_size(tscratch, entries, tscratch->nr_entries) > size)
 		goto reset;
