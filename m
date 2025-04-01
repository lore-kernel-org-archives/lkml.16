Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F491C8639
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516563; cv=none; b=UMNVbY0ASPSIruV2FFBHdfjit8SQ0yElsYN6NcjmoQ1aIFiisfMW77omihNhRdvj02zN32vVxosPlWd409cDSfFPs7gpG4yXXZrOOUxr/114Do7/Veoqd6cJ4q3iXLjLxQkP9qRiw3A8K50orXZr1jOkmdfIpJG4oa7rqkQ8JUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516563; c=relaxed/simple;
	bh=Ln/Jhjdpj0qhjAeyWPIXMtnNvatkI3c6UijQ4s6epMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0P+akZ7K2Ve2IRdrknrHoDdAcZHYa100kBr3OVzE8i7dc/ssXqCRvSgWyf/sLniTc2KasvDGqyvUhbKOtGwD8VZsIpzF015rdS/ttmehJsI2XkXp1W6+6UswMIbUgQu7baL7H3srYG6ZmVN4Z47VpSzzS/75PHlvF8UO87iK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F247C4CEE4;
	Tue,  1 Apr 2025 14:09:21 +0000 (UTC)
Date: Tue, 1 Apr 2025 10:10:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian Loehle <Christian.Loehle@arm.com>, "pr-tracker-bot@kernel.org"
 <pr-tracker-bot@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Hongyan Xia <Hongyan.Xia2@arm.com>, LKML
 <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <Mark.Rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Haiyue Wang <haiyuewa@163.com>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>, Sasha Levin <sashal@kernel.org>, Sven
 Schnelle <svens@linux.ibm.com>, Tengda Wu <wutengda@huaweicloud.com>
Subject: Re: [GIT PULL] ftrace: Updates for 6.15
Message-ID: <20250401101021.2aa9ed2c@gandalf.local.home>
In-Reply-To: <20250401113159.GA83216@unreal>
References: <20250325193935.66020aa3@gandalf.local.home>
	<174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
	<DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>
	<20250401113159.GA83216@unreal>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Apr 2025 14:31:59 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> We see same issue in our CI systems.
> 
> 13:29:09  + make -s -j64 ARCH=x86
> 13:32:31  ld: kernel/trace/trace_output.o: in function `print_function_args':
> 13:32:31  /home/jenkins/agent/workspace/kernel_build/linux/kernel/trace/trace_output.c:713:(.text+0x20f1): undefined reference to `btf_find_func_proto'
> 13:32:31  ld: /home/jenkins/agent/workspace/kernel_build/linux/kernel/trace/trace_output.c:717:(.text+0x210d): undefined reference to `btf_get_func_param'
> 13:32:31  make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> 13:32:31  make[1]: *** [/home/jenkins/agent/workspace/kernel_build/linux/Makefile:1234: vmlinux] Error 2
> 13:32:31  make: *** [Makefile:251: __sub-make] Error 2

Looks like a dependency is missing and/or an #ifdef block needs to be added.

Thanks for the report, I'll take a look into it.

-- Steve
