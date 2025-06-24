Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8A2DA740
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778411; cv=none; b=H0MyoWxBof+UgCXQiXeM9IRs1fPVD+Lhnug3I1D+EENo2IMCxcO5P1uSqsVUAXxTW5f3rWJrzi5SJHjaf/T+nfIxJWosZtP7Lc8o/e/C2hBXBrBU4YlY79fACY9aJUrw8HDgQ4op7IflE2x8EN09dvRiUspO8/ETjPgJeI1UFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778411; c=relaxed/simple;
	bh=Vm3A6wHZ/yoyBgE0EAf83UZWXKbrAMUvq94GaHakSHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FSR2Ocoo2EaIJWcwndVUUXoESPGb/SB4NyPxofqCtD4/dOctJ15m8D1cJOgVmYsAP4g2bpB4nfwPpO7HI9SEtnvYvsZsZv4BvlMg6BFYEDtS+Sb1ihVkFU0ztpCkTKogZEXEnlf9g1yE2B/QW/TKdhEq9JXy2L8k2KVMA5wZHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbulfpFz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbulfpFz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311d670ad35so5219273a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750778409; x=1751383209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGRfoH9LdFtGM39WnIuEZlC9+8YFZhcusYM4kwtNz9g=;
        b=GbulfpFzVniqykzkj1T0Fwd4FIgupk9wVLQnjO1XZ0dHCI4paq6IWRzII0f4ADdtF6
         Vw5y8dzKjjy5hfkHoHo/Oraknp1ykeYbxZTOebR9g46Lx558voUmyyYhTQbj2WLOagRT
         2kw4zB5oXCKgahHLvdxVjVIPZhbRXF51t8MJxwARH8QNczaTsF+Hn+ghw03huk1j6mkb
         eXOyi88F59ApYjVABVDA/HEIUaQ9VN1cm2/UimCsVwwd3p3rnBXXFnjc+ryV0rwA0B1Y
         xz9nYsxjbeARbmbpa5Tn3xUwG63t0yutOK6hnrqWrpX5BWQNVRGm3P5yUOJH/UmHv5Px
         JLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778409; x=1751383209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGRfoH9LdFtGM39WnIuEZlC9+8YFZhcusYM4kwtNz9g=;
        b=dPeVS7b9l+tzpeavc3Sr640ftR0gjV/llxzqghMgcs29WvhPMROVVPV4yvAxM/kyQx
         Y7CLcRucmdr422kehaSSa2ScUhBv3slw+hSk8Dp1s9yjsl+RZrsSTihHOcsJ6qs5/43z
         cGAWXpgbpPVdzITn8ttFi5f7wyb36ZKBavAhoygLXZeKx3rOpk/182YP4q2JVEPe227o
         4YNRcxNhmeIZy/sE6wpd9eVCA+HwOl7knzIMyh5xzewlEAu+pQAFKMmPrIyvKem4e7RI
         r+sO+cIBt1D8cJ/hNNqpBIAAWfc0tA9ZUNh+1aNPSLCL4Ho+VMJfn7i0L1xJ/FFdF2s/
         XJWA==
X-Forwarded-Encrypted: i=1; AJvYcCXY6ijIXrjSUgcHxeWxl1bS1dyYNmXUA2LW4/7svq7cpDyHF93+zpX/g0hrKs3do9JTuahYODeLOo3uL5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjMCUwbBdzhVlTSK9y6v5nXnm66sBgQOmxu1gO6WIUGiMeoSd
	bQfv2Yv1yTz+qRaz8E6HGbheo1Wb+ov7KKSusBNkKRibu367kKglzZDW57sWRFUKOttkcKxZfsU
	KttTeMA==
X-Google-Smtp-Source: AGHT+IGY1sNiClwBZTcmK97/eMChbdF+koURDQ4b/nqndAH0Pf6+wiOIfdVBF86RlKu8osKt9rWO6gJhKmc=
X-Received: from pjn14.prod.google.com ([2002:a17:90b:570e:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c11:b0:312:26d9:d5b4
 with SMTP id 98e67ed59e1d1-3159d8c7e55mr28632166a91.17.1750778408771; Tue, 24
 Jun 2025 08:20:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:20:07 -0700
In-Reply-To: <20250328171205.2029296-4-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-4-xin@zytor.com>
Message-ID: <aFrCJzodXP0sT6Ny@google.com>
Subject: Re: [PATCH v4 03/19] KVM: VMX: Disable FRED if FRED consistency
 checks fail
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li (Intel) wrote:
> From: Xin Li <xin3.li@intel.com>
> 
> Do not virtualize FRED if FRED consistency checks fail.
> 
> Either on broken hardware, or when run KVM on top of another hypervisor
> before the underlying hypervisor implements nested FRED correctly.
> 
> Suggested-by: Chao Gao <chao.gao@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> ---
> 
> Change in v4:
> * Call out the reason why not check FRED VM-exit controls in
>   cpu_has_vmx_fred() (Chao Gao).
> ---
>  arch/x86/kvm/vmx/capabilities.h | 11 +++++++++++
>  arch/x86/kvm/vmx/vmx.c          |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
> index b2aefee59395..b4f49a4690ca 100644
> --- a/arch/x86/kvm/vmx/capabilities.h
> +++ b/arch/x86/kvm/vmx/capabilities.h
> @@ -400,6 +400,17 @@ static inline bool vmx_pebs_supported(void)
>  	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept;
>  }
>  
> +static inline bool cpu_has_vmx_fred(void)
> +{
> +	/*
> +	 * setup_vmcs_config() guarantees FRED VM-entry/exit controls
> +	 * are either all set or none.  So, no need to check FRED VM-exit
> +	 * controls.
> +	 */
> +	return cpu_feature_enabled(X86_FEATURE_FRED) &&

Drop the cpu_feature_enabled().  These helpers are all about checking raw CPU
support; whether or not the kernel is configured to support FRED is irrelevant.

[For these helpers; KVM obviously needs to account for FRED support in other
 paths, but that should be automagically handled by kvm_set_cpu_caps()]


> +		(vmcs_config.vmentry_ctrl & VM_ENTRY_LOAD_IA32_FRED);
> +}
> +
>  static inline bool cpu_has_notify_vmexit(void)
>  {
>  	return vmcs_config.cpu_based_2nd_exec_ctrl &
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index e38545d0dd17..ab84939ace96 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8052,6 +8052,9 @@ static __init void vmx_set_cpu_caps(void)
>  		kvm_cpu_cap_check_and_set(X86_FEATURE_DTES64);
>  	}
>  
> +	if (!cpu_has_vmx_fred())
> +		kvm_cpu_cap_clear(X86_FEATURE_FRED);
> +
>  	if (!enable_pmu)
>  		kvm_cpu_cap_clear(X86_FEATURE_PDCM);
>  	kvm_caps.supported_perf_cap = vmx_get_perf_capabilities();
> -- 
> 2.48.1
> 
