Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D41D6193
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862762; cv=none; b=exudEAvlFQi4VH8s8yK0uOkF2rdZJrY+boqd1duHWv12VgEm8Fkq/8IJ2r5knRyzdyQkBJ6U5t105CmWRH2po+NmMFsXZvm6b+y3ZQoHyHDGBH6XDsrR2f+4U7YjtEapMPjddWknRe5FFkDFIOgR19ilJ9RGZajAwEqawIKLSB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862762; c=relaxed/simple;
	bh=yoF0KokkjotdOYrXmuA3qqpgQr4ybWAWolZ/EmYbBWI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=exnZAackHnLkXvOEGu7aVccu8SYbXTFKJQAaDUQcdfTEAVk4Brlx39Rv2GKXBoM+kPpyoF9fSuiugypd74WOZD82KAqfX69WFqQI6u2PeiED7ohmejrqybkAhrToBXZHcOBvqepD1mLUFKO37fWaulpKpYk2Mw+0toelf0jJMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ovGoKcYh; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ovGoKcYh"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso6640796a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750862760; x=1751467560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ICU5+XCoFVfw+pvlSIRLwAfwbdwsLkDlJRvVC647Yk=;
        b=ovGoKcYhVYWFXj6R9Wp0vvL3VaKBY2II7n+qcC/oNDHOkKQr+96+9gXzcLjbYBxDWl
         fST3y22pA8hEbfxe8EJklJDLvkl76y8MRvyD/rRtrYbaVvmn1jc+KlAj60msg6nydvqr
         AO8DoRtb94XAs0X4qDEyFcstuYTk1ovoNIIseuawIUhPGad8Zj6kvHnZdDPE+cPEKwRq
         9vqx5YtV5C3kMazKMpUr57tjZfbMUOO+bzacnoA/Tm0nSEfHdF8FaLgp5R/3AX4jyUvl
         oGyj66FEyKzr1DCuNT84SrSzznZUNwOJPY+1p5Dbl1EqBH1GeUGgbLVplakUOZfMGH4A
         z9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862760; x=1751467560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ICU5+XCoFVfw+pvlSIRLwAfwbdwsLkDlJRvVC647Yk=;
        b=PUFmhnjYIfgvLvjQEX3MRJ8ouMhBu+raq5Hz9yb/4gp9rMR/VtCzBQ5Juyozjb4kj1
         PGDqvYmkf7Mnc/WoDZUo1JrdUcFqYOMbbNstGDFzXnaKiKR5n4Q90yEW+2eLgnF4D2EU
         iWntR70kVDmrsq5jQUxUgGqQ+lCDzSI7oPzBlUFUHw7ShFjkauDJ6W/bgfefF5BYut+N
         X2JdmAHQJvJx+dt3FrW+5rlu9zncUeTaq5j6uvJSNjWcQqQi6QMIuJZVXjGjdcsJLflj
         uT/kIV/TuKG9pnK1+iNKX7IXqGrNzONyKpnAW7ppeKiEH5Y35axgCy0taNs6om1qox1n
         gXtA==
X-Forwarded-Encrypted: i=1; AJvYcCXDuV7K3uVOo/kmB1JIwT1+11in2qc0trX6M75pL4e1FLMxlfwQL5c2bJ3sZj6zX6/FaoiUVfISCvxoBHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTnwFick31E6gmI3RFvIHqBfQEtXZk4d1Tw216ri+FQ0+TMuLp
	tsXn60j0vpy5gXV1LvXgrRA7kAAj1vv7PSloZEdIHBCLmjnJOPtLP6xepB+fDTBp8uiGQ4/TBt3
	k28yEsQ==
X-Google-Smtp-Source: AGHT+IFDMtdXk5SSPSuJ3EMb+V+kr/F+ajAZV1NFxOvALvKGnoBD5whHEelbGvIw9+H52XqJQYE63qTRlc0=
X-Received: from pjbqd16.prod.google.com ([2002:a17:90b:3cd0:b0:311:485b:d057])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d91:b0:311:abba:53c0
 with SMTP id 98e67ed59e1d1-315f26137f1mr5585885a91.9.1750862760589; Wed, 25
 Jun 2025 07:46:00 -0700 (PDT)
Date: Wed, 25 Jun 2025 07:45:59 -0700
In-Reply-To: <20250514064941.51609-1-liuyuntao12@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514064941.51609-1-liuyuntao12@huawei.com>
Message-ID: <aFwLpyDYOsHUtCn-@google.com>
Subject: Re: [PATCH] kvm: x86: fix infinite loop in kvm_guest_time_update when
 tsc is 0
From: Sean Christopherson <seanjc@google.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, May 14, 2025, Yuntao Liu wrote:
> Call Trace:
>  <TASK>
>  kvm_get_time_scale arch/x86/kvm/x86.c:2458 [inline]
>  kvm_guest_time_update+0x926/0xb00 arch/x86/kvm/x86.c:3268
>  vcpu_enter_guest.constprop.0+0x1e70/0x3cf0 arch/x86/kvm/x86.c:10678
>  vcpu_run+0x129/0x8d0 arch/x86/kvm/x86.c:11126
>  kvm_arch_vcpu_ioctl_run+0x37a/0x13d0 arch/x86/kvm/x86.c:11352
>  kvm_vcpu_ioctl+0x56b/0xe60 virt/kvm/kvm_main.c:4188
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:871 [inline]
>  __se_sys_ioctl+0x12d/0x190 fs/ioctl.c:857
>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>  do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
>  entry_SYSCALL_64_after_hwframe+0x78/0xe2
> 
> ioctl$KVM_SET_TSC_KHZ(r2, 0xaea2, 0x1)
> user_tsc_khz = 0x1
> 	|
> kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
> 	|
> 	ioctl$KVM_RUN(r2, 0xae80, 0x0)
> 		|
> 		...
> 	kvm_guest_time_update(struct kvm_vcpu *v)
> 		|
> 		if (kvm_caps.has_tsc_control)
> 			tgt_tsc_khz = kvm_scale_tsc(tgt_tsc_khz,
> 					    v->arch.l1_tsc_scaling_ratio);
> 			|
> 			kvm_scale_tsc(u64 tsc, u64 ratio)
> 			|
> 			__scale_tsc(u64 ratio, u64 tsc)
> 			ratio=122380531, tsc=2299998, N=48
> 			ratio*tsc >> N = 0.999... -> 0
> 			|
> 		kvm_get_time_scale
> 
> In function __scale_tsc, it uses fixed point number to calculate
> tsc, therefore, a certain degree of precision is lost, the actual tsc
> value of 0.999... would be 0. In function kvm_get_time_scale
> tps32=tps64=base_hz=0, would lead second while_loop infinite. when
> CONFIG_PREEMPT is n, it causes a soft lockup issue.
> 
> Fixes: 35181e86df97 ("KVM: x86: Add a common TSC scaling function")
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  arch/x86/kvm/x86.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 1fa5d89f8d27..3e9d6f368eed 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2605,10 +2605,14 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu)
>   * point number (mult + frac * 2^(-N)).
>   *
>   * N equals to kvm_caps.tsc_scaling_ratio_frac_bits.
> + *
> + * return 1 if _tsc is 0.
>   */
>  static inline u64 __scale_tsc(u64 ratio, u64 tsc)
>  {
> -	return mul_u64_u64_shr(tsc, ratio, kvm_caps.tsc_scaling_ratio_frac_bits);
> +	u64 _tsc = mul_u64_u64_shr(tsc, ratio, kvm_caps.tsc_scaling_ratio_frac_bits);
> +
> +	return  !_tsc ? 1 : _tsc;

This can be

	return _tsc ? : 1;

However, I'm 99% certain this only affects kvm_guest_time_update(), because it's
the only code that scales a TSC *frequency*, versus scaling a TSC value.  Hmm,
kvm_x86_vendor_init() also scales a frequency, but the multiplier and shift are
KVM controlled, so that calculation can never be '0.

So I think just this for a fix?  Because in all other cases, a result of '0' is
totally fine, and arguably even more correct, e.g. when used in adjust_tsc_offset_host().

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b58a74c1722d..de51dbd85a58 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3258,9 +3258,11 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
        /* With all the info we got, fill in the values */
 
-       if (kvm_caps.has_tsc_control)
+       if (kvm_caps.has_tsc_control) {
                tgt_tsc_khz = kvm_scale_tsc(tgt_tsc_khz,
                                            v->arch.l1_tsc_scaling_ratio);
+               tgt_tsc_khz = tgt_tsc_khz ? : 1;
+       }
 
        if (unlikely(vcpu->hw_tsc_khz != tgt_tsc_khz)) {
                kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_khz * 1000LL,
