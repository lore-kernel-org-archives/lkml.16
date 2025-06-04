Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E71DED51
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055441; cv=none; b=ocigoq6PcquUHzQ03wgqIOhxWI5EhBxxHuGX7dvt3Swg5E5M8nNqSSeDC1IA8NA5dXDb2bjiq++77FmIN2pmQUT8bO6SZOcB5kPBzMikQyRmmb/qE6+rxyXIdVYxy3I3ATyB3QZsiA/6mvif6qiRuYjXdmZgGx9g5+hccKV8FKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055441; c=relaxed/simple;
	bh=D+aWTJlBR5Z1dDFyEuWrqwhKgcw6YgC3O9B89j9DBdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hw4Nkh/PepavTMEoQtrmjpElSSRXM9sUNFJjgY8Gw9Q65XrwlkauKJEhjJYU/doyI7z2eLBh3qiSyIiy9IcHshJT+WxxrKvofl7XgnxMPZmeZZpwrIkwuUJsw1ZkvaYGo5sk7LU+g6UmR2rRlm5RNJpf+2KOS0C/REUCW7yfQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGQZeTkV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGQZeTkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749055438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5uX+RcrMuYZZlT9e7PZl8kq+9gKjyZrSElVvecqGEe0=;
	b=SGQZeTkVwub0G4YYLmmpJB0qeXFJbYrjgzLGZDJUFGvxK6hoAG0hS7NEkqmJVFAkW18Cvx
	vVyRuDS/o+nxITyjlo3dChtoG+yOIV2ntsaPuMBvdgbcl1jERCkGR96vZLTUUw7RFtZPnZ
	YMPvckPrEY3a798DKC1aNrJ4bSmaRsA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-Zp-K8omzMw-dD0I6nzLn2g-1; Wed, 04 Jun 2025 12:43:57 -0400
X-MC-Unique: Zp-K8omzMw-dD0I6nzLn2g-1
X-Mimecast-MFC-AGG-ID: Zp-K8omzMw-dD0I6nzLn2g_1749055436
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so7587f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055434; x=1749660234;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uX+RcrMuYZZlT9e7PZl8kq+9gKjyZrSElVvecqGEe0=;
        b=A5HC75Bp8MnF2z0W9O0eFBGPOZ8G0V5Ihf+UvSyQKgWKdBBwyMSAG1VM0VuH5kj3Nz
         cmm9iUUTqrHKA/gdpkQob+tDW8HMzF9HeX5dEFtOMymO8vOfndOANnOAaJtiyssxR5+s
         RONRsZ++QFpaknrGfu/YlQnSDkN6NOCDybuhFoq3UekOUue4M73so6MHiFZAeYnz4bmM
         uG7kqy0NMTn7GxDKIrQz8q5yC4OPxLg1kRpZeVW4JM/15QZWjGZpM7o9EC93i81ccPNC
         d4hD7hXS+J67zP68r8M5CMHG+UUUCv6jiXvwOUAaCzZQ7FzQ32s3aVvfUe2Uiu5HmFMH
         gULw==
X-Forwarded-Encrypted: i=1; AJvYcCXHokJ3S6BVLlg+2HhYClyUO1oKZaG8s0OwTbQUftyZ4yHG/MrvYQcdGPX7O7gaHw31xPZLKjZ7FeR7deY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbrotbxX/3fHvy/bjlybF2Kk4Dy8JUd+kV9G7PwKT25EoEKRe
	b89KbDL9AGiGaisgB7RsdqnNfSAhYWLVgUnizXpWx4ln46V2aaySeTyxkLRIESmTTkpLcmbXY32
	WeEp9eNnUFvaLfIUq4XFAc/1hTN86y9H3IIpF6tuts4NXBH19rvwwipFW8dH6KFkEmg==
X-Gm-Gg: ASbGncv3vC9/0FurDZya0xcA8eCp+Hti2LXdKAK1f0NlyrKX61n75cGT+IiYPc+AAWF
	31+VYfxmmF9QitovviWf0R2lncJsXxfAjGnoJCyp7hSLTPeVEP02uSEezn7RPKU3zcDYjpE9m74
	2bRIrdJQwSi3FoPCePEuXuef3zYXe/WqwvtLa5aYiJIa0iWiGLJsLYmOtjyjY6CNmiVqeSzHDXf
	uXBCeinzvM/UgCWyU6TP62rSHj/ERZhDMjSLg4n8DsK5vYTM8inG6KbzzFTcqXnWajLHfUukUap
	WU6a8P5G4xe9KW3GbCFWIiYC
X-Received: by 2002:a05:6000:400d:b0:3a4:db94:2cfc with SMTP id ffacd0b85a97d-3a51d97b8c9mr3072855f8f.43.1749055433848;
        Wed, 04 Jun 2025 09:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCntt0U7ekMD/3TwxfttPyNya1EiPp8j8ZDG5E1tlDGzx3/ONAjY/WPQcKTOr2WSgewAeoZQ==
X-Received: by 2002:a05:6000:400d:b0:3a4:db94:2cfc with SMTP id ffacd0b85a97d-3a51d97b8c9mr3072830f8f.43.1749055433447;
        Wed, 04 Jun 2025 09:43:53 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009748fsm21929578f8f.80.2025.06.04.09.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:43:52 -0700 (PDT)
Message-ID: <e84bd556-38db-49eb-9ea1-f30ea84f2d3a@redhat.com>
Date: Wed, 4 Jun 2025 18:43:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] KVM: x86: Fold kvm_setup_default_irq_routing() into
 kvm_ioapic_init()
To: Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519232808.2745331-1-seanjc@google.com>
 <20250519232808.2745331-6-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250519232808.2745331-6-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 01:27, Sean Christopherson wrote:
> Move the default IRQ routing table used for in-kernel I/O APIC routing to
> ioapic.c where it belongs, and fold the call to kvm_set_irq_routing() into
> kvm_ioapic_init() (the call via kvm_setup_default_irq_routing() is done
> immediately after kvm_ioapic_init()).
> 
> In addition to making it more obvious that the so called "default" routing
> only applies to an in-kernel I/O APIC, getting it out of irq_comm.c will
> allow removing irq_comm.c entirely, and will also allow for guarding KVM's
> in-kernel I/O APIC emulation with a Kconfig with minimal #ifdefs.
> 
> No functional change intended.

Well, it also applies to the PIC.  Even though the IOAPIC and PIC (and 
PIT) do come in a bundle, it's a bit weird to have the PIC routing 
entries initialized by kvm_ioapic_init().  Please keep 
kvm_setup_default_irq_routine() a separate function.

Paolo

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/ioapic.c   | 32 ++++++++++++++++++++++++++++++++
>   arch/x86/kvm/irq.h      |  1 -
>   arch/x86/kvm/irq_comm.c | 32 --------------------------------
>   arch/x86/kvm/x86.c      |  6 ------
>   4 files changed, 32 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
> index 8c8a8062eb19..dc45ea9f5b9c 100644
> --- a/arch/x86/kvm/ioapic.c
> +++ b/arch/x86/kvm/ioapic.c
> @@ -710,6 +710,32 @@ static const struct kvm_io_device_ops ioapic_mmio_ops = {
>   	.write    = ioapic_mmio_write,
>   };
>   
> +#define IOAPIC_ROUTING_ENTRY(irq) \
> +	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
> +	  .u.irqchip = { .irqchip = KVM_IRQCHIP_IOAPIC, .pin = (irq) } }
> +#define ROUTING_ENTRY1(irq) IOAPIC_ROUTING_ENTRY(irq)
> +
> +#define PIC_ROUTING_ENTRY(irq) \
> +	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
> +	  .u.irqchip = { .irqchip = SELECT_PIC(irq), .pin = (irq) % 8 } }
> +#define ROUTING_ENTRY2(irq) \
> +	IOAPIC_ROUTING_ENTRY(irq), PIC_ROUTING_ENTRY(irq)
> +
> +static const struct kvm_irq_routing_entry default_routing[] = {
> +	ROUTING_ENTRY2(0), ROUTING_ENTRY2(1),
> +	ROUTING_ENTRY2(2), ROUTING_ENTRY2(3),
> +	ROUTING_ENTRY2(4), ROUTING_ENTRY2(5),
> +	ROUTING_ENTRY2(6), ROUTING_ENTRY2(7),
> +	ROUTING_ENTRY2(8), ROUTING_ENTRY2(9),
> +	ROUTING_ENTRY2(10), ROUTING_ENTRY2(11),
> +	ROUTING_ENTRY2(12), ROUTING_ENTRY2(13),
> +	ROUTING_ENTRY2(14), ROUTING_ENTRY2(15),
> +	ROUTING_ENTRY1(16), ROUTING_ENTRY1(17),
> +	ROUTING_ENTRY1(18), ROUTING_ENTRY1(19),
> +	ROUTING_ENTRY1(20), ROUTING_ENTRY1(21),
> +	ROUTING_ENTRY1(22), ROUTING_ENTRY1(23),
> +};
> +
>   int kvm_ioapic_init(struct kvm *kvm)
>   {
>   	struct kvm_ioapic *ioapic;
> @@ -731,8 +757,14 @@ int kvm_ioapic_init(struct kvm *kvm)
>   	if (ret < 0) {
>   		kvm->arch.vioapic = NULL;
>   		kfree(ioapic);
> +		return ret;
>   	}
>   
> +	ret = kvm_set_irq_routing(kvm, default_routing,
> +				  ARRAY_SIZE(default_routing), 0);
> +	if (ret)
> +		kvm_ioapic_destroy(kvm);
> +
>   	return ret;
>   }
>   
> diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
> index 33dd5666b656..f6134289523e 100644
> --- a/arch/x86/kvm/irq.h
> +++ b/arch/x86/kvm/irq.h
> @@ -107,7 +107,6 @@ void __kvm_migrate_timers(struct kvm_vcpu *vcpu);
>   
>   int apic_has_pending_timer(struct kvm_vcpu *vcpu);
>   
> -int kvm_setup_default_irq_routing(struct kvm *kvm);
>   int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
>   			     struct kvm_lapic_irq *irq,
>   			     struct dest_map *dest_map);
> diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
> index b85e4be2ddff..998c4a34d87c 100644
> --- a/arch/x86/kvm/irq_comm.c
> +++ b/arch/x86/kvm/irq_comm.c
> @@ -334,38 +334,6 @@ bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
>   }
>   EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
>   
> -#define IOAPIC_ROUTING_ENTRY(irq) \
> -	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
> -	  .u.irqchip = { .irqchip = KVM_IRQCHIP_IOAPIC, .pin = (irq) } }
> -#define ROUTING_ENTRY1(irq) IOAPIC_ROUTING_ENTRY(irq)
> -
> -#define PIC_ROUTING_ENTRY(irq) \
> -	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
> -	  .u.irqchip = { .irqchip = SELECT_PIC(irq), .pin = (irq) % 8 } }
> -#define ROUTING_ENTRY2(irq) \
> -	IOAPIC_ROUTING_ENTRY(irq), PIC_ROUTING_ENTRY(irq)
> -
> -static const struct kvm_irq_routing_entry default_routing[] = {
> -	ROUTING_ENTRY2(0), ROUTING_ENTRY2(1),
> -	ROUTING_ENTRY2(2), ROUTING_ENTRY2(3),
> -	ROUTING_ENTRY2(4), ROUTING_ENTRY2(5),
> -	ROUTING_ENTRY2(6), ROUTING_ENTRY2(7),
> -	ROUTING_ENTRY2(8), ROUTING_ENTRY2(9),
> -	ROUTING_ENTRY2(10), ROUTING_ENTRY2(11),
> -	ROUTING_ENTRY2(12), ROUTING_ENTRY2(13),
> -	ROUTING_ENTRY2(14), ROUTING_ENTRY2(15),
> -	ROUTING_ENTRY1(16), ROUTING_ENTRY1(17),
> -	ROUTING_ENTRY1(18), ROUTING_ENTRY1(19),
> -	ROUTING_ENTRY1(20), ROUTING_ENTRY1(21),
> -	ROUTING_ENTRY1(22), ROUTING_ENTRY1(23),
> -};
> -
> -int kvm_setup_default_irq_routing(struct kvm *kvm)
> -{
> -	return kvm_set_irq_routing(kvm, default_routing,
> -				   ARRAY_SIZE(default_routing), 0);
> -}
> -
>   void kvm_scan_ioapic_irq(struct kvm_vcpu *vcpu, u32 dest_id, u16 dest_mode,
>   			 u8 vector, unsigned long *ioapic_handled_vectors)
>   {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index f9f798f286ce..4a9c252c9dab 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -7118,12 +7118,6 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   			goto create_irqchip_unlock;
>   		}
>   
> -		r = kvm_setup_default_irq_routing(kvm);
> -		if (r) {
> -			kvm_ioapic_destroy(kvm);
> -			kvm_pic_destroy(kvm);
> -			goto create_irqchip_unlock;
> -		}
>   		/* Write kvm->irq_routing before enabling irqchip_in_kernel. */
>   		smp_wmb();
>   		kvm->arch.irqchip_mode = KVM_IRQCHIP_KERNEL;

