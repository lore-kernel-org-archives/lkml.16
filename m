Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8024EAA0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710652; cv=none; b=AptU/HAlhBC2r2qLjQAeYlofaXzJIP8NcYaVXE724m+T+/3lfhqweKhdiPaJnqICahak8Nfe+USK0BHf7eFT1RW4gcc+IcOcqtodSztKXwERDuE7xyy3H3SDH0i23OkpoPf4llFMOAdqPWVYs4+iNaA18jsaAz+Ltxm4ZnpI0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710652; c=relaxed/simple;
	bh=zGLq1pKU3vT6MPN6WYVbl9v9VWrgWfS+KwbxVLesfb0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5ZwtgLKIREHHmUxGyjzME78bJo/Z8GMxfOPDT9QCcBpVY8l8WICb8BBM65v4vR12D03krr13yoG0vhpfbG94IEa80cZ/iumtcjyNLOZYap7Xk7uiMqTepZo6wwYgbRiwaKuCOBWXnj3sNv4b9g9zl9U1Jhb6/+XgRH53D6F/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VcuTKBY3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VcuTKBY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySMLQ7nl0QHO1+0KOlz9UGIbL4OhdDWaV8q7u33fOMc=;
	b=VcuTKBY3YBWTaX5gn13RebWhKWPutNuFUk7M8rHPWX4SAALVlOoZX+swiesaJLka1vemci
	XPjwkypUDvLTIvPNWi24XKQl70mA3cyCJ9Ohux9oFtA7ZmLWVqe7yqLfwJrTiGknJvNeK7
	/7/AYTfuQdbZEHEwzgqJc/r4tCtK57c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Yy4pcs3JNo-1WMVm-ldM8g-1; Thu, 03 Apr 2025 16:04:07 -0400
X-MC-Unique: Yy4pcs3JNo-1WMVm-ldM8g-1
X-Mimecast-MFC-AGG-ID: Yy4pcs3JNo-1WMVm-ldM8g_1743710647
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso180263185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710647; x=1744315447;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySMLQ7nl0QHO1+0KOlz9UGIbL4OhdDWaV8q7u33fOMc=;
        b=ae+vXn5c3cCo6mB5rwAnx3C85a2GEUKEj+WkWagJj4RjB0RP9COBJkVlLwZSDix1X6
         lLwdyOcv5ZNPicyPFGchCPB63JAmonqoKdlnh0OHOEOJd2vygF8IzgPt2jv2Yr9Jpo+Z
         KtGojz9IHS43DE/CWBQmg63XFUKjTK2tDrtIi6skakavp9KwAJPc47IOUf3FcrkR1LzP
         cmi20ItTWMUJQ0L081Eth8FkQyq5IH/aJ6W+eboGAShhKl+NPBY6pSfZwXCNpaw6fqHd
         mq96LFdnP9omDM8fTML0oZS/3YRjCugYleyDQJaXs1GjhvbsqvJfQ5c665w9Z6IHj6ev
         6DJw==
X-Forwarded-Encrypted: i=1; AJvYcCVHWtRfmHEcHG8t/CTqkzuNQ4yVMNqVkf9ngNmsMNeoVMKDEGl/Nu5WJ3kzdFv6fDQoWWt1xhjcFGl5VFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Gk1M7raXssFzmtxLRY0vBL5lpFsajvBDBbyDd/kOcLcgMIc6
	wR9CS3oyLo+LhGytzCIpP3TrOOOd2DAXaXJDOrkJEg4SDvKm/Qo5mSJZo3Q+p+4MU6n1wAmEwnD
	5pcf4clL1hKaLB2xgbNIknYQ0NmRMlI6FZxpH80OXbVsde3Rwrcw1NZVhC/GonQ==
X-Gm-Gg: ASbGnctWGNTd+d17Ba5PmNR1aCqdJhVLt/Z75QVo6c9cVF2uQVDWEsGo9zg7BP5OAWy
	tD1DouN9Qi+WeEjAkEKD2vhX4VaMU+9iLNgvQ6pKq/H1lrnCkcX0Oh9vhrEtPj6L0RHiOt/375X
	m76BV0sviRAMFwZt66WOYg7sfuetZYTQtSx+O+mhWxnfqY2rQqAjWeb7Mv+QW368gkwgAX1nBvl
	WewRRykzJknQJF/erSLt+em/GVoX0LSYclDvCIreQVl50TC42ELQqKu8CI5DPFdOZQFYYdRa3I5
	E41Q6yBCiiwqpMs=
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr77208785a.23.1743710647063;
        Thu, 03 Apr 2025 13:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXnXuXsXM2t4zH972gygBZXfgtU6llV4Ahgf7pAsBs8JBeLaCvDrRZ35sE7DKtZ77Uckzx2g==
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr77204185a.23.1743710646623;
        Thu, 03 Apr 2025 13:04:06 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14d250sm11316526d6.103.2025.04.03.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:04:06 -0700 (PDT)
Message-ID: <03be59f070a02555596550d5764aa8b416e43b58.camel@redhat.com>
Subject: Re: [RFC PATCH 06/24] KVM: SEV: Track ASID->vCPU instead of
 ASID->VMCB
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:04:05 -0400
In-Reply-To: <20250326193619.3714986-7-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-7-yosry.ahmed@linux.dev>
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
> SEV currently tracks the ASID to VMCB mapping for each physical CPU.
> This is required to flush the ASID when a new VMCB using the same ASID
> is run on the same CPU. 


> Practically, there is a single VMCB for each
> vCPU using SEV. 

Can you elaborate on this a bit? AFAIK you can't run nested with SEV,
even plain SEV because guest state is encrypted, so for SEV we have
indeed one VMCB per vCPU.

> Furthermore, TLB flushes on nested transitions between
> VMCB01 and VMCB02 are handled separately (see
> nested_svm_transition_tlb_flush()).

Yes, or we can say that for now both VMCBs share the same ASID,
up until later in this patch series.

> 
> In preparation for generalizing the tracking and making the tracking
> more expensive, start tracking the ASID to vCPU mapping instead. This
> will allow for the tracking to be moved to a cheaper code path when
> vCPUs are switched.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/sev.c | 12 ++++++------
>  arch/x86/kvm/svm/svm.c |  2 +-
>  arch/x86/kvm/svm/svm.h |  4 ++--
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index d613f81addf1c..ddb4d5b211ed7 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -240,7 +240,7 @@ static void sev_asid_free(struct kvm_sev_info *sev)
>  
>  	for_each_possible_cpu(cpu) {
>  		sd = per_cpu_ptr(&svm_data, cpu);
> -		sd->sev_vmcbs[sev->asid] = NULL;
> +		sd->sev_vcpus[sev->asid] = NULL;
>  	}
>  
>  	mutex_unlock(&sev_bitmap_lock);
> @@ -3081,8 +3081,8 @@ int sev_cpu_init(struct svm_cpu_data *sd)
>  	if (!sev_enabled)
>  		return 0;
>  
> -	sd->sev_vmcbs = kcalloc(nr_asids, sizeof(void *), GFP_KERNEL);
> -	if (!sd->sev_vmcbs)
> +	sd->sev_vcpus = kcalloc(nr_asids, sizeof(void *), GFP_KERNEL);
> +	if (!sd->sev_vcpus)
>  		return -ENOMEM;
>  
>  	return 0;
> @@ -3471,14 +3471,14 @@ int pre_sev_run(struct vcpu_svm *svm, int cpu)
>  	/*
>  	 * Flush guest TLB:
>  	 *
> -	 * 1) when different VMCB for the same ASID is to be run on the same host CPU.
> +	 * 1) when different vCPU for the same ASID is to be run on the same host CPU.
>  	 * 2) or this VMCB was executed on different host CPU in previous VMRUNs.
>  	 */
> -	if (sd->sev_vmcbs[asid] == svm->vmcb &&
> +	if (sd->sev_vcpus[asid] == &svm->vcpu &&
>  	    svm->vcpu.arch.last_vmentry_cpu == cpu)
>  		return 0;
>  
> -	sd->sev_vmcbs[asid] = svm->vmcb;
> +	sd->sev_vcpus[asid] = &svm->vcpu;
>  	vmcb_set_flush_asid(svm->vmcb);
>  	vmcb_mark_dirty(svm->vmcb, VMCB_ASID);
>  	return 0;
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 18bfc3d3f9ba1..1156ca97fd798 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -694,7 +694,7 @@ static void svm_cpu_uninit(int cpu)
>  	if (!sd->save_area)
>  		return;
>  
> -	kfree(sd->sev_vmcbs);
> +	kfree(sd->sev_vcpus);
>  	__free_page(__sme_pa_to_page(sd->save_area_pa));
>  	sd->save_area_pa = 0;
>  	sd->save_area = NULL;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 843a29a6d150e..4ea6c61c3b048 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -340,8 +340,8 @@ struct svm_cpu_data {
>  
>  	struct vmcb *current_vmcb;
>  
> -	/* index = sev_asid, value = vmcb pointer */
> -	struct vmcb **sev_vmcbs;
> +	/* index = sev_asid, value = vcpu pointer */
> +	struct kvm_vcpu **sev_vcpus;
>  };
>  
>  DECLARE_PER_CPU(struct svm_cpu_data, svm_data);


Code itself looks OK, so 

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




