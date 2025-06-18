Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166791DF738
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261745; cv=none; b=nqnSjwyG7MPT+g8x8O4UnZf7W9pQ8gwwGwm+zRlAvmHNIlDMWQGnpK4ocbsmiYREe4/0JkA0qoYQF0LBccijJVqV5NRv/DvCHkHcIQn2n2+NfSMTfFk3RfTEKJoMPiTnVZX9jOLE/KFG9MZ9OrRKMC8mo3vvX+lPeKQrlz2po+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261745; c=relaxed/simple;
	bh=1FMcgHBGRpcgdJqz7L1cKQG6vvzTapgyrwXuW+aN4Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aplDMkJGA677bcRSkkV2NBc1HQBAyJd2O86HbOJi84UCD1jpq8/mpbEbllzitnmken1t4UyDoLG7V5tLhlQeLCGlXSnYRDN29OZtrafjluaTixZGF5zXfhj+2dUfV5RNwbha7XD7tZariyojc0X7fZ8Kou1bh+J8xsY+lj7Isnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 8B07316038D;
	Wed, 18 Jun 2025 15:49:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id A91FA2001F;
	Wed, 18 Jun 2025 15:48:59 +0000 (UTC)
Date: Wed, 18 Jun 2025 11:49:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Changbin Du <changbin.du@huawei.com>
Subject: [GIT PULL] ftrace: Fix accounting error in updating funcgraph-args
Message-ID: <20250618114907.23b824df@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A91FA2001F
X-Stat-Signature: 7p4xcn7n78cyta89uwruy8qa3usgbuwo
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+n7DdzAcAkfKOELSa83XKHE550hxLaGPg=
X-HE-Tag: 1750261739-932939
X-HE-Meta: U2FsdGVkX1+/JsCSPy8xOk/q3BujfAu2OYry/JYgSwSjx6VOjJ9skaor6gmkozhz+S2hBrz0dQnrkaJM6JHQASt/wpPfVzQEW08cPSOeJmXfjiPBFuTb28Va/Zy0Tv3geCUpjMXG/O7tiuaMJeMcvqnSOGiAtwLar57DkAUOIxWOU8+RPyxz05VMSVWj0mNLm5HC1ZfTyGHnCivXc5BqzhXWTJgwmXu27TnnnEHoZgzUlPlbwSrRDFL8yfMxNYDZGZNkVRSq8MgJoIhYc68s8bkaqDEG3UXkKHMg3VnuQuT+2yi9BINlionbOSTdo+BV9M33GpN8be0ZNR6rSjh2hqf0rGSFxBnw



Linus,

ftrace fix for 6.16:

- Do not blindly enable function_graph tracer when updating funcgraph-args

  When the option to trace function arguments in the function graph trace
  is updated, it requires the function graph tracer to switch its
  callback routine. It disables function graph tracing, updates the
  callback and then re-enables function graph tracing.

  The issue is that it doesn't check if function graph tracing is
  currently enabled or not. If it is not enabled, it will try to
  disable it and re-enable it (which will actually enable it even though
  it is not the current tracer). This causes an issue in the accounting
  and will trigger a WARN_ON() if the function tracer is enabled after
  that.


Please pull the latest ftrace-v6.16-rc2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ftrace-v6.16-rc2

Tag SHA1: 858ffefa15e822fdffe18bdfc34bf634ea8afd2a
Head SHA1: 327e28664307d49ce3fa71ba30dcc0007c270974


Steven Rostedt (1):
      fgraph: Do not enable function_graph tracer when setting funcgraph-args

----
 kernel/trace/trace_functions_graph.c | 6 ++++++
 1 file changed, 6 insertions(+)
---------------------------
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 9234e2c39abf..14d74a7491b8 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -455,10 +455,16 @@ static int graph_trace_init(struct trace_array *tr)
 	return 0;
 }
 
+static struct tracer graph_trace;
+
 static int ftrace_graph_trace_args(struct trace_array *tr, int set)
 {
 	trace_func_graph_ent_t entry;
 
+	/* Do nothing if the current tracer is not this tracer */
+	if (tr->current_trace != &graph_trace)
+		return 0;
+
 	if (set)
 		entry = trace_graph_entry_args;
 	else
