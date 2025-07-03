Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF2114B092
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556691; cv=none; b=q5p4P7ug9lk/EcULEkywxxH1SEhAXAxqxfDyt3coT46xBOs8OntEmwxh7xRt6nTT4D7x5DphBQQXXOD8nNXDrmXYWNgkRxKxWUYa5ndkBgbz88AEqCwS125i8GIPPiJfbJZ1/pMLdJSWweX3Hv4jTbKy08wmmHy01Qv5Xn/SzUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556691; c=relaxed/simple;
	bh=pc9OEeAJ9+xYaNUV4fdpysQKPNlGMC0ARIBerxFTA6w=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nVaOEH3aJqfA1KrgqMV78+Za6HrUwvvefDLpIcvWMCXmLn49WOstAmT8RN145Gkd7B6a4W/bhjIu614XcMYiv/oY9rLYxM25UCNX0Ot4QUvgQL+Q1GDvm86mNqxnEWWKVbbhLVxBht3Zh6jJ354GqM+yGr+F4wfM4K3ZHz74wVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GMv4YoXf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GMv4YoXf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748d982e97cso99067b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751556689; x=1752161489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QErbVzt9aJhbR9gTNXrZUX3xujrRTj9RW/I/kl5NW0o=;
        b=GMv4YoXfYtDBy4KpUoqV/z1OcdkZgSK3ZAQzpRE3AD8159WAes4JNBCiDHx6AImxHi
         5cLEFHOyVAu+vKbEuHtZCAXLuFlWCt16RJ3YjDhlHc8PO0w7BiaZpCJIzbhhlWf1/F4t
         zAB5R1Q8DyRUJD1HAIx/6cT2w021KjvD2yQw3jEHXLVAXCyTORYJEVAmbpAJ0QNHmP7W
         Nj/4zOOZbp8YzVjTm/G58sQjMpdey+EBb6TlTaZvWTPkH6ntB7J4iRPeTZW3LmtzDE4/
         G6CWJi48QalVQpWdhdbq+f+pYD9B00nGIb/s87doYsbj/obbccbrVFm9aD++Z9Gqz3R2
         jY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556689; x=1752161489;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QErbVzt9aJhbR9gTNXrZUX3xujrRTj9RW/I/kl5NW0o=;
        b=ELrJ1ZV6s9QpZT6EaNK+jtzrgWJOgMJ+0bLIj75oQ2EX3geSpVOwd7PwyzTNEC0BsM
         xW+ydFz6gIC0CDdS11A0Pr+ii/j6Qs5H6Vs3ykPQBwtx8LpQKEH8VkXL6HbhBpisWa3D
         rXnf3p4HNi5W4Ty1TBeUrLqyFEo88idyHjoz+NCS+0LmaIiBmW9/ZXzrFnIMfJsertEQ
         cVp68Fk4ugajxcF+cpZZZqm6oFbPrN6I6QWv64iHRHAUQsT8cMkc5XbgfVh1C9NSxUET
         c6S9EVNf3gptgclgJcuMc+wbAdeYFYMAl6d4uKTtAFN46jtYJR4ha1jqRFHjrZkAa2yB
         EfGw==
X-Gm-Message-State: AOJu0Yxz4rGZjz0VCCJwXqSgPxvywU8ZH6OWH8mO/XD1LwEFYSz5u8CM
	UE5dA3x2aWjYgpVHXeyVngJskLfX9vSoVsMfzIX88S4opOe0kolDBGJSOqoEYtxrwbg=
X-Gm-Gg: ASbGncvUqe2kLHlmGPuavIAsMEq2H0/HhFqClthV0/UTYm1k/kr8PDu7GvdyeVnCVcY
	TsZpZ/jvfDIwi3Z0IfMLRXL5D/on5vno+igD5RGfESM2dRbZD960HiZ/cZW+Qpf7Gd5Vbyh/Scc
	oYlnsPnO8dN2lDltNjAEn01Aup3O4x1f6KxJmTi8u7vBdFmbeE+Z9vtJKkq8Y2RqZUt0yeyk/p3
	NN+Y9bpGdwkY6BYvZa+gJOdga01rFJ5uiOVsBx9VgsvsmLqOGAAJ3Qet6XVJHN3qhZee4CrgtkR
	VhtVDzICBZi17gVzAFqMLYtozsBgbE8Iu0oKvvctCTgJ98Wx5eyOLvcSIEd6g0s82K9icUiLKm7
	bHyigfA==
X-Google-Smtp-Source: AGHT+IE95ek35Wr9lyJqPKav33JmLnLhLXVgMybhtizTLpGwZswShofGBH4D1YtgVNocuzP8SLiG+w==
X-Received: by 2002:a05:6a00:c8f:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74ca8490964mr4771557b3a.21.1751556688955;
        Thu, 03 Jul 2025 08:31:28 -0700 (PDT)
Received: from [10.4.60.76] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57e1699sm16516937b3a.149.2025.07.03.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:31:28 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
X-Google-Original-From: Liangyan <liangyan.peng@google.com>
Message-ID: <f3608ef2-1d9f-406c-92f3-fa69486e1644@google.com>
Date: Thu, 3 Jul 2025 23:31:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [RFC] genirq: Fix lockup in handle_edge_irq
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Yicong Shen
 <shenyicong.1023@bytedance.com>, ziqianlu@bytedance.com,
 songmuchun@bytedance.com, yuanzhu@bytedance.com
References: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
 <87a55mlok9.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87a55mlok9.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Thomas,

We have this softlockup issue in guest vm, so the related IRQ is from 
virtio-net tx queue, the interrupt controller is virt pci msix 
controller, related components have pci_msi_controller, virtio_pci, 
virtio_net and qemu.

And according to qemu msix.c source code, when irq is unmasked, it will 
fire new one if the msix pending bit is set.
Seems that for msi-x controller, it will not lose interrupt during 
unmask period.

For this virt MSIX controller, do you have some suggestion? Thanks.

Regards,
Liangyan


On 2025/7/2 21:17, Thomas Gleixner wrote:
> On Wed, Jul 02 2025 at 00:35, Liangyan wrote:
>>   void handle_edge_irq(struct irq_desc *desc)
>>   {
>> +	bool need_unmask = false;
>> +
>>   	guard(raw_spinlock)(&desc->lock);
>>   
>>   	if (!irq_can_handle(desc)) {
>> @@ -791,12 +793,16 @@ void handle_edge_irq(struct irq_desc *desc)
>>   		if (unlikely(desc->istate & IRQS_PENDING)) {
>>   			if (!irqd_irq_disabled(&desc->irq_data) &&
>>   			    irqd_irq_masked(&desc->irq_data))
>> -				unmask_irq(desc);
>> +				need_unmask = true;
>>   		}
>>   
>>   		handle_irq_event(desc);
>>   
>>   	} while ((desc->istate & IRQS_PENDING) && !irqd_irq_disabled(&desc->irq_data));
>> +
>> +	if (need_unmask && !irqd_irq_disabled(&desc->irq_data) &&
>> +	    irqd_irq_masked(&desc->irq_data))
>> +		unmask_irq(desc);
> 
> This might work in your setup by some definition of "works", but it
> breaks the semantics of this handler because of this:
> 
> device interrupt        CPU0                            CPU1
>                          handle_edge_irq()
>                          set(INPROGRESS);
> 
>                          do {
>                                 handle_event();
> 
> device interrupt
>                                                          handle_edge_irq()
>                                                             if (INPROGRESS) {
>                                                               set(PENDING);
>                                                               mask();
>                                                               return;
>                                                             }
> 
>                                 ...
>                                 if (PENDING) {
>                                    need_unmask = true;
>                                 }
>                                 handle_event();
> 
> device interrupt   << possible FAIL
> 
> because there are enough edge type interrupt controllers out there which
> lose an edge when the line is masked at the interrupt controller
> level. As edge type interrupts are fire and forget from the device
> perspective, the interrupt is not retriggered when unmasking later.
> 
> That's the reason why this handler is written the way it is and this
> cannot be changed for obvious reasons.
> 
> So no, this is not going to happen.
> 
> The only possible solution for this is to analyze all interrupt
> controllers, which are involved in the delivery chain, and establish
> whether they are affected by the above problem. If not, then that
> particular delivery chain combination of interrupt controllers can be
> changed to use a different flow handler along with a profound
> explanation why this is correct under all circumstances.
> 
> As you failed to provide any information about the involved controllers,
> I cannot even give any hint about a possible solution.
> 
> Thanks,
> 
>          tglx
> 
> 

