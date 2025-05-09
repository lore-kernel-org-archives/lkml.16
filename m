Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88317293462
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796381; cv=none; b=HgSDydkCZlm1hgugZmHkcyr0gUZNhjXRsT7veXBgn/Jdcbndol1aAS7NPG53gve3fmpT9c5LrM9mSu6bCZiNBAlDDJ45gRcr1w+oDNXx6hhzBBqMtDqXdPNxOrg1CbTtv2bwAX8ht9cKIEeddBVdBGbx/PcAt2ovW4+gGnJZeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796381; c=relaxed/simple;
	bh=M4oC3js/6GRG4hCXpowDgVIbV4NBdtJSRz/ZIWx5O3c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ZLIfVdBAKrkXIAyQgsB0v0vL1RUwBUQT5YL6z/oYkkn6evFd+l1HuGKEF+anNuaRmLzvvSpHDv3blucwuuMIXDcSwSX1b/hl+Dk6uzEDlQdvl8McTkIczirJXsqc8DVm9ElGHsrP9v+h1+b8n4DhEomwTRu1Vv8uwvUxuQcml4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A955C4CEF2;
	Fri,  9 May 2025 13:13:01 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXQ-00000002bwl-2ev3;
	Fri, 09 May 2025 09:13:16 -0400
Message-ID: <20250509131316.483054226@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [for-next][PATCH 18/31] tracing: kdb: Use tracer_tracing_on/off() instead of setting per CPU
 disabled
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The per CPU "disabled" value was the original way to disable tracing when
the tracing subsystem was first created. Today, the ring buffer
infrastructure has its own way to disable tracing. In fact, things have
changed so much since 2008 that many things ignore the disable flag.

The kdb_ftdump() function iterates over all the current tracing CPUs and
increments the "disabled" counter before doing the dump, and decrements it
afterward.

As the disabled flag can be ignored, doing this today is not reliable.
Instead, simply call tracer_tracing_off() and then tracer_tracing_on() to
disable and then enabled the entire ring buffer in one go!

Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/20250505212235.549033722@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_kdb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
index 1e72d20b3c2f..d7b135de958a 100644
--- a/kernel/trace/trace_kdb.c
+++ b/kernel/trace/trace_kdb.c
@@ -98,7 +98,6 @@ static int kdb_ftdump(int argc, const char **argv)
 	long cpu_file;
 	int err;
 	int cnt;
-	int cpu;
 
 	if (argc > 2)
 		return KDB_ARGCOUNT;
@@ -120,9 +119,7 @@ static int kdb_ftdump(int argc, const char **argv)
 	trace_init_global_iter(&iter);
 	iter.buffer_iter = buffer_iter;
 
-	for_each_tracing_cpu(cpu) {
-		atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-	}
+	tracer_tracing_disable(iter.tr);
 
 	/* A negative skip_entries means skip all but the last entries */
 	if (skip_entries < 0) {
@@ -135,9 +132,7 @@ static int kdb_ftdump(int argc, const char **argv)
 
 	ftrace_dump_buf(skip_entries, cpu_file);
 
-	for_each_tracing_cpu(cpu) {
-		atomic_dec(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-	}
+	tracer_tracing_enable(iter.tr);
 
 	kdb_trap_printk--;
 
-- 
2.47.2


