Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9013E02A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503999; cv=none; b=X/X5PHy1do4r2CQEQBHttBx5jaiYTrGtfqqEsCpDVwF2R7qJci6jdG4OYLH4rGi9wO2Z/TVsxmz1L2z/cjga54QlX6WI3o8g8xE5akVqYKdKeR58kAwCYCro6V2E1j7ZlBkkQK3wC2VKLZuPSbHyeqob67eOplqX+OK30QXG2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503999; c=relaxed/simple;
	bh=B6M0blk0x7gzQfl4V7yoC30BjjphrqR3MjZWIhAuJas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+MxkrfdKs361CVUK3PLlQJ2EqnEgdT50Ga7rOyZkKENRZPNGtgLaP+Vv5wwRwoFuY3cX9Rs4v11C21G8unKWNNTkHAKF6VQ3Ib2/QiiN3qidyGjh+b2aYV0gj1nS/wdBLmhX9SofyCXP2WjPSIxU3ZNSufbq4mgOlf1LeBBsjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XEfSe3KG; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XEfSe3KG"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85e751cffbeso92503839f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745503995; x=1746108795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fd31tuMqcDYEf3YOh3nb9hbCE7tpXTrqaGBK0QTTKgc=;
        b=XEfSe3KGOCFk6l5PBeKbt0O2X2WLtsG1UaosHB04azCWOeO/k/rPQBYjttuJq4yip1
         8e8lVxvR4qVFxLObQ9e4DLxjDhPU6ug/X+fE9HKgFcKoWLB9+7sgqKMwN+dh18hobw8s
         jwEDqB9tiY/w82MTuQcF19y5AhLYO9+TviSK+ZBt1qUxuMXZB2YM7YxNfMbnddq7NlzF
         Bn8Q+N2BI/ROlsnvsfwY/FqFU4iqOdtrIVrd32dzwEjK2by5PUQVERTLeh+10FByH/uS
         aNj6UAcc8wwhR5MNMaFZyGrQMMb0GhXYk0kqP25acAccKNr3J7men7uyHXpdv3DC7y1A
         L6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503995; x=1746108795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fd31tuMqcDYEf3YOh3nb9hbCE7tpXTrqaGBK0QTTKgc=;
        b=hihrhMmQBDZHg7LTpXsYA0oJnXAwp5SQ1/8SGKTDJcjawY8bQyQtP9iq4OA11NrCng
         4taKzMzJPeGAvZZOBFzXVU+a6FQxqjmGAGDIGm/p+r4Ptx1ckukuak0dmAUTX4Fye0C2
         aVCdJb6xBa3tBGDFoGubVAKWP8yFALMgc/VF9NJ69E3QYqfAo1StJudq5qRdYF4ZQsh1
         KbZjHOkVuYBaylJVDv8gl7xcm8PoddS+2hwAxilQVy8fM2Ld6wR/z6IFAPTH3IO/Yl4u
         oIDw1+nEYcuu2URcwUJWLNOvWrzPcRraz5YUOamaOLj3ZbLU7hkZA7UOc6eNJRcRoH3H
         zZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUfmG5rhi0mT2vpjezhq/dHMwwrF67OGmrR0LmNSVA0RthUpXfRJG14hOTxIpUOGmqsOWhHOQHfgmV+tq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZaGAxxZ6WPk/qrjPxwFDcQadCvmPOwOO3b7SZR9s8pI7o1Qj
	LVssfx2TcORtSDH7qt0SgA5qNptFE9pSQbpqtaX7q6XhmfLzaguks3bA2qEABww=
X-Gm-Gg: ASbGnct4UrY/QnAzlcQdrm8SSwXBuyCNRqtSCUnBuCEJNsLZ1nRnQtt+TRRLhcPe5IT
	xoqWkn+twwJBbRWBByOOFRA3xQaPp6Qlfnk0n+pQCH5glW14fvc1ZVPl5zkyCGSl3uW9pwNJPe5
	Z2JRQgtOBSB44UeyABjcYiMTB+toyPpb0nB3SoJrneZgHxsUG0yBUz2wZKyNgfAmIAMJmTWX3P8
	KtghZK14EEo4RCreNQ/yNTeSeANoCYyvQLpYvZGhaz8LeXLAE8FJ585GzsovoC5AuWgGJbu8p+e
	z6/ZHUAu2av2H3CCBUIFV2YcE60U4lfk8PW3
X-Google-Smtp-Source: AGHT+IEYHzLjHult/C3OCAnnN70ZyOtQR7NOtOT3xPstQU442NKdq7lUb6GFqX933ULAUPG/kkbK/w==
X-Received: by 2002:a05:6602:6d07:b0:861:c4cf:cae8 with SMTP id ca18e2360f4ac-8644f99fbe6mr297485339f.2.1745503995399;
        Thu, 24 Apr 2025 07:13:15 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864518de4e9sm20913439f.16.2025.04.24.07.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:13:14 -0700 (PDT)
Message-ID: <5c20b5ca-ce41-43c4-870a-c50206ab058d@kernel.dk>
Date: Thu, 24 Apr 2025 08:13:13 -0600
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
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CANHzP_uJft1FPJ0W++0Zp5rUjayaULEdpAQRn1VuuqDVq3DmJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 8:08 AM, ??? wrote:
> Jens Axboe <axboe@kernel.dk> ?2025?4?24??? 06:58???
>>
>> On 4/23/25 9:55 AM, Jens Axboe wrote:
>>> Something like this, perhaps - it'll ensure that io-wq workers get a
>>> chance to flush out pending work, which should prevent the looping. I've
>>> attached a basic test case. It'll issue a write that will fault, and
>>> then try and cancel that as a way to trigger the TIF_NOTIFY_SIGNAL based
>>> looping.
>>
>> Something that may actually work - use TASK_UNINTERRUPTIBLE IFF
>> signal_pending() is true AND the fault has already been tried once
>> before. If that's the case, rather than just call schedule() with
>> TASK_INTERRUPTIBLE, use TASK_UNINTERRUPTIBLE and schedule_timeout() with
>> a suitable timeout length that prevents the annoying parts busy looping.
>> I used HZ / 10.
>>
>> I don't see how to fix userfaultfd for this case, either using io_uring
>> or normal write(2). Normal syscalls can pass back -ERESTARTSYS and get
>> it retried, but there's no way to do that from inside fault handling. So
>> I think we just have to be nicer about it.
>>
>> Andrew, as the userfaultfd maintainer, what do you think?
>>
>> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
>> index d80f94346199..1016268c7b51 100644
>> --- a/fs/userfaultfd.c
>> +++ b/fs/userfaultfd.c
>> @@ -334,15 +334,29 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>>         return ret;
>>  }
>>
>> -static inline unsigned int userfaultfd_get_blocking_state(unsigned int flags)
>> +struct userfault_wait {
>> +       unsigned int task_state;
>> +       bool timeout;
>> +};
>> +
>> +static struct userfault_wait userfaultfd_get_blocking_state(unsigned int flags)
>>  {
>> +       /*
>> +        * If the fault has already been tried AND there's a signal pending
>> +        * for this task, use TASK_UNINTERRUPTIBLE with a small timeout.
>> +        * This prevents busy looping where schedule() otherwise does nothing
>> +        * for TASK_INTERRUPTIBLE when the task has a signal pending.
>> +        */
>> +       if ((flags & FAULT_FLAG_TRIED) && signal_pending(current))
>> +               return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, true };
>> +
>>         if (flags & FAULT_FLAG_INTERRUPTIBLE)
>> -               return TASK_INTERRUPTIBLE;
>> +               return (struct userfault_wait) { TASK_INTERRUPTIBLE, false };
>>
>>         if (flags & FAULT_FLAG_KILLABLE)
>> -               return TASK_KILLABLE;
>> +               return (struct userfault_wait) { TASK_KILLABLE, false };
>>
>> -       return TASK_UNINTERRUPTIBLE;
>> +       return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, false };
>>  }
>>
>>  /*
>> @@ -368,7 +382,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>         struct userfaultfd_wait_queue uwq;
>>         vm_fault_t ret = VM_FAULT_SIGBUS;
>>         bool must_wait;
>> -       unsigned int blocking_state;
>> +       struct userfault_wait wait_mode;
>>
>>         /*
>>          * We don't do userfault handling for the final child pid update
>> @@ -466,7 +480,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>         uwq.ctx = ctx;
>>         uwq.waken = false;
>>
>> -       blocking_state = userfaultfd_get_blocking_state(vmf->flags);
>> +       wait_mode = userfaultfd_get_blocking_state(vmf->flags);
>>
>>          /*
>>           * Take the vma lock now, in order to safely call
>> @@ -488,7 +502,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>          * following the spin_unlock to happen before the list_add in
>>          * __add_wait_queue.
>>          */
>> -       set_current_state(blocking_state);
>> +       set_current_state(wait_mode.task_state);
>>         spin_unlock_irq(&ctx->fault_pending_wqh.lock);
>>
>>         if (!is_vm_hugetlb_page(vma))
>> @@ -501,7 +515,11 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>>
>>         if (likely(must_wait && !READ_ONCE(ctx->released))) {
>>                 wake_up_poll(&ctx->fd_wqh, EPOLLIN);
>> -               schedule();
>> +               /* See comment in userfaultfd_get_blocking_state() */
>> +               if (!wait_mode.timeout)
>> +                       schedule();
>> +               else
>> +                       schedule_timeout(HZ / 10);
>>         }
>>
>>         __set_current_state(TASK_RUNNING);
>>
>> --
>> Jens Axboe
> I guess the previous io_work_fault patch might have already addressed
> the issue sufficiently. The later patch that adds a timeout for
> userfaultfd might

That one isn't guaranteed to be safe, as it's not necessarily a safe
context to prune the conditions that lead to a busy loop rather than the
normal "schedule until the condition is resolved". Running task_work
should only be done at the outermost point in the kernel, where the task
state is known sane in terms of what locks etc are being held. For some
conditions the patch will work just fine, but it's not guaranteed to be
the case.

> not be necessary  wouldn?t returning after a timeout just cause the
> same fault to repeat indefinitely again? Regardless of whether the
> thread is in UN or IN state, the expected behavior should be to wait
> until the page is filled or the uffd resource is released to be woken
> up, which seems like the correct logic.

Right, it'll just sleep timeout for a bit as not to be a 100% busy loop.
That's unfortunately the best we can do for this case... The expected
behavior is indeed to schedule until we get woken, however that just
doesn't work if there are signals pending, or other conditions that lead
to TASK_INTERRUPTIBLE + schedule() being a no-op.

-- 
Jens Axboe
