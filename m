Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDC29DB68
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749280; cv=none; b=PEWtMtxSQybt8h2Gddt9Yz2C+1VIC9q9pgSDGpbL5b9eca0idbFvtFraaEMPbw9NhhCuYjGISMeL9HaCzETFpstUUfqfWtyKlsqEouhwgO1NzouFc/QCiEZf8n3awLUd8mhQcfceeDl5rv12JiX88EslYMxsJ1Tpwwb4Rg89iGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749280; c=relaxed/simple;
	bh=S0AfpTT3e1dd75r4X4B034QJv0J/+UOFjOaNXfmUbek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UcYwmjgLWkOCkXN5uAhtGuj0yH68cYfYnL0E/0xtNm/BkcEp8ySlJJbJdzaYsgsuFtt3nTpBNCUD/9eUsPti+N2+KVlHMYW77sW6WeQ185vWS/PslI65F0zZNd7txZZVrzqlfwxAiBaI+MyYjy1Aou9xCIPiKu1/6gClLbqrmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK1EsFBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK1EsFBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB662C4CEEE;
	Thu, 12 Jun 2025 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749279;
	bh=S0AfpTT3e1dd75r4X4B034QJv0J/+UOFjOaNXfmUbek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TK1EsFBH2eA7HSZtTEdDkz5gWmhpwQ8gbhx2GcqhICM6fKTrzBjRzNA5uQ3E61nB3
	 kWQrwpQZK+Rm2489I28BR7wKW30uPvFLmMh0igtDU9rAmmhZbKKumtuMonX9ffrurg
	 657WQ7bdrkatAb4x1h2o9+mizytWDA7IIWcxVHCM3m82SeQxzPxn9xGtDm48b7hNGd
	 oU69EW+j5xmwueQA5fnEmjNkGiip06qiROEbJw56mUIFsRoond655tWGFdPgDN3Aki
	 +Mupuoo3d2htaTGD0+t0i7yDnkhqvhMTnuxDQQFzaLPjAozCZ6K8peAyZKnnTNQ1zL
	 UgFCGxh3WWwPg==
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Tengda Wu <wutengda@huaweicloud.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"David A . Long" <dave.long@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
Date: Thu, 12 Jun 2025 18:27:48 +0100
Message-Id: <174974547392.2465190.13255813578038754845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250604005533.1278992-1-wutengda@huaweicloud.com>
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 04 Jun 2025 00:55:33 +0000, Tengda Wu wrote:
> KASAN reports a stack-out-of-bounds read in regs_get_kernel_stack_nth().
> 
> Call Trace:
> [   97.283505] BUG: KASAN: stack-out-of-bounds in regs_get_kernel_stack_nth+0xa8/0xc8
> [   97.284677] Read of size 8 at addr ffff800089277c10 by task 1.sh/2550
> [   97.285732]
> [   97.286067] CPU: 7 PID: 2550 Comm: 1.sh Not tainted 6.6.0+ #11
> [   97.287032] Hardware name: linux,dummy-virt (DT)
> [   97.287815] Call trace:
> [   97.288279]  dump_backtrace+0xa0/0x128
> [   97.288946]  show_stack+0x20/0x38
> [   97.289551]  dump_stack_lvl+0x78/0xc8
> [   97.290203]  print_address_description.constprop.0+0x84/0x3c8
> [   97.291159]  print_report+0xb0/0x280
> [   97.291792]  kasan_report+0x84/0xd0
> [   97.292421]  __asan_load8+0x9c/0xc0
> [   97.293042]  regs_get_kernel_stack_nth+0xa8/0xc8
> [   97.293835]  process_fetch_insn+0x770/0xa30
> [   97.294562]  kprobe_trace_func+0x254/0x3b0
> [   97.295271]  kprobe_dispatcher+0x98/0xe0
> [   97.295955]  kprobe_breakpoint_handler+0x1b0/0x210
> [   97.296774]  call_break_hook+0xc4/0x100
> [   97.297451]  brk_handler+0x24/0x78
> [   97.298073]  do_debug_exception+0xac/0x178
> [   97.298785]  el1_dbg+0x70/0x90
> [   97.299344]  el1h_64_sync_handler+0xcc/0xe8
> [   97.300066]  el1h_64_sync+0x78/0x80
> [   97.300699]  kernel_clone+0x0/0x500
> [   97.301331]  __arm64_sys_clone+0x70/0x90
> [   97.302084]  invoke_syscall+0x68/0x198
> [   97.302746]  el0_svc_common.constprop.0+0x11c/0x150
> [   97.303569]  do_el0_svc+0x38/0x50
> [   97.304164]  el0_svc+0x44/0x1d8
> [   97.304749]  el0t_64_sync_handler+0x100/0x130
> [   97.305500]  el0t_64_sync+0x188/0x190
> [   97.306151]
> [   97.306475] The buggy address belongs to stack of task 1.sh/2550
> [   97.307461]  and is located at offset 0 in frame:
> [   97.308257]  __se_sys_clone+0x0/0x138
> [   97.308910]
> [   97.309241] This frame has 1 object:
> [   97.309873]  [48, 184) 'args'
> [   97.309876]
> [   97.310749] The buggy address belongs to the virtual mapping at
> [   97.310749]  [ffff800089270000, ffff800089279000) created by:
> [   97.310749]  dup_task_struct+0xc0/0x2e8
> [   97.313347]
> [   97.313674] The buggy address belongs to the physical page:
> [   97.314604] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14f69a
> [   97.315885] flags: 0x15ffffe00000000(node=1|zone=2|lastcpupid=0xfffff)
> [   97.316957] raw: 015ffffe00000000 0000000000000000 dead000000000122 0000000000000000
> [   97.318207] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> [   97.319445] page dumped because: kasan: bad access detected
> [   97.320371]
> [   97.320694] Memory state around the buggy address:
> [   97.321511]  ffff800089277b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   97.322681]  ffff800089277b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   97.323846] >ffff800089277c00: 00 00 f1 f1 f1 f1 f1 f1 00 00 00 00 00 00 00 00
> [   97.325023]                          ^
> [   97.325683]  ffff800089277c80: 00 00 00 00 00 00 00 00 00 f3 f3 f3 f3 f3 f3 f3
> [   97.326856]  ffff800089277d00: f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> [...]

Applied (using *addr) to arm64 (for-next/fixes), thanks!

[1/1] arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
      https://git.kernel.org/arm64/c/39dfc971e42d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
