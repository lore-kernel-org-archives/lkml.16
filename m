Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F203156228
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506382; cv=none; b=sdLM1CkQmj+MJZyu9NC1CmgP4j3reWxxEFK/EOhgnsL3YO60hxkuTKieRrK0COc/6nhbF8rD9124YQzCaijtA7825uOq4flvOd4wUb2PPZa4xcpftlgrk9VEKvSAUdccKw7CwYFX8rH4PoIxaz77P1kshzegCXauYaGBzEx41Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506382; c=relaxed/simple;
	bh=s3A657NCobqmPaYShcnXS41Dp2qgYq8SlulUzcZXQCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8xlEMIHpxLRU7H/610uf8O1rqHorKg3QxiTZD+pHmmOG1pbLiNGH9fdjnrKBgN6RCRyL8NRDqiQaSQakj/ctxuowyH3Eflv8zj2eIBADDX38HVbJtYZBGi5+sF9ZYffPcU7rg5arHO+IU5UFhJVP/46Or9BGWtrAKa8rdgKAFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=I39m9HlF; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="I39m9HlF"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e15dc8035so38854539f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745506379; x=1746111179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yE0uV5DbxwJ1m2x+ijJ+zl26X5qcx9ZqXHltCrR4LE=;
        b=I39m9HlF9hZ0VirXR4DjbfINEqUYIFPWEm0yXq1DBEk5SqT2XnVuym1qNoFNomOgy6
         RCgCLtCzAsSKc45Ppvgu/ZBcRhRnf5s3kkEnI3dP5JVz9eC2qWpeC7fkzRZgWB9sWySC
         9U/Ogco0ybjd+DsPg/A0XOX4PyZjW9WsNQXNlD0xsbXNzMgOfs/A2i7cQRveC6nWPWzr
         Sx2ZH05Uw7ytqhWXtjReSbGvvk8eSFlbeq8KHOjTp9545H7RpoxA4o8NBl46j7owDVKb
         kAl2+EDE0hJ4aIQLNCOusBnpQWBQlQgO7eQJViB88zdXsQtQZ88nBFkenHxY98BvsD8w
         du/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506379; x=1746111179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yE0uV5DbxwJ1m2x+ijJ+zl26X5qcx9ZqXHltCrR4LE=;
        b=sq9EsReE2FlG0FTCFfwUkpvbicYd77byQkrJGurPG47dFTZCM7sswDaCFh69E40B4K
         AOmzsIc86bg0NYhP7w8Mpzmh4eE+BD4+R2ehr4sKLN3fAy/H/7YJTqdkbyJLVNhte/DY
         1NxaLXZoBzoYzm2sCnT2n4tFsE9anyl4SRlZe234Wi+h0OLZEykT2r1LxBo4BDA9XE8Q
         i62Bs0Ii9BgD1FkRZjq0nok9FrGk1zUhJKTE9jzwVddnudiI00C9B/Ru039y2l4g0Ml0
         VCwKHHzuxHCgIqv2N1D86f5YZpx0j8ac6dH8LMeehd7SB3hP961OOy9KMWYhpcRs0LpY
         pRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFg5nMQoPkYc1W4qHHHEHtG5hjQRvXegEv31q+1p5MVMXcKH/duYGan7ggbNBJThKq0dmbHb/8XkgTh3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhutQchMihQITx46Yz8GDxYzV2d768QY1eMw2MWC18c6XFix6
	iO/oTFw0zBKz3LJCrN9x1um21FthJqm7DGRO7+MHEYOXfXr/sxCPsNr9cPvNfP8=
X-Gm-Gg: ASbGncs0l2ZJAWaPytsAC5ATfdIpTah4YoAnW7SmhQBxbLvjwcofZ4I0ToFjBEOYc5O
	Cc8uhLYZVqQXCMn44Rw7z5TD63fizN3kcqaJ1Q7rzYIi5D4p/s6Z7PtblpZLStcwXBtz36WvEhS
	ZlLO0El95txnHz29y5LoBcHDZjTlgG0x0Kw+BjumqFzY/FpEzGpcjFMnp1oZntLIEUI5C/QEFwm
	B/fJkiCIEQclHDs7cncXS3avFT25x36tOz6uyTHIMU1u81Xe8Gw3hyuf8Xnlfx6ErnBpXTlk2sk
	WONLiKL7EQ9SDh3T9mWzioQv9wfpBZj+gs6a
X-Google-Smtp-Source: AGHT+IHmib9ahOC1dv2zniq5nwg6FnMJtZiIc3s8imDTqkDCv/YYE4iVYUjfL3mDW5W99/bqB+ghoQ==
X-Received: by 2002:a05:6602:7517:b0:85b:423a:1c20 with SMTP id ca18e2360f4ac-8644fa7e980mr381604139f.13.1745506379519;
        Thu, 24 Apr 2025 07:52:59 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864519ca71dsm21162439f.32.2025.04.24.07.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:52:58 -0700 (PDT)
Message-ID: <1ed67bb5-5d3d-4af8-b5a7-4f644186708b@kernel.dk>
Date: Thu, 24 Apr 2025 08:52:57 -0600
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
 <52d55891-36e3-43e7-9726-a2cd113f5327@kernel.dk>
 <cac3a5c9-e798-47f2-81ff-3c6003c6d8bb@kernel.dk>
 <CANHzP_uJft1FPJ0W++0Zp5rUjayaULEdpAQRn1VuuqDVq3DmJA@mail.gmail.com>
 <5c20b5ca-ce41-43c4-870a-c50206ab058d@kernel.dk>
 <CANHzP_u2SA3uSoG-4LQ-e9BvW6t-Zo1wn8qnKM0xYGoekL74bA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CANHzP_u2SA3uSoG-4LQ-e9BvW6t-Zo1wn8qnKM0xYGoekL74bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 8:45 AM, ??? wrote:
> Jens Axboe <axboe@kernel.dk> ?2025?4?24??? 22:13???
>>
>> On 4/24/25 8:08 AM, ??? wrote:
>>> Jens Axboe <axboe@kernel.dk> ?2025?4?24??? 06:58???
>>>>
>>>> On 4/23/25 9:55 AM, Jens Axboe wrote:
>>>>> Something like this, perhaps - it'll ensure that io-wq workers get a
>>>>> chance to flush out pending work, which should prevent the looping. I've
>>>>> attached a basic test case. It'll issue a write that will fault, and
>>>>> then try and cancel that as a way to trigger the TIF_NOTIFY_SIGNAL based
>>>>> looping.
>>>>
>>>> Something that may actually work - use TASK_UNINTERRUPTIBLE IFF
>>>> signal_pending() is true AND the fault has already been tried once
>>>> before. If that's the case, rather than just call schedule() with
>>>> TASK_INTERRUPTIBLE, use TASK_UNINTERRUPTIBLE and schedule_timeout() with
>>>> a suitable timeout length that prevents the annoying parts busy looping.
>>>> I used HZ / 10.
>>>>
>>>> I don't see how to fix userfaultfd for this case, either using io_uring
>>>> or normal write(2). Normal syscalls can pass back -ERESTARTSYS and get
>>>> it retried, but there's no way to do that from inside fault handling. So
>>>> I think we just have to be nicer about it.
>>>>
>>>> Andrew, as the userfaultfd maintainer, what do you think?
>>>>
>>>> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
>>>> index d80f94346199..1016268c7b51 100644
>>>> --- a/fs/userfaultfd.c
>>>> +++ b/fs/userfaultfd.c
>>>> @@ -334,15 +334,29 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>>>>         return ret;
>>>>  }
>>>>
>>>> -static inline unsigned int userfaultfd_get_blocking_state(unsigned int flags)
>>>> +struct userfault_wait {
>>>> +       unsigned int task_state;
>>>> +       bool timeout;
>>>> +};
>>>> +
>>>> +static struct userfault_wait userfaultfd_get_blocking_state(unsigned int flags)
>>>>  {
>>>> +       /*
>>>> +        * If the fault has already been tried AND there's a signal pending
>>>> +        * for this task, use TASK_UNINTERRUPTIBLE with a small timeout.
>>>> +        * This prevents busy looping where schedule() otherwise does nothing
>>>> +        * for TASK_INTERRUPTIBLE when the task has a signal pending.
>>>> +        */
>>>> +       if ((flags & FAULT_FLAG_TRIED) && signal_pending(current))
>>>> +               return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, true };
>>>> +
>>>>         if (flags & FAULT_FLAG_INTERRUPTIBLE)
>>>> -               return TASK_INTERRUPTIBLE;
>>>> +               return (struct userfault_wait) { TASK_INTERRUPTIBLE, false };
>>>>
>>>>         if (flags & FAULT_FLAG_KILLABLE)
>>>> -               return TASK_KILLABLE;
>>>> +               return (struct userfault_wait) { TASK_KILLABLE, false };
>>>>
>>>> -       return TASK_UNINTERRUPTIBLE;
>>>> +       return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, false };
>>>>  }
>>>>
>>>>  /*
>>>> @@ -368,7 +382,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>>>         struct userfaultfd_wait_queue uwq;
>>>>         vm_fault_t ret = VM_FAULT_SIGBUS;
>>>>         bool must_wait;
>>>> -       unsigned int blocking_state;
>>>> +       struct userfault_wait wait_mode;
>>>>
>>>>         /*
>>>>          * We don't do userfault handling for the final child pid update
>>>> @@ -466,7 +480,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>>>         uwq.ctx = ctx;
>>>>         uwq.waken = false;
>>>>
>>>> -       blocking_state = userfaultfd_get_blocking_state(vmf->flags);
>>>> +       wait_mode = userfaultfd_get_blocking_state(vmf->flags);
>>>>
>>>>          /*
>>>>           * Take the vma lock now, in order to safely call
>>>> @@ -488,7 +502,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>>>          * following the spin_unlock to happen before the list_add in
>>>>          * __add_wait_queue.
>>>>          */
>>>> -       set_current_state(blocking_state);
>>>> +       set_current_state(wait_mode.task_state);
>>>>         spin_unlock_irq(&ctx->fault_pending_wqh.lock);
>>>>
>>>>         if (!is_vm_hugetlb_page(vma))
>>>> @@ -501,7 +515,11 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>>>
>>>>         if (likely(must_wait && !READ_ONCE(ctx->released))) {
>>>>                 wake_up_poll(&ctx->fd_wqh, EPOLLIN);
>>>> -               schedule();
>>>> +               /* See comment in userfaultfd_get_blocking_state() */
>>>> +               if (!wait_mode.timeout)
>>>> +                       schedule();
>>>> +               else
>>>> +                       schedule_timeout(HZ / 10);
>>>>         }
>>>>
>>>>         __set_current_state(TASK_RUNNING);
>>>>
>>>> --
>>>> Jens Axboe
>>> I guess the previous io_work_fault patch might have already addressed
>>> the issue sufficiently. The later patch that adds a timeout for
>>> userfaultfd might
>>
>> That one isn't guaranteed to be safe, as it's not necessarily a safe
>> context to prune the conditions that lead to a busy loop rather than the
>> normal "schedule until the condition is resolved". Running task_work
>> should only be done at the outermost point in the kernel, where the task
>> state is known sane in terms of what locks etc are being held. For some
>> conditions the patch will work just fine, but it's not guaranteed to be
>> the case.
>>
>>> not be necessary  wouldn?t returning after a timeout just cause the
>>> same fault to repeat indefinitely again? Regardless of whether the
>>> thread is in UN or IN state, the expected behavior should be to wait
>>> until the page is filled or the uffd resource is released to be woken
>>> up, which seems like the correct logic.
>>
>> Right, it'll just sleep timeout for a bit as not to be a 100% busy loop.
>> That's unfortunately the best we can do for this case... The expected
>> behavior is indeed to schedule until we get woken, however that just
>> doesn't work if there are signals pending, or other conditions that lead
>> to TASK_INTERRUPTIBLE + schedule() being a no-op.
>>
>> --
>> Jens Axboe
> In my testing, clearing the NOTIFY flag in the original io_work_fault
> ensures that the next schedule correctly waits. However, adding a

That's symptom fixing again - the NOTIFY flag is the thing that triggers
for io_uring, but any legitimate signal (or task_work added with
signaling) will cause the same issue.

> timeout causes the issue to return to multiple faults again.
> Also, after clearing the NOTIFY flag in handle_userfault,
> it?s possible that some task work hasn?t been executed.
> But if task_work_run isn?t added back, tasks might get lost?
> It seems like there isn?t an appropriate place to add it back.
> So, do you suggest adjusting the fault frequency in userfaultfd
> to make it more rhythmic to alleviate the issue?

The task_work is still there, you just removed the notification
mechanism that tells the kernel that there's task_work there. For this
particular case, you could re-set TIF_NOTIFY_SIGNAL at the end after
schedule(), but again it'd only fix that specific one case, not the
generic issue.

What's the objection to the sleep approach? If the task is woken by the
fault being filled, it'll still wake on time, no delay. If not, then it
prevents a busy loop, which is counterproductive.

-- 
Jens Axboe
