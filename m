Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C173263F47
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833456; cv=none; b=Tc6cqkrRaK/a/SUMXKzdbV7Dhd7Y9pXMeys1MRpzeuPr3nIeE4vZ6mcfVWEStOP9y1xcPTC3OAlFk4Stk5NY0W7V5r36uqjiizArqX7yVuqgBwv9DGoKAajFxV9TH7qwFzoNFlOW8GFZ0192NXJa3WAMYQLBDJ3s8yRZMzT2zds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833456; c=relaxed/simple;
	bh=XckVhXw8ESk7jST+7YujIxuoI+7R0vtUdI8l3qyTGk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s23HHEC5d45iVngPIJtn0Z2CVuvdlbFefeLX6uBAVP2yTIovCKJAs+bfj+bgCmQ8YH20QO+F/f8eOlMYYNVZZ6aNX6hAS/XZSAVqrcQLlsAE5CQdeAV95vGeFgGYhZGXR1KedqrZCiqoX1doHNEvVNdNqddtj+NVaYwLbLfoZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIu0C5rH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIu0C5rH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747833454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Coxx2aEBIqRB645mhtV+IgPRr+CylFQ+cGu0rui4m0s=;
	b=cIu0C5rH1dOiOg/nnaQuoee2PvCk/bGjYo104RY+jB+g9GScnvvmAdFgDHW+uXA55nlSKn
	qOFi1XSdUVoih06eNJ7Kyvq1lszeZNEYh3wFK/6bar1IG7sbMt59KBOfacq/ddvRlzu6Na
	8+qF26oAScDYKvIcZO2DE7PbX7hcspo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-JihAraNmP6iVacoKL2RvTA-1; Wed, 21 May 2025 09:17:30 -0400
X-MC-Unique: JihAraNmP6iVacoKL2RvTA-1
X-Mimecast-MFC-AGG-ID: JihAraNmP6iVacoKL2RvTA_1747833450
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so42777515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833449; x=1748438249;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Coxx2aEBIqRB645mhtV+IgPRr+CylFQ+cGu0rui4m0s=;
        b=r4XN+PLU8FF+ARbouqT99Snr/isPyWnClKwWLGABG4GmN7GBkMQNod0VYZOmLD6nLJ
         x3WZmbdzmDmYvwkf87EmnpVu7VEEEsCwYJYgBUrv3tQ6Gt69fo45CIVYLQfebQ0DvYTl
         5J/84qPALZlzrCn40b3gxgSWvunXJpXcRMe9ooFL+i0KRXh/AcF/63i6ppaAXADgNZf7
         N+Qcja2aStofmtEevhgw1EPWX54VejRTZ3/z51nezzyNC0IY5KgAqha/Mw93nIXcNNao
         paJAcwObINtgmhogDTgF+wW78bzUwUETj2aJH0H9oIr1gR1Ob0HI6QLX4ctRrWf1L37r
         dGGA==
X-Forwarded-Encrypted: i=1; AJvYcCV47+7Iwqu2+Tza9pWA4VcmP5fARpAkgzeCMIyI7Txnp+GBUxMftDTgSgzkot3ljRYSYHBmCSJxOgxQhdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Ms9qhLRWS8SSRhUl5AIKOWIgSPHMz1aknX0zDZciz3cDaXei
	5KhQvQgR/kxWvVPv1dHlX+tqTM2xl/+PVClZkGQO5unBEgyv05046FOVZ5RV8m77eElPJKtHnj5
	e0LQCq6s1+gQQo9xevxJtz47YdPMttfCaUq9e3gQDt7dNqnZW3Z73qPNb7BJvmAw1aA==
X-Gm-Gg: ASbGncspwSyAlpAuk/uNpQDetxLEhPQ9PJ91TwX8RsnZwtKZqAYVBjS2rsrgblx1ml2
	7BNR9cMu7UydOgMdmr9zlYdge2DRNflWO+5iANeZMLUM0ySPE2e8pkhZflJCadWch90N7xJ1gXw
	d8pgRIOnMvure7uLxBiYPdkpan/6i1ugPXL8zKwnB/Bj5rCTd7scIUVEhoK+leTWBKakhCyf/0+
	231I7wEST7y8Hl1AJRcWK+41liGXSmhwuAwfTJehDfcU0XmwKkXBIYVqk9GxH1VJQrOjE4Pihwe
	Gjl12OP7y2asjpjFKqs4EOPKv7zL9DeE38gQh0jZ1ULcaFbPi/6vJEo9YQlTvKKTm95+MZ0PJeY
	y2DsUUFijBBEJGxjRqrMgbxgkJcQ4EyU6c7YH+IM=
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr201632415e9.12.1747833449498;
        Wed, 21 May 2025 06:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeTvtRM9vsH0rx7yrcgJiEKJ2q99qlmz+CtY4GE46ewWI4BIjJPn0Gdy7a/BJ9+neXKRuaEA==
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr201631645e9.12.1747833448945;
        Wed, 21 May 2025 06:17:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85bb20sm186557675e9.0.2025.05.21.06.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:17:28 -0700 (PDT)
Message-ID: <a2aacca8-cc70-451c-be2b-44911ca3caaa@redhat.com>
Date: Wed, 21 May 2025 15:17:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] kvm: arm64: New memslot flag to indicate cacheable
 mapping
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com,
 qperret@google.com, seanjc@google.com, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 maobibo@loongson.cn
References: <20250518054754.5345-1-ankita@nvidia.com>
 <20250518054754.5345-4-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250518054754.5345-4-ankita@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.05.25 07:47, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Introduce a new memslot flag KVM_MEM_ENABLE_CACHEABLE_PFNMAP
> as a tool for userspace to indicate that it expects a particular
> PFN range to be mapped cacheable.
> 
> This will serve as a guide for the KVM to activate the code that
> allows cacheable PFNMAP.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   include/uapi/linux/kvm.h | 1 +
>   virt/kvm/kvm_main.c      | 6 ++++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index b6ae8ad8934b..9defefe7bdf0 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -51,6 +51,7 @@ struct kvm_userspace_memory_region2 {
>   #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
>   #define KVM_MEM_READONLY	(1UL << 1)
>   #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
> +#define KVM_MEM_ENABLE_CACHEABLE_PFNMAP	(1UL << 3)
>   
>   /* for KVM_IRQ_LINE */
>   struct kvm_irq_level {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e85b33a92624..a3e77fe57cc4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1524,12 +1524,14 @@ static void kvm_replace_memslot(struct kvm *kvm,
>    * only allows these.
>    */
>   #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
> -	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY | \
> +	 KVM_MEM_ENABLE_CACHEABLE_PFNMAP)
>   
>   static int check_memory_region_flags(struct kvm *kvm,
>   				     const struct kvm_userspace_memory_region2 *mem)
>   {
> -	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES |
> +			  KVM_MEM_ENABLE_CACHEABLE_PFNMAP;

Should we have some kind of kvm_arch_supports ... check? Because anybody 
else except arm64 will not respect this?

-- 
Cheers,

David / dhildenb

