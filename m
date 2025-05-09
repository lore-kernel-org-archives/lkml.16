Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C77291896
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796379; cv=none; b=TTd8KOwVy6XcM+fhTJ/l4QYNJWYFkDyiFRg59fPSkSNmtZm98i/nOlVIh5e6aXUmWaWKJa0+yhslnbknmQz/+PaSUEyNoaCW9bhIpvmNShOjIdRslmsnJ2eKjq+hRxwWX+8K+8Nji0Bkp1uFHDk0G0HPu5DMfnUNEjcU4vzpYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796379; c=relaxed/simple;
	bh=fG5VfAxDzNeQARtxqoK/2gXkOWqg2TdqudyazUO9QW8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BTTyvozEPEBsgbuTSFpDLoVap83f/AQJ4tP25ulJjKs/M4RxrTW6x9f8cjKuViPKEYynljpvhMxB8kMHJdRWI0iAj+h85xrBEZeLOMcA4H5qUYIl0pNYjE5kjfmbVXixDyAl2CpxrYVqZq3Cc6gdDoLvMdBlixCvtPA/mJxdtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4A5C4CEEB;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXO-00000002bpH-0Jto;
	Fri, 09 May 2025 09:13:14 -0400
Message-ID: <20250509131313.932699225@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 03/31] tracing: Only return an adjusted address if it matches the kernel
 address
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The trace_adjust_address() will take a given address and examine the
persistent ring buffer to see if the address matches a module that is
listed there. If it does not, it will just adjust the value to the core
kernel delta. But if the address was for something that was not part of
the core kernel text or data it should not be adjusted.

Check the result of the adjustment and only return the adjustment if it
lands in the current kernel text or data. If not, return the original
address.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250506102300.0ba2f9e0@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 5b8db27fb6ef..01572ef79802 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6032,6 +6032,7 @@ unsigned long trace_adjust_address(struct trace_array *tr, unsigned long addr)
 	struct trace_module_delta *module_delta;
 	struct trace_scratch *tscratch;
 	struct trace_mod_entry *entry;
+	unsigned long raddr;
 	int idx = 0, nr_entries;
 
 	/* If we don't have last boot delta, return the address */
@@ -6045,7 +6046,9 @@ unsigned long trace_adjust_address(struct trace_array *tr, unsigned long addr)
 	module_delta = READ_ONCE(tr->module_delta);
 	if (!module_delta || !tscratch->nr_entries ||
 	    tscratch->entries[0].mod_addr > addr) {
-		return addr + tr->text_delta;
+		raddr = addr + tr->text_delta;
+		return __is_kernel(raddr) || is_kernel_core_data(raddr) ||
+			is_kernel_rodata(raddr) ? raddr : addr;
 	}
 
 	/* Note that entries must be sorted. */
-- 
2.47.2


