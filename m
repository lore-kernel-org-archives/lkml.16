Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A3FC08
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 19:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749324504; cv=none; b=Tmizgw3FkJtancSKh7EmqI9u1ZElyrsyFTyi2ZYFDEBEUgNbgTVYAvxobzyIdUaNUDxRy3hKJTed0TigGrFMIyus5jvodhZmwg3ODG+jKtfqhp9J4iDHUDCUfOO9IrqBCOxhoRSv5LSyqvZkP3ofP1nc84oIHyvQLtACMZvKbps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749324504; c=relaxed/simple;
	bh=6LtZlLoLr4VabaHb5rMPs+djcI33bZAaAP95uOT2n6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q9i3nRz2/EVLem5x45GHnNya+Ns1oaEugsSauuWMfEwSnCUOuv7uFYDWiEufQo7xVr6ZLMSpEX2U8vIsYB47gPmH1GLd6AD75fShfzjj4bDiawtG1NFBoI2UY/kWfkV63ezxLXg+2RwBGE9FdwS4GeKHzmv6iUlnusucG87YRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 4E8D982713;
	Sat,  7 Jun 2025 19:28:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id EA04320028;
	Sat,  7 Jun 2025 19:28:13 +0000 (UTC)
Date: Sat, 7 Jun 2025 15:29:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: [for-linus][PATCH] tracing: Add rcu annotation around file->filter
 accesses
Message-ID: <20250607152937.7e9cccb0@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: EA04320028
X-Stat-Signature: 16gyqcbrze4hmrxybnitseptnp8ctwn1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/nUOrOG2ummSX4lxvKwmNLn1N9RinFVFM=
X-HE-Tag: 1749324493-237557
X-HE-Meta: U2FsdGVkX18NxUn8M612AgcJ+YzzXeU6aY61PgThzSGHRHhm6ToYMA94VfqghzGrWqsrLfBsI5911Gq2rYtcZQFWwFD8eO+Q8Apo692hvo0fJDfJx0Wy4dTw1EHhV/GXHMocSeXr2/xxRJf1Ee8X1NBFZCCQ4ubyxVCKHTqEnLetIY3C3q0tKyjJUtgGB3Y5c/0oJAI4lqBPJNfk2zzSMIUyzshzAe43+JqcVwrnSD9sSIHHnjl5kSk8ONJgsd/qN1a3oUiREqk4dbj9oX4cI9nf/ERKOGwKgbnhOtT1hZLYXBcBQFD+sayhDBS5GPTZ3sl34YOZoLEZQwRkO7WAFs5j6FFCuygDSTTzOnsyEY7czI7hL1Jiq8piO8y3EXM/nBYjalWLeoD6fpOSAJbiqZTR+++5I0zbbWy4pBtO0w9ZFPE6NQI6CH4eMezkpc2eDN5f5bSr3rf40I83/+EefA==


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 549e914c96ae67760f36b9714b424dc992a0a69b


Steven Rostedt (1):
      tracing: Add rcu annotation around file->filter accesses

----
 kernel/trace/trace_events_filter.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
---------------------------
commit 549e914c96ae67760f36b9714b424dc992a0a69b
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Sat Jun 7 10:28:21 2025 -0400

    tracing: Add rcu annotation around file->filter accesses
    
    Running sparse on trace_events_filter.c triggered several warnings about
    file->filter being accessed directly even though it's annotated with __rcu.
    
    Add rcu_dereference() around it and shuffle the logic slightly so that
    it's always referenced via accessor functions.
    
    Cc: Masami Hiramatsu <mhiramat@kernel.org>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Link: https://lore.kernel.org/20250607102821.6c7effbf@gandalf.local.home
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 711520081741..ea8b364b6818 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1250,7 +1250,9 @@ static void append_filter_err(struct trace_array *tr,
 
 static inline struct event_filter *event_filter(struct trace_event_file *file)
 {
-	return file->filter;
+	return rcu_dereference_protected(file->filter,
+					 lockdep_is_held(&event_mutex));
+
 }
 
 /* caller must hold event_mutex */
@@ -1320,7 +1322,7 @@ void free_event_filter(struct event_filter *filter)
 static inline void __remove_filter(struct trace_event_file *file)
 {
 	filter_disable(file);
-	remove_filter_string(file->filter);
+	remove_filter_string(event_filter(file));
 }
 
 static void filter_free_subsystem_preds(struct trace_subsystem_dir *dir,
@@ -1405,7 +1407,7 @@ static void try_delay_free_filter(struct event_filter *filter)
 
 static inline void __free_subsystem_filter(struct trace_event_file *file)
 {
-	__free_filter(file->filter);
+	__free_filter(event_filter(file));
 	file->filter = NULL;
 }
 
@@ -1465,7 +1467,7 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 	list_for_each_entry(file, &tr->events, list) {
 		if (file->system != dir || !file->filter)
 			continue;
-		__free_filter(file->filter);
+		__free_subsystem_filter(file);
 	}
 	__free_filter(filter);
 }
