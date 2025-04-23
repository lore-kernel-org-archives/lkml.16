Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054B28B4EA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421011; cv=none; b=bT3ZxPXws/rR1rDOiHZFu2w1Hv1Nc73jhwTQY9pWha4j4sAQBYpEr65T0EZ+hs7viClAIcKKm7Z7z8ZZL8LAgJO5Qp78/NTBkdrKQ1VvPk1EeUmi8i9jwZ+6CWLi0e4AK9kdva/sHwJGnqbLvKwuWz6OS7NS59D6AzES5fZ4fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421011; c=relaxed/simple;
	bh=LC7JCUJS4QWeyXOsFACD1wBTkRXB0lqS4pQzhiqSD5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fo3M18trg9KpgE6zjqJz2atnF+//cEkudWgNt2HwZd+uW/+A2808MqLkLiVx90Ij8OZjc4KPUmqCJ177Lkm/h17pU88qXeEE5UYp0+O96nNp6rxVhOPL2kRRFlH7a8jVBvU0T/graVjHK1P67WZmQ0CHk34Gp34bX9AxkLqO+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ohM/sxOH; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ohM/sxOH"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so10006925ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745421008; x=1746025808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVtzp5jBz46gSgrSLkFhZmCpyerpZC6S/sX37NoDzKo=;
        b=ohM/sxOH9lC4J12RrIfbHrCkZiSzfVV3kdIFTjNUi+QpXQY0JyJJfPQj9NoLPp9QyU
         74wbCXePWWVNoWhNtL9blInQfmlFvmuHeKZaKQuhuYD4xzisMFmQwSYASkdpSkwSjCr1
         5ZrntPp6DaS4zgP3lLN+aCjzNWHHAVBCI0JbjLy3iILVrixsCx66R1RM7SEAA10GIneH
         ojuQuw+KYADS2SzTJUyWPFEbBa0ktfsu8YH6wmxc6CXPve/rrSeYTQ2g10sLfnE2cu3Y
         RcVpmGW0hBk0jyj36AG8315T09yqAx7yEtlzEV6yuFB3aNFz5h9/PRYNjFbLdJmeS0sx
         wClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421008; x=1746025808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVtzp5jBz46gSgrSLkFhZmCpyerpZC6S/sX37NoDzKo=;
        b=UOsW0GfqQPQp676iyZsdSXFGGxGuS8bXytL/5G3U4ajwXsp54BPrVNYvEozLNOEFbF
         6idZ3AZY+y+8rwBmKeQQcDY+vdUOpJnpxnc7KFTPASlaobEUxO38m7EqYVgGwazfUgcV
         pwywjhsh/n75YuqWeYg1AuLSADVPMZ9KyEo8+IfgxZetWDJ12kCZgyOLzzO8XrKCoOvU
         2TL3SNcmdQJYluHpmMfydhgtpzDOw22flJiRHUoRNKDRPyKJ14AA6voZS2my6KuS4yhu
         1E/KPNfQVLOvMCUiW11S/O/wl6hRIc5NWs4wDXKhTMXBQTn0PVZ3hDsznnfRGUZYL8g4
         //Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVaQlK1PsLE0zaQ0HKHO/la3sy6wfH0WmmLpD8sSg9M3mSUdN89P2ekO4fHDf99yNQ5BIyp1MTLnLjdmMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG62CD6HzCz+FL3tzqV9Gaw6ARyV9xJzMPycV53CUBaNonUocI
	FG5nVdtYUl8L/p15UGachzr8vwXx4VgIAUY3zzPlknFluETwOKzWpiGWStU5/1k=
X-Gm-Gg: ASbGncuE2G/563ZZscgLTBD+nYCwtiKnaEw4f9wX6DFxyc3GVHeiBFH5A1Trb7Xq+ut
	kmViTG+dhw+lMCIwBE5LPvKvEhzV9BbBV0YOJ/IXFj3sW0WnneLO0OKKtSVutHL7HhPCHpfIN8e
	HepMhTKs1hF5ntmdM+xpqHt/gvfCiiEETzoWKodobl1v8AjZ6bEZaEX2euKy+jXROXx/6pIEf2o
	l1iR4rENoENMgp4fmn8bKac0IcivdTfOm+PQIfPgqi8Sbtv2tUMw0WhjXjcbJm7RCFTtB26HFJa
	EmS5gPsCsTnRzcFki/+lHbFQ1/QHGbo5H8J7
X-Google-Smtp-Source: AGHT+IGWaqgergSUU7j5ZyOFziO8hOuodpV1IkCU8Rw87NpM9HTKa+sr8m8c+IGcGxytCncSHwPs8w==
X-Received: by 2002:a05:6e02:3bc7:b0:3a7:820c:180a with SMTP id e9e14a558f8ab-3d894286289mr185799635ab.19.1745421008003;
        Wed, 23 Apr 2025 08:10:08 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a399b34csm2778615173.142.2025.04.23.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:10:07 -0700 (PDT)
Message-ID: <bc80036e-2bca-481a-9901-c570d65ad960@kernel.dk>
Date: Wed, 23 Apr 2025 09:10:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] io_uring: Add new functions to handle user fault
 scenarios
To: =?UTF-8?B?5aec5pm65Lyf?= <qq282012236@gmail.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 akpm@linux-foundation.org, peterx@redhat.com, asml.silence@gmail.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20250422162913.1242057-1-qq282012236@gmail.com>
 <20250422162913.1242057-2-qq282012236@gmail.com>
 <14195206-47b1-4483-996d-3315aa7c33aa@kernel.dk>
 <CANHzP_uW4+-M1yTg-GPdPzYWAmvqP5vh6+s1uBhrMZ3eBusLug@mail.gmail.com>
 <b61ac651-fafe-449a-82ed-7239123844e1@kernel.dk>
 <CANHzP_tLV29_uk2gcRAjT9sJNVPH3rMyVuQP07q+c_TWWgsfDg@mail.gmail.com>
 <7bea9c74-7551-4312-bece-86c4ad5c982f@kernel.dk>
 <CANHzP_ui_TEPvr6wkWr42j46Sk5qHzZ+p0oo06BrNny52dPK9Q@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANHzP_ui_TEPvr6wkWr42j46Sk5qHzZ+p0oo06BrNny52dPK9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 8:29 AM, ??? wrote:
> Jens Axboe <axboe@kernel.dk> ?2025?4?23??? 21:34???
>>
>> On 4/22/25 8:49 PM, ??? wrote:
>>> On Wed, Apr 23, 2025 at 1:33?AM Jens Axboe <axboe@kernel.dk> wrote:
>>>>
>>>> On 4/22/25 11:04 AM, ??? wrote:
>>>>> On Wed, Apr 23, 2025 at 12:32?AM Jens Axboe <axboe@kernel.dk> wrote:
>>>>>>
>>>>>> On 4/22/25 10:29 AM, Zhiwei Jiang wrote:
>>>>>>> diff --git a/io_uring/io-wq.h b/io_uring/io-wq.h
>>>>>>> index d4fb2940e435..8567a9c819db 100644
>>>>>>> --- a/io_uring/io-wq.h
>>>>>>> +++ b/io_uring/io-wq.h
>>>>>>> @@ -70,8 +70,10 @@ enum io_wq_cancel io_wq_cancel_cb(struct io_wq *wq, work_cancel_fn *cancel,
>>>>>>>                                       void *data, bool cancel_all);
>>>>>>>
>>>>>>>  #if defined(CONFIG_IO_WQ)
>>>>>>> -extern void io_wq_worker_sleeping(struct task_struct *);
>>>>>>> -extern void io_wq_worker_running(struct task_struct *);
>>>>>>> +extern void io_wq_worker_sleeping(struct task_struct *tsk);
>>>>>>> +extern void io_wq_worker_running(struct task_struct *tsk);
>>>>>>> +extern void set_userfault_flag_for_ioworker(void);
>>>>>>> +extern void clear_userfault_flag_for_ioworker(void);
>>>>>>>  #else
>>>>>>>  static inline void io_wq_worker_sleeping(struct task_struct *tsk)
>>>>>>>  {
>>>>>>> @@ -79,6 +81,12 @@ static inline void io_wq_worker_sleeping(struct task_struct *tsk)
>>>>>>>  static inline void io_wq_worker_running(struct task_struct *tsk)
>>>>>>>  {
>>>>>>>  }
>>>>>>> +static inline void set_userfault_flag_for_ioworker(void)
>>>>>>> +{
>>>>>>> +}
>>>>>>> +static inline void clear_userfault_flag_for_ioworker(void)
>>>>>>> +{
>>>>>>> +}
>>>>>>>  #endif
>>>>>>>
>>>>>>>  static inline bool io_wq_current_is_worker(void)
>>>>>>
>>>>>> This should go in include/linux/io_uring.h and then userfaultfd would
>>>>>> not have to include io_uring private headers.
>>>>>>
>>>>>> But that's beside the point, like I said we still need to get to the
>>>>>> bottom of what is going on here first, rather than try and paper around
>>>>>> it. So please don't post more versions of this before we have that
>>>>>> understanding.
>>>>>>
>>>>>> See previous emails on 6.8 and other kernel versions.
>>>>>>
>>>>>> --
>>>>>> Jens Axboe
>>>>> The issue did not involve creating new worker processes. Instead, the
>>>>> existing IOU worker kernel threads (about a dozen) associated with the VM
>>>>> process were fully utilizing CPU without writing data, caused by a fault
>>>>> while reading user data pages in the fault_in_iov_iter_readable function
>>>>> when pulling user memory into kernel space.
>>>>
>>>> OK that makes more sense, I can certainly reproduce a loop in this path:
>>>>
>>>> iou-wrk-726     729    36.910071:       9737 cycles:P:
>>>>         ffff800080456c44 handle_userfault+0x47c
>>>>         ffff800080381fc0 hugetlb_fault+0xb68
>>>>         ffff80008031fee4 handle_mm_fault+0x2fc
>>>>         ffff8000812ada6c do_page_fault+0x1e4
>>>>         ffff8000812ae024 do_translation_fault+0x9c
>>>>         ffff800080049a9c do_mem_abort+0x44
>>>>         ffff80008129bd78 el1_abort+0x38
>>>>         ffff80008129ceb4 el1h_64_sync_handler+0xd4
>>>>         ffff8000800112b4 el1h_64_sync+0x6c
>>>>         ffff80008030984c fault_in_readable+0x74
>>>>         ffff800080476f3c iomap_file_buffered_write+0x14c
>>>>         ffff8000809b1230 blkdev_write_iter+0x1a8
>>>>         ffff800080a1f378 io_write+0x188
>>>>         ffff800080a14f30 io_issue_sqe+0x68
>>>>         ffff800080a155d0 io_wq_submit_work+0xa8
>>>>         ffff800080a32afc io_worker_handle_work+0x1f4
>>>>         ffff800080a332b8 io_wq_worker+0x110
>>>>         ffff80008002dd38 ret_from_fork+0x10
>>>>
>>>> which seems to be expected, we'd continually try and fault in the
>>>> ranges, if the userfaultfd handler isn't filling them.
>>>>
>>>> I guess this is where I'm still confused, because I don't see how this
>>>> is different from if you have a normal write(2) syscall doing the same
>>>> thing - you'd get the same looping.
>>>>
>>>> ??
>>>>
>>>>> This issue occurs like during VM snapshot loading (which uses
>>>>> userfaultfd for on-demand memory loading), while the task in the guest is
>>>>> writing data to disk.
>>>>>
>>>>> Normally, the VM first triggers a user fault to fill the page table.
>>>>> So in the IOU worker thread, the page tables are already filled,
>>>>> fault no chance happens when faulting in memory pages
>>>>> in fault_in_iov_iter_readable.
>>>>>
>>>>> I suspect that during snapshot loading, a memory access in the
>>>>> VM triggers an async page fault handled by the kernel thread,
>>>>> while the IOU worker's async kernel thread is also running.
>>>>> Maybe If the IOU worker's thread is scheduled first.
>>>>> I?m going to bed now.
>>>>
>>>> Ah ok, so what you're saying is that because we end up not sleeping
>>>> (because a signal is pending, it seems), then the fault will never get
>>>> filled and hence progress not made? And the signal is pending because
>>>> someone tried to create a net worker, and this work is not getting
>>>> processed.
>>>>
>>>> --
>>>> Jens Axboe
>>>         handle_userfault() {
>>>           hugetlb_vma_lock_read();
>>>           _raw_spin_lock_irq() {
>>>             __pv_queued_spin_lock_slowpath();
>>>           }
>>>           vma_mmu_pagesize() {
>>>             hugetlb_vm_op_pagesize();
>>>           }
>>>           huge_pte_offset();
>>>           hugetlb_vma_unlock_read();
>>>           up_read();
>>>           __wake_up() {
>>>             _raw_spin_lock_irqsave() {
>>>               __pv_queued_spin_lock_slowpath();
>>>             }
>>>             __wake_up_common();
>>>             _raw_spin_unlock_irqrestore();
>>>           }
>>>           schedule() {
>>>             io_wq_worker_sleeping() {
>>>               io_wq_dec_running();
>>>             }
>>>             rcu_note_context_switch();
>>>             raw_spin_rq_lock_nested() {
>>>               _raw_spin_lock();
>>>             }
>>>             update_rq_clock();
>>>             pick_next_task() {
>>>               pick_next_task_fair() {
>>>                 update_curr() {
>>>                   update_curr_se();
>>>                   __calc_delta.constprop.0();
>>>                   update_min_vruntime();
>>>                 }
>>>                 check_cfs_rq_runtime();
>>>                 pick_next_entity() {
>>>                   pick_eevdf();
>>>                 }
>>>                 update_curr() {
>>>                   update_curr_se();
>>>                   __calc_delta.constprop.0();
>>>                   update_min_vruntime();
>>>                 }
>>>                 check_cfs_rq_runtime();
>>>                 pick_next_entity() {
>>>                   pick_eevdf();
>>>                 }
>>>                 update_curr() {
>>>                   update_curr_se();
>>>                   update_min_vruntime();
>>>                   cpuacct_charge();
>>>                   __cgroup_account_cputime() {
>>>                     cgroup_rstat_updated();
>>>                   }
>>>                 }
>>>                 check_cfs_rq_runtime();
>>>                 pick_next_entity() {
>>>                   pick_eevdf();
>>>                 }
>>>               }
>>>             }
>>>             raw_spin_rq_unlock();
>>>             io_wq_worker_running();
>>>           }
>>>           _raw_spin_lock_irq() {
>>>             __pv_queued_spin_lock_slowpath();
>>>           }
>>>           userfaultfd_ctx_put();
>>>         }
>>>       }
>>> The execution flow above is the one that kept faulting
>>> repeatedly in the IOU worker during the issue. The entire fault path,
>>> including this final userfault handling code you're seeing, would be
>>> triggered in an infinite loop. That's why I traced and found that the
>>> io_wq_worker_running() function returns early, causing the flow to
>>> differ from a normal user fault, where it should be sleeping.
>>
>> io_wq_worker_running() is called when the task is scheduled back in.
>> There's no "returning early" here, it simply updates the accounting.
>> Which is part of why your patch makes very little sense to me, we
>> would've called both io_wq_worker_sleeping() and _running() from the
>> userfaultfd path. The latter doesn't really do much, it simply just
>> increments the running worker count, if the worker was previously marked
>> as sleeping.
>>
>> And I strongly suspect that the latter is the issue, not the marking of
>> running. The above loop is fine if we do go to sleep in schedule.
>> However, if there's task_work (either TWA_SIGNAL or TWA_NOTIFY_SIGNAL
>> based) pending, then schedule() will be a no-op and we're going to
>> repeatedly go through that loop. This is because the expectation here is
>> that the loop will be aborted if either of those is true, so that
>> task_work can get run (or a signal handled, whatever), and then the
>> operation retried.
>>
>>> However, your call stack appears to behave normally,
>>> which makes me curious about what's different about execution flow.
>>> Would you be able to share your test case code so I can study it
>>> and try to reproduce the behavior on my side?
>>
>> It behaves normally for the initial attempt - we end up sleeping in
>> schedule(). However, then a new worker gets created, or the ring
>> shutdown, in which case schedule() ends up being a no-op because
>> TWA_NOTIFY_SIGNAL is set, and then we just sit there in a loop running
>> the same code again and again to no avail. So I do think my test case
>> and your issue is the same, I just reproduce it by calling
>> io_uring_queue_exit(), but the exact same thing would happen if worker
>> creation is attempted while an io-wq worker is blocked
>> handle_userfault().
>>
>> This is why I want to fully understand the issue rather than paper
>> around it, as I don't think the fix is correct as-is. We really want to
>> abort the loop and allow the task to handle whatever signaling is
>> currently preventing proper sleeps.
>>
>> I'll dabble a bit more and send out the test case too, in case it'll
>> help on your end.
>>
>> --
>> Jens Axboe
> I?m really looking forward to your test case. Also, I?d like to
> emphasize one more point: the handle_userfault graph path I sent you,
> including the schedule function, is complete and unmodified. You can
> see that the schedule function is very, very short. I understand your
> point about signal handling, but in this very brief function graph, I
> haven?t yet seen any functions related to signal handling.
> Additionally, there is no context switch here, nor is it the situation
> where the thread is being scheduled back in. Perhaps the scenario
> you?ve reproduced is still different from the one I?ve encountered in
> some subtle way?

Ask yourself, why would schedule() return immediately rather than
actually block? There's a few cases here:

1) The task state is set to TASK_RUNNING - either because it was never
   set to TASK_INTERRUPTIBLE/TASK_UNINTERRUPTIBLE, or because someone
   raced and woke up the task after the initial check on whether it
   should be sleeping or not.

2) Some kind of notification or signal is pending. This is usually when
   task_sigpending() returns true, or if TIF_NOTIFY_SIGNAL is set. Those
   need clearing, and that's generally done on return to userspace.

#1 isn't the case here, but #2 looks highly plausible. The io-wq workers
rely on running this kind of work manually, and retrying. If we loop
further down with these conditions being true, then we're just busy
looping at that point and will NEVER sleep. You don't see any functions
related to signal handling etc EXACTLY because of that, there's nowhere
it gets run.

> void io_wq_worker_running(struct task_struct *tsk)
> {
> struct io_worker *worker = tsk->worker_private;
> 
> if (!worker)
> return;
> if (!test_bit(IO_WORKER_F_FAULT, &worker->flags)) {
> if (!test_bit(IO_WORKER_F_UP, &worker->flags))
> return;
> if (test_bit(IO_WORKER_F_RUNNING, &worker->flags))
> return;
> set_bit(IO_WORKER_F_RUNNING, &worker->flags);
> io_wq_inc_running(worker);
> }
> }
> However, from my observation during the crash live memory analysis,
> when this happens in the IOU worker thread, the
> IO_WORKER_F_RUNNING flag is set. This is what I said "early return",
> rather than just a simple accounting function.I look forward to your
> deeper analysis and any corrections you may have.

It's set becase of what I outlined above. If schedule() would actually
sleep, then io_wq_worker_sleeping() would've been called. The fact that
you're getting io_wq_worker_running() called without WORKER_F_RUNNING
cleared is because of that.

But you're too focused on the symptom here, not the underlying issue. It
doesn't matter at all that io_wq_worker_running() is called when the
task is already running, it'll just ignore that. It's explicitly tested.
Your patch won't make a single difference for this case because of that,
you're just wrapping what's esssentially a no-op call with another no-op
call, as you've now nested RUNNING inside the FAULT flag. It won't
change your outcome at all.

-- 
Jens Axboe
