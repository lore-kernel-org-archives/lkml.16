Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A252D052
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747485378; cv=none; b=fZJvcct73U9Y8OA2OhIt1RZB0Kz7EDpsI0xyMG0CzlxIo4+j1pRg/FHTElQASqUQeopO5y4rSb1kRNWzXcLX63YL1vEBvrKTdBO6HwdqX/sKEfhZHBDmIiJ9Wn5Tbw3zqF8WsuRmfGl1vUMKFm3rZr2Ji0LkyCuC/Tg5w7iGhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747485378; c=relaxed/simple;
	bh=etuUqgZDekTPWc1mywUqKCAieD6k+Xk2ltdLNLatqW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCIjABhFxM+EgeZzJFLnB1FT1hVU6DwdUXUxqPdkQ91nbdxdbxfj8WaPPjReNhYJpUAEHZPGVwIbeFMVOqxulVj3+Gb/jQX4VnbFInRtHel+GF76iBr7fQHiEPA79WMqwWXGzQRPGeNU8MEYjgxjh0XzaLakrkRHLCPccZSKrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fro74X60; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fro74X60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747485373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3hCuTfjsNu5ACQNXXwWH9knQPQhUx7u9apSg60b7GQc=;
	b=fro74X60wsb/qRGjq4ggu6oQXj8R5KfaSOV23m3a5CCrR5hXHASAy1NwBWxx5oSMWnL0Wf
	lb3JD1p0LA5jUOjLEPf/cYUbOLdBYBo94RkpEj1KXlE580Gwubom6nFJdMiJiYUO5/RlWp
	oY1i4ve2qEBLLcDv/GDINcSoGp//4as=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-1uf7ZrvgNeCMoo9czz2Hwg-1; Sat, 17 May 2025 08:36:12 -0400
X-MC-Unique: 1uf7ZrvgNeCMoo9czz2Hwg-1
X-Mimecast-MFC-AGG-ID: 1uf7ZrvgNeCMoo9czz2Hwg_1747485372
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-48cc1907229so70188131cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 05:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747485371; x=1748090171;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hCuTfjsNu5ACQNXXwWH9knQPQhUx7u9apSg60b7GQc=;
        b=HJff02i06kYTfIAShZG2H9w9d3JT/xcVx4vv4DqnTa3zP18o6wXdRE6D+4Opwh1Xft
         ie2mL/Par2yiaBlOohkbp/nmKXy0OpE7hN1PcBrUa6i8t3l2rXv32vUnay4ytA/rBD3j
         GicZ9TVDDsaAmNB0ZN2QB6SPCkrv+zvpFiRzeK+coF+OM+xrsvyuZP24k7RwFZztvLhs
         y8+iSb7t7aoAAeAmfmkQs+z7Ml179J7h5kxYtt4mIVpQWqLkaBvkI4YrDNTyGjmNMS5H
         49l0cXml6ntZm4ltmGddK++HPe/qCv9/ls8GXxkyjFqp8ogfADcU9T8aHOLmvgVp3eej
         tuOA==
X-Forwarded-Encrypted: i=1; AJvYcCW7qWcdAY+haMAkNj8WM2o9QN3E/g0G5E/nRDnA6HcUGF6SO9P+z3oPRy4Yfvy+w4lxa5icwOz8sIJLQ3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UXMtZk6X1gX7uig+Hv/KcrNXcUWoTGVeaNi55E/RupPuHPen
	nEfeEojmJC0ic/TxjEGZHsJAieeB4XwQ4HTuHAFRkh0XV/NngtDjmPu2ozVWKYP+08Xb5KeRw80
	xBA3PnNHWEPQHEu0UdlIrlcHeVVUCXhZst/Bpr0/S1euR26Jwze2J1PCY9ULu6xJR192bKD8r8g
	==
X-Gm-Gg: ASbGncti0zd1rJNgg2hNoHaMJ9W1yo7Z64+BODcVfMAAhuq57e6Q06rqpfi2qXTYETf
	LMHb90YGbQnImSOOvTT+11A8PTNVxAKVfNIKPzjzCZ/Dg3hZwRrgAjOaI4+A0B1/II5Plxto0S5
	iMrAPyib11rA/Uw7kJQQ8xq0nZinEeiCjPK8mN3yQpgepiEibur6B3pMxoa5/vQIQvedRxd35Dk
	G/l0njOp56f0OJAt2Nau2dDUmV/AnumN4Hcsr73ABEkdECeI9CwDkGXNqVFyPkBkgAA5UY8eF/h
	/iYuvI7XSQlqdy1PgQ==
X-Received: by 2002:a05:622a:22a9:b0:476:923a:f1cb with SMTP id d75a77b69052e-494ae4600damr115386491cf.41.1747485371719;
        Sat, 17 May 2025 05:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM609SyUfzUqo4OLsFLuxdNV4/x0HRlr8FVHAUN/Func1h8j8Ce5B7Setm7CTwZNs7enaEbQ==
X-Received: by 2002:a05:6214:f23:b0:6f8:aa6f:438b with SMTP id 6a1803df08f44-6f8b08352f5mr117405936d6.3.1747485361377;
        Sat, 17 May 2025 05:36:01 -0700 (PDT)
Received: from [192.168.21.214] ([69.164.134.123])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6f8b08afb37sm25011526d6.49.2025.05.17.05.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 05:36:00 -0700 (PDT)
Message-ID: <219b6bd5-9afe-4d1c-aaab-03e5c580ce5c@redhat.com>
Date: Sat, 17 May 2025 14:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] KVM: x86: Use kvzalloc() to allocate VM struct
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vipin Sharma <vipinsh@google.com>
References: <20250516215422.2550669-1-seanjc@google.com>
 <20250516215422.2550669-3-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250516215422.2550669-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 23:54, Sean Christopherson wrote:
> Allocate VM structs via kvzalloc(), i.e. try to use a contiguous physical
> allocation before falling back to __vmalloc(), to avoid the overhead of
> establishing the virtual mappings.  For non-debug builds, The SVM and VMX
> (and TDX) structures are now just below 7000 bytes in the worst case
> scenario (see below), i.e. are order-1 allocations, and will likely remain
> that way for quite some time.
> 
> Add compile-time assertions in vendor code to ensure the size of the
> structures, sans the memslos hash tables, are order-0 allocations, i.e.
> are less than 4KiB.  There's nothing fundamentally wrong with a larger
> kvm_{svm,vmx,tdx} size, but given that the size of the structure (without
> the memslots hash tables) is below 2KiB after 18+ years of existence,
> more than doubling the size would be quite notable.
> 
> Add sanity checks on the memslot hash table sizes, partly to ensure they
> aren't resized without accounting for the impact on VM structure size, and
> partly to document that the majority of the size of VM structures comes
> from the memslots.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  2 +-
>   arch/x86/kvm/svm/svm.c          |  2 ++
>   arch/x86/kvm/vmx/main.c         |  2 ++
>   arch/x86/kvm/vmx/vmx.c          |  2 ++
>   arch/x86/kvm/x86.h              | 22 ++++++++++++++++++++++
>   5 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 9667d6b929ee..3a985825a945 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1961,7 +1961,7 @@ void kvm_x86_vendor_exit(void);
>   #define __KVM_HAVE_ARCH_VM_ALLOC
>   static inline struct kvm *kvm_arch_alloc_vm(void)
>   {
> -	return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> +	return kvzalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT);
>   }
>   
>   #define __KVM_HAVE_ARCH_VM_FREE
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 0ad1a6d4fb6d..d13e475c3407 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5675,6 +5675,8 @@ static int __init svm_init(void)
>   {
>   	int r;
>   
> +	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_svm);
> +
>   	__unused_size_checks();
>   
>   	if (!kvm_is_svm_supported())
> diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> index d1e02e567b57..e18dfada2e90 100644
> --- a/arch/x86/kvm/vmx/main.c
> +++ b/arch/x86/kvm/vmx/main.c
> @@ -64,6 +64,8 @@ static __init int vt_hardware_setup(void)
>   		vt_x86_ops.protected_apic_has_interrupt = tdx_protected_apic_has_interrupt;
>   	}
>   
> +	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_tdx);

I would put either both or no checks in main.c.

Or if you use static_assert, you can also place the macro invocation 
close to the struct definition.

Paolo

> + */
> +#define KVM_SANITY_CHECK_VM_STRUCT_SIZE(x)						\
> +do {											\
> +	BUILD_BUG_ON(get_order(sizeof(struct x) - SIZE_OF_MEMSLOTS_HASHTABLE) &&	\
> +		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
> +	BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&					\
> +		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
> +} while (0)
>   #define KVM_NESTED_VMENTER_CONSISTENCY_CHECK(consistency_check)		\
>   ({									\
>   	bool failed = (consistency_check);				\

