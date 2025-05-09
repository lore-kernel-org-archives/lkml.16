Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5A294A0C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=PlzhvfjUUvE9YNLwctjVipoxiPOg+E0IUVzpoYohOAAmTwyzRCus32Hoo1ztvU9t0L0D4xg6QR8M/Yp3sA2L3g1DQj8w+65QDTzZPalBDTj98LVRGzDuPfV2Z4LZ70Jv1N80d7is+6nxnaHTKLRNJHqcsPunbMX/n9npnm9iQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=SzPqlg0Eque0YCACbS3nlNWvZVzenw1a+Kzf9qe87js=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MEJWkAC7SIeORjB7P7O3+QThscUnVOkHLmkL7ioe+2iQsCtY4jm0YhRQlT3SkkAu2qPFgaXa+Jvy48ppp374a+r90OlLcuXOwcQXeCpqFuHwIAcTJ9GYiZDJkul8WRE3f42haTyOKhJCkU2+uMMwndFsvNh8SHGStY5SGcrj5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F6C4CEEB;
	Fri,  9 May 2025 13:13:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXS-00000002c1o-1SnJ;
	Fri, 09 May 2025 09:13:18 -0400
Message-ID: <20250509131318.200556507@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tom Zanussi <zanussi@kernel.org>,
 Miaoqian Lin <linmq006@gmail.com>
Subject: [for-next][PATCH 28/31] tracing: Fix error handling in event_trigger_parse()
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Miaoqian Lin <linmq006@gmail.com>

According to trigger_data_alloc() doc, trigger_data_free() should be
used to free an event_trigger_data object. This fixes a mismatch introduced
when kzalloc was replaced with trigger_data_alloc without updating
the corresponding deallocation calls.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Tom Zanussi <zanussi@kernel.org>
Link: https://lore.kernel.org/20250507145455.944453325@goodmis.org
Link: https://lore.kernel.org/20250318112737.4174-1-linmq006@gmail.com
Fixes: e1f187d09e11 ("tracing: Have existing event_command.parse() implementations use helpers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
[ SDR: Changed event_trigger_alloc/free() to trigger_data_alloc/free() ]
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events_trigger.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index dac3344ee345..c316badc608b 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -995,7 +995,7 @@ event_trigger_parse(struct event_command *cmd_ops,
 
 	if (remove) {
 		event_trigger_unregister(cmd_ops, file, glob+1, trigger_data);
-		kfree(trigger_data);
+		trigger_data_free(trigger_data);
 		ret = 0;
 		goto out;
 	}
@@ -1022,7 +1022,7 @@ event_trigger_parse(struct event_command *cmd_ops,
 
  out_free:
 	event_trigger_reset_filter(cmd_ops, trigger_data);
-	kfree(trigger_data);
+	trigger_data_free(trigger_data);
 	goto out;
 }
 
-- 
2.47.2


