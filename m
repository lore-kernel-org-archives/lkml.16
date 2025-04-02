Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA929CE1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560553; cv=none; b=SQuVeHAe4F3eLRuqNn9fSRkixVhtRgWSlX/TjqWyOo5cPO1Otl8RCsqPbsdE18NVoz5QIWrChSRI2LcjNNxf0PPX91VoETIV6WdovcWuJNJznIMUDJy5RC8S8fsokOc6e0dC8Mb/Sfbfy4K1/3YcoMb2CHgUFAPloC+PbNu47LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560553; c=relaxed/simple;
	bh=DCxRafmm3bkIwxe7XnDiqfCO1qxNMhwVeQxCFNCrA6w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=WOueT1xuwRwi9JiiJXQ3uyvFRrJlgvFQN2SybnOLpFVMGH+9RgPw+dJQxehn9jo0/vMIiuYrLXpOTBFkwFx8w6zg0AkWu9eX8+6y6A4eHhtncYsPpdT5IuiaMds0nlQ5eNbpwekVl7q8DxfQ+OtW7xZdpPITw1UcDPwutL/JQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB5DC4CEE8;
	Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tznlP-00000006MNq-02B2;
	Tue, 01 Apr 2025 22:23:35 -0400
Message-ID: <20250402022334.856216750@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 01 Apr 2025 22:23:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 2/4] tracing: Free module_delta on freeing of persistent ring buffer
References: <20250402022308.372786127@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

If a persistent ring buffer is created, a "module_delta" array is also
allocated to hold the module deltas of loaded modules that match modules
in the scratch area. If this buffer gets freed, the module_delta array is
not freed and causes a memory leak.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250401124525.1f9ac02a@gandalf.local.home
Fixes: 35a380ddbc65 ("tracing: Show last module text symbols in the stacktrace")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 103b193875b3..de6d7f0e6206 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9609,6 +9609,7 @@ static void free_trace_buffers(struct trace_array *tr)
 		return;
 
 	free_trace_buffer(&tr->array_buffer);
+	kfree(tr->module_delta);
 
 #ifdef CONFIG_TRACER_MAX_TRACE
 	free_trace_buffer(&tr->max_buffer);
-- 
2.47.2


