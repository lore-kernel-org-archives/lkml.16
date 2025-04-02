Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545012E5D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560553; cv=none; b=U9DE0XbEXcbObsUahIojS5bb2HufTmYIYmwpjbg3+jEqyRJ59gcr+CffOEcR4vWP086svYebgmSVbDrz1eORygcaVVheNpHqTwWUMQRFuMgMkGlPgdFyPHGhNFzlK9HLZ/Xfxoobt0oOxVrGIETCSMeGabnf6Ww8NZlK0pxZdIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560553; c=relaxed/simple;
	bh=F3Pet1LG0fVFF9SVj7fZj8Tnxdw0TQPXJ67sTcw2Iys=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BxoSGzPuZ2sTlKVqBii8nTCikwtCKsHxfRku1BiJFpTHkmKg4mGY1aZ+Gn26giXZduR70C2VMuJoKEG4ALEhChYXsMMK0YoxFHjOkrgFQ8D5oISoRfk3dXlK5gIPon9KEXxGpnIZ4LVmIZ8ZT4aEwYbxraOwYOXMv5tI5DqFe5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DADC4CEEE;
	Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tznlO-00000006MNM-3VBD;
	Tue, 01 Apr 2025 22:23:34 -0400
Message-ID: <20250402022334.683869963@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 01 Apr 2025 22:23:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Christian Loehle <Christian.Loehle@arm.com>
Subject: [for-linus][PATCH 1/4] ftrace: Have tracing function args depend on PROBE_EVENTS_BTF_ARGS
References: <20250402022308.372786127@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The option PROBE_EVENTS_BTF_ARGS enables the functions
btf_find_func_proto() and btf_get_func_param() which are used by the
function argument tracing code. The option FUNCTION_TRACE_ARGS was
dependent on the same configs that PROBE_EVENTS_BTF_ARGS was dependent on,
but it was also dependent on PROBE_EVENTS_BTF_ARGS. In fact, if
PROBE_EVENTS_BTF_ARGS is supported then FUNCTION_TRACE_ARGS is supported.

Just make FUNCTION_TRACE_ARGS depend on PROBE_EVENTS_BTF_ARGS.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>
Link: https://lore.kernel.org/20250401113601.17fa1129@gandalf.local.home
Fixes: 533c20b062d7c ("ftrace: Add print_function_args()")
Closes: https://lore.kernel.org/all/DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com/
Reported-by: Christian Loehle <Christian.Loehle@arm.com>
Tested-by: Christian Loehle <Christian.Loehle@arm.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 033fba0633cf..a3f35c7d83b6 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -265,8 +265,7 @@ config FUNCTION_GRAPH_RETADDR
 
 config FUNCTION_TRACE_ARGS
        bool
-	depends on HAVE_FUNCTION_ARG_ACCESS_API
-	depends on DEBUG_INFO_BTF
+	depends on PROBE_EVENTS_BTF_ARGS
 	default y
 	help
 	  If supported with function argument access API and BTF, then
-- 
2.47.2


