Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD0D80C02
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133468; cv=none; b=Qib1FWm5Xs9AVrOdvnH7isF9hqH0uTadJf8PPcpSVlLd+8D1UGRq03Dur/+ChEo/qPNTdrLqww1w7Mq1YlE2JEtYwaDN2iqHNGkN+s79ReFNTMwngqR1XqzuwYP3tFH+ptaeGqX0yUHS2+QYYQ8+LKsXEjyAteR8bMW5BAQ0yyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133468; c=relaxed/simple;
	bh=D7b7VJE/qK3nUJN8leFt4GMH3HjPtviAUkTKo43KNv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgkyBEKQFgPlH0JDmqKSZGhXtiYGoIyckh8M++GQX9DahqNVNSF9QQml+1d15kn2ovAzUj56DfrQEEvS5VYc1F2I9n572Wsvl1JmmmYjtErOrM+38w9SBz0+a0oAFUeYLSc9X3PIbKPVeVcfXe7U6Eqm1mrGQqJJ1nAXX3pa6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dd8CEOxs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dd8CEOxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744133463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dzPxLIZBoNlt2Y90PQFKInDcbJuvQW9tSEfr6MFFaVo=;
	b=dd8CEOxsSYRmpRwyxZDhE8HqDZc+DeiL+m45Rai8OFXOWngUGm+jO91AU55ADPdOTjEIBT
	cso8HYsUXWD43O55wUyJqUQKkAfSjZvwYzSpzk5oc7owTNk1gqV0hZYoGw/dyJtklhqrDF
	du6Ly2ps//dwOz4a9eY4liqbjB/bDS0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-TD6gpLfVOYuUdYS8GacWTQ-1; Tue, 08 Apr 2025 13:31:02 -0400
X-MC-Unique: TD6gpLfVOYuUdYS8GacWTQ-1
X-Mimecast-MFC-AGG-ID: TD6gpLfVOYuUdYS8GacWTQ_1744133461
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so464808266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744133461; x=1744738261;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzPxLIZBoNlt2Y90PQFKInDcbJuvQW9tSEfr6MFFaVo=;
        b=i8kun1+Bq1QWFaEZBLuKKPKmmUDd9atAAulbbr9FOK22RI47ioQi39mA76TpbG1oK7
         rqjlN7CcHvBX6XgOC61NN2sDs3GLOXDvWQz2ZEroxkhEY+gQitl3F2Np/4hrgHR7nor6
         NdpuiJP8F1WrAICm4UKm6iXPtCizSsvfd1J6NkTpP5dWdGPbiL8+yA0zDWeFsjfCwSt5
         bmsp8lGKEcXHwVTeUAhUovHx6PYgWykaqIz55d5hf6tnu6UbyO80GSkAHJgrAWpaCyU+
         ZiOXW9em3F50VRn7KXtaRW3UJDLp5RSkzm4EV/1uMLr3csv+xHwCYDzenXYYqmmml7qv
         rsUw==
X-Forwarded-Encrypted: i=1; AJvYcCViiMB6PigzpT243vVg/0TG4plAH0/rQYXSzKJODkUobuXE66+QbSKgeOHl8kCjxViwMJYDFvtK4g1D1Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/R6tLWqzRLuHTrOqtMAhBwgG2it4qf+ZvTV+aCwEKACFNx8d
	Fd5AdZVo1nqVjJGbR3AjxlVt36NWkjhStiUpaj0/UYmK7bvTYN6jk7Rgv5WMdNyWSzrXH1PPUe/
	8614QQyM0vel7K2JzQY6EYZHZdLT/4J6Gr7U2Wd4ZmxWcJHHzbRcMj8CzOsjX6A==
X-Gm-Gg: ASbGncuV3uwiWt9JLg+5PP1QOAObD3oow7DvwmDp9vvzBZRGs7iX2J7zN2O6uw+nXfo
	eG5GZSoKzK8r+Spt0l/5hKZoCP1RYQJ9D34WiwD74ndQJsVegJ0E9XPz8tBr++eaZHoBphXKkzk
	TH+nMhc6zMMZSz6pSlQWgDO/M8y5CU+tDJ7jJX4W+j2Lnz+fG+ApfcfF+JoDk8G+VexIcu5HRTZ
	EB4TYhrdEBzlewHu8LfFKsz9l+ac8vgMLiyb5h+tMzCDtAyuQ9XAuj/kaF+y8CJq5/YxB0ienlP
	nvi0+WJwZFXuhwEIgb6a
X-Received: by 2002:a17:906:c155:b0:ac3:48e4:f8bc with SMTP id a640c23a62f3a-aca9b6ef9e0mr6562566b.48.1744133461170;
        Tue, 08 Apr 2025 10:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuborAwGa6Z0LeZj2bXLnL5CvSBi0lObSi6zOlGHSw3B2yhYf8VKtjtBWf8HUqWLTb74Vsg==
X-Received: by 2002:a17:906:c155:b0:ac3:48e4:f8bc with SMTP id a640c23a62f3a-aca9b6ef9e0mr6558266b.48.1744133460649;
        Tue, 08 Apr 2025 10:31:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.197.100])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7c013f29csm943856466b.113.2025.04.08.10.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 10:31:00 -0700 (PDT)
Message-ID: <cf4d9b81-c1ab-40a6-8c8c-36ad36b9be63@redhat.com>
Date: Tue, 8 Apr 2025 19:30:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/67] KVM: x86: Dedup AVIC vs. PI code for identifying
 target vCPU
To: Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, David Matlack <dmatlack@google.com>
References: <20250404193923.1413163-1-seanjc@google.com>
 <20250404193923.1413163-34-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250404193923.1413163-34-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/25 21:38, Sean Christopherson wrote:
> Hoist the logic for identifying the target vCPU for a posted interrupt
> into common x86.  The code is functionally identical between Intel and
> AMD.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  3 +-
>   arch/x86/kvm/svm/avic.c         | 83 ++++++++-------------------------
>   arch/x86/kvm/svm/svm.h          |  3 +-
>   arch/x86/kvm/vmx/posted_intr.c  | 56 ++++++----------------
>   arch/x86/kvm/vmx/posted_intr.h  |  3 +-
>   arch/x86/kvm/x86.c              | 46 +++++++++++++++---

Please use irq.c, since (for once) there is a file other than x86.c that 
can be used.

Bonus points for merging irq_comm.c into irq.c (IIRC irq_comm.c was 
"common" between ia64 and x86 :)).

Paolo

>   6 files changed, 81 insertions(+), 113 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 85f45fc5156d..cb98d8d3c6c2 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1838,7 +1838,8 @@ struct kvm_x86_ops {
>   
>   	int (*pi_update_irte)(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   			      unsigned int host_irq, uint32_t guest_irq,
> -			      struct kvm_kernel_irq_routing_entry *new);
> +			      struct kvm_kernel_irq_routing_entry *new,
> +			      struct kvm_vcpu *vcpu, u32 vector);
>   	void (*pi_start_assignment)(struct kvm *kvm);
>   	void (*apicv_pre_state_restore)(struct kvm_vcpu *vcpu);
>   	void (*apicv_post_state_restore)(struct kvm_vcpu *vcpu);
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index ea6eae72b941..666f518340a7 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -812,52 +812,13 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
>   	return 0;
>   }
>   
> -/*
> - * Note:
> - * The HW cannot support posting multicast/broadcast
> - * interrupts to a vCPU. So, we still use legacy interrupt
> - * remapping for these kind of interrupts.
> - *
> - * For lowest-priority interrupts, we only support
> - * those with single CPU as the destination, e.g. user
> - * configures the interrupts via /proc/irq or uses
> - * irqbalance to make the interrupts single-CPU.
> - */
> -static int
> -get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
> -		 struct vcpu_data *vcpu_info, struct kvm_vcpu **vcpu)
> -{
> -	struct kvm_lapic_irq irq;
> -	*vcpu = NULL;
> -
> -	kvm_set_msi_irq(kvm, e, &irq);
> -
> -	if (!kvm_intr_is_single_vcpu(kvm, &irq, vcpu) ||
> -	    !kvm_irq_is_postable(&irq)) {
> -		pr_debug("SVM: %s: use legacy intr remap mode for irq %u\n",
> -			 __func__, irq.vector);
> -		return -1;
> -	}
> -
> -	pr_debug("SVM: %s: use GA mode for irq %u\n", __func__,
> -		 irq.vector);
> -	vcpu_info->vector = irq.vector;
> -
> -	return 0;
> -}
> -
>   int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   			unsigned int host_irq, uint32_t guest_irq,
> -			struct kvm_kernel_irq_routing_entry *new)
> +			struct kvm_kernel_irq_routing_entry *new,
> +			struct kvm_vcpu *vcpu, u32 vector)
>   {
> -	bool enable_remapped_mode = true;
> -	struct vcpu_data vcpu_info;
> -	struct kvm_vcpu *vcpu = NULL;
>   	int ret = 0;
>   
> -	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
> -		return 0;
> -
>   	/*
>   	 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
>   	 * from the *previous* vCPU's list.
> @@ -865,7 +826,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   	svm_ir_list_del(irqfd);
>   
>   	pr_debug("SVM: %s: host_irq=%#x, guest_irq=%#x, set=%#x\n",
> -		 __func__, host_irq, guest_irq, !!new);
> +		 __func__, host_irq, guest_irq, !!vcpu);
>   
>   	/**
>   	 * Here, we setup with legacy mode in the following cases:
> @@ -874,23 +835,23 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   	 * 3. APIC virtualization is disabled for the vcpu.
>   	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
>   	 */
> -	if (new && new && new->type == KVM_IRQ_ROUTING_MSI &&
> -	    !get_pi_vcpu_info(kvm, new, &vcpu_info, &vcpu) &&
> -	    kvm_vcpu_apicv_active(vcpu)) {
> -		struct amd_iommu_pi_data pi;
> -
> -		enable_remapped_mode = false;
> -
> -		vcpu_info.pi_desc_addr = avic_get_backing_page_address(to_svm(vcpu));
> -
> +	if (vcpu && kvm_vcpu_apicv_active(vcpu)) {
>   		/*
>   		 * Try to enable guest_mode in IRTE.  Note, the address
>   		 * of the vCPU's AVIC backing page is passed to the
>   		 * IOMMU via vcpu_info->pi_desc_addr.
>   		 */
> -		pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id, vcpu->vcpu_id);
> -		pi.is_guest_mode = true;
> -		pi.vcpu_data = &vcpu_info;
> +		struct vcpu_data vcpu_info = {
> +			.pi_desc_addr = avic_get_backing_page_address(to_svm(vcpu)),
> +			.vector = vector,
> +		};
> +
> +		struct amd_iommu_pi_data pi = {
> +			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id, vcpu->vcpu_id),
> +			.is_guest_mode = true,
> +			.vcpu_data = &vcpu_info,
> +		};
> +
>   		ret = irq_set_vcpu_affinity(host_irq, &pi);
>   
>   		/**
> @@ -902,12 +863,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   		 */
>   		if (!ret)
>   			ret = svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
> -	}
>   
> -	if (!ret && vcpu) {
> -		trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id,
> -					 guest_irq, vcpu_info.vector,
> -					 vcpu_info.pi_desc_addr, !!new);
> +		trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id, guest_irq,
> +					 vector, vcpu_info.pi_desc_addr, true);
> +	} else {
> +		ret = irq_set_vcpu_affinity(host_irq, NULL);
>   	}
>   
>   	if (ret < 0) {
> @@ -915,10 +875,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   		goto out;
>   	}
>   
> -	if (enable_remapped_mode)
> -		ret = irq_set_vcpu_affinity(host_irq, NULL);
> -	else
> -		ret = 0;
> +	ret = 0;
>   out:
>   	return ret;
>   }
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 6ad0aa86f78d..5ce240085ee0 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -741,7 +741,8 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu);
>   void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu);
>   int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   			unsigned int host_irq, uint32_t guest_irq,
> -			struct kvm_kernel_irq_routing_entry *new);
> +			struct kvm_kernel_irq_routing_entry *new,
> +			struct kvm_vcpu *vcpu, u32 vector);
>   void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
>   void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
>   void avic_ring_doorbell(struct kvm_vcpu *vcpu);
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 786912cee3f8..fd5f6a125614 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -266,46 +266,20 @@ void vmx_pi_start_assignment(struct kvm *kvm)
>   
>   int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   		       unsigned int host_irq, uint32_t guest_irq,
> -		       struct kvm_kernel_irq_routing_entry *new)
> +		       struct kvm_kernel_irq_routing_entry *new,
> +		       struct kvm_vcpu *vcpu, u32 vector)
>   {
> -	struct kvm_lapic_irq irq;
> -	struct kvm_vcpu *vcpu;
> -	struct vcpu_data vcpu_info;
> -
> -	if (!vmx_can_use_vtd_pi(kvm))
> -		return 0;
> -
> -	/*
> -	 * VT-d PI cannot support posting multicast/broadcast
> -	 * interrupts to a vCPU, we still use interrupt remapping
> -	 * for these kind of interrupts.
> -	 *
> -	 * For lowest-priority interrupts, we only support
> -	 * those with single CPU as the destination, e.g. user
> -	 * configures the interrupts via /proc/irq or uses
> -	 * irqbalance to make the interrupts single-CPU.
> -	 *
> -	 * We will support full lowest-priority interrupt later.
> -	 *
> -	 * In addition, we can only inject generic interrupts using
> -	 * the PI mechanism, refuse to route others through it.
> -	 */
> -	if (!new || new->type != KVM_IRQ_ROUTING_MSI)
> -		goto do_remapping;
> -
> -	kvm_set_msi_irq(kvm, new, &irq);
> -
> -	if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
> -	    !kvm_irq_is_postable(&irq))
> -		goto do_remapping;
> -
> -	vcpu_info.pi_desc_addr = __pa(vcpu_to_pi_desc(vcpu));
> -	vcpu_info.vector = irq.vector;
> -
> -	trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id, guest_irq,
> -				 vcpu_info.vector, vcpu_info.pi_desc_addr, true);
> -
> -	return irq_set_vcpu_affinity(host_irq, &vcpu_info);
> -do_remapping:
> -	return irq_set_vcpu_affinity(host_irq, NULL);
> +	if (vcpu) {
> +		struct vcpu_data vcpu_info = {
> +			.pi_desc_addr = __pa(vcpu_to_pi_desc(vcpu)),
> +			.vector = vector,
> +		};
> +
> +		trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id, guest_irq,
> +					 vcpu_info.vector, vcpu_info.pi_desc_addr, true);
> +
> +		return irq_set_vcpu_affinity(host_irq, &vcpu_info);
> +	} else {
> +		return irq_set_vcpu_affinity(host_irq, NULL);
> +	}
>   }
> diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
> index a586d6aaf862..ee3e19e976ac 100644
> --- a/arch/x86/kvm/vmx/posted_intr.h
> +++ b/arch/x86/kvm/vmx/posted_intr.h
> @@ -15,7 +15,8 @@ void __init pi_init_cpu(int cpu);
>   bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
>   int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
>   		       unsigned int host_irq, uint32_t guest_irq,
> -		       struct kvm_kernel_irq_routing_entry *new);
> +		       struct kvm_kernel_irq_routing_entry *new,
> +		       struct kvm_vcpu *vcpu, u32 vector);
>   void vmx_pi_start_assignment(struct kvm *kvm);
>   
>   static inline int pi_find_highest_vector(struct pi_desc *pi_desc)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b8b259847d05..0ab818bba743 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13567,6 +13567,43 @@ bool kvm_arch_has_irq_bypass(void)
>   }
>   EXPORT_SYMBOL_GPL(kvm_arch_has_irq_bypass);
>   
> +static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
> +			      struct kvm_kernel_irq_routing_entry *old,
> +			      struct kvm_kernel_irq_routing_entry *new)
> +{
> +	struct kvm *kvm = irqfd->kvm;
> +	struct kvm_vcpu *vcpu = NULL;
> +	struct kvm_lapic_irq irq;
> +
> +	if (!irqchip_in_kernel(kvm) ||
> +	    !kvm_arch_has_irq_bypass() ||
> +	    !kvm_arch_has_assigned_device(kvm))
> +		return 0;
> +
> +	if (new && new->type == KVM_IRQ_ROUTING_MSI) {
> +		kvm_set_msi_irq(kvm, new, &irq);
> +
> +		/*
> +		 * Force remapped mode if hardware doesn't support posting the
> +		 * virtual interrupt to a vCPU.  Only IRQs are postable (NMIs,
> +		 * SMIs, etc. are not), and neither AMD nor Intel IOMMUs support
> +		 * posting multicast/broadcast IRQs.  If the interrupt can't be
> +		 * posted, the device MSI needs to be routed to the host so that
> +		 * the guest's desired interrupt can be synthesized by KVM.
> +		 *
> +		 * This means that KVM can only post lowest-priority interrupts
> +		 * if they have a single CPU as the destination, e.g. only if
> +		 * the guest has affined the interrupt to a single vCPU.
> +		 */
> +		if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
> +		    !kvm_irq_is_postable(&irq))
> +			vcpu = NULL;
> +	}
> +
> +	return kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, irqfd->producer->irq,
> +					    irqfd->gsi, new, vcpu, irq.vector);
> +}
> +
>   int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
>   				      struct irq_bypass_producer *prod)
>   {
> @@ -13581,8 +13618,7 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
>   	irqfd->producer = prod;
>   
>   	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
> -		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
> -						   irqfd->gsi, &irqfd->irq_entry);
> +		ret = kvm_pi_update_irte(irqfd, NULL, &irqfd->irq_entry);
>   		if (ret)
>   			kvm_arch_end_assignment(irqfd->kvm);
>   	}
> @@ -13610,8 +13646,7 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
>   	spin_lock_irq(&kvm->irqfds.lock);
>   
>   	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
> -		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
> -						   irqfd->gsi, NULL);
> +		ret = kvm_pi_update_irte(irqfd, &irqfd->irq_entry, NULL);
>   		if (ret)
>   			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
>   				irqfd->consumer.token, ret);
> @@ -13628,8 +13663,7 @@ int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
>   				  struct kvm_kernel_irq_routing_entry *old,
>   				  struct kvm_kernel_irq_routing_entry *new)
>   {
> -	return kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, irqfd->producer->irq,
> -					    irqfd->gsi, new);
> +	return kvm_pi_update_irte(irqfd, old, new);
>   }
>   
>   bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,

