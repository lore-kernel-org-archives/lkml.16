Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9972BF3DF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944213; cv=none; b=MZmwgqNmyIjbQTezfCeqEANWQqknOSy4g+P/d8og4ulYR8uKB5GexlJ2b1Fs8Wj8kR/lvc0MF/XZPsV/TWCs6GnwM+fwT+hrS/WeiFHJ0av85U3u4767pCaXUoGFqjugP8zCyJqbrAw/zhIULX2msGfaEdT0e2oF5nRtDCOX+JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944213; c=relaxed/simple;
	bh=JosPJvpRh/NgQ0NpOwqec6dkBGy+XSuFPBiRxmnah2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsoqZ/mTF4BcuVyvO5U8SZiECBql6BWArcHgqpUrffU7m9WjqjEpFxJ91C/72cHL8I4JYhq3tepXonfZ6+jPbQIg5CjJx7ntRtpjt5biVrl3P2SZ2Jqr5shC8uLva18MXKbEvtXO3IJUtIKtwmKNFNnKQs8A5Ijy0GVv0F96OFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=sZAL/ND0; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="sZAL/ND0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=whPVdRW90Uq7P8jdzr92MHqEADsPnt/XYxyLRyhHXE0=; b=sZAL/ND0xKsx4j/CvSURgabriz
	UDdFwjcXpD7VjEQa8EhHqdSRXrfdibD2957UYVH29tqn9Ytu9Wwee9XJjS1F2i/5/F2qQZElu5RSg
	5xhbJucwxWhr528zcwKip07Sj5shF/j7JFapFB6Y/6XWx1zmqj4JO97nSwatGKONgg8LFTKYrJGcs
	YUIabTGVqpgtZXT+niqL/TxuFBUWPSkB/Sy0QL5KOUAIFIncBKvnZ3AME694wN1MEhvYnWskyieSt
	+DqwSLv9PrcO7+RC/uJBc5p1mqXlw6Mi1fxkZBOICkUO1r8+K4jxcJsk5sfPTHeiDlqC0Ha0+UDBs
	e23cwxxg==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uIC8G-000ggc-B2; Thu, 22 May 2025 21:03:13 +0100
Message-ID: <61ce249d-4c3e-4b49-b29a-3f04865e083b@codethink.co.uk>
Date: Thu, 22 May 2025 21:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Samuel Holland <samuel.holland@sifive.com>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Cyril Bur <cyrilbur@tenstorrent.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, charlie@rivosinc.com, jrtc27@jrtc27.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
 <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
 <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
 <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
 <CAFTtA3NXatSV91_iAqj5+vxnMi14+TFNSET6Pm-UY7YrhspAfw@mail.gmail.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAFTtA3NXatSV91_iAqj5+vxnMi14+TFNSET6Pm-UY7YrhspAfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: ben.dooks@codethink.co.uk

On 22/05/2025 18:40, Andy Chiu wrote:
> Hi Samuel and Alex,
> 
> On Wed, May 21, 2025 at 10:35 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Hi Samuel,
>>
>> On 5/21/25 15:38, Samuel Holland wrote:
>>> Hi Alex, Ben,
>>>
>>> On 2025-05-21 3:26 AM, Ben Dooks wrote:
>>>> On 22/04/2025 11:22, Alexandre Ghiti wrote:
>>>>> Hi Cyril,
>>>>>
>>>>> On 10/04/2025 09:05, Cyril Bur wrote:
>>>>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>
>>>>>> When threads/tasks are switched we need to ensure the old execution's
>>>>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>>>>> restored.
>>>>>>
>>>>>> The issue was seen under heavy load especially with the syz-stress tool
>>>>>> running, with crashes as follows in schedule_tail:
>>>>>>
>>>>>> Unable to handle kernel access to user memory without uaccess routines
>>>>>> at virtual address 000000002749f0d0
>>>>>> Oops [#1]
>>>>>> Modules linked in:
>>>>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>>>> Hardware name: riscv-virtio,qemu (DT)
>>>>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>>>     ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>>>     ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>>>     gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>>>     t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>>>     s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>>>     a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>>>     a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>>>     s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>>>     s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>>>     s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>>>     s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>>>     t5 : ffffffc4043cafba t6 : 0000000000040000
>>>>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>>>> 000000000000000f
>>>>>> Call Trace:
>>>>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>>>> Dumping ftrace buffer:
>>>>>>       (ftrace buffer empty)
>>>>>> ---[ end trace b5f8f9231dc87dda ]---
>>>>>>
>>>>>> The issue comes from the put_user() in schedule_tail
>>>>>> (kernel/sched/core.c) doing the following:
>>>>>>
>>>>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>>>> {
>>>>>> ...
>>>>>>            if (current->set_child_tid)
>>>>>>                    put_user(task_pid_vnr(current), current->set_child_tid);
>>>>>> ...
>>>>>> }
>>>>>>
>>>>>> the put_user() macro causes the code sequence to come out as follows:
>>>>>>
>>>>>> 1:    __enable_user_access()
>>>>>> 2:    reg = task_pid_vnr(current);
>>>>>> 3:    *current->set_child_tid = reg;
>>>>>> 4:    __disable_user_access()
>>>>>>
>>>>>> The problem is that we may have a sleeping function as argument which
>>>>>> could clear SR_SUM causing the panic above. This was fixed by
>>>>>> evaluating the argument of the put_user() macro outside the user-enabled
>>>>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>>>>> enabling user access")"
>>>>>>
>>>>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>>>>> to avoid the same issue we had with put_user() and sleeping functions we
>>>>>> must ensure code flow can go through switch_to() from within a region of
>>>>>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>>>>> patch addresses the problem allowing future work to enable full use of
>>>>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>>>>> on every access. Make switch_to() save and restore SR_SUM.
>>>>>>
>>>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>>>> ---
>>>>>>     arch/riscv/include/asm/processor.h | 1 +
>>>>>>     arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>>>>     arch/riscv/kernel/entry.S          | 8 ++++++++
>>>>>>     3 files changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/ asm/
>>>>>> processor.h
>>>>>> index 5f56eb9d114a..58fd11c89fe9 100644
>>>>>> --- a/arch/riscv/include/asm/processor.h
>>>>>> +++ b/arch/riscv/include/asm/processor.h
>>>>>> @@ -103,6 +103,7 @@ struct thread_struct {
>>>>>>         struct __riscv_d_ext_state fstate;
>>>>>>         unsigned long bad_cause;
>>>>>>         unsigned long envcfg;
>>>>>> +    unsigned long status;
>>>>>>         u32 riscv_v_flags;
>>>>>>         u32 vstate_ctrl;
>>>>>>         struct __riscv_v_ext_state vstate;
>>>>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- offsets.c
>>>>>> index 16490755304e..969c65b1fe41 100644
>>>>>> --- a/arch/riscv/kernel/asm-offsets.c
>>>>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>>>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>>>         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>>>         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>>>         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>>>>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>>>>>>         OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>>>>>         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>>>>> @@ -346,6 +347,10 @@ void asm_offsets(void)
>>>>>>               offsetof(struct task_struct, thread.s[11])
>>>>>>             - offsetof(struct task_struct, thread.ra)
>>>>>>         );
>>>>>> +    DEFINE(TASK_THREAD_STATUS_RA,
>>>>>> +          offsetof(struct task_struct, thread.status)
>>>>>> +        - offsetof(struct task_struct, thread.ra)
>>>>>> +    );
>>>>>>         DEFINE(TASK_THREAD_F0_F0,
>>>>>>               offsetof(struct task_struct, thread.fstate.f[0])
>>>>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>>>>> index 33a5a9f2a0d4..00bd0de9faa2 100644
>>>>>> --- a/arch/riscv/kernel/entry.S
>>>>>> +++ b/arch/riscv/kernel/entry.S
>>>>>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>>>>>         REG_S s9,  TASK_THREAD_S9_RA(a3)
>>>>>>         REG_S s10, TASK_THREAD_S10_RA(a3)
>>>>>>         REG_S s11, TASK_THREAD_S11_RA(a3)
>>>>>> +
>>>>>> +    /* save the user space access flag */
>>>>>> +    li    s0, SR_SUM
>>>>>
>>>>> This is not needed anymore ^ but I'll remove it when merging your patchset.
>>>>>
>>>> Could you be more specific about what "this" is?
>>>>
>>>> If we don't save/restore the SR_SUM bit I think our old friend
>>>> the sched_tail bug will just return.
>>> I think Alex is saying the `li` instruction above is not needed because s0 is
>>> unused. But instead I think there is an `and` instruction missing here. The
>>> patch as merged ORs the entirety of the old sstatus with the new sstatus, not
>>> just the SUM bit, which seems extremely dangerous.
>>
> 
> Thanks for noticing this. I've also spent a bit of time pondering...
> 
> If this were an "and" instruction, I think we should rename the struct
> to "status_sum" to prevent confusions, as it only holds the SUM bit
> now. Or maybe we could create a bitfield "any only touch "and
> save/restore" the specified bit.
> 
> Thanks,
> Andy

So, is it worth just saving/restoring all the flags in the SSTATUS
or do we need to have some sort of mask (and if so, are there other
flags we should make sure get saved?)

I don't have time to setup a test system at the moment and I am out
of office until Tuesday 27th anyway with limited email access to my
codethink emails.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
