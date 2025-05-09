Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E32951AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796383; cv=none; b=ZrbXhgHMSF91RfXIA9149eKsfC19b+OBwyDLjvnb40iN1/spbkWM/1oHKLFFe7IOg66Y5vaX71U2goIErLysoEfzJ/x4teeYxFqeUgIVBwkKoauavEQVsxbWJ6/MhcTaosIK5cjHSTYjcp1hmyt9iHjUAq0/o/uJPhsZyC6bDjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796383; c=relaxed/simple;
	bh=s/f1WOZINXsqbCEyArw9h0+7djiEJThn/JJePbdtQQc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=l46GgNxID5HeH1OK4n/dagZ+uskoh+SgDocXkLO9RzelXA+aBoOuK404JjiZmyzRJeMAxr5IhUL9fWtoKJiAXA70FqaHn13ghqiXdLjBZFjS6A4kEe9HblPH3KCGwjIhHr6YgOTrTdSPpPB/JqngvULXuPRHMajVQl4nursfHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA6AC4CEF1;
	Fri,  9 May 2025 13:13:03 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXS-00000002c2o-2tRf;
	Fri, 09 May 2025 09:13:18 -0400
Message-ID: <20250509131318.540432016@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 30/31] tracing: Add a helper function to handle the dereference arg in
 verifier
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Add a helper function called handle_dereference_arg() to replace the logic
that is identical in two locations of test_event_printk().

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250507191703.5dd8a61d@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index fe0ea14d809e..120531268abf 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -400,6 +400,20 @@ static bool process_string(const char *fmt, int len, struct trace_event_call *ca
 	return true;
 }
 
+static void handle_dereference_arg(const char *arg_str, u64 string_flags, int len,
+				   u64 *dereference_flags, int arg,
+				   struct trace_event_call *call)
+{
+	if (string_flags & (1ULL << arg)) {
+		if (process_string(arg_str, len, call))
+			*dereference_flags &= ~(1ULL << arg);
+	} else if (process_pointer(arg_str, len, call))
+		*dereference_flags &= ~(1ULL << arg);
+	else
+		pr_warn("TRACE EVENT ERROR: Bad dereference argument: '%.*s'\n",
+			len, arg_str);
+}
+
 /*
  * Examine the print fmt of the event looking for unsafe dereference
  * pointers using %p* that could be recorded in the trace event and
@@ -563,11 +577,9 @@ static void test_event_printk(struct trace_event_call *call)
 			}
 
 			if (dereference_flags & (1ULL << arg)) {
-				if (string_flags & (1ULL << arg)) {
-					if (process_string(fmt + start_arg, e - start_arg, call))
-						dereference_flags &= ~(1ULL << arg);
-				} else if (process_pointer(fmt + start_arg, e - start_arg, call))
-					dereference_flags &= ~(1ULL << arg);
+				handle_dereference_arg(fmt + start_arg, string_flags,
+						       e - start_arg,
+						       &dereference_flags, arg, call);
 			}
 
 			start_arg = i;
@@ -578,11 +590,9 @@ static void test_event_printk(struct trace_event_call *call)
 	}
 
 	if (dereference_flags & (1ULL << arg)) {
-		if (string_flags & (1ULL << arg)) {
-			if (process_string(fmt + start_arg, i - start_arg, call))
-				dereference_flags &= ~(1ULL << arg);
-		} else if (process_pointer(fmt + start_arg, i - start_arg, call))
-			dereference_flags &= ~(1ULL << arg);
+		handle_dereference_arg(fmt + start_arg, string_flags,
+				       i - start_arg,
+				       &dereference_flags, arg, call);
 	}
 
 	/*
-- 
2.47.2


