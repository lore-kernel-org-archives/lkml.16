Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16D1A314C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747895029; cv=none; b=eZQit3E69zsgPsRTRD85NR64TQHEB9jLHhQUdKwN+xywTZwyn8CxV2rXI7PSiOFzX5epdmmQv7Yp69lhMS01y/KaDfPQcS/mVFo9GLD8dY12hrtgJhWBA/JgQRlSozmhvfiJvrao2Ex6r9PuCTAuFiPSL1Y5AYVgVoJ5euO1oFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747895029; c=relaxed/simple;
	bh=aTDspjRmUhAMmnxp2A0hZGa/rm3q3LpoxyeZl+VlNUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpzekT379g+dj13r0bOcdi84XMmpI8AONogBBEY8xmAY3tzpYt8KT0dklMVrGahkSQFfKG6d3bkwNomtp0QIEkUGwkWa5CH9aN2rFotDx9SzazR0dKYqXL4XCWgwBOB7aN5Rt2QHNH2JMOiRdECRju1+s9c27jzEVV686eLY5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=TgBwao3j; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="TgBwao3j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ann5LkHML10Vn8KeLpl19P0FLIOhd+Y7uikYKwXYanQ=; b=TgBwao3jAzq/reoivZEYo+fzbe
	pk+k7YuLZKVXdhvyCXYX7i35dESLpGOOVQsjf8Cd5jqf1ZKiQpOlYOkytwOH7npI1sP4x+g0LfEQd
	fCxMYYDQw6/GS4caU7zSeZUaBS8QFlDTgv9MlaDGbpHt6QVo+Ty+Zl6AW6KTjE5xTGsOjFMgPJGW8
	4dw5d604a1EyujgLIbzgMLCgYiXBToyqJDx4dbEHgNjaNwWCaRx36W1ZTgxk5bPv/eHHAdLBTU+ip
	IkHh1fud/4Nvs5i+ucCGUhF4woUEgyRkoPruuaypoxPsM8x+5c+aQYqvzfj+St9Sg/tQSlfFTZR5v
	SGaLm7JA==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uHzL5-000DGj-HU; Thu, 22 May 2025 07:23:36 +0100
Message-ID: <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
Date: Thu, 22 May 2025 07:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Deepak Gupta <debug@rivosinc.com>, Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
 <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: ben.dooks@codethink.co.uk

On 20/05/2025 17:49, Deepak Gupta wrote:
> I did give this patch my RB and had planned to come back to it to see
> if it impacts cfi related patches. Thanks to alex for brinigng to my
> attention again. As it stands today, it doesn't impact cfi related
> changes but I've some concerns.
> 
> Overall I do agree we should reduce number of SSTATUS accesses.
> 
> Couple of questions on introducing new `sstatus` field (inline)
> 
> On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>> On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>
>>> When threads/tasks are switched we need to ensure the old execution's
>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>> restored.
>>>
>>> The issue was seen under heavy load especially with the syz-stress tool
>>> running, with crashes as follows in schedule_tail:
>>>
>>> Unable to handle kernel access to user memory without uaccess routines
>>> at virtual address 000000002749f0d0
>>> Oops [#1]
>>> Modules linked in:
>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>> Hardware name: riscv-virtio,qemu (DT)
>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>> ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>> ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>> gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>> t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>> s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>> a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>> a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>> s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>> s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>> s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>> s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>> t5 : ffffffc4043cafba t6 : 0000000000040000
>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>> 000000000000000f
>>> Call Trace:
>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>>> Dumping ftrace buffer:
>>>  (ftrace buffer empty)
>>> ---[ end trace b5f8f9231dc87dda ]---
>>>
>>> The issue comes from the put_user() in schedule_tail
>>> (kernel/sched/core.c) doing the following:
>>>
>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>> {
>>> ...
>>>       if (current->set_child_tid)
>>>               put_user(task_pid_vnr(current), current->set_child_tid);
>>> ...
>>> }
>>>
>>> the put_user() macro causes the code sequence to come out as follows:
>>>
>>> 1:    __enable_user_access()
>>> 2:    reg = task_pid_vnr(current);
>>> 3:    *current->set_child_tid = reg;
>>> 4:    __disable_user_access()
>>>
>>> The problem is that we may have a sleeping function as argument which
>>> could clear SR_SUM causing the panic above. This was fixed by
>>> evaluating the argument of the put_user() macro outside the user-enabled
>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>> enabling user access")"
>>>
>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>> to avoid the same issue we had with put_user() and sleeping functions we
>>> must ensure code flow can go through switch_to() from within a region of
>>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>> patch addresses the problem allowing future work to enable full use of
>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>> on every access. Make switch_to() save and restore SR_SUM.
>>>
>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>> ---
>>> arch/riscv/include/asm/processor.h | 1 +
>>> arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>> arch/riscv/kernel/entry.S          | 8 ++++++++
>>> 3 files changed, 14 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/ 
>>> asm/processor.h
>>> index 5f56eb9d114a..58fd11c89fe9 100644
>>> --- a/arch/riscv/include/asm/processor.h
>>> +++ b/arch/riscv/include/asm/processor.h
>>> @@ -103,6 +103,7 @@ struct thread_struct {
>>>     struct __riscv_d_ext_state fstate;
>>>     unsigned long bad_cause;
>>>     unsigned long envcfg;
>>> +    unsigned long status;
> 
> Do we really need a new member field in `thread_struct`. We already have
> `sstatus` in `pt_regs` which reflects overall execution environment 
> situation
> for current thread. This gets saved and restored on trap entry and exit.
> 
> If we put `status` in `thread_struct` it creates ambiguity in terms of 
> which
> `status` to save to and pick from from future maintainibility purposes 
> as the
> fields get introduced to this CSR.
> 
> Why can't we access current trap frame's `sstatus` image in 
> `__switch_to` to
> save and restore?
> 
> Let me know if I am missing something obvious here. If there is a 
> complication,
> I am missing here and we do end up using this member field, I would 
> rename it
> to something like `status_kernel` to reflect that. So that future 
> changes are
> cognizant of the fact that we have split `status`. One for kernel 
> execution env
> per thread and one for controlling user execution env per thread.

This is so long ago now I cannot remember if there was any sstatus in
the pt_regs field, and if kernel threads have the same context as their
userland parts.

Does anyone else have any comment on this?

> 
>>>     u32 riscv_v_flags;
>>>     u32 vstate_ctrl;
>>>     struct __riscv_v_ext_state vstate;
>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- 
>>> offsets.c
>>> index 16490755304e..969c65b1fe41 100644
>>> --- a/arch/riscv/kernel/asm-offsets.c
>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>>     OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>     OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>     OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
