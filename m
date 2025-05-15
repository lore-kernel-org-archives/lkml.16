Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E9296725
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299058; cv=none; b=n/PuNUkEWvCBex3Wem/OFVlgQdh85hnTarNemBksvKx2FN+bVAaE8Et6gQHVFGmNzCKaa4fCq503jywiSNkrs33zODTowzsVilKEyNIjwuK3gwYPcC3jB618rbNbgWE0SJLwrahmjT/+qeDQpxc1DEDc/HsTZveLshfAZ8om84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299058; c=relaxed/simple;
	bh=3KvYVQA/G6RjGW/wcg6G38bPG9+xfSCTrZaKaWFuz4w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=hFTe0B2IBfODcmaQqqRoY/8kXTAncNPQ+QkmGJuOEuObCfAifRJCHo37EV/j9NdqvsmAg6rgrY5TP0xjUJ8Zg3cShoeriJdtYW10p0+p1RMuZOkgixA9nOSygxVwUOchE45PQBbruQ3N2EYeVnHw8bKjmMCvIjDi6U0Q5TiSh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC70C4CEF5;
	Thu, 15 May 2025 08:50:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uFUJL-00000005Xbg-2q29;
	Thu, 15 May 2025 04:51:27 -0400
Message-ID: <20250515085127.524121555@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 15 May 2025 04:51:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 4/4] tracing: Record trace_clock and recover when reboot
References: <20250515085109.352233527@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Record trace_clock information in the trace_scratch area and recover
the trace_clock when boot, so that reader can docode the timestamp
correctly.
Note that since most trace_clocks records the timestamp in nano-
seconds, this is not a bug. But some trace_clock, like counter and
tsc will record the counter value. Only for those trace_clock user
needs this information.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/174720625803.1925039.1815089037443798944.stgit@mhiramat.tok.corp.google.com
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index cf51c30b137f..2c1764ed87b0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6066,6 +6066,7 @@ struct trace_mod_entry {
 };
 
 struct trace_scratch {
+	unsigned int		clock_id;
 	unsigned long		text_addr;
 	unsigned long		nr_entries;
 	struct trace_mod_entry	entries[];
@@ -6181,6 +6182,7 @@ static void update_last_data(struct trace_array *tr)
 	if (tr->scratch) {
 		struct trace_scratch *tscratch = tr->scratch;
 
+		tscratch->clock_id = tr->clock_id;
 		memset(tscratch->entries, 0,
 		       flex_array_size(tscratch, entries, tscratch->nr_entries));
 		tscratch->nr_entries = 0;
@@ -7403,6 +7405,12 @@ int tracing_set_clock(struct trace_array *tr, const char *clockstr)
 	tracing_reset_online_cpus(&tr->max_buffer);
 #endif
 
+	if (tr->scratch && !(tr->flags & TRACE_ARRAY_FL_LAST_BOOT)) {
+		struct trace_scratch *tscratch = tr->scratch;
+
+		tscratch->clock_id = i;
+	}
+
 	mutex_unlock(&trace_types_lock);
 
 	return 0;
@@ -9628,6 +9636,15 @@ static void setup_trace_scratch(struct trace_array *tr,
 
 	/* Scan modules to make text delta for modules. */
 	module_for_each_mod(make_mod_delta, tr);
+
+	/* Set trace_clock as the same of the previous boot. */
+	if (tscratch->clock_id != tr->clock_id) {
+		if (tscratch->clock_id >= ARRAY_SIZE(trace_clocks) ||
+		    tracing_set_clock(tr, trace_clocks[tscratch->clock_id].name) < 0) {
+			pr_info("the previous trace_clock info is not valid.");
+			goto reset;
+		}
+	}
 	return;
  reset:
 	/* Invalid trace modules */
-- 
2.47.2


