Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FAE246765
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197203; cv=none; b=Uz6N2xgED4yPsVhPg/Mc9fv5qLpPSC1pPXBh2k2EahHTGvhT28chxaWN8zKCi/ad2cdq7+kr6LZrW5q9lRP5mYZ1Bu1go1/oYd4mSgABdlwRs1DsNYDv7PFEB5sQPHojDjMOYtOWmwEAfcVsTrKoaDhUYoRn4K/9xRuAAlviXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197203; c=relaxed/simple;
	bh=YGOOaAzygCCrD+nd0bR3A9SoxsGxOdIiiuIkhpvn5Sk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=F8Savo9vOn107dVUJVxIZLoDfmlDx35wIBi3Zwv15UmcVin7hzVRbhW0gj6ZZfsG1JtfzbI38SrRZ1Qbe+MSp6ILKkwuqdwIqaOofvGC8uF2W23O+SvrR/d7cmxiv+4vQJ0K5Xss+6WXdzQdPUCNHxZxhtFXkIV+ZVNvDpH2p/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140F7C4CEF2;
	Fri,  2 May 2025 14:46:43 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uArf9-000000032vU-2aZv;
	Fri, 02 May 2025 10:46:51 -0400
Message-ID: <20250502144651.463362779@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 02 May 2025 10:46:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 3/4] tracing: Fix trace_adjust_address() when there is no modules in
 scratch area
References: <20250502144607.785079223@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The function trace_adjust_address() is used to map addresses of modules
stored in the persistent memory and are also loaded in the current boot to
return the current address for the module.

If there's only one module entry, it will simply use that, otherwise it
performs a bsearch of the entry array to find the modules to offset with.

The issue is if there are no modules in the array. The code does not
account for that and ends up referencing the first element in the array
which does not exist and causes a crash.

If nr_entries is zero, exit out early as if this was a core kernel
address.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250501151909.65910359@gandalf.local.home
Fixes: 35a380ddbc653 ("tracing: Show last module text symbols in the stacktrace")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6d52dc108f00..5b8db27fb6ef 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6043,8 +6043,10 @@ unsigned long trace_adjust_address(struct trace_array *tr, unsigned long addr)
 	tscratch = tr->scratch;
 	/* if there is no tscrach, module_delta must be NULL. */
 	module_delta = READ_ONCE(tr->module_delta);
-	if (!module_delta || tscratch->entries[0].mod_addr > addr)
+	if (!module_delta || !tscratch->nr_entries ||
+	    tscratch->entries[0].mod_addr > addr) {
 		return addr + tr->text_delta;
+	}
 
 	/* Note that entries must be sorted. */
 	nr_entries = tscratch->nr_entries;
-- 
2.47.2


