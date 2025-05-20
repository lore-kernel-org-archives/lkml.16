Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22C25EFBB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735027; cv=none; b=tuNQKrJvWfEkvCDVZFQCQ2Uxap56kWs8qbu6cQT41y/ezhCqcbIgny6jhyaTHCrgyXraYMvGAjHTK4eyakF5iUquLAn//l91z3GM677sYQx+Nfcgenpr4dHH5XbDEr7paXv59fCgc+H8RqAGH2k5ayqNpJ1rBLLncWSb03eoAN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735027; c=relaxed/simple;
	bh=GarkuXCkr5IXxh7NckX9YQfEQNudMTCDgtz11JyIWrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=swF/gr9uAjGtTNimsI7/WFS3Oyx+3KNkY2QheX1rccg76J6uoLGCjt9oaI6QLmPd5EB3ws0v2IyqL5QHcV6BCCZGKCSb7oypINtrkbKhcxSSu5Cxjk6Vqv340FB6tZ0JA+rrVk1MSEhQbsfxe30VvZeQMtRIM5veA6k5ixLK910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PhkTvSMe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PhkTvSMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747735024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QaNix5hwG/O2KInAPWrv41TuCAhnMcb8Uiy5ln7GJXQ=;
	b=PhkTvSMev1/BxLnij2oJWbZ4l/UIz/G7UVfpwTugLe21e9foq6x7oqqk7g7ZEc2F5mR9Yh
	84fvDokixd+cf9FO4HGaBFam2Rz8q5VhqJ/JdtcQXmXgOSj+qlRKT355SdC/c1Li+aXabV
	LlcHx0Zz+v8OThQmoQXRHvzOxxSOmiU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-nGj4BAEWOtSq_5ZYO_iYYw-1; Tue, 20 May 2025 05:57:03 -0400
X-MC-Unique: nGj4BAEWOtSq_5ZYO_iYYw-1
X-Mimecast-MFC-AGG-ID: nGj4BAEWOtSq_5ZYO_iYYw_1747735022
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a371fb826cso892418f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735022; x=1748339822;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaNix5hwG/O2KInAPWrv41TuCAhnMcb8Uiy5ln7GJXQ=;
        b=bsdG2gGgMl66gvfsYIdXLHi3RXWlw0n6nCJrAfkUyF3FV/M/DkPhKeNmGpi5oF9i/9
         v9sV5HNXuSDxzvnFHbEQT75+yajzH5S7zxdGgBxoTj1Vxzn4jHBNi4CU93lCouILB5UA
         zXcHUhW58ZDS1n5I5PKIdsHUN/jPzmn0+ARCsudHkd230wsr2DHChbZhTY0IDCsKp7AZ
         pffVHlb6X+e3IPRHPWHR8Ka5TeC/D3ZNFOXJUBh+GOQO7xq5Vtb4CENTFrSJmcVLPNsh
         IQDf/sHxMcZtuzFqzJB7/UJM/fuNR3zeSvRlvFsbZhltZFYdXTmtW7rDXZbweeM6OV3C
         JCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrEe/lwAC6kmNinsOHl5zO+Vh+L19d2IUGDS1wZVeNPyT4FVeNcDFeR9VJM6FAlgoE+rDknMrzPlPDaBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAYItsEjazZEyjc3U/F9RXFytzLc6bFvqiJOYuFKKZ3h1WSEk
	fiTrrQG6hS1E3Il61tHFKJRqUr5ISQ8quXK/6Pt0f3Qh1qWFf0OWfga7BrKtsBjQe2e3jRkxfvD
	7YqNSvlFB+xXnZEiJvNPWeO74v4B291c8pm0XWOy+pCJw5pwAMc2WzaJLrV3vZSVKsL9E7cMk7A
	==
X-Gm-Gg: ASbGnct4OXHc8qUSUpuQIGimezXbUHu5OapNlaY0BDGh401zcL7ERTe9RatRyh4lVg4
	+X9A47SJOdF9nmstjNT0v9lSDrzfnAjfGVJL5ICX3g5E9X+LDaUOkDeIfMW+di+vjZxNFxRpzMU
	faJv/2994UCB8axxK6hAfPhrDyq3FxguTUypiJMxQdTmUrBCl6FT/bvZhJi28a4UwUsLye98Mdw
	zYcdZDMJwkEk64ZiTQgYLa13M0vPcuDc5CTHkWWbc1b6IQEzZq20yfFUiiiYcu8+KDlYkXJsR4W
	UPxjrAI=
X-Received: by 2002:a05:6000:3103:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a364159712mr10826923f8f.41.1747735021856;
        Tue, 20 May 2025 02:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdStSqCIzuerJKIl5wmWHsWUCUxWeb0WiHCpo/dsDDXM6ixiV/uDzmbbJVpFK8aJrjTl1MAg==
X-Received: by 2002:a05:6000:3103:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a364159712mr10826905f8f.41.1747735021519;
        Tue, 20 May 2025 02:57:01 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251adsm25481865e9.2.2025.05.20.02.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:57:01 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH 04/15] KVM: x86: Drop superfluous kvm_hv_set_sint() =>
 kvm_hv_synic_set_irq() wrapper
In-Reply-To: <20250519232808.2745331-5-seanjc@google.com>
References: <20250519232808.2745331-1-seanjc@google.com>
 <20250519232808.2745331-5-seanjc@google.com>
Date: Tue, 20 May 2025 11:57:00 +0200
Message-ID: <87iklvob9v.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> Drop the superfluous kvm_hv_set_sint() and instead wire up ->set() directly
> to its final destination.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Nitpick: synic_set_irq() still has trace_kvm_hv_synic_set_irq() but
kvm_hv_synic_set_irq() is now gone, I think it may make sense to rename
it to e.g. 'trace_kvm_hv_set_sint' or 'trace_synic_set_irq' to avoid any
confusion.

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

> ---
>  arch/x86/kvm/hyperv.c   | 10 +++++++---
>  arch/x86/kvm/hyperv.h   |  3 ++-
>  arch/x86/kvm/irq_comm.c | 12 ------------
>  3 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 24f0318c50d7..7f565636edde 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -497,15 +497,19 @@ static int synic_set_irq(struct kvm_vcpu_hv_synic *synic, u32 sint)
>  	return ret;
>  }
>  
> -int kvm_hv_synic_set_irq(struct kvm *kvm, u32 vpidx, u32 sint)
> +int kvm_hv_set_sint(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
> +		    int irq_source_id, int level, bool line_status)
>  {
>  	struct kvm_vcpu_hv_synic *synic;
>  
> -	synic = synic_get(kvm, vpidx);
> +	if (!level)
> +		return -1;
> +
> +	synic = synic_get(kvm, e->hv_sint.vcpu);
>  	if (!synic)
>  		return -EINVAL;
>  
> -	return synic_set_irq(synic, sint);
> +	return synic_set_irq(synic, e->hv_sint.sint);
>  }
>  
>  void kvm_hv_synic_send_eoi(struct kvm_vcpu *vcpu, int vector)
> diff --git a/arch/x86/kvm/hyperv.h b/arch/x86/kvm/hyperv.h
> index 913bfc96959c..4ad5a0749739 100644
> --- a/arch/x86/kvm/hyperv.h
> +++ b/arch/x86/kvm/hyperv.h
> @@ -103,7 +103,8 @@ static inline bool kvm_hv_hypercall_enabled(struct kvm_vcpu *vcpu)
>  int kvm_hv_hypercall(struct kvm_vcpu *vcpu);
>  
>  void kvm_hv_irq_routing_update(struct kvm *kvm);
> -int kvm_hv_synic_set_irq(struct kvm *kvm, u32 vcpu_id, u32 sint);
> +int kvm_hv_set_sint(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
> +		    int irq_source_id, int level, bool line_status);
>  void kvm_hv_synic_send_eoi(struct kvm_vcpu *vcpu, int vector);
>  int kvm_hv_activate_synic(struct kvm_vcpu *vcpu, bool dont_zero_synic_pages);
>  
> diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
> index 8dcb6a555902..b85e4be2ddff 100644
> --- a/arch/x86/kvm/irq_comm.c
> +++ b/arch/x86/kvm/irq_comm.c
> @@ -127,18 +127,6 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
>  	return kvm_irq_delivery_to_apic(kvm, NULL, &irq, NULL);
>  }
>  
> -#ifdef CONFIG_KVM_HYPERV
> -static int kvm_hv_set_sint(struct kvm_kernel_irq_routing_entry *e,
> -		    struct kvm *kvm, int irq_source_id, int level,
> -		    bool line_status)
> -{
> -	if (!level)
> -		return -1;
> -
> -	return kvm_hv_synic_set_irq(kvm, e->hv_sint.vcpu, e->hv_sint.sint);
> -}
> -#endif
> -
>  int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
>  			      struct kvm *kvm, int irq_source_id, int level,
>  			      bool line_status)

-- 
Vitaly

