Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061322CCC5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507125; cv=none; b=og/R2wEKso+XI9jAoimGeMyBej6rCJ7y7oT6UA1YDLlN2ao2hHOn1hhOpEzn5n7b61GKpNDi2grLhXvG5DQwnf0oifNRVMFVo9o1JAjaNSJYeSkR70fxL04brfWw17/apya7gKlxEIolkcHt8XxgnTBHxMiUeYwkMRvUjdalejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507125; c=relaxed/simple;
	bh=dd9Yohu3bLNU37Fu3gNES3v22ka1maPyEMnLvHbr4zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmweAtuOD7NW8R3ksl3HjyQcSgvWbEyrq84nzJV38gQffbFi01M3tFhVtc5lD+yiO15du1G4NauOFcW5EjJr4RURGU9GHWt/vMjPg848usWF51sry4WWSAMzO4UCOQ8rvEblCkWOv0RaGivir97fGVsJWbk4csr23iDfrpOM9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4etQI/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4etQI/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06B4C4CEE8;
	Tue,  1 Apr 2025 11:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743507124;
	bh=dd9Yohu3bLNU37Fu3gNES3v22ka1maPyEMnLvHbr4zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4etQI/tYSfJdm1cd/wl6DwcqmQ1wWT/BkAVndZjGP06t4ZdEYkZbip1szA7Umb8k
	 s3e6oam2bRgv0e7TklvsqagXmlRhrLiPZ8tf4xnBw6pii6i6nee1jDQOJGfz4TFuDH
	 QJhixoQp0KuBgqY7W7jvdAwU7Q1IzirtHsBl1oE+6X7HXCMzkXv21B7d+ChcWVttrc
	 MZ+7cBtPvUczHlWlPp5+TZxZqvEIZ2fUKbMNkHn3ZuSDGfkkDVrbLffdSoIWOTtqAK
	 8/R2v5saEwCPwTcy3DWRsqhNjB8+HbRzqmYK0Rj+y8/LLizLx/DHlg9o3lOlPp+u4h
	 WoFytShDtOG1A==
Date: Tue, 1 Apr 2025 14:31:59 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Christian Loehle <Christian.Loehle@arm.com>
Cc: "pr-tracker-bot@kernel.org" <pr-tracker-bot@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Hongyan Xia <Hongyan.Xia2@arm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Haiyue Wang <haiyuewa@163.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Sasha Levin <sashal@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Tengda Wu <wutengda@huaweicloud.com>
Subject: Re: [GIT PULL] ftrace: Updates for 6.15
Message-ID: <20250401113159.GA83216@unreal>
References: <20250325193935.66020aa3@gandalf.local.home>
 <174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
 <DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>

On Mon, Mar 31, 2025 at 04:57:53PM +0000, Christian Loehle wrote:
> 
> 
> ________________________________________
> From: pr-tracker-bot@kernel.org <pr-tracker-bot@kernel.org>
> Sent: 28 March 2025 00:09
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>; LKML <linux-kernel@vger.kernel.org>; Masami Hiramatsu <mhiramat@kernel.org>; Mark Rutland <Mark.Rutland@arm.com>; Mathieu Desnoyers <mathieu.desnoyers@efficios.com>; Andrew Morton <akpm@linux-foundation.org>; Haiyue Wang <haiyuewa@163.com>; Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; Sasha Levin <sashal@kernel.org>; Sven Schnelle <svens@linux.ibm.com>; Tengda Wu <wutengda@huaweicloud.com>
> Subject: Re: [GIT PULL] ftrace: Updates for 6.15
>  
>  
> >The pull request you sent on Tue, 25 Mar 2025 19:39:35 -0400:
> >
> >> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.15
> >
> >has been merged into torvalds/linux.git:
> >https://git.kernel.org/torvalds/c/31eb415bf6f06c90fdd9b635caf3a6c5110a38b6
> >
> >Thank you!
> >
> >--
> >Deet-doot-dot, I am a bot.
> >https://korg.docs.kernel.org/prtracker.html
> 
> Hi Steven,
> I'm pretty sure this causes the build to fail on linus' tree and next:
> 4e82c87058f4 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'rust-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux
> 
> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> aarch64-linux-gnu-ld: kernel/trace/trace_output.o: in function `print_function_args':
> /home/chrloe01/development/linux-mainline/kernel/trace/trace_output.c:712: undefined reference to `btf_find_func_proto'
> aarch64-linux-gnu-ld: /home/chrloe01/development/linux-mainline/kernel/trace/trace_output.c:716: undefined reference to `btf_get_func_param'
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> make[1]: *** [/data_nvme1n1/chrloe01/development/linux-mainline/Makefile:1234: vmlinux] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

We see same issue in our CI systems.

13:29:09  + make -s -j64 ARCH=x86
13:32:31  ld: kernel/trace/trace_output.o: in function `print_function_args':
13:32:31  /home/jenkins/agent/workspace/kernel_build/linux/kernel/trace/trace_output.c:713:(.text+0x20f1): undefined reference to `btf_find_func_proto'
13:32:31  ld: /home/jenkins/agent/workspace/kernel_build/linux/kernel/trace/trace_output.c:717:(.text+0x210d): undefined reference to `btf_get_func_param'
13:32:31  make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
13:32:31  make[1]: *** [/home/jenkins/agent/workspace/kernel_build/linux/Makefile:1234: vmlinux] Error 2
13:32:31  make: *** [Makefile:251: __sub-make] Error 2

Thanks

> 
> Sound familiar?
> grep BTF .config
> CONFIG_DEBUG_INFO_BTF=y
> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> CONFIG_DEBUG_INFO_BTF_MODULES=y
> # CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
> 
> Enabling CONFIG_PROBE_EVENTS_BTF_ARGS passes the build.
> 
> 
