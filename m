Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48625BAC4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710683; cv=none; b=OMUM2vvxq2BaDEwfJMBJrSVdTS9oIcS9JUk9KoUkhEAQb4ZH66kuek1mP2Ll0Yv6JSigo4pZLAVhOdncKQeyqVDtDOgqBLR9fiVbX6Lksw2OlB/k8id7bkbKAQoTvolk2mfIR/LKka2JpjppxyAYgv/X+Z1b+093YrNjuFkTxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710683; c=relaxed/simple;
	bh=NkB3n0ul+MfMxizFwXwyx3phcNv722wiU11cVISsZts=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ejt9jc0L2yc+7Mik+CBE3ATak1UO8YdlJ0EGgONYdR/7XBqrvVZ2M3I7QujmB9AXA2MiotNY6IAQ64oOD5aM+EJR79bDic6XPYtKAzD1oa++Nn3QHDYlYhoYBoYTeFJuK8pNGY/JD9BtqfpqgNps8N9HykIqIdOQzYH6WUBDet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XZg+N82i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XZg+N82i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kga9aNRHkzQOD82yZTsoFxnFwsipXqt6fxru+FOVT4s=;
	b=XZg+N82ifr0b2Djp6leoDGVUPmUDWP7AXe7Ve3lRA2LxgjMrn4vCZgENbvl5g353TZwRrB
	t/t+0W8hfibaw7Hm0rMelT05KhDCWrq31SYQ7vyURVWA3QpQWRpxJU4Ey7U/cTt+7aa83b
	onH/Wun4zPStldnk4PrqsGiPm46SpPI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-FcmR1r9RN0eihmdbbH2yqg-1; Thu, 03 Apr 2025 16:04:38 -0400
X-MC-Unique: FcmR1r9RN0eihmdbbH2yqg-1
X-Mimecast-MFC-AGG-ID: FcmR1r9RN0eihmdbbH2yqg_1743710677
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so240249385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710677; x=1744315477;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kga9aNRHkzQOD82yZTsoFxnFwsipXqt6fxru+FOVT4s=;
        b=VO7lIZlk1oTx3uUHrnmrohAKg2I97W1YGkPF+hc8FCnXqz/aEGpaGDEvJfzVEDLd2x
         pOGWpuWn3rRPI0jTzR6xpALNDndxw9lMhbfKSeT5dj+XAjJEqiLWBZP5oU0bwi9PVyDW
         Ny8xrPLNTtPZhof/ciE72mBhFeHunSXnwEkNQgrxj83kEoIWsdvY8mVyIdG7CGVJR5em
         KMu3Z2+QE3RWDbpc0ju2BLtmrnudaQ5FuYxcpzSwDmlXSRy6ypuUnGjIkZYHZxBLW/D9
         VzA0BcDp6WQtYkoWhVRM0EZ6vRUkd7hSkw1K8A9rDQdJE7M/fbMnBSlpwGxMG7E9bvpJ
         Yu/A==
X-Forwarded-Encrypted: i=1; AJvYcCVSq5mXcxQAPjwf1c2JoRshiATLglxwqDAIFm9oyj1nDlnSqfj2rV6fW6UxZM26cYabw/09PZxwx9jOfx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQYB+p1VwBeIyDqP/iYd5yMmKNkYt6O4aKiaqAyW5io6Haox2
	/GT9N6A8UVFCK8YGnvLdXckMj0A8FuWULLGodXlVh/CrD4wIcVTT8qKGFOU4pBwFt1DrTBFhXK7
	9geyPGe4JGp4S1GCeORvSyOU+UMyI8f1kM6eaXtYff6PafmYu99Gtotp1H542KA==
X-Gm-Gg: ASbGnctMp+eLHjeXe9jBg2vc3poqBTsZHuiJJ/Tv/s910SN3fUogneRbcLcXalToWVe
	bhlysSA0x668esCqLELadgvjo2Opeze/zd+1RFzsF7N3OqzDXLYtSHe8tkkPeSEi0wIUvJTduo0
	DjbaQdW3o6oOcDevgyoDxflH6s4x1d6UEukE4ZPOSPdSCcsPx3k3WDHOdwq6w8V46HkZ4tNG6DP
	YiWEPXdR9Qgxl01CbmZ2k3yQAdgb88w/PJ3DdAiimr6Fi/patCb6vc8MdXKxCgiR9XboJSDc8np
	fhxAYhHY6bLpnUQ=
X-Received: by 2002:a05:620a:25c8:b0:7c7:5c0b:fdc8 with SMTP id af79cd13be357-7c774d5128cmr87077785a.17.1743710677390;
        Thu, 03 Apr 2025 13:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZCLnm4HCvgrp1JG+ONjQils839nHMO7PI4qjxrAX6OLhscKo4reCAsfz0+t2ZEZw/qV/d3A==
X-Received: by 2002:a05:620a:25c8:b0:7c7:5c0b:fdc8 with SMTP id af79cd13be357-7c774d5128cmr87074385a.17.1743710677052;
        Thu, 03 Apr 2025 13:04:37 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75b5dfsm115867385a.35.2025.04.03.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:04:36 -0700 (PDT)
Message-ID: <83942b9b464c9ab69ca9059f879eb0539380e2a3.camel@redhat.com>
Subject: Re: [RFC PATCH 08/24] KVM: SEV: Drop pre_sev_run()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:04:35 -0400
In-Reply-To: <20250326193619.3714986-9-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-9-yosry.ahmed@linux.dev>
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
> Now that the ASID to vCPU/VMCB tracking was moved out of pre_sev_run(),
> the only remaining pieces are:
> (a) Checking for valid VMSA.
> (b) Assigning svm->asid.
> (c) Flush the ASID if the VMCB is run on a different physical CPU.
> 
> The check in (c) is already being done in pre_svm_run(), and so is
> redundant. (a) and (b) are small enough and probably do not warrant a
> separate helper (and (b) will be going way soon), so open-code the
> function into pre_svm_run() and remove it.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/sev.c | 28 ----------------------------
>  arch/x86/kvm/svm/svm.c | 16 ++++++++++++++--
>  arch/x86/kvm/svm/svm.h |  1 -
>  3 files changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 3ef0dfdbb34d2..1742f51d4c194 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3451,34 +3451,6 @@ void sev_es_unmap_ghcb(struct vcpu_svm *svm)
>  	svm->sev_es.ghcb = NULL;
>  }
>  
> -int pre_sev_run(struct vcpu_svm *svm, int cpu)
> -{
> -	struct kvm *kvm = svm->vcpu.kvm;
> -	unsigned int asid = sev_get_asid(kvm);
> -
> -	/*
> -	 * Reject KVM_RUN if userspace attempts to run the vCPU with an invalid
> -	 * VMSA, e.g. if userspace forces the vCPU to be RUNNABLE after an SNP
> -	 * AP Destroy event.
> -	 */
> -	if (sev_es_guest(kvm) && !VALID_PAGE(svm->vmcb->control.vmsa_pa))
> -		return -EINVAL;
> -
> -	/* Assign the asid allocated with this SEV guest */
> -	svm->asid = asid;
> -
> -	/*
> -	 * Flush guest TLB if the VMCB was executed on a differet host CPU in
> -	 * previous VMRUNs.
> -	 */
> -	if (svm->vcpu.arch.last_vmentry_cpu == cpu)
> -		return 0;
> -
> -	vmcb_set_flush_asid(svm->vmcb);
> -	vmcb_mark_dirty(svm->vmcb, VMCB_ASID);
> -	return 0;
> -}
> -
>  #define GHCB_SCRATCH_AREA_LIMIT		(16ULL * PAGE_SIZE)
>  static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 len)
>  {
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e6e380411fbec..ce67112732e8c 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3649,8 +3649,20 @@ static int pre_svm_run(struct kvm_vcpu *vcpu)
>  		svm->current_vmcb->cpu = vcpu->cpu;
>          }
>  
> -	if (sev_guest(vcpu->kvm))
> -		return pre_sev_run(svm, vcpu->cpu);
> +	if (sev_guest(vcpu->kvm)) {
> +		/* Assign the asid allocated with this SEV guest */
> +		svm->asid = sev_get_asid(vcpu->kvm);
> +
> +		/*
> +		 * Reject KVM_RUN if userspace attempts to run the vCPU with an invalid
> +		 * VMSA, e.g. if userspace forces the vCPU to be RUNNABLE after an SNP
> +		 * AP Destroy event.
> +		 */
> +		if (sev_es_guest(vcpu->kvm) &&
> +		    !VALID_PAGE(svm->vmcb->control.vmsa_pa))
> +			return -EINVAL;
> +		return 0;
> +	}
>  
>  	/* FIXME: handle wraparound of asid_generation */
>  	if (svm->current_vmcb->asid_generation != sd->asid_generation)
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index ca38a233fa24c..3ab2a424992c1 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -760,7 +760,6 @@ void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu);
>  
>  /* sev.c */
>  
> -int pre_sev_run(struct vcpu_svm *svm, int cpu);
>  void sev_init_vmcb(struct vcpu_svm *svm);
>  void sev_vcpu_after_set_cpuid(struct vcpu_svm *svm);
>  int sev_es_string_io(struct vcpu_svm *svm, int size, unsigned int port, int in);

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



