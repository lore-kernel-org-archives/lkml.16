Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA822339
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261586; cv=none; b=p1cHEMY/EBsdIBA5ANG1tjrkGzXsg9WJIGe7xxQvtmMIZx5jZNue7A5WuBs2Yln+grRusJzmYUrxj0yDWNJWgUbcQMouptHYErc2pb69D7pl/9MYWGuIOpwTXbRcTcQsrwNJE3V8vzYEch7gUHlvSMeat1VV0YUSstHOsP7fxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261586; c=relaxed/simple;
	bh=0H5fJp3gO+4zFRgzqkRzDWHqvihb62c6uVJucZHR2YM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mpkJ4Tqhl+aVOzhDSZfAhAjTEl9wMTduyFYO8MSPwT2uxdXRA2psgcVKlCKrQ/jrWJfjNvPGiJ4+Mg1JSUkZqpeGL0SxT+RUL7GjRCOCIQcBp1e9V9IBF5i24XCoQoBsocSptMzG5ATblVaAw9S2Ftdpk1yvLVOUDgxrBvnjgfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcvRwkJC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcvRwkJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751261582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLPYeo0qoqf09LDPaZaiDqNfei05s1/6tpeqiyDf/vA=;
	b=gcvRwkJCpiGhJVo+ELewOvZhFrQR+JpPs9A0YUUNLKjSWLnit1a8xwcwmJNUqTQEF9wEp0
	e/wbFZZH2DVRx996hYlAqYlhG8NFh0jAVFkfInbm6Sw1ccA9cmTXm9piPf0F0KJYLQXRrr
	s/SFxqF+wKqAWKxo9DUDzp8GgYtfUek=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-jWbos2tWONiKmplYgoc2TQ-1; Mon, 30 Jun 2025 01:33:00 -0400
X-MC-Unique: jWbos2tWONiKmplYgoc2TQ-1
X-Mimecast-MFC-AGG-ID: jWbos2tWONiKmplYgoc2TQ_1751261579
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40aa3e76fe6so1932124b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 22:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751261579; x=1751866379;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLPYeo0qoqf09LDPaZaiDqNfei05s1/6tpeqiyDf/vA=;
        b=N+IhMgcz/TULJwRb9t2IB7iPd9398BiQgzbBCwoTCxREMggtSGIwKSTnnf19BO6Qgl
         Sq5q3E1pvWuq7YREhNtG03GDKR3hngnvMEkWLt2jXOcovpW3Vd308/RSlrW0DHk8Frsh
         4IviRdJs1MiCj0zHXtHqxQ8LVoo7S5v5VeImwfautQJkX/SKIiGmgdmBpxSegh+x70mF
         ohKtG28+Fudy6juG6LMf9ccTTarMXVgdP9OtsO6fKAUvcSyo0LxDNZH2yciseREDr/AI
         oKWnhc10I0/J6hDp2V9h08zvu/ENFQq9LkyVcGaqyf606QtPGXf2x4kgqEDute/KUvI5
         dKlA==
X-Forwarded-Encrypted: i=1; AJvYcCWvuD3xo4XeuEl9nXUWjCtMw+Aw7PfIkNC22RE8deGSDULMhmF2o70zxQjPjOsKHet77VJmjs8pv6DcbZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmEjqjCg6gUFZt+aZCw4IHTcU/gFTOmIMWi4XOKfqTaMmUGkK
	4OmPxzCo9IszSpUUGyiUgoJt2Uv/3ylIycAIZpgjulpLLbCPRFGtwP4/JoZ3GmXQX2kWeRbzkMq
	/ouMUoLa3nrr4e9ZmwvDm9NWgQwW50qBkOsZUlBhaqt1rLDrsgDelcdXI61UmGxETJQ==
X-Gm-Gg: ASbGncsDfIZEQprvdAeMhClbo3zcPMQGshsTtoCI7hq5E7Pti8uEKqtLF6z8CODAkzd
	Haplb3L4frzxTpYUQ/vMYIx9HSAWkvriEvmhwbw478WicYZLwM1AUT+AcKPrc7YCLwAOVaRb/WA
	JMP/8+FsI1n9byt9MUY4ikbOBHRGiFeHdsIPbLiaGnHSnfbdacWT5s3ANeHw4U32tcb7fqCCIhb
	2u2LLmATzzhOXMUkiWCe9wp3a3WemCGJnBdruDtOSR5ihXXppwGV9Mbp6TR49UWddtDkedp6ciQ
	dQCTF81aa0HdwZZ0XeHWkLbi6HSjYBQf19YNj5kDggGukhaEe7XPEvIFwPWJDg61E8cg
X-Received: by 2002:a05:6808:2f11:b0:3f7:28ac:8068 with SMTP id 5614622812f47-40b33d739famr8404114b6e.13.1751261579338;
        Sun, 29 Jun 2025 22:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAPnSmK0h+Bu/PWP9BFRLdQCyZMG2CT9ABThJxSQG9/yb6VZL5COXMbvln/zBTLSYl1C13xw==
X-Received: by 2002:a05:6808:2f11:b0:3f7:28ac:8068 with SMTP id 5614622812f47-40b33d739famr8404100b6e.13.1751261578897;
        Sun, 29 Jun 2025 22:32:58 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3240548csm1531368b6e.28.2025.06.29.22.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 22:32:58 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <df0a0896-6a16-4240-97dc-c85eb51908b9@redhat.com>
Date: Mon, 30 Jun 2025 01:32:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [locking/lockdep] de4b59d652:
 BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Marco Elver <elver@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>
References: <202506300447.102c9e45-lkp@intel.com>
 <c2115579-46cb-4984-adc6-3b117c0b4225@redhat.com>
Content-Language: en-US
In-Reply-To: <c2115579-46cb-4984-adc6-3b117c0b4225@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 12:13 AM, Waiman Long wrote:
> On 6/29/25 10:34 PM, kernel test robot wrote:
>>
>> Hello,
>>
>> kernel test robot noticed 
>> "BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq" on:
>>
>> commit: de4b59d652646cf00cf632174348ca2266099edc ("locking/lockdep: 
>> Add kasan_check_byte() check in lock_acquire()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> I don't believe commit de4b59d65264 ("locking/lockdep: Add 
> kasan_check_byte() check in lock_acquire()") is the cause of the KASAN 
> error. The previous commit ee57ab5a3212 ("locking/lockdep: Disable 
> KASAN instrumentation of lockdep.c") explicitly disables KASAN 
> instrumentation to improve lockdep performance. If bisection happens 
> to land in between these two commits, the bisection algorithm can 
> incorrectly think commit de4b59d65264 is the culprit.
>
> Anyway, it is the caller of the spin_lock_irq() that passes in a lock 
> pointer that are in a memory area that has been freed. In this 
> particular case, kmod_dup_request_exists_wait() is handling a 
> duplicated kmod_req returned by kmod_dup_request_lookup(). The 
> duplicated kmod_req has been freed somehow.
>
> Cheers,
> Longman
>
>
>
>>
>> [test failed on linus/master afa9a6f4f5744d907954f5b708d76c9bffa43234]
>> [test failed on linux-next/master 
>> 2aeda9592360c200085898a258c4754bfe879921]
>>
>> in testcase: trinity
>> version:
>> with following parameters:
>>
>>     runtime: 600s
>>
>>
>> config: x86_64-randconfig-104-20250415
>> compiler: gcc-12
>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 
>> -m 16G
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>> the issue does not always happen. 23 times out of 142 runs as below.
>> parent keeps clean.
>>
>>
>> ee57ab5a32129f59 de4b59d652646cf00cf63217434
>> ---------------- ---------------------------
>>         fail:runs  %reproduction    fail:runs
>>             |             |             |
>>             :142         16%          23:142 
>> dmesg.BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-lkp/202506300447.102c9e45-lkp@intel.com
>>
>>
>> [ 154.326222][ T1658] BUG: KASAN: slab-use-after-free in 
>> _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 
>> kernel/locking/spinlock.c:170)
>> [  154.327485][ T1658] Read of size 1 at addr ffff888101655868 by 
>> task trinity-c3/1658
>> [  154.328688][ T1658]
>> [  154.329089][ T1658] CPU: 0 UID: 536870912 PID: 1658 Comm: 
>> trinity-c3 Tainted: G                T 6.14.0-rc5-00228-gde4b59d65264 #1
>> [  154.330915][ T1658] Tainted: [T]=RANDSTRUCT
>> [  154.331547][ T1658] Call Trace:
>> [  154.332090][ T1658]  <TASK>
>> [ 154.332553][ T1658] dump_stack_lvl (lib/dump_stack.c:123)
>> [ 154.333291][ T1658] print_address_description+0x8a/0x34b
>> [ 154.334384][ T1658] print_report (mm/kasan/report.c:522)
>> [ 154.335159][ T1658] ? __virt_addr_valid (arch/x86/mm/physaddr.c:66)
>> [ 154.335979][ T1658] ? _raw_spin_lock_irq 
>> (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170)
>> [ 154.336775][ T1658] kasan_report (mm/kasan/report.c:636)
>> [ 154.337475][ T1658] ? _raw_spin_lock_irq 
>> (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170)
>> [ 154.338283][ T1658] ? _raw_spin_lock_irq 
>> (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170)
>> [ 154.339112][ T1658] ? __wait_for_common 
>> (kernel/sched/completion.c:84 kernel/sched/completion.c:116)
>> [ 154.339920][ T1658] __kasan_check_byte (mm/kasan/common.c:561)
>> [ 154.340707][ T1658] lock_acquire (include/trace/events/lock.h:24 
>> include/trace/events/lock.h:24 kernel/locking/lockdep.c:5829)
>> [ 154.341554][ T1658] ? pci_mmcfg_reserved (kernel/sched/core.c:6646)
>> [ 154.342337][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.343252][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 
>> (discriminator 6))
>> [ 154.343968][ T1658] ? write_comp_data (kernel/kcov.c:246)
>> [ 154.344741][ T1658] ? usleep_range_state 
>> (kernel/time/sleep_timeout.c:62)
>> [ 154.345597][ T1658] _raw_spin_lock_irq 
>> (include/linux/spinlock_api_smp.h:120 kernel/lockinspinlock.c:170)
>> [ 154.346429][ T1658] ? __wait_for_common 
>> (kernel/sched/completion.c:84 kernel/sched/completion.c:116)
>> [ 154.347266][ T1658] __wait_for_common (kernel/sched/completion.c:84 
>> kernel/sched/completion.c:116)

Taking a deeper look in __wait_for_common():

  94 raw_spin_unlock_irq(&x->wait.lock);
  95                         timeout = action(timeout);
  96 raw_spin_lock_irq(&x->wait.lock);

The raw_spin_lock_irq() call before calling __wait_for_common() is OK. 
So the memory free likely happens after the unlock in the action() call 
here. After that, the raw_spin_lock_irq() call hits the KASAN bug.

Cheers,
Longman

>> [ 154.348111][ T1658] ? _printk (kernel/printk/printk.c:2452)
>> [ 154.348825][ T1658] ? out_of_line_wait_on_bit_lock 
>> (kernel/sched/completion.c:110)
>> [ 154.349775][ T1658] wait_for_completion_state 
>> (kernel/sched/completion.c:268)
>> [ 154.350731][ T1658] kmod_dup_request_exists_wait 
>> (kernel/module/dups.c:210)
>> [ 154.351725][ T1658] ? inet_create (net/ipv4/af_inet.c:1382)
>> [ 154.352749][ T1658] __request_module (kernel/module/kmod.c:167)
>> [ 154.353587][ T1658] ? free_modprobe_argv (kernel/module/kmod.c:132)
>> [ 154.354406][ T1658] ? mark_lock (kernel/locking/lockdep.c:4726 
>> (discriminator 3))
>> [ 154.355134][ T1658] ? __lock_acquire (kernel/locking/lockdep.c:5235)
>> [ 154.355920][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 
>> include/linux/rcupdate.h:880)
>> [ 154.356711][ T1658] ? kvm_sched_clock_read 
>> (arch/x86/kernel/kvmclock.c:91)
>> [ 154.357535][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301)
>> [ 154.358370][ T1658] ? __lock_release+0xc0/0x16f
>> [ 154.358993][ T1658] ? inet_create (net/ipv4/af_inet.c:1382)
>> [ 154.359749][ T1658] inet_create (net/ipv4/af_inet.c:1382)
>> [ 154.360375][ T1658] ? kvm_sched_clock_read 
>> (arch/x86/kernel/kvmclock.c:91)
>> [ 154.360824][ T1658] inet_create (net/ipv4/af_inet.c:266)
>> [ 154.361197][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:878)
>> [ 154.361659][ T1658] __sock_create (net/socket.c:1549)
>> [ 154.362058][ T1658] __sys_socket_create (net/socket.c:1644)
>> [ 154.362599][ T1658] ? sock_create (net/socket.c:1629)
>> [ 154.363222][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 
>> include/linux/rcupdate.h:880)
>> [ 154.363796][ T1658] __sys_socket (net/socket.c:1692)
>> [ 154.364376][ T1658] __x64_sys_socket (net/socket.c:1702)
>> [ 154.364848][ T1658] do_syscall_64 (arch/x86/entry/common.c:52 
>> arch/x86/entry/common.c:83)
>> [ 154.365258][ T1658] ? lockdep_hardirqs_on_prepare 
>> (kernel/locking/lockdep.c:4663)
>> [ 154.366074][ T1658] ? syscall_exit_to_user_mode 
>> (include/linux/entry-common.h:362 kernel/entry/common.c:220)
>> [ 154.366845][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102)
>> [ 154.367412][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 
>> include/linux/rcupdate.h:880)
>> [ 154.367834][ T1658] ? kvm_sched_clock_read 
>> (arch/x86/kernel/kvmclock.c:91)
>> [ 154.368274][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301)
>> [ 154.368702][ T1658] ? local_clock 
>> (arch/x86/include/asm/preempt.h:84 kernel/sched/clock.c:316)
>> [ 154.369074][ T1658] ? __lock_release+0xc0/0x16f
>> [ 154.369792][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.370652][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.371504][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 
>> (discriminator 6))
>> [ 154.372218][ T1658] ? write_comp_data (kernel/kcov.c:246)
>> [ 154.372976][ T1658] ? tracer_hardirqs_on 
>> (kernel/trace/trace_irqsoff.c:630)
>> [ 154.373837][ T1658] ? lockdep_hardirqs_on_prepare 
>> (kernel/locking/lockdep.c:4663)
>> [ 154.374908][ T1658] ? syscall_exit_to_user_mode 
>> (include/linux/entry-common.h:362 kernel/entry/common.c:220)
>> [ 154.375824][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102)
>> [ 154.376619][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.377531][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.378445][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 
>> (discriminator 6))
>> [ 154.379157][ T1658] ? write_comp_data (kernel/kcov.c:246)
>> [ 154.379923][ T1658] ? tracer_hardirqs_on 
>> (kernel/trace/trace_irqsoff.c:630)
>> [ 154.380723][ T1658] ? lockdep_hardirqs_on_prepare 
>> (kernel/locking/lockdep.c:4663)
>> [ 154.381723][ T1658] ? syscall_exit_to_user_mode 
>> (include/linux/entry-common.h:362 kernel/entry/common.c:220)
>> [ 154.382608][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102)
>> [ 154.383220][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 
>> include/linux/rcupdate.h:880)
>> [ 154.383811][ T1658] ? kvm_sched_clock_read 
>> (arch/x86/kernel/kvmclock.c:91)
>> [ 154.384524][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301)
>> [ 154.385261][ T1658] ? local_clock 
>> (arch/x86/include/asm/preempt.h:84 kernel/sched/clock.c:316)
>> [ 154.385979][ T1658] ? __lock_release+0xc0/0x16f
>> [ 154.386876][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.387784][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217)
>> [ 154.388666][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 
>> (discriminator 6))
>> [ 154.389383][ T1658] ? write_comp_data (kernel/kcov.c:246)
>> [ 154.390168][ T1658] ? tracer_hardirqs_on 
>> (kernel/trace/trace_irqsoff.c:630)
>> [ 154.390997][ T1658] ? lockdep_hardirqs_on_prepare 
>> (kernel/locking/lockdep.c:4663)
>> [ 154.392108][ T1658] ? syscall_exit_to_user_mode 
>> (include/linux/entry-common.h:362 kernel/entry/common.c:220)
>> [ 154.393047][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 154.393829][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 154.394600][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 154.395191][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 154.395845][ T1658] entry_SYSCALL_64_after_hwframe 
>> (arch/x86/entry/entry_64.S:130)
>> [  154.396678][ T1658] RIP: 0033:0x463519
>> [ 154.397279][ T1658] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 
>> 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 
>> 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 59 00 00 c3 66 2e 0f 1f 
>> 84 00 00 00 00
>> All code
>> ========
>>     0:    00 f3                    add    %dh,%bl
>>     2:    c3                       ret
>>     3:    66 2e 0f 1f 84 00 00     cs nopw 0x0(%rax,%rax,1)
>>     a:    00 00 00
>>     d:    0f 1f 40 00              nopl   0x0(%rax)
>>    11:    48 89 f8                 mov    %rdi,%rax
>>    14:    48 89 f7                 mov    %rsi,%rdi
>>    17:    48 89 d6                 mov    %rdx,%rsi
>>    1a:    48 89 ca                 mov    %rcx,%rdx
>>    1d:    4d 89 c2                 mov    %r8,%r10
>>    20:    4d 89 c8                 mov    %r9,%r8
>>    23:    4c 8b 4c 24 08           mov    0x8(%rsp),%r9
>>    28:    0f 05                    syscall
>>    2a:*    48 3d 01 f0 ff ff        cmp 
>> $0xfffffffffffff001,%rax        <-- trapping instruction
>>    30:    0f 83 db 59 00 00        jae    0x5a11
>>    36:    c3                       ret
>>    37:    66                       data16
>>    38:    2e                       cs
>>    39:    0f                       .byte 0xf
>>    3a:    1f                       (bad)
>>    3b:    84 00                    test   %al,(%rax)
>>    3d:    00 00                    add    %al,(%rax)
>>     ...
>>
>> Code starting with the faulting instruction
>> ===========================================
>>     0:    48 3d 01 f0 ff ff        cmp $0xfffffffffffff001,%rax
>>     6:    0f 83 db 59 00 00        jae    0x59e7
>>     c:    c3                       ret
>>     d:    66                       data16
>>     e:    2e                       cs
>>     f:    0f                       .byte 0xf
>>    10:    1f                       (bad)
>>    11:    84 00                    test   %al,(%rax)
>>    13:    00 00                    add    %al,(%rax)
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250630/202506300447.102c9e45-lkp@intel.com 
>>
>>
>>
>>

