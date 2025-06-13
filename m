Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FF279DA5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814615; cv=none; b=o1pNFXcCMdmJCSKfR+oO2t73RjWZLzdYsGtn4vsGrt582ed0Rcbe+1HZchuTousXBoprKZASO+6cab8d2wvD34kLFPpZiGnNIiV8UI0MXZvSivi0nSA9ygm2mlcMOWaSJq2KMQt3jqfb1synbqMR2DwKhjnSwjBZ6/hs7BqIuuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814615; c=relaxed/simple;
	bh=oGlpjZ5opoJtpQ1qNyf7S0PnCoXmXblVAlhgGEL2LpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8zlVBu9oxvB2xEwGmvkOGblsey3AJOH1E3qPq8O/0EVWjNZu7ayW0xf8nAeXAQCInepoZDfCl/2lF/cJCGJIZhyCloGCgKkcyvMR8jr3dXumZmk7zT7SYW+1CxjNZ3Fa3qez8T4o2qZ0F9Clyne3U8N1dT3gy7tNaNg3zBUr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dw8YZCjW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dw8YZCjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749814612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kiZEx38HoIp/sJF/T9xSvKuzGXFeABVVsomdogZAZjY=;
	b=Dw8YZCjWVORHwCWhTM8YcMYMWuNovCm2bHJW41B0egyMn4nEOec63MZpz6p7KCqK/qT4MI
	LK8zr02amXd2uDGLUMUrDLEm8GJMbw82U851OZb56kS16qCGpWN4YHaYuTXlgiekWC0zFO
	RvUhGqvGFIFfPzRdZrTB6Q38Jch2H1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-GCQv5isgOg2O6ikkNcAA6w-1; Fri, 13 Jun 2025 07:36:50 -0400
X-MC-Unique: GCQv5isgOg2O6ikkNcAA6w-1
X-Mimecast-MFC-AGG-ID: GCQv5isgOg2O6ikkNcAA6w_1749814609
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d22so13800515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814609; x=1750419409;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiZEx38HoIp/sJF/T9xSvKuzGXFeABVVsomdogZAZjY=;
        b=fwPsYGsfgQiE6JdUDi+nk0iztKZYP6+RxA/0UOQogxYZz5zDbTLBInvQwkZ5+lD6KU
         hcXt/ZdmzQAlnb6imZpclH3yi74dsHP8vghXLRHEDq0x/l9gZIeQPTgrKmieb3vHH8g4
         BhF/oY1AZvuksjETQUShOiUzuO1qdr7a4UXrl0TgybDQFTzbcajYrO/RsLYZvnvuMpU8
         yyjp0nSZLJ8KZE4I/oI/Gp8OGUjH0r2/KW0gooOy5b2CKT7jcNFidBR/558YHiX92NL2
         7VPw3YZfv+pxONEO+iZBClsaE1CA457kwdrTL9KRux68Y9pN6Y11160ArrcoN/PpDH5+
         41cg==
X-Forwarded-Encrypted: i=1; AJvYcCW+70YP1coSNBijWH89LOS1CxI9MNXyl/SeC8p7cczrds0hUBdddPF+cdLRhcAV1JxbXQGVJEo4vhdmxMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4da+5VnwdtgFJBBdNv6gTP2THFg2/pTIx/6WsPcSgVLtUHX6
	RnaJQeeI+8ls9HC6ZURbb5hU+CjcqbhIlKzimWH6FHPvP+AwJZbarPnYHJj870N3ImH6dzK+lHg
	6v9WAkr2xsYi9oqBNQsPxhKChYQrBaojUtAe2olWP/8fI7uLz31SQylAqOobwk8PYBQ==
X-Gm-Gg: ASbGnctbIFI57BLc47IJ4083uWdyF31aquEVxrTFtx24M5VONnH2v0smscFJCylPDtQ
	wPtsxpW6Vwxz8kBlINznHhXSYsNM5jslycPm8YFLxVJELqEx9vQTK/pXwscNUmNKh5qArymULAN
	yaMmP06saQdUmx7/odm0lgyuJd1y7ZAriHkysZIFGmXY+Eyd2DWnT2McupctYQyq1rNcqVXHl9g
	wPyM9AOIOR7TeBqOy5bm5NqhJddSXw99DqP0mKZ8/DHiwvmOGH152TO7yrJbWis0txDSMTSDo96
	SCkMpPEA9qlxQLYbFuMKM58i
X-Received: by 2002:a05:600c:4451:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-45334a72185mr27367815e9.4.1749814609486;
        Fri, 13 Jun 2025 04:36:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0/pWAKXXkfTKjY6GSDkjAZxarVPySFWaSgjTKT++lKeu39Gcd8U/THccgcBg1C7Om+J9v1g==
X-Received: by 2002:a05:600c:4451:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-45334a72185mr27367295e9.4.1749814609004;
        Fri, 13 Jun 2025 04:36:49 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e169d90sm50809005e9.32.2025.06.13.04.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 04:36:48 -0700 (PDT)
Message-ID: <3a7c0856-6e7b-4d3d-b966-6f17f1aca42e@redhat.com>
Date: Fri, 13 Jun 2025 13:36:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 6/5] KVM: TDX: Explicitly do WBINVD upon reboot
 notifier
To: Kai Huang <kai.huang@intel.com>, dave.hansen@intel.com, bp@alien8.de,
 tglx@linutronix.de, peterz@infradead.org, mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, seanjc@google.com, rick.p.edgecombe@intel.com,
 isaku.yamahata@intel.com, reinette.chatre@intel.com,
 dan.j.williams@intel.com, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 nik.borisov@suse.com, sagis@google.com
References: <cover.1746874095.git.kai.huang@intel.com>
 <20250510112503.23497-1-kai.huang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250510112503.23497-1-kai.huang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 13:25, Kai Huang wrote:
> On TDX platforms, during kexec, the kernel needs to make sure there's no
> dirty cachelines of TDX private memory before booting to the new kernel
> to avoid silent memory corruption to the new kernel.
> 
> During kexec, the kexec-ing CPU firstly invokes native_stop_other_cpus()
> to stop all remote CPUs before booting to the new kernel.  The remote
> CPUs will then execute stop_this_cpu() to stop themselves.
> 
> The kernel has a percpu boolean to indicate whether the cache of a CPU
> may be in incoherent state.  In stop_this_cpu(), the kernel does WBINVD
> if that percpu boolean is true.
> 
> TDX turns on that percpu boolean on a CPU when the kernel does SEAMCALL.
> This makes sure the cahces will be flushed during kexec.
> 
> However, the native_stop_other_cpus() and stop_this_cpu() have a "race"
> which is extremely rare to happen but if did could cause system to hang.

s/if did//

> Specifically, the native_stop_other_cpus() firstly sends normal reboot
> IPI to remote CPUs and wait one second for them to stop.  If that times
> out, native_stop_other_cpus() then sends NMIs to remote CPUs to stop
> them.
> 
> The aforementioned race happens when NMIs are sent.  Doing WBINVD in
> stop_this_cpu() makes each CPU take longer time to stop and increases
> the chance of the race to happen.
> 
> Register reboot notifier in KVM to explcitly flush caches upon reboot
> for TDX.  This brings doing WBINVD at earlier stage and aovids the
> WBINVD in stop_this_cpu(), eliminating the possibility of increasing the
> chance of the aforementioned race.

"This moves the WBINVD to an earlier stage than stop_this_cpus(), 
avoiding a possibly lengthy operation at a time where it could cause 
this race."

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Waiting for v3. :)

Paolo

> Signed-off-by: Kai Huang <kai.huang@intel.com>
> ---
>   arch/x86/include/asm/tdx.h  |  3 +++
>   arch/x86/kvm/vmx/tdx.c      | 45 +++++++++++++++++++++++++++++++++++++
>   arch/x86/virt/vmx/tdx/tdx.c |  9 ++++++++
>   3 files changed, 57 insertions(+)
> 
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 91dc6e6bdd97..d0156bf0b966 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -221,6 +221,8 @@ u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u6
>   u64 tdh_phymem_cache_wb(bool resume);
>   u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
>   u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page);
> +
> +void tdx_cpu_flush_cache(void);
>   #else
>   static inline void tdx_init(void) { }
>   static inline int tdx_cpu_enable(void) { return -ENODEV; }
> @@ -228,6 +230,7 @@ static inline int tdx_enable(void)  { return -ENODEV; }
>   static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
>   static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
>   static inline const struct tdx_sys_info *tdx_get_sysinfo(void) { return NULL; }
> +static inline void tdx_cpu_flush_cache(void) { }
>   #endif	/* CONFIG_INTEL_TDX_HOST */
>   
>   #endif /* !__ASSEMBLER__ */
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index b952bc673271..3b92b3999855 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -5,7 +5,9 @@
>   #include <asm/fpu/xcr.h>
>   #include <linux/misc_cgroup.h>
>   #include <linux/mmu_context.h>
> +#include <linux/reboot.h>
>   #include <asm/tdx.h>
> +#include <asm/processor.h>
>   #include "capabilities.h"
>   #include "mmu.h"
>   #include "x86_ops.h"
> @@ -3278,6 +3280,33 @@ static int tdx_offline_cpu(unsigned int cpu)
>   	return -EBUSY;
>   }
>   
> +static void smp_func_cpu_flush_cache(void *unused)
> +{
> +	tdx_cpu_flush_cache();
> +}
> +
> +static int tdx_reboot_notify(struct notifier_block *nb, unsigned long code,
> +			     void *unused)
> +{
> +	/*
> +	 * Flush cache for all CPUs upon the reboot notifier.  This
> +	 * avoids having to do WBINVD in stop_this_cpu() during kexec.
> +	 *
> +	 * Kexec calls native_stop_other_cpus() to stop remote CPUs
> +	 * before booting to new kernel, but that code has a "race"
> +	 * when the normal REBOOT IPI timesout and NMIs are sent to
> +	 * remote CPUs to stop them.  Doing WBINVD in stop_this_cpu()
> +	 * could potentially increase the posibility of the "race".
> +	 */
> +	if (code == SYS_RESTART)
> +		on_each_cpu(smp_func_cpu_flush_cache, NULL, 1);
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block tdx_reboot_nb = {
> +	.notifier_call = tdx_reboot_notify,
> +};
> +
>   static void __do_tdx_cleanup(void)
>   {
>   	/*
> @@ -3435,6 +3464,11 @@ void tdx_cleanup(void)
>   {
>   	if (enable_tdx) {
>   		misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
> +		/*
> +		 * Ignore the return value.  See the comment in
> +		 * tdx_bringup().
> +		 */
> +		unregister_reboot_notifier(&tdx_reboot_nb);
>   		__tdx_cleanup();
>   		kvm_disable_virtualization();
>   	}
> @@ -3518,6 +3552,17 @@ int __init tdx_bringup(void)
>   		enable_tdx = 0;
>   	}
>   
> +	if (enable_tdx)
> +		/*
> +		 * Ignore the return value.  @tdx_reboot_nb is used to flush
> +		 * cache for all CPUs upon rebooting to avoid having to do
> +		 * WBINVD in kexec while the kexec-ing CPU stops all remote
> +		 * CPUs.  Failure to register isn't fatal, because if KVM
> +		 * doesn't flush cache explicitly upon rebooting the kexec
> +		 * will do it anyway.
> +		 */
> +		register_reboot_notifier(&tdx_reboot_nb);
> +
>   	return r;
>   
>   success_disable_tdx:
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index af8798bc62ed..7478230cdc33 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1890,3 +1890,12 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
>   	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
>   }
>   EXPORT_SYMBOL_GPL(tdh_phymem_page_wbinvd_hkid);
> +
> +void tdx_cpu_flush_cache(void)
> +{
> +	lockdep_assert_preemption_disabled();
> +
> +	wbinvd();
> +	this_cpu_write(cache_state_incoherent, false);
> +}
> +EXPORT_SYMBOL_GPL(tdx_cpu_flush_cache);

