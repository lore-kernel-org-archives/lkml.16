Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831628CF56
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332813; cv=none; b=pXuv3WeiY5RrPNWoL0Cvg8RoFydkL6DFthDEuoZI0GbUhmHR9EA8qYOILCVlk5NyxpWPmmQl/h5LkrsXcMJippP/gLHgNG+XmdTGw8Bq7sD4ljc3aJrBwPQS51FYm68fde0/oQ4fOzeBaSUhMDcoW7jWvFB3YcE4yys4As8Mux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332813; c=relaxed/simple;
	bh=yuLRPQMFA+GTdmMoSkE9Fopm0uOWFWq8xtDRFSpj/TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJ2krP6RlBTjPJ20L7J+L7UG38C0ObDC6KbqOcQK8H/HQoAzvM5JVJkqaZtG1qiRgj4ZN3rzVLdFy+malq0j7x4GOgQWALr6bQphpHkNnUF0h7wz/ZDYL/H3aEgelfC55HQLuQbcd/3FbXo285Mzhy+HZUpTTFj/149voV8IQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbMqjMZ1; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbMqjMZ1"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c1425fbfcso2581452a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745332811; x=1745937611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgDRifXaNYB0VqxMUzJ5WtdqZNW94oWMiLpSuETPS1E=;
        b=HbMqjMZ1EF7VPgNOvNxXKL0lA1rIt4C5M0sckAwzDHm/OY3wiZpDkThXS/9ZMQCy7b
         7qGX65lCSsSAA3i1ybAOzr+zRFb32TNK9F77SIa2qMK7XS/mRkABn8uUeZoHcNwJoe+A
         ud7QWc48HpWSZVDjpOje/1LKjymtD0o6DedUZOvz0h6tiemonDMPwFpw1c6aXy8evavF
         a5C43ZkF+npg6bs+T7hsykhbgnJTik3qRQy1tAI/NAxhxWM+scoR2f7S7vyq9sOBXcAC
         2+Tpml3tT1j+l9xJ5IYoT+axWn39HUcnJL5B0xxweKD9y/nk5a9qVkt4t4klK92FJk37
         JMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332811; x=1745937611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgDRifXaNYB0VqxMUzJ5WtdqZNW94oWMiLpSuETPS1E=;
        b=PlPpzMSu/9fb2PjTMby8TQTN8RszitIUOeyhBided1hZFVatNPcpJyiOuuXCSEYpmD
         /hvVwOnafrYpr/FQ5EujV24OkxWQEDYx04W6QMZ8FtXVUqe4N6ewe2PW5AmUjqO5OF2z
         YoOE5uPZ5BbBwY0oE/DTn+1twprfgxQOedUeif+KWu1YSvb09ZYJoCd8fe/vVLh0OS7K
         8fmScM7FnMU9aDLS5uEvxk+88fZuRBG6vGHvTmGxObvOy3UZfreEmebvyq+4gCT/X5gX
         6gReSurIKe7TbXuN8OwuiMQODf+4LvS8HRzM0NcgLejBa8p+wQ8fLbVuYbLHkARFuv79
         jkyA==
X-Forwarded-Encrypted: i=1; AJvYcCWU1h841ZRJqozvPEx7ivVErhXaiCjOTc/081QLPREtkdkSFTy5i3TmbSMXH8TvJ+0aU5Fxipw8VshoZ/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZA+wgDj6deZidn3eBcyJKdcoDkZMGYUXfb1OF1aqkZitA2oEP
	x1NMIGLskPkGMwo091t1W70K2tx9GC5R6fYhH8+JOQr0MXLt5jG2
X-Gm-Gg: ASbGncuTw4L5+ZzOBpFvbDQpnkOY2gUcKo8B/qdEKV1c/Ib+5U9ZSVL3pEyfOa2m5j+
	S+bFEyhu4ztdueY6Ho4qIAk4yDPKISajhzCDhccM4s777xV1eNJHfdO8xJ5kUlh/kMPAl/H9cv2
	ShQUFQFAEN8oBZ+VadccHK68UA4O2rS/DjDjrwhOGeR1GutaCUTq06r6XZrwP0Qj0a3plpOTqDU
	dCzow1xJQVT+BB7vKlJDqyXg/S/8rZDCFq5kaAZJ0zxJv89SEWwIz3e8r+OwVMSIhoupfiXiz6h
	5XULOxZcJO8Am25UnMirRjxhNW3hB2Ls83GzsznyNnDLHOEDYalOtuOEG86xLZCeHv1GTkdZH1r
	8ECicGFqvCXzpibBjsTBsvmtvdQs2D+7m37BYrvI=
X-Google-Smtp-Source: AGHT+IG5XEgE+sW4JrfW25KmGPKZe4ajiZ6Rq8VhHqb2XfR8yfP2MxccLYb9GoBzE1HSCOODjcEniA==
X-Received: by 2002:a05:6830:390f:b0:72a:18a6:d431 with SMTP id 46e09a7af769-73006229950mr9722469a34.14.1745332810825;
        Tue, 22 Apr 2025 07:40:10 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73004884738sm1975442a34.51.2025.04.22.07.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:40:10 -0700 (PDT)
Message-ID: <bba47a8a-d2e6-433f-8128-b2a7fc05414d@gmail.com>
Date: Tue, 22 Apr 2025 07:44:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] panic: Allow archs to reduce CPU consumption after
 panic
To: Sean Christopherson <seanjc@google.com>, Petr Mladek <pmladek@suse.com>,
 jan.glauber@gmail.com
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, bilbao@vt.edu,
 akpm@linux-foundation.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Carlos Bilbao <bilbao@vt.edu>
References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
 <20250326151204.67898-2-carlos.bilbao@kernel.org>
 <Z_khOuvPGEWBAQbp@pathway.suse.cz> <Z_lDzyXJ8JKqOyzs@google.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <Z_lDzyXJ8JKqOyzs@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the feedback, everyone!


On 4/11/25 11:31, Sean Christopherson wrote:

> On Fri, Apr 11, 2025, Petr Mladek wrote:
>> Added Linus and Jiri (tty) into Cc.
>>
>> On Wed 2025-03-26 10:12:03, carlos.bilbao@kernel.org wrote:
>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>
>>> After handling a panic, the kernel enters a busy-wait loop, unnecessarily
>>> consuming CPU and potentially impacting other workloads including other
>>> guest VMs in the case of virtualized setups.
> Impacting other guests isn't the guest kernel's problem.  If the host has heavily
> overcommited CPUs and can't meet SLOs because VMs are panicking and not rebooting,
> that's a host problem.
>
> This could become a customer problem if they're getting billed based on CPU usage,
> but I don't know that simply doing HLT is the best solution.  E.g. advising the
> customer to configure their kernels to kexec into a kdump kernel or to reboot
> on panic, seems like it would provide a better overall experience for most.
>
> QEMU (assuming y'all use QEMU) also supports a pvpanic device, so unless the VM
> and/or customer is using a funky setup, the host should already know the guest
> has panicked.  At that point, the host can make appropiate scheduling decisions,
> e.g. userspace can simply stop running the VM after a certain timeout, throttle
> it, jail it, etc.
>
>>> Introduce cpu_halt_after_panic(), a weak function that archs can override
>>> for a more efficient halt of CPU work. By default, it preserves the
>>> pre-existing behavior of delay.
>>>
>>> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
>>> Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
>>> ---
>>>  kernel/panic.c | 12 +++++++++++-
>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/panic.c b/kernel/panic.c
>>> index fbc59b3b64d0..fafe3fa22533 100644
>>> --- a/kernel/panic.c
>>> +++ b/kernel/panic.c
>>> @@ -276,6 +276,16 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>>>  		crash_smp_send_stop();
>>>  }
>>>  
>>> +/*
>>> + * Called after a kernel panic has been handled, at which stage halting
>>> + * the CPU can help reduce unnecessary CPU consumption. In the absence of
>>> + * arch-specific implementations, just delay
>>> + */
>>> +static void __weak cpu_halt_after_panic(void)
>>> +{
>>> +	mdelay(PANIC_TIMER_STEP);
>>> +}
>>> +
>>>  /**
>>>   *	panic - halt the system
>>>   *	@fmt: The text string to print
>>> @@ -474,7 +484,7 @@ void panic(const char *fmt, ...)
>>>  			i += panic_blink(state ^= 1);
>>>  			i_next = i + 3600 / PANIC_BLINK_SPD;
>>>  		}
>>> -		mdelay(PANIC_TIMER_STEP);
>>> +		cpu_halt_after_panic();
>> The 2nd patch implements this functions using safe_halt().
>>
>> IMHO, it makes perfect sense to halt a virtualized system or
> I really, really don't want to arbitrarily single out VMs, especially in core
> kernel code, as doing so risks creating problems that are unique to VMs.  If the
> behavior is based on a virtualization-agnostic heuristic like "no console", then
> by all means, but please don't condition something like this purely based on
> running in a VM.
>
> I also have no objection to the host/hypervisor prescribing specific behavior
> (see below).  What I don't like is the kernel deciding to do things differently
> because it's a VM, without any knowledge of the environment in which the VM is
> running.


Sean, I understand your point that we shouldn’t make core kernel behavior arbitrarily VM-specific. Even though, arguably, my RFC cover letter focused on VMs -- as that’s where I detected the issue (without oversubscription, BTW) -- the intention is to provide a more general post-panic solution that can help both VM/bare-metal envs. As Jan mentioned, the current default (a
CPU spinning forever after panic()) is often suboptimal.


>> a system without a registered "graphical" console.
>>
>> I think that the blinking diods were designed for desktops
>> and laptops with some "graphical" terminal attached. The
>> infinite loop allows to read the last lines, ideally
>> the backtrace on the screen.
>>
>> I wonder if we could make it more clever and do the halt
>> only when the system is virtualized or when there is no
>> "graphical" console registered.
> Could we do something with panic_notifier_list?  E.g. let panic devices override
> the default post-print behavior.  Then VMs with a paravirt panic interface could
> make an explicit call out to the host instead of relying on arch specific code
> to HLT and hope for the best.  And maybe console drivers that want/need to keep
> the CPU running can nullify panic_halt?


I like your suggestion of a panic_set_hlt() API with a priority mechanism
-- it’s more flexible than a weak function, and I’m happy to integrate that
into v2. Here's what I propose:

    Patch 1: Introduce panic_set_hlt(func, prio).
    Patch 2: Register a fallback safe_halt() implementation at priority 0
             that just calls safe_halt().

Please, LMK if you've any concerns with that plan.


> E.g. with a rudimentary priority system so that paravirt devices can override
> everything else.
>
> diff --git a/kernel/panic.c b/kernel/panic.c
> index d8635d5cecb2..fe9007222308 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -141,6 +141,18 @@ static long no_blink(int state)
>  long (*panic_blink)(int state);
>  EXPORT_SYMBOL(panic_blink);
>  
> +static void (*panic_halt)(void) = cpu_halt_after_panic;
> +static int panic_hlt_priority;
> +
> +void panic_set_hlt(void (*fn)(void), int priority)
> +{
> +       if (priority <= panic_hlt_priority)
> +               return;
> +
> +       panic_halt = fn;
> +}
> +EXPORT_SYMBOL_GPL(panic_set_hlt);
> +
>  /*
>   * Stop ourself in panic -- architecture code may override this
>   */
> @@ -467,6 +479,9 @@ void panic(const char *fmt, ...)
>         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>         nbcon_atomic_flush_unsafe();
>  
> +       if (panic_halt)
> +               panic_halt();
> +
>         local_irq_enable();
>         for (i = 0; ; i += PANIC_TIMER_STEP) {
>                 touch_softlockup_watchdog();
>

Thanks,

Carlos

