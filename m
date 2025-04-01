Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE520550E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519663; cv=none; b=rEXxQHkduEkWkZ2ByDwyl5ro+m4pM6r48tIVR9+4DVKZ3dluGROMAGKBXbxsCnP8NgqrXuQffS6Z/1Ia7AKqwuWYXXdlzjfd1duAPEjMV4ZcFqf1SukawxbScLZCpuQcOcqCLD+1jEjPKn+wil6mjSfgzwCe6ZzdA11Ku2ZTuZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519663; c=relaxed/simple;
	bh=F+wrxflNOl9CWWkjxGsUTbnqc1KvEnpfyAiXu1HpDCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5jusSgsU9N8MBu6kG2nZxYm+bchWLMiYZ5hUZZw7l8K0TyuzVMaU4F70GTbe3UXrEW94VYG9oxf+qKq7gkqbGBu2jWqOPtQ+I+Lm5lYRKr4msnxRAlr9U4FzjRatEQf+bCA/UHP/c+Ognj47rBaH8pIYCPwAJyjl+MhDydQcCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fhYRIWwm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fhYRIWwm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so58164385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743519660; x=1744124460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKU+LR+HJWMVjrtaH7LXhtAj8RB+ZnjTx5pbaQyRxm8=;
        b=fhYRIWwmc8E9Vt0LUHhWCQCmRZIhTnb6K0I4Be0j9m76LBxqKZm/HE61iZXzfgYzKK
         aDkWGrp6Y2EzHZuba8gyBmJzgnTwCmaw7n+eQ3qJHs3n4S0tcve0JeO46zBvusuA5QOU
         SihCy73v9aCDux/BFLlujk9BtRksD2ce0+ywE+sn+yAJ2LQG/qN/bGjIZp9ZqZGm0KrY
         e7CEzjd5P0eFmC7Cia/uJ063xeKmSja3QBk2P8sZjunYkyTmJkZa4hp1nr5JT1PPSyAn
         lfhI9HnHH5D6oghuxcMlY7z0TBC5W0SOR6soqSVIsMg3CH3SNoEt42pX+oeLJbH00+Ff
         S4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743519660; x=1744124460;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKU+LR+HJWMVjrtaH7LXhtAj8RB+ZnjTx5pbaQyRxm8=;
        b=YNahqOPAfGu7+7jow4fNnGTJ38ZtU+J6l43s3M/ztgmcfsfymQaMgYeURIQpfEWfvD
         zi8/DyTRZd2gfGMe9eJ4Z3rcsr4sK3gqqyK4fBm4sM1lUrwsrtRJ+JIggbM4jDLijjea
         RWxcma0tmvbyM3YaUgW8QTNwL8r6A70lyNvmpVL48lnpoq/FL9zRcUXox4ldRBbJjScq
         14508LEJqz/zZTHBsNpMCblTuuHBOcobtmkWlhGRViWv3Q2xQdb+lSZ335Pz4BxWOSOU
         m5Wfq8tdFFVtWf3ksGuOYTRIcid4XmfL5QKPe1i5yWMYKOpy4+FBvuTSZmpx23toR9i+
         HF+g==
X-Forwarded-Encrypted: i=1; AJvYcCUMHh3A1OIqKPgGO12bvNxUUbDWU2ZAm7BTkSdNNdbH48XqtbtU1KVZwRGD0LAxUXWxL0bwm07szUQlz9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI58crJrhj0zdU5UBstKjryAJEq2+xDXhOfttoyJwcOhgZUOiJ
	0Kf0FoOvcgq2PSKj3FlA4eqqw628VoC7QqGRHIUwzdXUo8TbgmVIN2zbR5BJaqA=
X-Gm-Gg: ASbGncubxa34a5dWulbXpowqvxv1xxsoQo6AudqIYvOSshurD4GV/zCRUSTm0ZMXl6N
	WdIwyPGvy56toxnnxLJeLXHDoAbXzUZwTk1+vB8i45qpKe2EoFZ7koVd7vxfs/IhefHbAcIiTZK
	myx87uRFNNfN+lK1hXz+h3aCR4R7YL/aJnaA8xHk1gAxP1+bE9dK1PyRazWO4rq/W7uAESJiS0e
	harRxvWSRsJjK64VajESnpAeCzgHdAeHqh8pn7sLe2g6dzyNAiGhDGfcqcS7wl6G1l+kGPZMhz0
	Z14Vlqr02QTynW0OiRUfP6cFmzqiZeRtF+tr1GPjpO1UiqzFBg==
X-Google-Smtp-Source: AGHT+IGcyzHAF78T6NEneYbAVUuHYU7jOxzrDM7UPD8EfgrIsarIcz2ntCg+mm4W1Lba4djSp0L92Q==
X-Received: by 2002:a05:600c:4f82:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-43db62b75c6mr100679905e9.20.1743519659693;
        Tue, 01 Apr 2025 08:00:59 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm13293480f8f.42.2025.04.01.08.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:00:59 -0700 (PDT)
Message-ID: <5d4b2b95-bb11-4d1f-8cba-0bcd8e864711@suse.com>
Date: Tue, 1 Apr 2025 18:00:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
To: Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Kai Huang <kai.huang@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Jani Nikula <jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>,
 Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-2-sohil.mehta@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20250327234629.3953536-2-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.03.25 г. 1:46 ч., Sohil Mehta wrote:
> The unknown_nmi_panic variable is used to control whether the kernel
> should panic on unknown NMIs. There is a sysctl entry for the same, which
> can be used to change the behavior at runtime.
> 
> However, it seems that in some places, the option unnecessarily depends
> on CONFIG_X86_LOCAL_APIC. Other code in nmi.c uses unknown_nmi_panic
> without such a dependency. This results in a few messy #ifdefs
> splattered across the code. The dependency was likely introduce due to a
> potential compile issue [1] reported a long time ago. Such an issue no
> longer exists.
> 
> Also, similar NMI panic options, such as panic_on_unrecovered_nmi and
> panic_on_io_nmi, do not have an explicit dependency on the local APIC.
> Though, it's hard to imagine a production system without the local APIC
> configuration, making a specific NMI sysctl option dependent on it
> doesn't make sense.
> 
> Remove the explicit dependency between unknown NMI handling and the
> local APIC to make the code cleaner and more consistent.
> 
> While at it, reorder the header includes to maintain alphabetical order.
 > > [1]: https://lore.kernel.org/lkml/40BC67F9.3000609@myrealbox.com/
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
>   arch/x86/include/asm/nmi.h |  4 ++--
>   arch/x86/kernel/setup.c    | 37 ++++++++++++++++---------------------
>   2 files changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
> index f677382093f3..9cf96cce02fc 100644
> --- a/arch/x86/include/asm/nmi.h
> +++ b/arch/x86/include/asm/nmi.h
> @@ -14,10 +14,10 @@ extern void release_perfctr_nmi(unsigned int);
>   extern int reserve_evntsel_nmi(unsigned int);
>   extern void release_evntsel_nmi(unsigned int);
>   
> -extern int unknown_nmi_panic;
> -
>   #endif /* CONFIG_X86_LOCAL_APIC */
>   
> +extern int unknown_nmi_panic;
> +
>   #define NMI_FLAG_FIRST	1
>   
>   enum {
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index c7164a8de983..c3e1ae7373e9 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -7,10 +7,11 @@
>    */
>   #include <linux/acpi.h>
>   #include <linux/console.h>
> -#include <linux/cpu.h>
>   #include <linux/crash_dump.h>
> +#include <linux/cpu.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/efi.h>
> +#include <linux/hugetlb.h>
>   #include <linux/ima.h>
>   #include <linux/init_ohci1394_dma.h>
>   #include <linux/initrd.h>
> @@ -18,21 +19,19 @@
>   #include <linux/memblock.h>
>   #include <linux/panic_notifier.h>
>   #include <linux/pci.h>
> +#include <linux/random.h>
>   #include <linux/root_dev.h>
> -#include <linux/hugetlb.h>
> -#include <linux/tboot.h>
> -#include <linux/usb/xhci-dbgp.h>
>   #include <linux/static_call.h>
>   #include <linux/swiotlb.h>
> -#include <linux/random.h>
> +#include <linux/tboot.h>
> +#include <linux/usb/xhci-dbgp.h>
> +#include <linux/vmalloc.h>
>   
>   #include <uapi/linux/mount.h>
>   
>   #include <xen/xen.h>
>   
>   #include <asm/apic.h>
> -#include <asm/efi.h>
> -#include <asm/numa.h>
>   #include <asm/bios_ebda.h>
>   #include <asm/bugs.h>
>   #include <asm/cacheinfo.h>
> @@ -47,18 +46,16 @@
>   #include <asm/mce.h>
>   #include <asm/memtype.h>
>   #include <asm/mtrr.h>
> -#include <asm/realmode.h>
> +#include <asm/nmi.h>
> +#include <asm/numa.h>
>   #include <asm/olpc_ofw.h>
>   #include <asm/pci-direct.h>
>   #include <asm/prom.h>
>   #include <asm/proto.h>
> +#include <asm/realmode.h>
>   #include <asm/thermal.h>
>   #include <asm/unwind.h>
>   #include <asm/vsyscall.h>
> -#include <linux/vmalloc.h>
> -#if defined(CONFIG_X86_LOCAL_APIC)
> -#include <asm/nmi.h>
> -#endif

As far as headers are concerned only this change falls under the 
"simplify nmi handling code" the others while nice cleanups should 
ideally be in a separate patch.

>   
>   /*
>    * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
> @@ -150,6 +147,13 @@ static size_t ima_kexec_buffer_size;
>   int bootloader_type, bootloader_version;
>   
>   static const struct ctl_table x86_sysctl_table[] = {
> +	{
> +		.procname       = "unknown_nmi_panic",
> +		.data           = &unknown_nmi_panic,
> +		.maxlen         = sizeof(int),
> +		.mode           = 0644,
> +		.proc_handler   = proc_dointvec,
> +	},
>   	{
>   		.procname	= "panic_on_unrecovered_nmi",
>   		.data		= &panic_on_unrecovered_nmi,
> @@ -185,15 +189,6 @@ static const struct ctl_table x86_sysctl_table[] = {
>   		.mode		= 0644,
>   		.proc_handler	= proc_dointvec,
>   	},
> -#if defined(CONFIG_X86_LOCAL_APIC)
> -	{
> -		.procname       = "unknown_nmi_panic",
> -		.data           = &unknown_nmi_panic,
> -		.maxlen         = sizeof(int),
> -		.mode           = 0644,
> -		.proc_handler   = proc_dointvec,
> -	},
> -#endif

Why move the definition and not just delete the #ifdef ?

>   #if defined(CONFIG_ACPI_SLEEP)
>   	{
>   		.procname	= "acpi_video_flags",

