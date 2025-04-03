Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17E25D21D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710978; cv=none; b=MkDd+913+Rm79u+ApkyJ+a/bgqUnyU/HQU1zYyPRGwceLPR3WsYFU5IIfhb1gdxO9OCfcafxBrIg0E4rZJUC6+s0Ixka1o6HR4BAFk/mhh8IG73IHFQkxCuBZ0IaLDEmHatm2Omshrog6r3ERJvfO8yuuzPLrePzZJu7gBIGDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710978; c=relaxed/simple;
	bh=VM/LZ2Hify8LhO6mOdJAAEZTRv8bASm7Uv+aSgyzxNc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDk2hqYMDFnf+FEMxrsZzM5f55oSPA16AxXeLbXAXT/3SOS+sezgH0gZpxipyKl7oYM2yzlTyHPRXVhzSk2Pp5exafD+KBOweEnP/TDvYjTlVCe5GQCDTj3Uoio3TbBREafWyBNrv96Iqk4i0DhxryWwfn57/vfsPbSPrtDQC94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RypxOL5+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RypxOL5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHkPg4f2KhDyPjkAa0vYH0z+cU0CoktXMmBUTSvvlNg=;
	b=RypxOL5+pztQpibLof6SFAPxXRol/nifkItcdMw+HJuQY7+P0xwl0KIxR+xSFr37aQbkW9
	lng99/lCtc+xd1klVk/1wSRkJIkwYd/rKD7JMj/SkQDEUa3uyT0CTwHJiI7+Qhe2ie1Psu
	S/ODbPr/leIiYsjmoARod+Hyj5L+tTA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-PE9ghzycN0SEirA_n6INIg-1; Thu, 03 Apr 2025 16:09:33 -0400
X-MC-Unique: PE9ghzycN0SEirA_n6INIg-1
X-Mimecast-MFC-AGG-ID: PE9ghzycN0SEirA_n6INIg_1743710972
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767e6b4596so21432731cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710972; x=1744315772;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHkPg4f2KhDyPjkAa0vYH0z+cU0CoktXMmBUTSvvlNg=;
        b=KhnbzcKPQoZqEh3IdSQVA5cH3sDY1A45guXC1gAKN2HW/8MzD9ED4VPAeuGFB/jPIR
         hsiJLhs99xO8EL3tenjb+MtbQrFrjUmjnMly5paSb9XfhrwQvY5nxJpoytIOsQWtSXfR
         tRhL8ipvy1jwuguOiQoWxLoRcRZR66rdvYLQdfuYdaWpdcosb7yIpa8IquQnKPW+1jS3
         ergHdkzfRKXN7wPyV9vUAUNQ9BnnAgeZ5AWMJixaunea2KAla+pl9Vw11RuMHGDwEjWw
         UZeNUmSvFdtmvEAamK/SOHqzPAYAe+VtSwCLOsC/01pLSRwkbc6x6tAmBTZmcfRZioaY
         d9nw==
X-Forwarded-Encrypted: i=1; AJvYcCViKEXW1/cLQapPBf8FDcLQAQQivFmPRHN5JaGL83+JQKeX9BQ0IcgVjFgk9LowgbExe9WC8GGey0+Skwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfa+3hfcNeKG9sr+h11DzqNu+fsNGt0+QVRhSWeL9hPn5wp1+
	oyFA99VHRJNlIrbhjLD4u7g/mtknNJN/OcGJnWI13h6QZLjXSreEyR5yTJgVCADrZar4rTJ5T44
	tO05BIC0GShyReGlIwnmkdzHV6rvXT50nVh50XUnIgCXOj8S5RayaxeNlevB8ZQ==
X-Gm-Gg: ASbGnctSrcIBWhFW9YA5bEYWGPVLGDpL+nktIDHFKFI2hBZQO2uCS/2tTk8z7IPthBY
	d8N1um5D1lb2GE0WC6w3MviTigESADXn4ggovnyPFz4Yv67C6TAK40vFS4D1Bp8P3gGnxk5j0A5
	sFitvzdHYSrlHUwVzXOYN4g+MZpYZ+IgK5EJdxtywP3iB6ZJ3iNG24h5pMuGMen8gyazVk3HHxK
	MAgEG0L8FYUDxbuQHZ2tYgjMUvk/iFdmBt36AbUGy4FC/BXgSWIvbbvyk4PPKMtOiaCa8mv56l/
	ijkMvgbQCGqL984=
X-Received: by 2002:a05:622a:20f:b0:478:f03c:b3dc with SMTP id d75a77b69052e-47925a35858mr4930191cf.41.1743710972368;
        Thu, 03 Apr 2025 13:09:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU+UU1cCtLalnRfA0DF1A/kmiMX8QNwvpWlUJwraHCy8fxemUuozaBN5IUqdCFtsVCeFXkg==
X-Received: by 2002:a05:622a:20f:b0:478:f03c:b3dc with SMTP id d75a77b69052e-47925a35858mr4929931cf.41.1743710972094;
        Thu, 03 Apr 2025 13:09:32 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b1440d0sm11537231cf.68.2025.04.03.13.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:09:31 -0700 (PDT)
Message-ID: <45e6e250e5bc51d2b0a8490f31e2144054990b82.camel@redhat.com>
Subject: Re: [RFC PATCH 11/24] KVM: nSVM: Use a separate ASID for nested
 guests
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:09:30 -0400
In-Reply-To: <20250326193619.3714986-12-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-12-yosry.ahmed@linux.dev>
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
> The per-VM ASID is currently shared by both L1 and L2 guests. That ASID
> is currently flushed on every transition between L1 and L2.
> 
> Allocate and track a separate ASID per-VM for nested guests. This is in
> preparation for doing fine-grained TLB flushes on nested transitions
> instead of unconditional full flushes.
> 
> Nested ASIDs are still not fully maintained (e.g. a remote flush will
> only flush the current ASID), so keep the TLB flush on every transition
> until this is sorted out in following changes.
> 
> Add a helper to get the ASID associated with a specific VMCB and use it
> instead of directly reading the VM's ASID. This transparently uses L2's
> ASID when an L2 guest is being run.
> 
> L1's ASID is flushed on KVM_REQ_TLB_FLUSH_GUEST if it is the active
> context, so remove the TODO in nested_svm_transition_tlb_flush() about
> it.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/nested.c |  8 ++++++--
>  arch/x86/kvm/svm/svm.c    | 13 +++++++++++--
>  arch/x86/kvm/svm/svm.h    |  3 ++-
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 81184b2fb27fd..75223869aa8c6 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -495,7 +495,6 @@ static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
>  	 *  - Honor L1's request to flush an ASID on nested VMRUN
>  	 *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
>  	 *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
> -	 *  - Flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST
>  	 *
>  	 * [*] Unlike nested EPT, SVM's ASID management can invalidate nested
>  	 *     NPT guest-physical mappings on VMRUN.
> @@ -677,7 +676,7 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm,
>  	vmcb02->control.nested_ctl = vmcb01->control.nested_ctl;
>  	vmcb02->control.iopm_base_pa = vmcb01->control.iopm_base_pa;
>  	vmcb02->control.msrpm_base_pa = vmcb01->control.msrpm_base_pa;
> -	vmcb02->control.asid = svm_asid(vcpu->kvm);
> +	vmcb02->control.asid = svm_nested_asid(vcpu->kvm);
>  
>  	/* Also overwritten later if necessary.  */
>  	vmcb_clr_flush_asid(vmcb02);
> @@ -1179,6 +1178,7 @@ static void nested_svm_triple_fault(struct kvm_vcpu *vcpu)
>  
>  int svm_allocate_nested(struct vcpu_svm *svm)
>  {
> +	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
>  	struct page *vmcb02_page;
>  
>  	if (svm->nested.initialized)
> @@ -1196,6 +1196,10 @@ int svm_allocate_nested(struct vcpu_svm *svm)
>  	svm_vcpu_init_msrpm(&svm->vcpu, svm->nested.msrpm);
>  
>  	svm->nested.initialized = true;
> +
> +	if (!kvm_svm->nested_asid)
> +		kvm_svm->nested_asid = kvm_svm->asid;

Nitpick: maybe put nested_asid into .nested struct as well?
I don't have a strong option on this, feel free to leave it where it is now.


> +
>  	return 0;
>  
>  err_free_vmcb02:
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index f028d006f69dc..e664d8428c792 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -1225,17 +1225,26 @@ static inline void init_vmcb_after_set_cpuid(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> -unsigned int svm_asid(struct kvm *kvm)
> +unsigned int svm_nested_asid(struct kvm *kvm)
> +{
> +	return to_kvm_svm(kvm)->nested_asid;
> +}

It might also make sense to add WARN_ON_ONCE(!svm->nested.initialized) here, just in case.

> +
> +static unsigned int svm_asid(struct kvm *kvm)
>  {
>  	return to_kvm_svm(kvm)->asid;
>  }
>  
>  static unsigned int svm_get_current_asid(struct vcpu_svm *svm)
>  {
> -	struct kvm *kvm = svm->vcpu.kvm;
> +	struct kvm_vcpu *vcpu = &svm->vcpu;
> +	struct kvm *kvm = vcpu->kvm;
>  
>  	if (sev_guest(kvm))
>  		return sev_get_asid(kvm);
> +	if (is_guest_mode(vcpu))
> +		return svm_nested_asid(kvm);
> +	WARN_ON_ONCE(svm->current_vmcb != &svm->vmcb01);
>  	return svm_asid(kvm);
>  }
>  
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 436b7e83141b9..e67e3a64e92f7 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -118,6 +118,7 @@ struct kvm_svm {
>  	struct kvm kvm;
>  
>  	unsigned int asid;
> +	unsigned int nested_asid;
>  
>  	/* Struct members for AVIC */
>  	u32 avic_vm_id;
> @@ -651,7 +652,7 @@ void svm_complete_interrupt_delivery(struct kvm_vcpu *vcpu, int delivery_mode,
>  				     int trig_mode, int vec);
>  bool svm_register_asid(unsigned int asid);
>  void svm_unregister_asid(unsigned int asid);
> -unsigned int svm_asid(struct kvm *kvm);
> +unsigned int svm_nested_asid(struct kvm *kvm);
>  
>  /* nested.c */
>  


Overall looks good,

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



