Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345E9281537
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331205; cv=none; b=Wk85YV0FlZdW2UMM4AodODJlNVqtls49ARBZDmmeeKd/BM4ivUPnblmv7WC4oLtDex7muam75De0PN/zs6j/1fvogIfbjbXA546wE3Otiio/j+Tpem27I6+CcTLYwUC7cJgGLXCOwogBt9Ipm6sTnAkGUYQ6fjZrzvIBRCI7WB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331205; c=relaxed/simple;
	bh=qur72rcPg9p2Vj9qw82Z6e/LUgC0MBT3UTvpo0xOtp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyryhDtjKnVyQQplek8e6e0rrv5AUIixm0JMpxDoNloJOElz5QQY+v1wN8J79I7D3TDr+pOvb/tQbuLBYnZOzP9sGkdN8RxP4Eg4C/e5ptu26YOjM//gRv+RWogqgNq6cMmEANMOSkzGbDskUAhsAbCFzZ9/LeR2tVmNTxmqunk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=v8weGwsr; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="v8weGwsr"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so15721995ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745331202; x=1745936002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QR8zq+WeURJcQJZtbdR5JK1T9fRJKOc9/cP5khZOT8Q=;
        b=v8weGwsrTXSgGfCbkoui+IAADyzs4GpNn/BaPJ+2N+tsCo4rbgmYwktFMtrgD18mKX
         YgVrMQ75dm+BtbJv/jlMaE2T5pMXPVwgmOEJgtQm8DaNCiK6Zc0z/KberBOYwLY4VPGX
         84Ek8V2qsTcS8korQAab87dUnXi8P8LJy0yEcbjmzVu+WF6Gno16JFDsISzSH1CbBs69
         Q7O6hvZaUS8lTuxR+7dSLmittxZHOe11WZWiMDe9FZcx6iHjePvKJZ63ZwpLEpGDfNjd
         J3r7YQfcfPJjmNiPZxWJyJITeUaT921D10cDKCRrbCoBWOExXK2lPNP5ewP/l+NE2kSG
         q/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331202; x=1745936002;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR8zq+WeURJcQJZtbdR5JK1T9fRJKOc9/cP5khZOT8Q=;
        b=rwWLqJAy5387iYerqr+DI/LPn5gSIYJZYDKfPNl4XZgqK78uvKJa7lbhvItc1KQoyW
         eyMtkUs8S9lco3ndAKNSuFGCe9IID6R8wer6UoNK3G0NFyToALczO77Lr549+zl/4cx9
         zwwaG5Nk8aK6kDC4vPENGjudOqERN8ITHsExuwXp1eU9yArrtrgTUIGyYHGTX9UQeUFr
         NahTXRucBDWwMg6Q9oAGrfOd3KqCmwq7LnensqYlp6zdgFcvZM5TRpcfERkjVOSPXyrI
         /W/F7kGR0DZf9MxkgHWRcs9Z+4Mlk+2jPR6lfrtjX3tM9f/Mn9d4nCglGo1nozLFEMn3
         X0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWDDFOaERiUTsfYpvV0BOvTXn7W6D9mTP/J9JZ5Ge6rnZKpFJOdh3U4MRsj0V+6XbiNkbbFMENxNSde+Gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyegkFBADRK6CJ6TeB+1d3MJpdf8PIQegWF802p6p+HxaH/IXNZ
	lQ7ShWVFzMdC8cQlzZA2K9mUfZWrQMULWyf1kdrfkNpHHZ5cPZq/bnRWwhWKypg=
X-Gm-Gg: ASbGncuJrTCQPvyu68wMYXOkNwmPM497RFzAmpXE+mLSUcZSdmf0oofJ2M8YMkxqExD
	jdK7MXSASjidz9vm4mYKG+oWye3ShS3qAl838RMvHMut00+p1Wq0dqHl8gguCN+fE5sdI4isXtj
	mHgEn6kg8DIMysGlzTnFgB1akwYluaT8GNeYVBYy4LIuWh/s7Z9bas76CxTwnpsPi8WyYPujSBc
	05IJFGpbTL9rj5pLK6O5cFH5p2MmR62n01HyW4PvsIPyR7rpPGXDCQWAZ7TgszWWA2TS904Oeid
	DgIIMyE/tsxUSmoMoHkC8stu2u8CAqhPeC69fw==
X-Google-Smtp-Source: AGHT+IHWzI0Wn75AyMi9DGxMOkS03WlRiBtxZ7rlcgm58ABO0oLpJVq/2ieK8hF5G5HQ2V0a9+w1wA==
X-Received: by 2002:a05:6e02:3183:b0:3d8:1d7c:e197 with SMTP id e9e14a558f8ab-3d88ed95743mr178064425ab.7.1745331202189;
        Tue, 22 Apr 2025 07:13:22 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a37cbb4fsm2354342173.16.2025.04.22.07.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:13:21 -0700 (PDT)
Message-ID: <028b4791-b6fc-47e3-9220-907180967d3a@kernel.dk>
Date: Tue, 22 Apr 2025 08:13:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix 100% CPU usage issue in IOU worker threads
To: =?UTF-8?B?5aec5pm65Lyf?= <qq282012236@gmail.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 akpm@linux-foundation.org, peterx@redhat.com, asml.silence@gmail.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20250422104545.1199433-1-qq282012236@gmail.com>
 <bc68ea08-4add-4304-b66b-376ec488da63@kernel.dk>
 <CANHzP_tpNwcL45wQTb6yFwsTU7jUEnrERv8LSc677hm7RQkPuw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CANHzP_tpNwcL45wQTb6yFwsTU7jUEnrERv8LSc677hm7RQkPuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 8:10 AM, ??? wrote:
> On Tue, Apr 22, 2025 at 9:35?PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 4/22/25 4:45 AM, Zhiwei Jiang wrote:
>>> In the Firecracker VM scenario, sporadically encountered threads with
>>> the UN state in the following call stack:
>>> [<0>] io_wq_put_and_exit+0xa1/0x210
>>> [<0>] io_uring_clean_tctx+0x8e/0xd0
>>> [<0>] io_uring_cancel_generic+0x19f/0x370
>>> [<0>] __io_uring_cancel+0x14/0x20
>>> [<0>] do_exit+0x17f/0x510
>>> [<0>] do_group_exit+0x35/0x90
>>> [<0>] get_signal+0x963/0x970
>>> [<0>] arch_do_signal_or_restart+0x39/0x120
>>> [<0>] syscall_exit_to_user_mode+0x206/0x260
>>> [<0>] do_syscall_64+0x8d/0x170
>>> [<0>] entry_SYSCALL_64_after_hwframe+0x78/0x80
>>> The cause is a large number of IOU kernel threads saturating the CPU
>>> and not exiting. When the issue occurs, CPU usage 100% and can only
>>> be resolved by rebooting. Each thread's appears as follows:
>>> iou-wrk-44588  [kernel.kallsyms]  [k] ret_from_fork_asm
>>> iou-wrk-44588  [kernel.kallsyms]  [k] ret_from_fork
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_wq_worker
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_worker_handle_work
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_wq_submit_work
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_issue_sqe
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_write
>>> iou-wrk-44588  [kernel.kallsyms]  [k] blkdev_write_iter
>>> iou-wrk-44588  [kernel.kallsyms]  [k] iomap_file_buffered_write
>>> iou-wrk-44588  [kernel.kallsyms]  [k] iomap_write_iter
>>> iou-wrk-44588  [kernel.kallsyms]  [k] fault_in_iov_iter_readable
>>> iou-wrk-44588  [kernel.kallsyms]  [k] fault_in_readable
>>> iou-wrk-44588  [kernel.kallsyms]  [k] asm_exc_page_fault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] exc_page_fault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] do_user_addr_fault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] handle_mm_fault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] hugetlb_fault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] hugetlb_no_page
>>> iou-wrk-44588  [kernel.kallsyms]  [k] hugetlb_handle_userfault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] handle_userfault
>>> iou-wrk-44588  [kernel.kallsyms]  [k] schedule
>>> iou-wrk-44588  [kernel.kallsyms]  [k] __schedule
>>> iou-wrk-44588  [kernel.kallsyms]  [k] __raw_spin_unlock_irq
>>> iou-wrk-44588  [kernel.kallsyms]  [k] io_wq_worker_sleeping
>>>
>>> I tracked the address that triggered the fault and the related function
>>> graph, as well as the wake-up side of the user fault, and discovered this
>>> : In the IOU worker, when fault in a user space page, this space is
>>> associated with a userfault but does not sleep. This is because during
>>> scheduling, the judgment in the IOU worker context leads to early return.
>>> Meanwhile, the listener on the userfaultfd user side never performs a COPY
>>> to respond, causing the page table entry to remain empty. However, due to
>>> the early return, it does not sleep and wait to be awakened as in a normal
>>> user fault, thus continuously faulting at the same address,so CPU loop.
>>> Therefore, I believe it is necessary to specifically handle user faults by
>>> setting a new flag to allow schedule function to continue in such cases,
>>> make sure the thread to sleep.
>>>
>>> Patch 1  io_uring: Add new functions to handle user fault scenarios
>>> Patch 2  userfaultfd: Set the corresponding flag in IOU worker context
>>>
>>>  fs/userfaultfd.c |  7 ++++++
>>>  io_uring/io-wq.c | 57 +++++++++++++++---------------------------------
>>>  io_uring/io-wq.h | 45 ++++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 68 insertions(+), 41 deletions(-)
>>
>> Do you have a test case for this? I don't think the proposed solution is
>> very elegant, userfaultfd should not need to know about thread workers.
>> I'll ponder this a bit...
>>
>> --
>> Jens Axboe
> Sorry,The issue occurs very infrequently, and I can't manually
> reproduce it. It's not very elegant, but for corner cases, it seems
> necessary to make some compromises.

I'm going to see if I can create one. Not sure I fully understand the
issue yet, but I'd be surprised if there isn't a more appropriate and
elegant solution rather than exposing the io-wq guts and having
userfaultfd manipulate them. That really should not be necessary.

-- 
Jens Axboe
