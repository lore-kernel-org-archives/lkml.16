Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDAC1DE2A0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970674; cv=none; b=qL+8Wcbyb27JlHdjwQQNGd/d0cTJlOajUtpwk1U0VWVx22wAdUk9KkVN9Y9t8qBccsKNRP36qbNsLzDHg/CwYF434jADk3FrLs+yoi00apL/SQutdBx3sPnj22MTGkE6PFZKvsV/4YRPD3ALpKUYd3UiiUW8RVieAzGD9v7y96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970674; c=relaxed/simple;
	bh=aZhK6wG2PGLiBcUue9u+wu3jgnZx7VeVgIvnyB4Vi+g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=mQOh/ZXXuCVKpU+bAJi/Dmh85gJd6bWbUFTQK+qj6y197+rpvgJnXqkY1kHI+VhE9scHcTHmdDtmhkvPY70el6YekR3AxoMptN7xPaeCXh7f7FgFxfqc97WpAxpuq1IwIvXKE4tJFghRAHlUiAlJJdQ+9lH47fBd6q3vZETKack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7B9C4AF09;
	Tue,  3 Jun 2025 17:11:13 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uMVBc-0000000E403-36q6;
	Tue, 03 Jun 2025 13:12:28 -0400
Message-ID: <20250603171228.597721946@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 03 Jun 2025 13:11:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ye Bin <yebin10@huawei.com>
Subject: [for-linus][PATCH 2/5] ftrace: Dont allocate ftrace module map if ftrace is disabled
References: <20250603171149.582996770@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Ye Bin <yebin10@huawei.com>

If ftrace is disabled, it is meaningless to allocate a module map.
Add a check in allocate_ftrace_mod_map() to not allocate if ftrace is
disabled.

Link: https://lore.kernel.org/20250529111955.2349189-3-yebin@huaweicloud.com
Signed-off-by: Ye Bin <yebin10@huawei.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 84fd2f8263fa..a7291685902e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7631,6 +7631,9 @@ allocate_ftrace_mod_map(struct module *mod,
 {
 	struct ftrace_mod_map *mod_map;
 
+	if (ftrace_disabled)
+		return NULL;
+
 	mod_map = kmalloc(sizeof(*mod_map), GFP_KERNEL);
 	if (!mod_map)
 		return NULL;
-- 
2.47.2


