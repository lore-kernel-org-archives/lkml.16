Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E01E1C29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600976; cv=none; b=ZRIkkDdcopSfqLm6FOEmu/sYBxg2foJM8GpzL1Kd06rKMfV2+ajgUeIrP69Uk8jJXFeldpjvIw/FgKKtuA1ofAxNkDVXbb0iUSjQ4/ipmuzYcoDGSGwBZXr4xNYUL8/P64AM6AdNNuO81JgtcrrPGZgTacdYglF2Q8OGOYxjMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600976; c=relaxed/simple;
	bh=MqBOTDc9GRqer6IcN1CWf28Fjo98+zBzhr/8RRY4has=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dpy/K7I7JLA1OAhe/G4tfMjsceuQKceEDtRL/PIx40KnAXf5dZ+0B+z5B7WzAG0sLqg1aKbSY4cDd5Clcz8nUiQ1yzrWM1qUFlgl1zzTnfkzA7ZS1CUxDc8YSW/KMYXBzZYHruPTvQN84BzAW+/jqT8unO8E6+sa9wK6P0G2APg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jnakGx+s; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jnakGx+s"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so12018204a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743600974; x=1744205774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mk+AHGtNwwzbB9JrzbmHG5xhTZS1h9alfQA3RqPYHQQ=;
        b=jnakGx+sq4IcYFe97Jh95q4lWQnA7I+SUsN+n9j5SVMcMQw2uJ4H2JG8j4Pd/yQFym
         qlNGSlG+vFt7lIXZusa5kBGuexBxQG0xb2WbSbAyReNgAlzOHdVDhNQrVLKLxr114pPK
         Mzrz+ELwB/AvaZB8kdFlc0fmd1Fm6XmiGaxbMwF9nzV4+4Hu2WIRANrM1bddW9wYeFUI
         oX2YFRJPZZj9/T043ub9v4sP3uEiZcig7nbGbvCfjARfLYO0nEokJZsd7lumnLgxk7S1
         V1xKjD42uFQHQxaHDQjeYNPT/Tnl1TSxG4hU0ncSpAPTHBRsIML9bvIzLW7HdDWLJYuN
         GhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600974; x=1744205774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mk+AHGtNwwzbB9JrzbmHG5xhTZS1h9alfQA3RqPYHQQ=;
        b=CvU5yZ377ORHIApHSOagYCXL8bT6OTmrZ8J6K9+9FO0MKH1OKKfkJh2hrBy2cwXrAJ
         iTgGtS2xLUfaNfeBv4W2olo5NcP1vW19we3vVYAmTkcyTz8Povi6i1Z9ocQFb1PeJR+V
         VpvZRShRj9RhvbcHbvZnjcok8f51ML/NJVZNjeF0WnPT3isR83jZWoi2J+BiAUw3YqgN
         wXOJKwDxKsFdBMH9k849KEfQC1bocxJYllNFr6SxVk+eqYHUNczc4Vxrc0fimeVqof+l
         P4G5WQxBMQGsh5WczgDFDxVImzluDuWi0HMSyV2BIg65PtkWOgS1FBi+L8Spw/oP7vmf
         o+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUgaX8quWO7J4G35CWonEusf3Lz/TbHGfyMFTTZpXMiLvrU9m6ZpxfC0/nJg5DlgVnN9Ly3dEZmYxxscsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwIeeJ2pSndAXFFd0pQjBqahOC00uwETnlA1IODCHiF/8DdwM
	wvap5VJ9c6lzaXNIvIDh+9uMINhmRh0hUJ6NBPokSi2T87K/8VOGmQACZNpDN5lpvXqeHYFdB+U
	Rjg==
X-Google-Smtp-Source: AGHT+IEg80yE/5EQOyTbP8oPtkkE6VHG4R4N8JI2Kg9VJlrk7/RNDAbsRVFXgGcpSHsz8luqfesoSLLT04M=
X-Received: from pjbso5.prod.google.com ([2002:a17:90b:1f85:b0:2ff:6e58:8a0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c8e:b0:2fe:a545:4c84
 with SMTP id 98e67ed59e1d1-305321634dcmr21618691a91.34.1743600974287; Wed, 02
 Apr 2025 06:36:14 -0700 (PDT)
Date: Wed, 2 Apr 2025 06:36:12 -0700
In-Reply-To: <20250401044931.793203-1-jon@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401044931.793203-1-jon@nutanix.com>
Message-ID: <Z-09TLXNWv-msJ4O@google.com>
Subject: Re: [PATCH] KVM: x86: Expose ARCH_CAP_FB_CLEAR when invulnerable to MDS
From: Sean Christopherson <seanjc@google.com>
To: Jon Kohler <jon@nutanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 31, 2025, Jon Kohler wrote:
> Expose FB_CLEAR in arch_capabilities for certain MDS-invulnerable cases 
> to support live migration from older hardware (e.g., Cascade Lake, Ice 
> Lake) to newer hardware (e.g., Sapphire Rapids or higher). This ensures 
> compatibility when user space has previously configured vCPUs to see 
> FB_CLEAR (ARCH_CAPABILITIES Bit 17).
> 
> Newer hardware sets the following bits but does not set FB_CLEAR, which 
> can prevent user space from configuring a matching setup:

I looked at this again right after PUCK, and KVM does NOT actually prevent
userspace from matching the original, pre-SPR configuration.  KVM effectively
treats ARCH_CAPABILITIES like a CPUID leaf, and lets userspace shove in any
value.  I.e. userspace can still migrate+stuff FB_CLEAR irrespective of hardware
support, and thus there is no need for KVM to lie to userspace.

So in effect, this is a userspace problem where it's being too aggressive in its
sanity checks.

FWIW, even if KVM did reject unsupported ARCH_CAPABILITIES bits, I would still
say this is userspace's problem to solve.  E.g. by using MSR filtering to
intercept and emulate RDMSR(ARCH_CAPABILITIES) in userspace.

>     ARCH_CAP_MDS_NO
>     ARCH_CAP_TAA_NO
>     ARCH_CAP_PSDP_NO
>     ARCH_CAP_FBSDP_NO
>     ARCH_CAP_SBDR_SSDP_NO
> 
> This change has minimal impact, as these bit combinations already mark 
> the host as MMIO immune (via arch_cap_mmio_immune()) and set 
> disable_fb_clear in vmx_update_fb_clear_dis(), resulting in no 
> additional overhead.
> 
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Signed-off-by: Jon Kohler <jon@nutanix.com>
> 
> ---
>  arch/x86/kvm/x86.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c841817a914a..2a4337aa78cd 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -1641,6 +1641,20 @@ static u64 kvm_get_arch_capabilities(void)
>  	if (!boot_cpu_has_bug(X86_BUG_GDS) || gds_ucode_mitigated())
>  		data |= ARCH_CAP_GDS_NO;
>  
> +	/*
> +	 * User space might set FB_CLEAR when starting a vCPU on a system
> +	 * that does not enumerate FB_CLEAR but is also invulnerable to
> +	 * other various MDS related bugs. To allow live migration from
> +	 * hosts that do implement FB_CLEAR, leave it enabled.
> +	 */
> +	if ((data & ARCH_CAP_MDS_NO) &&
> +	    (data & ARCH_CAP_TAA_NO) &&
> +	    (data & ARCH_CAP_PSDP_NO) &&
> +	    (data & ARCH_CAP_FBSDP_NO) &&
> +	    (data & ARCH_CAP_SBDR_SSDP_NO)) {
> +		data |= ARCH_CAP_FB_CLEAR;
> +	}
> +
>  	return data;
>  }
>  
> -- 
> 2.43.0
> 
