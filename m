Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA625DD06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711049; cv=none; b=s5UfDy9Zf7VUi10cl2C7ofmFoz+NdR0EMlpaGFlbk5e/q9pk+iz0DDG59LzXMjCBaGZReArCZUIqkDvC24flNT765JtDbTxxLZB4rAC35evaWGmzcsateCn9Lua8bndUJ5oPZlgN2zhD+tlcXPyQRXMPliR+8LEzCC9l8zwhPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711049; c=relaxed/simple;
	bh=IAbb+57bvxBTSqct+jicwJiBlS6fZhLGUsf4hfx/jXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJK5Ue1XKHsCHtzg6v5CDWoT+/+GtXbaNEt7VEih+ISbI379IpYvNqI/S+KKpHc6sNBzdATiSEABCFoBGsLBtR/kJF3blbmdr85SarBlIfxVzKEg68Fj6lrtFXqhotL2xV5DJGomrChzglxoz1B689zbO7Al/dv37Cg9hLbUL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=baTPjAoQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="baTPjAoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743711047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGv3I+Uf1BgmOqSQxj8McIcEQIndE7P+WntswOEF8vk=;
	b=baTPjAoQ4F6Ct5jsZ0BYeWrxIBqc1/lvexl/sWxVPT2ZCQVA30icDY4BNW1GF/L29Vg28a
	j3o5xHsw148eGSX8b6dyhrk90LuhZ7NpfEOY8RB2GgnuoexbyI+gt+gqevVqBbfC/i9HMm
	e32mCtWxTop6s6vP1ceX/ymy0nBDb50=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-NZisrMuQO120nHRvVzRGGg-1; Thu, 03 Apr 2025 16:10:09 -0400
X-MC-Unique: NZisrMuQO120nHRvVzRGGg-1
X-Mimecast-MFC-AGG-ID: NZisrMuQO120nHRvVzRGGg_1743711008
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769a1db721so33082711cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711008; x=1744315808;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGv3I+Uf1BgmOqSQxj8McIcEQIndE7P+WntswOEF8vk=;
        b=KdnyoNr/BjnqK6lKwgBjmtQbbfufBprqWhLR7byQJOg6jXrHNIxdpmxUxivqyj+Ar0
         LFJdFY0Cdb4jgSmOCHquAsFkW2zFNTldOTRsTJt6XD9twDaaN9uoIIBHELFqv9bXsXo4
         gkYDd8TsvvMDHDjF1gbyhoR7/4epiI/sR/bhGOBRXjKydmD5moc+ihA34iKivqDfbWyi
         do6mZRLIAdU8MBwHqMuQEkv/g6n4VnZwmpknHuZZYDSHAtSUytMD+jBncr6KuLvpSCdT
         kvgEK7A3FFgjCO7YNBK7S3Cv12Es1ryAMakmVr+DUeMoJ36jqThV64F8ggicKLw2R0BH
         BGFg==
X-Forwarded-Encrypted: i=1; AJvYcCXl6VHYn7Y8cq8Sz4aZbd1uSkDK6QjnZKuRdF/k/v1oumOX0IXEQ/7+gb8CXA4Yo3Hr4SbHdEolJM94yWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGPmvad0fOYg4emXoXHnuPsPdkAvWAvMFNp6k1b4uYW3rS5r41
	ShrJp+r8Db9c3eA/KXY1wl0Hy/TPXX0dr1aQ2XJkqzVzIullpkXcOPGPRi2g8CmiMcazXAeTYGg
	G2J2tptdJWYc6wpgeTCl0j4LTRp+7p6xPTx3xS5uWixsdAhIizX6X1GRmLgh3uQ==
X-Gm-Gg: ASbGncsfKm2g+bNw9Oh7Pby2DA4lkYT1wNOAlaKc4DEKzINT20C+LQAWl5WiNz9mq7y
	UCanDt2hQobcra8PHn+COayvBqCQmx44IWAsKNeXMt/i3URr7sKCh9ZbTx7lyN3vBSny/EguEvI
	MduoQ8vUd3m4jeZ1Pors+JELo7ZBIgbAi2EpDpZN7KxuSP97MXQ1n0QAZFw0q94wRt+DauZ0uSd
	nOgL/PX2aZxxBTqKpWUqlm2YAyGodEDRqYIoHVwAwE6FT5Vq/zGQkWGdtpEhliaZab4aQgW0eJB
	WIT45IF0eAYUPp4=
X-Received: by 2002:a05:622a:1920:b0:477:6f28:8c16 with SMTP id d75a77b69052e-4792490da45mr12914321cf.6.1743711008619;
        Thu, 03 Apr 2025 13:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxK4rvzFyEl6eiIaIgKnQSl586hDylja1va27HaDiyQgv7ChcS37qrANaiPXgjgwx3huqPGg==
X-Received: by 2002:a05:622a:1920:b0:477:6f28:8c16 with SMTP id d75a77b69052e-4792490da45mr12913871cf.6.1743711008200;
        Thu, 03 Apr 2025 13:10:08 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e7355f9sm116588585a.24.2025.04.03.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:10:07 -0700 (PDT)
Message-ID: <a910ebd37e05091ec59ba7e731f10f6f7b9b97bc.camel@redhat.com>
Subject: Re: [RFC PATCH 13/24] KVM: nSVM: Parameterize svm_flush_tlb_asid()
 by is_guest_mode
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:10:06 -0400
In-Reply-To: <20250326193619.3714986-14-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-14-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:36 +0000, Yosry Ahmed wrote:
> svm_flush_tlb_asid() currently operates on the current VMCB. In
> preparation for properly tracking TLB flushes for L1 and L2 ASIDs,
> refactor it to take is_guest_mode and find the proper VMCB. All existing
> callers pass is_guest_mode(vcpu) to maintain existing behavior for now.
> 
> Move the comment about only flushing the current ASID to
> svm_flush_tlb_all(), where it probably should have been anyway, because
> svm_flush_tlb_asid() now flushes a given ASID, not the current ASID.
> 
> Create a svm_flush_tlb_guest() wrapper to use as the flush_tlb_guest()
> callback.
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/svm.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 865c5ce4fa473..fb6b9f88a1504 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4016,25 +4016,24 @@ static void svm_enable_nmi_window(struct kvm_vcpu *vcpu)
>  	svm->vmcb->save.rflags |= (X86_EFLAGS_TF | X86_EFLAGS_RF);
>  }
>  
> -static void svm_flush_tlb_asid(struct kvm_vcpu *vcpu)
> +static struct vmcb *svm_get_vmcb(struct vcpu_svm *svm, bool is_guest_mode)
> +{
> +	return is_guest_mode ? svm->nested.vmcb02.ptr : svm->vmcb01.ptr;
> +}

Not sure 100% about this helper, it name might be a bit confusing because
we already have a current vmcb. Maybe add a comment above stating this
this is to get vmcb which might not be currently active?

> +
> +static void svm_flush_tlb_asid(struct kvm_vcpu *vcpu, bool is_guest_mode)
>  {
>  	struct vcpu_svm *svm = to_svm(vcpu);
> +	struct vmcb *vmcb = svm_get_vmcb(svm, is_guest_mode);
>  
>  	/*
>  	 * Unlike VMX, SVM doesn't provide a way to flush only NPT TLB entries.
>  	 * A TLB flush for the current ASID flushes both "host" and "guest" TLB
>  	 * entries, and thus is a superset of Hyper-V's fine grained flushing.
>  	 */
> -	kvm_hv_vcpu_purge_flush_tlb(vcpu, is_guest_mode(vcpu));
> -
> -	/*
> -	 * Flush only the current ASID even if the TLB flush was invoked via
> -	 * kvm_flush_remote_tlbs().  Although flushing remote TLBs requires all
> -	 * ASIDs to be flushed, KVM uses a single ASID for L1 and L2, and
> -	 * unconditionally does a TLB flush on both nested VM-Enter and nested
> -	 * VM-Exit (via kvm_mmu_reset_context()).
> -	 */
> -	vmcb_set_flush_asid(svm->vmcb);
> +	kvm_hv_vcpu_purge_flush_tlb(vcpu, is_guest_mode);
> +	if (vmcb)
> +		vmcb_set_flush_asid(vmcb);
>  }
>  
>  static void svm_flush_tlb_current(struct kvm_vcpu *vcpu)
> @@ -4050,7 +4049,7 @@ static void svm_flush_tlb_current(struct kvm_vcpu *vcpu)
>  	if (svm_hv_is_enlightened_tlb_enabled(vcpu) && VALID_PAGE(root_tdp))
>  		hyperv_flush_guest_mapping(root_tdp);
>  
> -	svm_flush_tlb_asid(vcpu);
> +	svm_flush_tlb_asid(vcpu, is_guest_mode(vcpu));
>  }
>  
>  static void svm_flush_tlb_all(struct kvm_vcpu *vcpu)
> @@ -4065,7 +4064,14 @@ static void svm_flush_tlb_all(struct kvm_vcpu *vcpu)
>  	if (WARN_ON_ONCE(svm_hv_is_enlightened_tlb_enabled(vcpu)))
>  		hv_flush_remote_tlbs(vcpu->kvm);
>  
> -	svm_flush_tlb_asid(vcpu);
> +	/*
> +	 * Flush only the current ASID even if the TLB flush was invoked via
> +	 * kvm_flush_remote_tlbs().  Although flushing remote TLBs requires all
> +	 * ASIDs to be flushed, KVM uses a single ASID for L1 and L2, and
> +	 * unconditionally does a TLB flush on both nested VM-Enter and nested
> +	 * VM-Exit (via kvm_mmu_reset_context()).
> +	 */
> +	svm_flush_tlb_asid(vcpu, is_guest_mode(vcpu));
>  }
>  
>  static void svm_flush_tlb_gva(struct kvm_vcpu *vcpu, gva_t gva)
> @@ -4075,6 +4081,11 @@ static void svm_flush_tlb_gva(struct kvm_vcpu *vcpu, gva_t gva)
>  	invlpga(gva, svm_get_current_asid(svm));
>  }
>  
> +static void svm_flush_tlb_guest(struct kvm_vcpu *vcpu)
> +{
> +	svm_flush_tlb_asid(vcpu, is_guest_mode(vcpu));
> +}
> +
>  static inline void sync_cr8_to_lapic(struct kvm_vcpu *vcpu)
>  {
>  	struct vcpu_svm *svm = to_svm(vcpu);
> @@ -5187,7 +5198,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
>  	.flush_tlb_all = svm_flush_tlb_all,
>  	.flush_tlb_current = svm_flush_tlb_current,
>  	.flush_tlb_gva = svm_flush_tlb_gva,
> -	.flush_tlb_guest = svm_flush_tlb_asid,
> +	.flush_tlb_guest = svm_flush_tlb_guest,
>  
>  	.vcpu_pre_run = svm_vcpu_pre_run,
>  	.vcpu_run = svm_vcpu_run,


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>


Best regards,
	Maxim Levitsky





