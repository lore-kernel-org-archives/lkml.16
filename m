Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01C27F16F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237388; cv=none; b=c+jwIDuzaX/7W9WOnPv1I1INWj4LzCstleGdAg0tR9ClWKwcSSJukSBLIhudtEss1BiwARf3zmkH4wyW0RIyiVjX+Xzmv4BNRAE0m78ksV/F6y0IxOfgoSGOja5kEJWuUB9beWZtguSYN/8ptf7RAt9Y4Gv6E+N+oUTaLTk+FpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237388; c=relaxed/simple;
	bh=bneFlm31Pd/Xfl3umVqeMKyb0kuHcqMPwyG8Y1qkajM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UzW9Voctv6/H9hfWGVfl7q34Mm/jshVZxKE8cc6gM7IM4z2g+6FbAIJehFMH9rapqe/qX/y0C6Dmlnq4VFXKocPXpIDhJg1Rk8w7YctoTvbVmuP//v7/mXwg1Om5klI1lqMHXBDOXhdr8hmmKyT4+WtRUwHX/3AaVj1sITUaeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iXYwNkiD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iXYwNkiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750237382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcn/LkxqL3L+wKUw0Rvs7ObcOPnZp08u4bi4thzRrzc=;
	b=iXYwNkiDfsTYu74+usHKx1VCZ7cPSOK+UX6JffxM4LppCpdTyZxYLG3o7txoRK/A+BJnMI
	MFZI2WpUljP5e6gQFhDG+G8sDE7ykODFlLdQLiqvGNjcCkLaByPNyZ7pdkINuWieSvm/my
	mLypY2aXLStSqN7XMxzGRy0yXmUBZLY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-4g314y8pPdGxyvWhBWRYAw-1; Wed, 18 Jun 2025 05:02:57 -0400
X-MC-Unique: 4g314y8pPdGxyvWhBWRYAw-1
X-Mimecast-MFC-AGG-ID: 4g314y8pPdGxyvWhBWRYAw_1750237377
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450787c8626so51199125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237376; x=1750842176;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcn/LkxqL3L+wKUw0Rvs7ObcOPnZp08u4bi4thzRrzc=;
        b=eSIEVWD0+WgewX9rmq+RsGeJKGdQwHzu2zAGnsK1kOox4HOd+yUKZfRtiCsZW682q7
         gnbZHsuxxRLOxQjd75jWDNeEtczKWrofBCEFDOuElBFOrJeBAZnOJhG/3d18lMALtiuC
         kQtzKOcTXxj/O27SsunSexZftyp6N5dewyyyIXIa7uKPkELOhufDYfs64KaZ0Ivu3f+e
         6cthXD9Wxtt960x5GPpc3TjeawFFOScsYtWpNicQLtBaW7QEWJ5rAzvKcdoqMipCqjM6
         L8v/JUQfLi/qqLUfG0qKTsJfAR4Jldwz2x8GbfUKcqv8BXD8xCUlyZUauZYpQGZcMuai
         TBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo/C8aOD8JrynQVIeEFm+gXjTI5fm/BRNZYBxazh3g1EkMMWJDhTXWkgx8yxH7n9Z8XjdlEE7rq4On8v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+nCP1MyCFpU7xhg4hQtcnbxkviD4UVTiQDiOKMk1rrNua3nq
	ZrkQs77EMdgOgE0uptNc06m4UerDFm8KlcuZvGBl4aQhxLZ87vfHxSy54tXvwHR1J9kou2xzkl0
	/epdC9ANPndWJmpYeN7Ez63i/Tb1UAxC6aBQxmpOj1qK8CAJkdtEKrK391EKlp/7sgw==
X-Gm-Gg: ASbGncsNKoB8E5CMrEnzK/tsOObKc4FpjUDwlxWofumOl5/3T+Ea5d+UPHbTmBMcdtM
	iwcdo3M9cX4RwoF+ExsjohaX/4Jw6zWeGgXmNeuekUQPK2zHtpSrGvCyR6BwYOumjHk4Jz00Ps3
	At+6CnVF9hljTWc/+E8oMR+Iw2GKkweAjicI7bf/wSuCEd5cNa7tYICjfM1HXGGG0JfkuN414Ah
	s10oYwiNBygtBMp8jBNrkYu1rkqHjMGeIPvD4xiC6fuTJu+2nh9OX3hJQdRQkeofHpDTWPC53vZ
	I5ukgujSRB9Gv3VUuQ==
X-Received: by 2002:a05:600c:1d1f:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4534f9f165amr76162165e9.20.1750237376599;
        Wed, 18 Jun 2025 02:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHweVLH3+qQqzxN9lP0gvuWDUPk09sRaZGtlxPAesY7nOwT7neBaDVRHRs5uwT3SBz915xDtA==
X-Received: by 2002:a05:600c:1d1f:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4534f9f165amr76161785e9.20.1750237376101;
        Wed, 18 Jun 2025 02:02:56 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm198439285e9.4.2025.06.18.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:02:55 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Kai Huang
 <kai.huang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 04/18] KVM: x86: Drop superfluous kvm_hv_set_sint()
 => kvm_hv_synic_set_irq() wrapper
In-Reply-To: <20250611213557.294358-5-seanjc@google.com>
References: <20250611213557.294358-1-seanjc@google.com>
 <20250611213557.294358-5-seanjc@google.com>
Date: Wed, 18 Jun 2025 11:02:54 +0200
Message-ID: <87a565pgld.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> Drop the superfluous kvm_hv_set_sint() and instead wire up ->set() directly
> to its final destination, kvm_hv_synic_set_irq().  Keep hv_synic_set_irq()
> instead of kvm_hv_set_sint() to provide some amount of consistency in the
> ->set() helpers, e.g. to match kvm_pic_set_irq() and kvm_ioapic_set_irq().
>
> kvm_set_msi() is arguably the oddball, e.g. kvm_set_msi_irq() should be
> something like kvm_msi_to_lapic_irq() so that kvm_set_msi() can instead be
> kvm_set_msi_irq(), but that's a future problem to solve.
>
> No functional change intended.
>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Sorry for the delay,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

> ---
>  arch/x86/kvm/hyperv.c   | 10 +++++++---
>  arch/x86/kvm/hyperv.h   |  3 ++-
>  arch/x86/kvm/irq_comm.c | 18 +++---------------
>  3 files changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 24f0318c50d7..f316e11383aa 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -497,15 +497,19 @@ static int synic_set_irq(struct kvm_vcpu_hv_synic *synic, u32 sint)
>  	return ret;
>  }
>  
> -int kvm_hv_synic_set_irq(struct kvm *kvm, u32 vpidx, u32 sint)
> +int kvm_hv_synic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
> +			 int irq_source_id, int level, bool line_status)
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
> index 913bfc96959c..6ce160ffa678 100644
> --- a/arch/x86/kvm/hyperv.h
> +++ b/arch/x86/kvm/hyperv.h
> @@ -103,7 +103,8 @@ static inline bool kvm_hv_hypercall_enabled(struct kvm_vcpu *vcpu)
>  int kvm_hv_hypercall(struct kvm_vcpu *vcpu);
>  
>  void kvm_hv_irq_routing_update(struct kvm *kvm);
> -int kvm_hv_synic_set_irq(struct kvm *kvm, u32 vcpu_id, u32 sint);
> +int kvm_hv_synic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
> +			 int irq_source_id, int level, bool line_status);
>  void kvm_hv_synic_send_eoi(struct kvm_vcpu *vcpu, int vector);
>  int kvm_hv_activate_synic(struct kvm_vcpu *vcpu, bool dont_zero_synic_pages);
>  
> diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
> index 8dcb6a555902..28a8555ab58b 100644
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
> @@ -149,8 +137,8 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
>  	switch (e->type) {
>  #ifdef CONFIG_KVM_HYPERV
>  	case KVM_IRQ_ROUTING_HV_SINT:
> -		return kvm_hv_set_sint(e, kvm, irq_source_id, level,
> -				       line_status);
> +		return kvm_hv_synic_set_irq(e, kvm, irq_source_id, level,
> +					    line_status);
>  #endif
>  
>  	case KVM_IRQ_ROUTING_MSI:
> @@ -302,7 +290,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
>  		break;
>  #ifdef CONFIG_KVM_HYPERV
>  	case KVM_IRQ_ROUTING_HV_SINT:
> -		e->set = kvm_hv_set_sint;
> +		e->set = kvm_hv_synic_set_irq;
>  		e->hv_sint.vcpu = ue->u.hv_sint.vcpu;
>  		e->hv_sint.sint = ue->u.hv_sint.sint;
>  		break;

-- 
Vitaly

