Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78DB72614
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637744; cv=none; b=M2gA1Tisdi0GafBQffSl1dEfVRnNmpNjxEc5pRlHp9NqzLzqI1CTaDZXhiDEtmbOJt8IQPpIPhqOx7VM74eNkK3a36ceKMKFa+pSrgoowtvZbgZ9RasUZG6at4w4TABOiHFpv8vwnmXH6+BkyX1LFFaAGicJf9qnFirelyijP6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637744; c=relaxed/simple;
	bh=vJbjX3+3u9zBq2/97auwhYI+d2v9jUp52FT9PQSAmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZC8gkEDzMHXYHyLGdHRbH57XvCchpJtHUeY4l3S0bKH72VonMTe+OzUliRHjlX+5hBDolbNRtjV/7LcDOXvLpkQmnleHAYnTQQ/8rafb8a4jqcJcuuHyNwyGiPD1f6LE/no9n8pN46pTdSsNwKdSdGEyN3OSya3ZayTQyMmjHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MLk4K+9L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MLk4K+9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751637740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pfAyq8gycikWXRNwIODTLXhKhyUIzGBWvmEXVr9wTQ8=;
	b=MLk4K+9LfqNvWIdEhnVSgFTrGdbHfdHHUc+1FyibbwMIhUXGnc4ZPNisueZuu+4dLOFL2f
	6WywHOBsNYys+GFa2S4509LY8NI1dFQvoHP3N7yg03q80vky5qOM6yQ0JdgjgAyrLg+psJ
	7tNQ42B9oxnp8AwfpqWJgTwYRzC1GGs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-E-LcI0vPPPSLH1b9mqUgag-1; Fri, 04 Jul 2025 10:02:19 -0400
X-MC-Unique: E-LcI0vPPPSLH1b9mqUgag-1
X-Mimecast-MFC-AGG-ID: E-LcI0vPPPSLH1b9mqUgag_1751637739
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso7221605e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637739; x=1752242539;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pfAyq8gycikWXRNwIODTLXhKhyUIzGBWvmEXVr9wTQ8=;
        b=J6odKJXmf57R5ymBhzL1Grk1f2CDqBgKT0ojZGGZhv5805lqN0/39gY442yAVK5tfM
         J59Y5ynsYx6DWPLrGs4fcqejP215oasETe3ANAsza7/8aqawlQvkdfUSkUrzQsnCnklX
         H8nhNqelywAw91wp3FuU7A9lRR079gqtg4zNCQ0TQ2UHiG83+ytCY8V6MA8Z+vFEERlG
         uyjQ8waMESnBFtxmeiUP/zffaKRW67DdDqBG2heL7WWDQCpnRNJ9y3NKHrvJ3/SqayGR
         yPpAyYXjGlgIxkaoDyR4HLt0ZtNLNucTIZKsmh4Tr3w5gZhw2f1rGARYIKdgPCQkODzO
         2PxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKEBTM8IXO8eF0cKc0bm2AS1UzKwY9xzz53zR6P2OHSmsmRO5FBt8vnQ34QFpHloeRvacCiG3/1iV4CNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWX8AsT7ndgFdrj97L4ctySGC40LZWKUN0R1HposET7x4glTo
	pYFLQU4iyQ1VYgLEt4Zqu6g6zVMlkDT6Nv132v9yEj2UzeZP5mWDShjREVDJ+LFWqnKIaamSIES
	RHV+S+F6TB/WBkc1FY08QPsjmiM/NNb/HeL6qKDZe4jOs9o1Cq0EdzNkVaokxDV4jyw==
X-Gm-Gg: ASbGnctf4/1y2VfUs/zfDfzdALc5SOdU4+mGLeV7Axnbyp560/K4Ya1ev7sG/JUs6U7
	8Cb2zkKzYJHhuBDxKfJLaxVpPAjiDFfkTWL9aWewK700felfzRYVMxYV1GtTAUK8dzN0n7HQs1o
	YB6maWlWXB5KM5qDF4SoHYb592OaLZxBzQwCuBrwKJOgsOfK9asOsG9XPk0QFCDZPLPmy4Ydf7w
	O8YLdFSLvlio/O5zmyMSVnhvU/biqKVhkrmyVQnlNll7M+rT76YkDdEudEB9tVQV4fs/cjdRoGK
	4OG5tiihHv517HeqVDhiAhRDhCJLA4HhDArM1jR4ERcOLTC+rkLKkrlD4edGk4KcbMmQGupa3UJ
	V7UsJtutxnrNmXKnBSpzhaO8/XN9kwBgiqyRJNq8yrRKtfME=
X-Received: by 2002:a05:600c:8582:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454b5110ec7mr17311965e9.12.1751637736803;
        Fri, 04 Jul 2025 07:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+P0Nfr25RkBoVa/EoYZgkHPHVRA3QXbSx1KJI0Z4OIMAoOnHBEyqeTXs8zZiy7MJ6Xprz9w==
X-Received: by 2002:a05:600c:8582:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454b5110ec7mr17309895e9.12.1751637734516;
        Fri, 04 Jul 2025 07:02:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm27322725e9.39.2025.07.04.07.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:02:14 -0700 (PDT)
Message-ID: <00e2cdba-0fa3-48da-9596-7a2020bd1858@redhat.com>
Date: Fri, 4 Jul 2025 16:02:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] KVM: arm64: Update the check to detect device
 memory
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
 ddutile@redhat.com, seanjc@google.com
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, tabba@google.com, qperret@google.com,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-3-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250621042111.3992-3-ankita@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.06.25 06:21, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently, the kvm_is_device_pfn() detects if the memory is kernel
> mapped through pfn_is_map_memory. It thus implies whether KVM can
> use Cache Maintenance Operations (CMOs) on that PFN. It is a bit
> of a misnomer as it does not necessarily detect whether a PFN
> is for a device memory. Moreover, the function is only used at
> one place.
> 
> It would be better to directly call pfn_is_map_memory. Moreover
> we should restrict this call to VM_PFNMAP or VM_MIXEDMAP. Otherwise
> the VMA has struct pages in it and mapped in the kernel VA.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   arch/arm64/kvm/mmu.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1601ab9527d4..5fe24f30999d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -193,11 +193,6 @@ int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>   	return 0;
>   }
>   
> -static bool kvm_is_device_pfn(unsigned long pfn)
> -{
> -	return !pfn_is_map_memory(pfn);
> -}
> -
>   static void *stage2_memcache_zalloc_page(void *arg)
>   {
>   	struct kvm_mmu_memory_cache *mc = arg;
> @@ -1492,6 +1487,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>   	struct kvm_pgtable *pgt;
>   	struct page *page;
> +	vm_flags_t vm_flags;
>   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>   
>   	if (fault_is_perm)
> @@ -1619,6 +1615,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   
>   	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>   
> +	vm_flags = vma->vm_flags;
> +
>   	/* Don't use the VMA after the unlock -- it may have vanished */
>   	vma = NULL;
>   
> @@ -1642,7 +1640,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (is_error_noslot_pfn(pfn))
>   		return -EFAULT;
>   
> -	if (kvm_is_device_pfn(pfn)) {
> +	if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(pfn)) {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

