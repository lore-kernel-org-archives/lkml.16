Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702231CF5C0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827641; cv=none; b=cQeY2v15Ue6WxuVj99k/Kak95lq/IQFFBxK6jBwwYPX59ELhLKBFf2ryvdGwkvdyZFe5wZx//8gFLUQpX9/6wSsRqKCZYKE0/74H1VNC/gMgbQotIr4s8wgZ2n5/3aPRvdIn0XTeckSVdHIb7nZQB17yWBaIDg5zZSc7j7j7vT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827641; c=relaxed/simple;
	bh=Iq9SiqP/SrYlO2Ciq+e+kOyMVeKBtdiq/DBTcZmrtXI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=unYgZYq4SbmNkr+JIsNvDvjQxgnxa/h0ROWYKICsPpm1TB3VqNJ3iBglFzirrHR9x49uClJZ/B7uBoDCZDWYRFs51Zqjy5LcP7EbOgDpkhEHrS2583z2u3JstV1cZIS84CKZAhwEgN9HR9BIf2UM9aTmLi3Xftlv4Ej3BbSUNOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/Q6Tbz0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/Q6Tbz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749827638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTdAEVhFxean76TYCKC2N0pcvJegmW7ueG1c/kY0NJU=;
	b=T/Q6Tbz05iMstw9S/x899rMG6tKKrlsEDED3UQmcH2VzLjiRx/0lHHIMzMQDZQshwxFUEs
	wVlO4yvh1pcKj6rLIL0v2vNb5+51jM/m4FZ4oDbcio6c44mIxOP7Kv4e+i+VVJ54OLjAEy
	8TmnxGnPwHD9iAZKw8He5qbnn606tdA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-NtfK9PGENfyGT3uvM54rOA-1; Fri, 13 Jun 2025 11:13:57 -0400
X-MC-Unique: NtfK9PGENfyGT3uvM54rOA-1
X-Mimecast-MFC-AGG-ID: NtfK9PGENfyGT3uvM54rOA_1749827637
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d2107d6b30so340054985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827637; x=1750432437;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTdAEVhFxean76TYCKC2N0pcvJegmW7ueG1c/kY0NJU=;
        b=cMzJjBgVHnCYEPirnW3ObUQlNzsWjcF6xg5GR4njZp9tQPejPm8l6omXzFW+0r+x2K
         lUUCpiHSX8tat+xPWghBj2IIeQjrZjt+yQGnj5fJwS5wnehVuSXXk/sTaievalfUXCVF
         yvvHLFFGOQw2SCQwyBp38gaSCxsfHPcEpr3hdXmUZzoLwfvkxvtb3Md4NBaL0WHARFus
         VlPBwasi8wxKpmI4HKlKITH5Tk3AsPFRQtS2aVK4RqVrLDdNW/ujPTb2iEYeNNDcpA/O
         S1wEsclFtN66gONttsDlY5b1mxc0fFQL7WObv6qnJp5046Uwu+RtMc5rUABdrAhsoqUo
         qfMQ==
X-Gm-Message-State: AOJu0YwWBHot2/h0fAzYlmvAqKGKJRGyd4q9c9udqRn3eJSWXNoExzoI
	m8HtDJRFYV8OL5sMvnB0nk2jRvZtdpVpP8fyCTiP8iTd3eBXbvie8ap5n53NBaDFsA1rzrdRFME
	ygDJRUNlDxMccZdOg0CZzKpTUNiu4J+sSwsW032hFpw+O/vRmbiI2OqkKKcNS+I47ig==
X-Gm-Gg: ASbGncuo1aH70lDzqONmxomn9m8AplP4zOFc+oC/scgDKjheQ5G105MfO+Q+YNS+Rl/
	rbRBeX06CHMhss78brRBYy+XEwS99PTtnBPS50DzvHzxdYnXdyRpmGEGflyRaXYg96Jc7Gbhjme
	FhIiVp/b1umxyzT59Od++tdK2ldmDuiUQPwtk5PoZWeojm7UrFBEy0MH/wIFKEFHVnw0N3Lyr4V
	LShJ8iAMoANim+G+drEzVFfq5SQGJxnJU1Ykc9w09yLuOyle8rX6jWaG1mN7a+iRSC2CKYChdPi
	aMT6by88QviIB0+GCj6UWA6JDbuti5g2mLHI
X-Received: by 2002:a05:620a:288c:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3bc394f6bmr587033185a.13.1749827636645;
        Fri, 13 Jun 2025 08:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdhZWTluiSLqX2NkvDbcvdHfRYPnRTpIbh5n0+r1CSbAuSdPqSvC8eiuI2jZ6la9yY0TrnqA==
X-Received: by 2002:a05:620a:288c:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3bc394f6bmr587027585a.13.1749827636093;
        Fri, 13 Jun 2025 08:13:56 -0700 (PDT)
Received: from [192.168.21.4] ([216.228.39.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eacccfsm181773785a.66.2025.06.13.08.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:13:55 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b04ae490-0878-4d39-a6c8-406d4dd3728f@redhat.com>
Date: Fri, 13 Jun 2025 11:13:54 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer
 debug objects
To: Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20250606031539.1004644-1-longman@redhat.com>
 <20250606031539.1004644-4-longman@redhat.com> <87o6ussjld.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87o6ussjld.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/25 6:03 PM, Thomas Gleixner wrote:
> On Thu, Jun 05 2025 at 23:15, Waiman Long wrote:
>> A circular locking dependency lockdep splat was hit recently with a
>> debug kernel. The dependency chain (in reverse order) is:
>>
>>    -> #3 (&zone->lock){-.-.}-{2:2}:
>>    -> #2 (&base->lock){-.-.}-{2:2}:
>>    -> #1 (&console_sch_key){-.-.}-{2:2}:
>>    -> #0 (console_owner){..-.}-{0:0}:
>>
>> The last one is from calling printk() within the rmqueue_bulk() call in
>> mm/page_alloc.c. The "base->lock" is from lock_timer_base() and first
>> one is due to calling add_timer_on() leading to debug_object_activate()
>> doing actual memory allocation acquiring the zone lock.
>>
>> The console_sch_key comes from a s390 console driver in driver/s390/cio.
>> The console_sch_key -> timer dependency happens because the console
>> driver is setting a timeout value while holding its lock. Apparently it
>> is pretty common for a console driver to use timer for timeout or other
>> timing purposes. So this may happen to other console drivers as well.
>>
>> One way to break this circular locking dependency is to disallow any
>> memory allocation when a timer debug object is being handled. Do this by
>> setting the ODEBUG_FLAG_NO_ALLOC flag in the timer_debug_descr
>> structure.
> Well. I'm absolutely not convinced that this is the right approach.
>
> I have a hard time to find the printk() in rmqueue_bulk(). But if there
> is one then it has to go or has to be converted to a deferred printk()
> simply because that code can be called from so many contexts, which all
> can legitimately create a lock dependency chain into the console drivers
> in some way or the other. That's like invoking printk() from the guts of
> the scheduler or locking code.

Actually, rmqueue_bulk() calls expand() which, in turn, calls 
__add_to_free_list() and the printk() comes from the VM_WARN_ONCE() 
macro there.

In a sense, printk() is called because of some other issues in the mm code.

>
>> The figures below show the number of times the debug_objects_fill_pool()
>> function has reached the statement right before and after the no_alloc
>> check in initial bootup and after running a parallel kernel build on
>> a 2-socket 96-threads x86-64 system.
>>
>> 			 Before      After     non-timer %
>> 		 	 ------      -----     -----------
>>    Initial bootup	  150,730     148,198     98.3%
>>    Parallel kernel build 5,974,464   5,893,116     98.6%
>>
>> So from object pre-allocation perspective, timer debug objects represent
>> just a small slice of the total number of debug objects to be processed.
> That math is skewed due to the way how debugobjects handles the
> allocations for the global pool.
>
> The initial decision to attempt a refill is:
>
>      count < min_cnt
>
> where min_cnt = 256 + 16 * num_possible_cpus()
>
> That makes _one_ context go into the allocation path unless
>
>      count < min_cnt / 2
>
> which forces all contexts to try allocating in order not to deplete the
> pool.
>
> So let's assume we have 16 CPUs, then min_cnt = 512 and therefore
> min_cnt / 2 = 256.
>
> As the initial context which allocates when the count goes below 512
> might be preempted, the rest of the callers can lower the pool count to
> 256 easily.
>
> In the 0-day splat the debug_objects OOM happens from o2net_init():
>
> [ 92.566274][ T1] debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:785)
> [ 92.566777][ T1] init_timer_key (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/include/asm/jump_label.h:36
> [ 92.567230][ T1] o2net_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/tcp.c:2128 (discriminator 3))
> [ 92.567629][ T1] init_o2nm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/nodemanager.c:832)
> [ 92.568023][ T1] do_one_initcall (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1257)
>
> o2net_init() initializes 255 nodes and each node has three delayed works. Each
> delayed work contains a timer for which debugobjects needs to create a
> new tracking object. So with your brute force approach of disabling
> allocations for timers blindy o2net_init() can trivially deplete the
> pool.
>
> For the o2net case this requires that workqueue debugobjects are
> disabled, but you can't argue that this is silly because there are other
> code paths which do bulk initialization of timers w/o having a work
> involved.
>
> So using the percentage of timer operations for evaluating how this
> change can cause a debug object OOM is just bogus and wishful thinking.
>
> Let's take a step back and ask the obvious question, when there is
> actually consumption of debug objects happening:
>
>    1) For all dynamically initialized objects it happens in
>       debug_object_init()
>
>    2) For statically initialized objects it happens in
>       debug_object_activate()
>
> #2 is arguably irrelevant as there are not gazillions of statically
>     initialized objects, which are trackable by debugobjects
>
> #1 is the vast majority and the good news is that the initialization of
>     such objects (after allocation) happens mostly in preemptible context
>     with no locks held.
>
> So the obvious thing to try is not adding some random flag to timers
> (and tomorrow to RCU and work), but to restrict the allocation
> requirement to debug_object_init().
>
> Something like the untested below should make all of these headaches
> go away. Except for the general observation that debugobjects is not the
> only way to create nasty dependency chains into console driver locks,
> but that's a headache the MM folks have to sort out.
>
> Thanks,
>
>          tglx
> ---
>
> --- a/lib/debugobjects.c
> +++ b/lib/debugobjects.c
> @@ -811,8 +811,6 @@ int debug_object_activate(void *addr, co
>   	if (!debug_objects_enabled)
>   		return 0;
>   
> -	debug_objects_fill_pool();
> -
>   	db = get_bucket((unsigned long) addr);
>   
>   	raw_spin_lock_irqsave(&db->lock, flags);
> @@ -1000,8 +998,6 @@ void debug_object_assert_init(void *addr
>   	if (!debug_objects_enabled)
>   		return;
>   
> -	debug_objects_fill_pool();
> -
>   	db = get_bucket((unsigned long) addr);
>   
>   	raw_spin_lock_irqsave(&db->lock, flags);
>
Thanks for the suggestion. I will take further look at this problem.

Cheers,
Longman

