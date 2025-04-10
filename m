Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DE20ED
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306238; cv=none; b=T3gMzG0VgLKbxqwPyCV3aavFFKuCJ5tVnj4kaAW2iVyRHUvazdrL+NyZM1lnBU4JBksnJyhyk5nFo1r+oQxJBvJjoMukqlF45ZrPG5jI2r9jmX2jYQ8M9K2zwqtNfzar3NZO+Xu86r6a66gsQuuNOttXXGOU9vvqCj/MhnY9nQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306238; c=relaxed/simple;
	bh=chohcvHjLi/wyU9Kxph3IQG5vw7+BOgL/UFLTtCKZX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufEMzX4eaq/PUDiVFVqY9BfxkKpYIlw6lF4lCwUndvwqz5npFUagAU1lk9UksX6TZmDR2MD0YU17AD+Hchs3zLiHijZtkjr3KfOAOZlpin5BslkPvAj5KqJtAqm7WQ1AMHoLjKAh8hMUSxOARtnAer/yqJoiTYdBC5GJeqBZm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=GqS4jmQP; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="GqS4jmQP"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-72a4793d4e2so632513a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1744306234; x=1744911034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OihzHFkyFsBySikpt66wEMQuS8epxfY7hMxeSZhbDI=;
        b=GqS4jmQPr3VIlCS76XDQzRz9ZJvbd934BuhC/nvRLlG/2ip0pQiHwSwBNLycgMxA5o
         GFWSHEZqNPfInV86m+k/B5wtH3s+RspGqTrYoVmNUi17casx1nnzq2kuykJ7OvRdBtmU
         wtTRI1UYAH5jcCcWSpgJP5A+BrWSVq67075llfXC61HMSNNoWEl2t7RC3Xa2Zk85TrnV
         L90cMobTJtf0Kp5AXtIfR63mdMO9ZYAM4SG97z3LSORyqyJeon9RxWyXYSMzqmfZIYKw
         EcU/ayoZ4MZvcXBs8lA0erPcNVr7zANaZ3zBiQLTUwazmR8EG8Jza2hwwLruZwTXYS+X
         llyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306234; x=1744911034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OihzHFkyFsBySikpt66wEMQuS8epxfY7hMxeSZhbDI=;
        b=W44N4vWaiOGnxEdC1mqaGcNPeLXQJjg57KyIOM+JAoQxhqAKir8lH8/2divNZY3A/h
         xwrHIyD6S5Qm/I6Rxygr6yDPOVaXsNFWKH75rQNAEdf26nLLnhL6miqfGyAm72Bq7Dvh
         p+ek3ash70vLVjBH6lf/yzlFRFTO6aibidXqHsoajUKY7YG70wnYyPA8e7Gia7q4DO1r
         awy5ecW8G9VUlShcmvsYpNIPIvqI2DZtT7fIxv9a1TH0tAvrirOnAzDasL4Pds0vU6Aa
         DkY0bh+V7sbbiGjbCJ8dZWTNfpyPdFVhra9+KCcfIfeJ2XP3VkHfhV2gz7vspwPRd1kF
         x0ig==
X-Forwarded-Encrypted: i=1; AJvYcCXwH5czybkYY15F3+m19tNlsPCd3qmrAGJ2en9L2ZYVXG3T/mZJpkHYxEB5Qr4B14ea0faoYzKEULxyvG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhX+1XlgLLkAS8e7KMCUlJKWfITnj4/qmQxy6W9unz7g7aNKJo
	bKcnlp7X8aonvPHqSOFZWMdfQCpflwbeGkgM2h/vITEeqb5YIJd7qDZHHayaoA0YBeiUFL6oKkG
	pkZcAy1JL
X-Gm-Gg: ASbGnct9R1Oy6m7ruvNgcm/FQ8PBp3wmCJaN+7EwDeeIQJ4IWCjVK7KOLXgL006NBL4
	Uul0b1ofBUes2eR/oSe3xcwOw/XRcc17aw7bqQanr7FwHF/qyjRFl8C32ZT1g4j1DS2msqEdGDd
	NED9H8ZgCsWqG6Df91J3XbI5SBuPChfTxyNd3+EztbT+j8FKtl/Kl0vJWtjOZ2F726Az5emgFAQ
	sg5oOvVCIAe09n90ZsTDsM1k0zWM3AuTHf+gRL3coq9nIBvqz+nLgikJjZmGjJvTCdHjRpjrgpU
	6OeR7Jq9qUuNiAprpduplDaIeovM0FDNbkKpXjoDc38xlkTmELSTiBtUEUKpMkaEJO4VlO6EIRf
	3v8TRP34=
X-Google-Smtp-Source: AGHT+IGZkJR5ZdeRJ+CQM//R4nQRDJhqMW+9uumnGv7FMXxnmqm4JEiDynSsDaMvbT1Dz/LifQFDPQ==
X-Received: by 2002:a05:6830:6988:b0:72a:e8b:a849 with SMTP id 46e09a7af769-72e7bb42c98mr2546212a34.27.1744306233828;
        Thu, 10 Apr 2025 10:30:33 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8d2f3sm638050a34.31.2025.04.10.10.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:30:32 -0700 (PDT)
Message-ID: <71641866-bbde-4dee-b1ff-5214ba93ff4c@vt.edu>
Date: Thu, 10 Apr 2025 12:30:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Reminder: [PATCH 0/2] Reduce CPU usage when finished handling panic
To: carlos.bilbao@kernel.org, tglx@linutronix.de, pmladek@suse.com,
 akpm@linux-foundation.org
Cc: jan.glauber@gmail.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de,
 Carlos Bilbao <cbilbao@digitalocean.com>
References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250326151204.67898-1-carlos.bilbao@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again,

I would really appreciate your opinions on this.

Thanks!
Carlos

On 3/26/25 10:12, carlos.bilbao@kernel.org wrote:
> From: Carlos Bilbao <cbilbao@digitalocean.com>
> 
> After the kernel has finished handling a panic, it enters a busy-wait loop.
> But, this unnecessarily consumes CPU power and electricity. Plus, in VMs,
> this negatively impacts the throughput of other VM guests running on the
> same hypervisor.
> 
> This patch set introduces a weak function cpu_halt_after_panic() to give
> architectures the option to halt the CPU during this state while still
> allowing interrupts to be processed. Do so for arch/x86 by defining the
> weak function and calling safe_halt().
> 
> Here's some numbers to support my claim, the perf stats from the hypervisor
> after triggering a panic on a guest Linux kernel.
> 
> Samples: 55K of event 'cycles:P', Event count (approx.): 36090772574
> Overhead  Command          Shared Object            Symbol
>   42.20%  CPU 5/KVM        [kernel.kallsyms]        [k] vmx_vmexit
>   19.07%  CPU 5/KVM        [kernel.kallsyms]        [k] vmx_spec_ctrl_restore_host
>    9.73%  CPU 5/KVM        [kernel.kallsyms]        [k] vmx_vcpu_enter_exit
>    3.60%  CPU 5/KVM        [kernel.kallsyms]        [k] __flush_smp_call_function_queue
>    2.91%  CPU 5/KVM        [kernel.kallsyms]        [k] vmx_vcpu_run
>    2.85%  CPU 5/KVM        [kernel.kallsyms]        [k] native_irq_return_iret
>    2.67%  CPU 5/KVM        [kernel.kallsyms]        [k] native_flush_tlb_one_user
>    2.16%  CPU 5/KVM        [kernel.kallsyms]        [k] llist_reverse_order
>    2.10%  CPU 5/KVM        [kernel.kallsyms]        [k] __srcu_read_lock
>    2.08%  CPU 5/KVM        [kernel.kallsyms]        [k] flush_tlb_func
>    1.52%  CPU 5/KVM        [kernel.kallsyms]        [k] vcpu_enter_guest.constprop.0
> 
> And here are the results from the guest VM after applying my patch:
> 
> Samples: 51  of event 'cycles:P', Event count (approx.): 37553709
> Overhead  Command          Shared Object            Symbol
>    7.94%  qemu-system-x86  [kernel.kallsyms]        [k] __schedule
>    7.94%  qemu-system-x86  libc.so.6                [.] 0x00000000000a2702
>    7.94%  qemu-system-x86  qemu-system-x86_64       [.] 0x000000000057603c
>    7.43%  qemu-system-x86  libc.so.6                [.] malloc
>    7.43%  qemu-system-x86  libc.so.6                [.] 0x00000000001af9c0
>    6.37%  IO mon_iothread  libglib-2.0.so.0.7200.4  [.] g_mutex_unlock
>    5.21%  IO mon_iothread  [kernel.kallsyms]        [k] __pollwait
>    4.70%  IO mon_iothread  [kernel.kallsyms]        [k] clear_bhb_loop
>    3.56%  IO mon_iothread  [kernel.kallsyms]        [k] __secure_computing
>    3.56%  IO mon_iothread  libglib-2.0.so.0.7200.4  [.] g_main_context_query
>    3.15%  IO mon_iothread  [kernel.kallsyms]        [k] __hrtimer_start_range_ns
>    3.15%  IO mon_iothread  [kernel.kallsyms]        [k] _raw_spin_lock_irq
>    2.88%  IO mon_iothread  libglib-2.0.so.0.7200.4  [.] g_main_context_prepare
>    2.83%  qemu-system-x86  libglib-2.0.so.0.7200.4  [.] g_slist_foreach
>    2.58%  IO mon_iothread  qemu-system-x86_64       [.] 0x00000000004e820d
>    2.21%  qemu-system-x86  libc.so.6                [.] 0x0000000000088010
>    1.94%  IO mon_iothread  [kernel.kallsyms]        [k] arch_exit_to_user_mode_prepar
> 
> As you can see, CPU consumption is significantly reduced after applying the
> proposed change after panic logic, with KVM-related functions (e.g.,
> vmx_vmexit()) dropping from more than 70% of CPU usage to virtually
> nothing. Also, the num of samples decreased from 55K to 51 and the event
> count dropped from 36.09 billion to 37.55 million.
> 
> Carlos Bilbao at DigitalOcean (2):
>   panic: Allow archs to reduce CPU consumption after panic
>   x86/panic: Use safe_halt() for CPU halt after panic
> 
> ---
> 
>  arch/x86/kernel/Makefile |  1 +
>  arch/x86/kernel/panic.c  |  9 +++++++++
>  kernel/panic.c           | 12 +++++++++++-
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 arch/x86/kernel/panic.c
> 
> 
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42E1F4174
> 	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:12:15 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
> ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1743001935; cv=none; b=pTx5wAwLeH5sWAAgsmlCk1lZgzSyUJH4X0UwzbEXvNm3EDKfoAwmJNvbIAk6ESdDQZ4j/9u/Tr51T9mIAGBteoeogjNzS7CEhokwMvfjLwfK/GZHSzyN+0oqtMptT829NvzENA2BVex1DLKAjsePN5nTlrf3/WMHr1bcmQSYBG4=
> ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1743001935; c=relaxed/simple;
> 	bh=dvH6cZROBDqL/EIJB0ddluLgh3GMP5pgXEtD5g291tI=;
> 	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version; b=oQxBjv4Hpv/rJEVcoN/5DAetBXYAQcfNM++r5iZT8phmtHiLu/rCJ3KAEuqzqy6ffyuEgAPLj8oD9G5nwxUFtscLmkYOL1LlhmcNF5Qtdfnmpdbtsd6oCsCd+9eV0diUhXdALWysZAF6aQXpSZw5LUfT8xresIHTaKWrp6pvX7A=
> ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MurPLbRg; arc=none smtp.client-ip=10.30.226.201
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MurPLbRg"
> Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6FDC4CEE8;
> 	Wed, 26 Mar 2025 15:12:14 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
> 	s=k20201202; t=1743001935;
> 	bh=dvH6cZROBDqL/EIJB0ddluLgh3GMP5pgXEtD5g291tI=;
> 	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
> 	b=MurPLbRgOhvxG7DGoeI4e6uf1uBNgQKuYEVn+R9J1Ys/ntkU8s2GjleUUf4P5gSje
> 	 K0Qw27qmTj6yClEmUiZYU3Jw1dUraF20/y3Y5X2ULu4JIBKzJDJcs5zPefI7Hkzoie
> 	 vbSpNhTmjCjRrUQu0tIv9GAwFTQynj6olDOMx+wonf4CXVF2xg0OSv6n4KuZs9Plps
> 	 V14SmWmJUQLArdVDliLtaFaZ+VR12eQgLTD7XuLG8HExBuGdATgUYre2U3B9lGEfxr
> 	 RcHi7NoRsrkmWAkQfXjInPNCwOkLvWM6CaaRHxsMWSD8aK5/8DS82WxDealKGyUyX0
> 	 LuAEXKNekpppw==
> From: carlos.bilbao@kernel.org
> To: tglx@linutronix.de
> Cc: bilbao@vt.edu,
> 	pmladek@suse.com,
> 	akpm@linux-foundation.org,
> 	jan.glauber@gmail.com,
> 	jani.nikula@intel.com,
> 	linux-kernel@vger.kernel.org,
> 	gregkh@linuxfoundation.org,
> 	takakura@valinux.co.jp,
> 	john.ogness@linutronix.de,
> 	Carlos Bilbao <carlos.bilbao@kernel.org>
> Subject: [PATCH 1/2] panic: Allow archs to reduce CPU consumption after panic
> Date: Wed, 26 Mar 2025 10:12:03 -0500
> Message-ID: <20250326151204.67898-2-carlos.bilbao@kernel.org>
> X-Mailer: git-send-email 2.47.1
> In-Reply-To: <20250326151204.67898-1-carlos.bilbao@kernel.org>
> References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> 
> From: Carlos Bilbao <carlos.bilbao@kernel.org>
> 
> After handling a panic, the kernel enters a busy-wait loop, unnecessarily
> consuming CPU and potentially impacting other workloads including other
> guest VMs in the case of virtualized setups.
> 
> Introduce cpu_halt_after_panic(), a weak function that archs can override
> for a more efficient halt of CPU work. By default, it preserves the
> pre-existing behavior of delay.
> 
> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
> ---
>  kernel/panic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index fbc59b3b64d0..fafe3fa22533 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -276,6 +276,16 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>  		crash_smp_send_stop();
>  }
>  
> +/*
> + * Called after a kernel panic has been handled, at which stage halting
> + * the CPU can help reduce unnecessary CPU consumption. In the absence of
> + * arch-specific implementations, just delay
> + */
> +static void __weak cpu_halt_after_panic(void)
> +{
> +	mdelay(PANIC_TIMER_STEP);
> +}
> +
>  /**
>   *	panic - halt the system
>   *	@fmt: The text string to print
> @@ -474,7 +484,7 @@ void panic(const char *fmt, ...)
>  			i += panic_blink(state ^= 1);
>  			i_next = i + 3600 / PANIC_BLINK_SPD;
>  		}
> -		mdelay(PANIC_TIMER_STEP);
> +		cpu_halt_after_panic();
>  	}
>  }
>  

