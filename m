Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540128F1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810026; cv=none; b=rAG914254yGRjRrg4A2tMfu+6684lWSxMrhh5/ZDzr3Pm3kqwQcUljBJEtDbabXX4ZbdIE2pdlX426eSb2sJGxVHlU+HxhgWKG9VH93bLtKrgUYRzvygNbZjN+0dwe0pqOwI+Icm12trsSG5qUYGKBuk1Y34veM6C8AIrxEvJ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810026; c=relaxed/simple;
	bh=Y5O7F5xo9lhA0fnWTT2b3nOG1h07arKYtkBAvBlqBwI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YtbPd3sDtU8d51KqhZmA5B1FCdHfIy0Oku6bfmOgeZ+b3K3Yi9apeoEielj2eBJv/nPrXGZ73kJXz4IE+/9qoNDGOTcxEKp0XhsPsBKB+7AjhEdxprQUeHWCffTDz2jeyIN3DdLOdJlw5Mutne0Og1zJqR5X3zNsYoLOrdTQIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHKk2lo2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHKk2lo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738810023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/vDY+I8hXgzKrK6IBkFtYydJAlJfKrxma6B3QDUxrs=;
	b=HHKk2lo2+lBhr/PpLxJGVnp/f+DS3mth0t/X3zmYs4c5GCVMg32QQ9KQPZi8Hi2WkGRbm+
	Tu2bvhG1lWctBlDehq48bqCObBL9pT4O7j4D5wi4qC31V/1qjY3/MyCfCCzxaiHJ709izL
	0y76h8Va+dOiYDE1pJ6M1sE3XfDZikk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-r4BUa5nOMnaNRpAvl53WTw-1; Wed, 05 Feb 2025 21:47:02 -0500
X-MC-Unique: r4BUa5nOMnaNRpAvl53WTw-1
X-Mimecast-MFC-AGG-ID: r4BUa5nOMnaNRpAvl53WTw
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6ccb09f9so34321685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 18:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738810022; x=1739414822;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/vDY+I8hXgzKrK6IBkFtYydJAlJfKrxma6B3QDUxrs=;
        b=qJ98sAgPCPL+dz8JzBDcI8ey4vEvw2Zx+4rf11Ch7d7DHBR6jd6p07MJK5/eRw6jal
         /UDH63FJI3mVQa4GN5XMFSTgibZLljfArsdqbH2ZyNLCw/2j0mJaL0S30uwoBJukBnRn
         EAPQPp9LhVbPcJdxj6mHo72H7gohOwyea803zojRU5qnGzvo9CK3b0UMgrzbMxsLykP+
         KIngSpqyEIAlna5lfWcEr0+SlVfU4BfsEr1nFTwd1Spzf/uf8t3m4go68Am0LZRLUsdB
         CN5QwUphofBLXMpaDjf5zV/pDHTmE0mkZ2hiLRQDBB1ErYiofPxiMbHLkimSkFWiJzFx
         wvPw==
X-Forwarded-Encrypted: i=1; AJvYcCWy9myP8I9qFp+zUug3ByVCFvU9OMcdBLaaGZ1srHjb3510ilDyMqVdo/RVYq+hcM+X6ll+Qzm4HL3jYq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gpG9ZygEvMRanSh/eMrCsbbdWR3CtcTLoKeB3ZBaPlo0ClWG
	mg3uX3KN2LLRBzawboX8R+EbHKI5MDz7ohdRdhTOST4Qk3GLzlDrmj7Xs3MVUR5EV9oXYOgXP8P
	fOfcorOZNc6M+Gnl+4QQY0pDfL6kpccGR01aU2A/eRD/aTQBCs2tQILpiQroMpQ==
X-Gm-Gg: ASbGncu8PSxruH+EX8eK/fc13jIEq6Hn4XSYcnsp6akIkvhpK/sMAPHD220kylZJ+Kl
	K9rUy47lAs11bBbxaYEpF2qY+UggjGzx/ymcDnc1gmev7wzR9q5gwUx2R6JYIb1Gc8zwuIj0Ce3
	qidWyQv4Bkc76JLWOS71ACXq3NAnhFmdaEhqIrEgEIfaAmFHM/8R6YGTw86s8zE7DudX4qtQVCg
	FMv343KXnSkxSeJw4+KUf30cWSPcBbUMSvgza30kSicascXHb6gHX8UdlmlgfskWh0FXTEUSFL1
	eiJ52NkxNhX/kc/WjY2crsinIf7INZCriakREunegGnHH7kL
X-Received: by 2002:a05:620a:198b:b0:7b6:7618:d7ce with SMTP id af79cd13be357-7c039f97e6amr760925585a.10.1738810021984;
        Wed, 05 Feb 2025 18:47:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi/AGym7X7QEk7n4HoPe2nRqUvFwKx7QMMPDDwIbboCBw38IldtWizCE/Fl9U9XVZs3R8qYw==
X-Received: by 2002:a05:620a:198b:b0:7b6:7618:d7ce with SMTP id af79cd13be357-7c039f97e6amr760923985a.10.1738810021657;
        Wed, 05 Feb 2025 18:47:01 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ed0304sm16240785a.115.2025.02.05.18.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 18:47:01 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <cf3a8f45-683e-4fbc-bee7-cfae73d9061c@redhat.com>
Date: Wed, 5 Feb 2025 21:46:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nmi: Add an emergency handler in nmi_desc & use it
 in nmi_shootdown_cpus()
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>
References: <20241219150653.349177-1-longman@redhat.com> <87a5b0oihc.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87a5b0oihc.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 4:20 AM, Thomas Gleixner wrote:
> On Thu, Dec 19 2024 at 10:06, Waiman Long wrote:
>> Depending on the type of panics, it was found that the
>> __register_nmi_handler() function can be called in NMI context from
>> nmi_shootdown_cpus() leading to a lockdep splat like the following.
>>
>> [ 1123.133573] ================================
>> [ 1123.137845] WARNING: inconsistent lock state
>> [ 1123.142118] 6.12.0-31.el10.x86_64+debug #1 Not tainted
>> [ 1123.147257] --------------------------------
>> [ 1123.151529] inconsistent {INITIAL USE} -> {IN-NMI} usage.
>>    :
>> [ 1123.261544]  Possible unsafe locking scenario:
>> [ 1123.261544]
>> [ 1123.267463]        CPU0
>> [ 1123.269915]        ----
>> [ 1123.272368]   lock(&nmi_desc[0].lock);
>> [ 1123.276122]   <Interrupt>
>> [ 1123.278746]     lock(&nmi_desc[0].lock);
>> [ 1123.282671]
>> [ 1123.282671]  *** DEADLOCK ***
>>    :
>> [ 1123.314088] Call Trace:
>> [ 1123.316542]  <NMI>
>> [ 1123.318562]  dump_stack_lvl+0x6f/0xb0
>> [ 1123.322230]  print_usage_bug.part.0+0x3d3/0x610
>> [ 1123.330618]  lock_acquire.part.0+0x2e6/0x360
>> [ 1123.357217]  _raw_spin_lock_irqsave+0x46/0x90
>> [ 1123.366193]  __register_nmi_handler+0x8f/0x3a0
>> [ 1123.374401]  nmi_shootdown_cpus+0x95/0x120
>> [ 1123.378509]  kdump_nmi_shootdown_cpus+0x15/0x20
>> [ 1123.383040]  native_machine_crash_shutdown+0x54/0x160
>> [ 1123.388095]  __crash_kexec+0x10f/0x1f0
>> [ 1123.421465]  ? __ghes_panic.cold+0x4f/0x5d
>> [ 1123.482648]  </NMI>
> Can you please trim backtraces properly according to documentation:
>
>      https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages
>
Thanks for the pointer, will trim down the backtrace.

>> In this particular case, the following panic message was printed before.
>> One way to address this problem is to remove all the panic() calls from
>> NMI context, but that can be too restrictive.
>>
>> Another way to fix this problem while allowing panic() calls from
> Fix it by doing ....
>
>> NMI context is by adding a new emergency NMI handler to the nmi_desc
>> structure and provide a new set_emergency_nmi_handler() helper to
>> atomically set crash_nmi_callback() in any context. The new emergency
>> handler will preempt other handlers in the linked list. That will
>> eliminate the need to take any lock and serve the panic in NMI use case.
>> +/*
>> + * An emergency handler can be set in any context including NMI
>> + */
>>   struct nmi_desc {
>>   	raw_spinlock_t lock;
>> +	nmi_handler_t emerg_handler;	/* Emergency handler */
> This tail comment is not only useless
>
>> +/**
>> + * set_emergency_nmi_handler - Set emergency handler
>> + * @type:    NMI type
>> + * @handler: the emergency handler to be stored
>> + * Return: 0 if success, -EEXIST if a handler had been stored
>> + *
>> + * Atomically set an emergency NMI handler which, if set, will preempt all
>> + * the other handlers in the linked list. If a NULL handler is passed in,
>> + * it will clear it.
>> + */
>> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
>> +{
>> +	struct nmi_desc *desc = nmi_to_desc(type);
>> +	nmi_handler_t orig = NULL;
>> +
>> +	if (!handler) {
>> +		orig = READ_ONCE(desc->emerg_handler);
>> +		WARN_ON_ONCE(!orig);
>> +	}
>> +
>> +	if (try_cmpxchg(&desc->emerg_handler, &orig, handler))
>> +		return 0;
> What's the point of this cmpxchg()? What's the concurrency problem this
> tries to address?
It is because I am not sure if there can only be one instance of 
nmi_shootdown_cpus() at any time. If there can't be more than one 
instance, I can remove the atomic instruction. I do remove the smp_wmb() 
in nmi_shootdown_cpus(). If I don't use an atomic instruction, I will 
have to add it smp_wmb() here.
>
>> +	if (WARN_ON_ONCE(orig == handler))
>> +		return 0;
>> +	WARN_ONCE(1, "%s: failed to set emergency NMI handler!\n", __func__);
>> +	return -EEXIST;
> These return values are there to be ignored at the only call site. So
> what's the point of having them in the first place?

The first version of the patch did check the return value. I will change 
it to a void function.

Thanks for the review.

Cheers,
Longman

