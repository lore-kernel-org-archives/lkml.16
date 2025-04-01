Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBB81F152F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506828; cv=none; b=kM1ZDkWqIvQ/9J/cip3Z+H5fUN1q3yhiTItxOlPcJw+QmYkii4FeGtAOYvn46upPATmcbhDwZcaD/D7NSNIMddNMFJQbP3GKnZUPAHkFm8bmExTGfHwYl/7H5z2GhCNRvhPrNTcSxmn1eoSJ9nGoEy05tcdlzEK/SpJEoyFxVtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506828; c=relaxed/simple;
	bh=KwiEpF1/WiyMcICvDmlCgwF4Wd5Y0RydDfYY/VEhfL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pH7hFv9s5ANzqGl8yBPdcDVcSOn0AfCFJW27GUtNtVdJdTxNNRdcQMVulsSxY/vRaOCawhuLaEBLHHbv7e+3Z5qFVeMzpAlp7I3ROFfMEKlPl3SRUJR4m6Eja0emJ6Jit1RyjXyQ+nwQcQodwR0t0XeBzBpmB2oot2yOAtQ8ebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5881C14BF;
	Tue,  1 Apr 2025 04:27:09 -0700 (PDT)
Received: from [10.57.40.234] (unknown [10.57.40.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D00B53F694;
	Tue,  1 Apr 2025 04:27:02 -0700 (PDT)
Message-ID: <df70e7da-20b3-4d56-b9ac-87352b0874e3@arm.com>
Date: Tue, 1 Apr 2025 12:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ftrace: Updates for 6.15
To: "pr-tracker-bot@kernel.org" <pr-tracker-bot@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hongyan Xia <Hongyan.Xia2@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Haiyue Wang <haiyuewa@163.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Sasha Levin <sashal@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 Tengda Wu <wutengda@huaweicloud.com>
References: <20250325193935.66020aa3@gandalf.local.home>
 <174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
 <DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/31/25 17:57, Christian Loehle wrote:
> 
> 
> ________________________________________
> From: pr-tracker-bot@kernel.org <pr-tracker-bot@kernel.org>
> Sent: 28 March 2025 00:09
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>; LKML <linux-kernel@vger.kernel.org>; Masami Hiramatsu <mhiramat@kernel.org>; Mark Rutland <Mark.Rutland@arm.com>; Mathieu Desnoyers <mathieu.desnoyers@efficios.com>; Andrew Morton <akpm@linux-foundation.org>; Haiyue Wang <haiyuewa@163.com>; Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; Sasha Levin <sashal@kernel.org>; Sven Schnelle <svens@linux.ibm.com>; Tengda Wu <wutengda@huaweicloud.com>
> Subject: Re: [GIT PULL] ftrace: Updates for 6.15
> 
> 
>> The pull request you sent on Tue, 25 Mar 2025 19:39:35 -0400:
>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.15
>>
>> has been merged into torvalds/linux.git:
>> https://git.kernel.org/torvalds/c/31eb415bf6f06c90fdd9b635caf3a6c5110a38b6
>>
>> Thank you!
>>
>> --
>> Deet-doot-dot, I am a bot.
>> https://korg.docs.kernel.org/prtracker.html
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

In linus' tree we have:
76fe0337c219 ftrace: Add arguments to function tracer
c7a60a733c37 ftrace: Have funcgraph-args take affect during tracing
ff5c9c576e75 ftrace: Add support for function argument to graph tracer
533c20b062d7 ftrace: Add print_function_args()
3d44e1d1575a md: switch personalities to use md_submodule_head

3d44e1d1575a md: switch personalities to use md_submodule_head
builds fine.

533c20b062d7 ftrace: Add print_function_args()
is the first one to fail but with:
kernel/trace/trace_output.c: In function ‘print_function_args’:
kernel/trace/trace_output.c:724:26: error: ‘FTRACE_REGS_MAX_ARGS’ undeclared (first use in this function)
  724 |                 if (a == FTRACE_REGS_MAX_ARGS) {
      |                          ^~~~~~~~~~~~~~~~~~~~
kernel/trace/trace_output.c:724:26: note: each undeclared identifier is reported only once for each function it appears in

then 
ff5c9c576e75 ftrace: Add support for function argument to graph tracer
shows

aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: kernel/trace/trace_output.o: in function `print_function_args':
/home/chrloe01/development/linux-mainline/kernel/trace/trace_output.c:711: undefined reference to `btf_find_func_proto'
aarch64-linux-gnu-ld: /home/chrloe01/development/linux-mainline/kernel/trace/trace_output.c:715: undefined reference to `btf_get_func_param'
make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
make[1]: *** [/data_nvme1n1/chrloe01/development/linux-mainline/Makefile:1226: vmlinux] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j16 -s Image  5747.92s user 554.69s system 830% cpu 12:38.50 total

fails just like reported linus' tree.

