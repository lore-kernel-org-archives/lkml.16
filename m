Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2578C8CE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749604944; cv=none; b=bioFoZY0S6ByDXnLbIXDqTAvjf8hsbpWU6jnLXEov0GWe9wRmggu1RUguQy/QBMQOoklLQzmAVn+yhN4PM07dkiOFHeFDMeTGh6ykZbgVtkK2k+xogzGAKBK9+irAh29rf8fxS158GRV/9vAiJLCkzfTy4UGvnAUpyCYykSoczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749604944; c=relaxed/simple;
	bh=TqDA/IN/fKY6drHQdoxX4n86zvkoCka3nVYVgMABPSc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rGax2x3S0E4kfAWnK2tuzALux1kME8sUwF36SVlFKuut0Ib7LUF9A6f0z939Y5l0aba02BZeesbp40W0ahHj8Ov9PJ/8jkvLmexStwKkzDTOpr4UB1LaKdW0BRtKahimT2mKDV3BQ4Hmx+UkTOYhx5WcRCAgijrAMuNOM9JUZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bH7Dh2PpnzYQw1j
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 564BC1A1E6A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:11 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP3 (Coremail) with SMTP id _Ch0CgBnu8U82khoGpikOw--.29151S2;
	Wed, 11 Jun 2025 09:22:11 +0800 (CST)
Message-ID: <0602e96c-a77f-4b64-8a19-60041543f5c8@huaweicloud.com>
Date: Wed, 11 Jun 2025 09:22:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tengda Wu <wutengda@huaweicloud.com>
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
To: Oleg Nesterov <oleg@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "David A . Long" <dave.long@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <20250604005533.1278992-1-wutengda@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgBnu8U82khoGpikOw--.29151S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1rXry3trykJF4fWFykZrb_yoWrCF1rpw
	nxZw4DCr48Ar12va17Cw1jgryrJw4DAF1DGrZ7Gw1Fyr18Gr1jyry7XF1UWrWUZw1DZw43
	JFyDAr90qr1UWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUFKZXUUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

Ping?

Thanks,
Tengda

On 2025/6/4 8:55, Tengda Wu wrote:
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
> This issue seems to be related to the behavior of some gcc compilers and
> was also fixed on the s390 architecture before:
> 
>  commit d93a855c31b7 ("s390/ptrace: Avoid KASAN false positives in regs_get_kernel_stack_nth()")
> 
> As described in that commit, regs_get_kernel_stack_nth() has confirmed that
> `addr` is on the stack, so reading the value at `*addr` should be allowed.
> Use READ_ONCE_NOCHECK() helper to silence the KASAN check for this case.
> 
> Fixes: 0a8ea52c3eb1 ("arm64: Add HAVE_REGS_AND_STACK_ACCESS_API feature")
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>  arch/arm64/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f79b0d5f71ac..fe3f7e554d14 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>  
>  	addr += n;
>  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
> -		return *addr;
> +		return READ_ONCE_NOCHECK(addr);
>  	else
>  		return 0;
>  }

