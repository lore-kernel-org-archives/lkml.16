Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B21A2391
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051351; cv=none; b=WOMMsFPvzqsTQysTZs4PPs6SF2li48Vds6rLbxBjLN2qrEx3y054cV2dL4+v2cng47kdh/ZQ0zt2L/9FLkk28hAklqSv4HTvR1mFVPXUPLH0Ki0gccjIBZJE6Mcgzxr2pjnG61EpZfzLLKRqg4FaMAfn6NR4keASK0WVqPZRad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051351; c=relaxed/simple;
	bh=VHSJz1dRNiP2G582gS4azghf/c6ZHxaFNwWXYVETiBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUhHiAqYg1euW+1E1T/5zfF5XMM/JX6ShPDTk0NYpOsgGHWHPx56UdxINPBoQ+J6NCs5Sr+KaHQ1/MlAJ68TVoDqNygfOmU4MTk9AOIeQ7I1M1Y3L1JQEQCJUmXUP9hrs0o4IzwJnKygVTMn8aL+xbH44JyIg+0Bq0/bHBC/AJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aH89siRN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aH89siRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749051347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ctKc+hSqozlgg1MRW5+HjrFvzU5NiOJ35GVuMd+Z1RY=;
	b=aH89siRN+5YTejoSIp7qdHp76EDORqXHjrrSK4Z8COeXbiL5qGbiMNwCMbl0lGbWaiOH5x
	RXWF+Da+YyI5vO+cQ8iRewlDPaRsNKYSw72BpiIXWykpXdBQDs4P0JQFj/rdpKdrxXMMQ7
	9rQiq/4OzpfMN27wTGXMKoaVU+kT5qE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-1YVAAIHqNk2GoabjAz2izg-1; Wed, 04 Jun 2025 11:35:44 -0400
X-MC-Unique: 1YVAAIHqNk2GoabjAz2izg-1
X-Mimecast-MFC-AGG-ID: 1YVAAIHqNk2GoabjAz2izg_1749051343
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f3796779so4282823f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051343; x=1749656143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctKc+hSqozlgg1MRW5+HjrFvzU5NiOJ35GVuMd+Z1RY=;
        b=qDeglnMmOMtRmmJPipEbl2QLvJRXc+VBqGVMzoODy92if91Mf+zWkPaCLXWxr91bi4
         CjVfIkn+qg7L7aglKsKqjIWOI64kytBnLrtlyPoKJ85GkP13LHBD9eTJGnNr++QCWPMi
         X0F+soFnjPTKjElEyn/4lFESJoQ89IrXrorZqT0PK5lG76NjJw1Ru55FS9GszTt5PYwC
         uANsjYHrU65exuNNrLSYAF+yQ7wII8nrEzXCBtD8K91BP7z5vUYFUuMR73KU21wT8XOu
         C21WGO+BquBKi4USu1ICK1Fp1Wid48EBB6fNhjEoUvNgfAuZShTDS+PA54d/pa3uMYsS
         kpXw==
X-Forwarded-Encrypted: i=1; AJvYcCWuxfzVr98hX1HjYP5/w06tcAaFnJv/F1M/UwJDYJsdbq5nf01HZUG8REOY+TMF/8bIwap0NK11dmHP/2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NlvI/7GJBLeRgDy5e/sULMJPq4p7Ar081COgtD7sGhrkgLOw
	wfrysO4fYFBsK3Wu6a7wV55Vj2akvk/hXqKd7TauTCiaJxMR6KTkdfwURZZTzZ9zj00CZXdhGRw
	YMs94cAuwCx5ecqFZ/Nq7xWIcl2y2ApCgTqssBwhNNI3gXc7B0P5L4MfJ0I1ZfYCYQQ==
X-Gm-Gg: ASbGnct7+pH1AbaFCCV85j8lil/xwXx/+YJstfwtbkWCuLLa4/gnP94azvZPWqumZeE
	WpvE/Z4ynSI41arwNXMLwXhclAqtrvNwEb7iRW50KBqLKtRzQaYh2TEXFUVKpzMHuY+LADv082x
	SbEa7gdac3k99+ref6aGMUPmWrK43+5ZYqPzigcG1aKkQI6w7TCej+mcrDt2E+KbfcILHS+sUVD
	LGqpgfE2xetMq1hTvO9f4zeA3u6SNgy2ktlgr88UGHKC4H0qmX3lop6IhSoWXcu6t+vVovGXVOz
	cMVIk/4AejJGBA==
X-Received: by 2002:a05:6000:250f:b0:3a4:e090:2274 with SMTP id ffacd0b85a97d-3a51d8f60efmr2697128f8f.8.1749051342977;
        Wed, 04 Jun 2025 08:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgY+Mu+j0HY1zwFI63+9IOyhC3SrLeQUeGjZ9/kwUl9SqqTdNHZd6uwDOFaJ98tY42b+3myQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:e090:2274 with SMTP id ffacd0b85a97d-3a51d8f60efmr2697105f8f.8.1749051342578;
        Wed, 04 Jun 2025 08:35:42 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe6ca46sm22536035f8f.31.2025.06.04.08.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 08:35:42 -0700 (PDT)
Message-ID: <e826e3e8-1aec-478b-8ffa-d1807b3d8301@redhat.com>
Date: Wed, 4 Jun 2025 17:35:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/28] KVM: nSVM: Use dedicated array of MSRPM offsets to
 merge L0 and L1 bitmaps
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>,
 Chao Gao <chao.gao@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
References: <20250529234013.3826933-1-seanjc@google.com>
 <20250529234013.3826933-9-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250529234013.3826933-9-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/25 01:39, Sean Christopherson wrote:
> Use a dedicated array of MSRPM offsets to merge L0 and L1 bitmaps, i.e. to
> merge KVM's vmcb01 bitmap with L1's vmcb12 bitmap.  This will eventually
> allow for the removal of direct_access_msrs, as the only path where
> tracking the offsets is truly justified is the merge for nested SVM, where
> merging in chunks is an easy way to batch uaccess reads/writes.
> 
> Opportunistically omit the x2APIC MSRs from the merge-specific array
> instead of filtering them out at runtime.
> 
> Note, disabling interception of XSS, EFER, PAT, GHCB, and TSC_AUX is
> mutually exclusive with nested virtualization, as KVM passes through the
> MSRs only for SEV-ES guests, and KVM doesn't support nested virtualization
> for SEV+ guests.  Defer removing those MSRs to a future cleanup in order
> to make this refactoring as benign as possible.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/svm/nested.c | 72 +++++++++++++++++++++++++++++++++------
>   arch/x86/kvm/svm/svm.c    |  4 +++
>   arch/x86/kvm/svm/svm.h    |  2 ++
>   3 files changed, 67 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 89a77f0f1cc8..e53020939e60 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -184,6 +184,64 @@ void recalc_intercepts(struct vcpu_svm *svm)
>   	}
>   }
>   
> +static int nested_svm_msrpm_merge_offsets[9] __ro_after_init;
> +static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
> +
> +int __init nested_svm_init_msrpm_merge_offsets(void)
> +{
> +	const u32 merge_msrs[] = {

"static const", please.

Paolo

> +		MSR_STAR,
> +		MSR_IA32_SYSENTER_CS,
> +		MSR_IA32_SYSENTER_EIP,
> +		MSR_IA32_SYSENTER_ESP,
> +	#ifdef CONFIG_X86_64
> +		MSR_GS_BASE,
> +		MSR_FS_BASE,
> +		MSR_KERNEL_GS_BASE,
> +		MSR_LSTAR,
> +		MSR_CSTAR,
> +		MSR_SYSCALL_MASK,
> +	#endif
> +		MSR_IA32_SPEC_CTRL,
> +		MSR_IA32_PRED_CMD,
> +		MSR_IA32_FLUSH_CMD,
> +		MSR_IA32_LASTBRANCHFROMIP,
> +		MSR_IA32_LASTBRANCHTOIP,
> +		MSR_IA32_LASTINTFROMIP,
> +		MSR_IA32_LASTINTTOIP,
> +
> +		MSR_IA32_XSS,
> +		MSR_EFER,
> +		MSR_IA32_CR_PAT,
> +		MSR_AMD64_SEV_ES_GHCB,
> +		MSR_TSC_AUX,
> +	};
> +	int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(merge_msrs); i++) {
> +		u32 offset = svm_msrpm_offset(merge_msrs[i]);
> +
> +		if (WARN_ON(offset == MSR_INVALID))
> +			return -EIO;
> +
> +		for (j = 0; j < nested_svm_nr_msrpm_merge_offsets; j++) {
> +			if (nested_svm_msrpm_merge_offsets[j] == offset)
> +				break;
> +		}
> +
> +		if (j < nested_svm_nr_msrpm_merge_offsets)
> +			continue;
> +
> +		if (WARN_ON(j >= ARRAY_SIZE(nested_svm_msrpm_merge_offsets)))
> +			return -EIO;
> +
> +		nested_svm_msrpm_merge_offsets[j] = offset;
> +		nested_svm_nr_msrpm_merge_offsets++;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * Merge L0's (KVM) and L1's (Nested VMCB) MSR permission bitmaps. The function
>    * is optimized in that it only merges the parts where KVM MSR permission bitmap
> @@ -216,19 +274,11 @@ static bool nested_svm_merge_msrpm(struct kvm_vcpu *vcpu)
>   	if (!(vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT)))
>   		return true;
>   
> -	for (i = 0; i < MSRPM_OFFSETS; i++) {
> -		u32 value, p;
> +	for (i = 0; i < nested_svm_nr_msrpm_merge_offsets; i++) {
> +		const int p = nested_svm_msrpm_merge_offsets[i];
> +		u32 value;
>   		u64 offset;
>   
> -		if (msrpm_offsets[i] == 0xffffffff)
> -			break;
> -
> -		p      = msrpm_offsets[i];
> -
> -		/* x2apic msrs are intercepted always for the nested guest */
> -		if (is_x2apic_msrpm_offset(p))
> -			continue;
> -
>   		offset = svm->nested.ctl.msrpm_base_pa + (p * 4);
>   
>   		if (kvm_vcpu_read_guest(vcpu, offset, &value, 4))
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 1c70293400bc..84dd1f220986 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5689,6 +5689,10 @@ static int __init svm_init(void)
>   	if (!kvm_is_svm_supported())
>   		return -EOPNOTSUPP;
>   
> +	r = nested_svm_init_msrpm_merge_offsets();
> +	if (r)
> +		return r;
> +
>   	r = kvm_x86_vendor_init(&svm_init_ops);
>   	if (r)
>   		return r;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 909b9af6b3c1..0a8041d70994 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -686,6 +686,8 @@ static inline bool nested_exit_on_nmi(struct vcpu_svm *svm)
>   	return vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_NMI);
>   }
>   
> +int __init nested_svm_init_msrpm_merge_offsets(void);
> +
>   int enter_svm_guest_mode(struct kvm_vcpu *vcpu,
>   			 u64 vmcb_gpa, struct vmcb *vmcb12, bool from_vmrun);
>   void svm_leave_nested(struct kvm_vcpu *vcpu);

