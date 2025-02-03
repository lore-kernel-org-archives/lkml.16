Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33D205AC4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591892; cv=none; b=fOTKyUK4CCtCDwxdJYSf/s0oMXfxcY78affDulylQPIZnfsQOqVWLaIv/QG1QBjAPxbDh6KIjT5RsFyvAtJiRPye8vgJ8utVidC4iepl+juWY14ofaQel7xtOv060Ds73K/sgQItRzDCuGrTizpCC1SWjL+lof1Fg//U3wb4XGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591892; c=relaxed/simple;
	bh=e4WI6nlbO2QB2lecyDNW645oNhnqQJgGNipivse3EEM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MMlaK8D4f/5XvIIb8NcQB+QppoNB6DjYMDESKAOItd8ZEbcAuC6WF4OJbhLBa16jaBgDcWb67/ww0pqsnowQYyC7fB2kbo4ubeg7S60m6QtBgZzUxEZ/7mXblLiw7EwQSutH2OnNRkihbra8OVdoLFzhMTPkAO4f9tCFQgYYKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjcB4Zti; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjcB4Zti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738591890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNYQqqcaTx+1LujPrCNfquIlXzhCGfQhCWwIk2yngjk=;
	b=UjcB4Ztiy5wlg+H4CUWSNn1qlisNMtG8lRxvtBNfc6EsPFqiIInDrx/WOzpIR0BkxA5aBC
	0HJiN9qKvVD9K7yHjdxlifk2dv+uHC18YvasMYw1+CxWD2bBjHeNDL55ZR6oIiCopH+mJm
	fx9OroiP4Kv0Ew2LnpVkpuBQwQS319E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-CXL7kDMkMjKhwnMMiyRO8w-1; Mon, 03 Feb 2025 09:11:28 -0500
X-MC-Unique: CXL7kDMkMjKhwnMMiyRO8w-1
X-Mimecast-MFC-AGG-ID: CXL7kDMkMjKhwnMMiyRO8w
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6eabd51cfso711103385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591888; x=1739196688;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNYQqqcaTx+1LujPrCNfquIlXzhCGfQhCWwIk2yngjk=;
        b=bYRuAhdKCHSLuhUC227LVcgRPCXV2jmmEXzJgTYHD8YdVYzRLGUWi6AGQ4a4ezLgVE
         EhcAUoKqOWkkONYBUXWswQJxhbbTn8JnVNbuWWB3bh1+OBjNNwjX3GFUqLqtyB9q1Vro
         hdUykw3BJzXnO8ujpeubmEhiIgZurvFB+yrudctPcCz5h4lUVvMsKo+rMmxzI8BDMkSl
         wqqJY7qoqgejUAOAPfoIj2XsGbQqVDrQfyd3XO0GuiqQt7q1P1UFtqDaXJ6DIIH/y9Z+
         QhAzYba7RAYnw+8cEKWY/ES/5VSOzX7dfhUZhqPeX+2YeeepHaiWKV8mvBE87pzb6cj7
         WSZg==
X-Forwarded-Encrypted: i=1; AJvYcCX9uWXX1KYXoG+IEPbxBJieNEvc7AUpO9JV1e9n1uNWVO7aYV9CD4iKGd4YmJcHiI+BfbJ2miWUvDrbHYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4NhfCsbo1HflTeK2zwoUbp3llM5Owp7IK2BG8TZEyNpblnNf
	aJKykVMFaWl6fHLcMNEQo6M/N/83BytvypO43ovca9Kb7JGTM9IWxGQmMp0t5lYV1m9t/7F8rer
	A9tlwfHX1hpj7Hc53+3PXmJPvA2nxh//TqtFIUKrMsL4KADfauqMUHoBO6YETxA==
X-Gm-Gg: ASbGncspgxqcJwLo8Hv69Xsxk8SickJ9w7/mYP/US6Xbd7p9c/4C9gqUQYjd7Y0V9W6
	FL95GbopVsfIKwFvAKGipHP5CBBaL4IWfSYbJlMJs8k+05lirmEH6Iefo3GSNR6NGliDuMvbpDL
	COGCRy3gSwga+p90BFfD/HeXugunfA3Low2/Kv2xbBWuJU6naXGZni0mHYkvA5vQAErhxWIH6Ut
	uszschZA40CWikAKFtDVb/0zAxNOVHpXJBxrxJ8o0CgyhgKwdQJAWq1vIV+2rQ5O5YKVLqN/Isn
	sEiCZbhMKbf3/qx4XYPWjRrRwO5ppD1heQiPMIBpC4WJm5x6
X-Received: by 2002:a05:620a:448d:b0:7b6:d050:7210 with SMTP id af79cd13be357-7bffcce2f1fmr3183669285a.15.1738591887732;
        Mon, 03 Feb 2025 06:11:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjD+jCw2nER7+iSm9yAuVY1GuQRJLX1EpeVReAXk/LQpcfRfxSaSg+KF4H7Le/CHmNlJ/psQ==
X-Received: by 2002:a05:620a:448d:b0:7b6:d050:7210 with SMTP id af79cd13be357-7bffcce2f1fmr3183662385a.15.1738591887266;
        Mon, 03 Feb 2025 06:11:27 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bbaf5sm530968185a.11.2025.02.03.06.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:11:26 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c263295e-0345-40a2-932e-b83c7728941c@redhat.com>
Date: Mon, 3 Feb 2025 09:11:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/lockdep: Disable KASAN instrumentation of
 lockdep.c
To: Peter Zijlstra <peterz@infradead.org>, Waiman Long <llong@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org
References: <20250131165020.878944-1-longman@redhat.com>
 <14eb5880-7df1-4717-8f6e-e667328c369d@redhat.com>
 <20250203112445.GE505@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20250203112445.GE505@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 6:24 AM, Peter Zijlstra wrote:
> On Fri, Jan 31, 2025 at 04:47:06PM -0500, Waiman Long wrote:
>> On 1/31/25 11:50 AM, Waiman Long wrote:
>>> Both KASAN and LOCKDEP are commonly enabled in building a debug kernel.
>>> Each of them can significantly slow down the speed of a debug kernel.
>>> Enabling KASAN instrumentation of the LOCKDEP code will further slow
>>> thing down.
>>>
>>> Since LOCKDEP is a high overhead debugging tool, it will never get
>>> enabled in a production kernel. The LOCKDEP code is also pretty mature
>>> and is unlikely to get major changes. There is also a possibility of
>>> recursion similar to KCSAN. As the small advantage of enabling KASAN
>>> instrumentation to catch potential memory access error is probably
>>> not worth the drawback of further slowing down a debug kernel, disable
>>> KASAN instrumentation to enable a debug kernel to gain a little bit of
>>> speed back.
>>>
>>> With a debug kernel with both LOCKDEP and KASAN enabled running on a
>>> 2-socket 144-thread system, the time to do a "make -j144" kernel build
>>> was 18m40.641s. After applying this patch, the parallel kernel build
>>> time was reduced to 17m35.136s. This is a reduction of about 66s (5.8%).
>>>
>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>> ---
>>>    kernel/locking/Makefile | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
>>> index 0db4093d17b8..8a588b0227b1 100644
>>> --- a/kernel/locking/Makefile
>>> +++ b/kernel/locking/Makefile
>>> @@ -6,6 +6,7 @@ KCOV_INSTRUMENT		:= n
>>>    obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
>>>    # Avoid recursion lockdep -> sanitizer -> ... -> lockdep.
>>> +KASAN_SANITIZE_lockdep.o := n
>>>    KCSAN_SANITIZE_lockdep.o := n
>>>    ifdef CONFIG_FUNCTION_TRACER
>> The rationale behind this patch is due to the fact that a similar configured
>> PREEMPT_RT debug kernel is found to be about 3 times slower than the non-RT
>> debug kernel. For the test same system, the parallel build runtime is
>> 59m56.722s. After applying this patch, it is reduced to 38m3.348s. Its more
>> than 1/3 reduction is more than I would have expected. So the lockdep code
>> is much more heavily used in a PREEMPT_RT debug kernel.
> Perhaps put that in the changelog instead?
>
> Its not like RT is this secret out of tree project :-)
>
> Also, any quick clues as to what causes the extra lockdep overhead?
> Initially I thought perhaps local-lock, but that should also cause
> lockdep on !RT builds.

Yes, I am planning to update the patch with more RT debug kernel 
performance data.

As to why, my guess is that the average nesting depth will be higher 
because spin_lock_irq* no longer disable IRQ and there is an extra wait 
lock underneath the rt-mutex. Also the increase in the number of 
sleep-wake cycles because of the sleeping lock nature of rt-spinlock may 
be a contributing factor.

Cheers,
Longman

Cheers,
Longman

