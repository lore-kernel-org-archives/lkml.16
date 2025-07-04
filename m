Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E51552E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638240; cv=none; b=nG/jAaX/50FAqaC9xDNm5febCMsDmWPNtEgRt27mu/1Qds0IgC5SzXmUsuWZaCBs2Kg6ACug+SL5/HSN4Hq21rCccqubQc8dLJuzzrqV2LXu4/VfRuDyZ8eNyMlDclcQw5xA5eeSQYFxszXoUCc6df0Qa1el+pY2SjYbJpi6BxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638240; c=relaxed/simple;
	bh=K6UHyJ8mrsEWqVNA8naSIk/yZTHQsZ2kPB2X5TAsiyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rr77YA8sNFy5Xbl03+r1+OmhiD+wQZhxfTN+u1SEjmuY2EYbavLIs0hnYbxp0um9Sf/tCMjYIOwSAlcgeZbXk5mBe6IrFRBcempiP9Fx0simrPCTLkYgMOHPa+eUdXexkj7huuPVKfZnDRh9QIErnGkbwTeu8/QlOC4IjA5Urv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xx0ptlla; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xx0ptlla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751638236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xf17P1YALsimhDT+/HwyPfAob6T0qJHwLHeouZenqkI=;
	b=Xx0ptllaPRNFMXA0sd7hTi6wihd2CIHhpXEptJI9EGRE/ZpKj1CQJlByACsFU8x7UCbU/p
	PLgFYJwHP3lfSlSWyJr9lyt0w5w285lajT7SWAQt5FqZjwpnUHX17XwL7NTREFoDqC5Tdm
	/huiJfj88rAvplPYFVHb8j4VUvvjdE8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-eywCQqZaPqSEVJx7jkJxnA-1; Fri, 04 Jul 2025 10:10:35 -0400
X-MC-Unique: eywCQqZaPqSEVJx7jkJxnA-1
X-Mimecast-MFC-AGG-ID: eywCQqZaPqSEVJx7jkJxnA_1751638234
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4538f375e86so7788515e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638233; x=1752243033;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xf17P1YALsimhDT+/HwyPfAob6T0qJHwLHeouZenqkI=;
        b=MeqMCq/4KWl+lQg8HBnN6Zeg7UZRahSuCU+obEuwc6HRqpuW4cDDduaR8jOHgOY4bO
         TVK9T+kNs7kTzDZj3prZzQYVjkdVNdl5Cdqr/1P5/YazgYy7hmeh6KEtNEg33yk9lIat
         vyDmvJah4CwjReX1Sr9ogHIZMFc1YxMYG6iQ6NGvrvfUHK69sqwA9dvOGjyr2Ga9amn1
         B0i5liDl50Cva47RBdL/MIAiiEbOYUndjZnpT9JOzflivPSymb6PGrQkGnb552+9XlwP
         RKw2ErtANfWITIPlWLT2pvbm9Dm+gsmJRD0k4Bm+LY68AkwADEjypj4wCep6NvYHFme4
         ORyg==
X-Forwarded-Encrypted: i=1; AJvYcCXRtriO/P0VMTXBmfVnyYgcz3thYyjYj0eULtihOH6SbvCrOKpA0VjUqSen0RHsEoszBHo9BpMWxbzA64s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7ML3Ll3/USaNNHe3klZSNuh1QooI1WZ0P0kV5w71F6gVX43X
	Fq1V3oOP6tDSyoezSf5Syh70E/m4G+WxOG3OqSk0P+0qUQOqXdQkB5rgLB8aatr6jNgUXyG5h/K
	GTU8UYLHZzy/J95ajBra3CR2wDlF1lY/YYvA1pvj5L8q+6KbeLIlS0xMH3Fm2tU7QPg==
X-Gm-Gg: ASbGnctX+tkMB/C+s82Rbt0VUTQKAdIRZQ8YS4qqP1+/MIj3qZTAaIpqyTNyh/vucax
	SZq9Q8vufxtWjDlUgccWIqvsH9m3Jl0ccXQpVyN6YoTffwl7Mdff/eotrz1FicDgizM4W4/hKaM
	/7CgrdV5NhlMUAQ24PANZyrwpnyxYuG9TRYFcvBfJMGgFEClgif20Hw2H1jw497Qbv0FdOsgAgG
	yS14+OE5vOZqObEBRZ7HzSs3kbWevu+YoYBKY6W401rJ6versG6h/yBtyu1Zdzt3mn1lxXZOpo/
	HTN/vbqFP06If3H8L7lpgcwgdG63HZcF9ljpeVkxn93VDUS/w/OQ+dF0GzrqH275ikDPGaqAIlm
	O59RmALbkUG9HikxC006x3NlomoTYCGasCBxH5/VLmU8zcs4=
X-Received: by 2002:a05:600c:3ba5:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454b3b8a45emr27030585e9.27.1751638233326;
        Fri, 04 Jul 2025 07:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsqbZf4RF6qO+LIbhyPLm8ae++HUsMG9OIMJY26dMAgU/68GqU2/mlOykgqK3yE46NGChe4g==
X-Received: by 2002:a05:600c:3ba5:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454b3b8a45emr27029925e9.27.1751638232755;
        Fri, 04 Jul 2025 07:10:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997ae2esm56138585e9.9.2025.07.04.07.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:10:32 -0700 (PDT)
Message-ID: <7ccee3be-6438-462d-8dce-efa58238f28d@redhat.com>
Date: Fri, 4 Jul 2025 16:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] KVM: arm64: New function to determine hardware
 cache management support
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
 <20250621042111.3992-5-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250621042111.3992-5-ankita@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.06.25 06:21, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> VM_PFNMAP VMA's are allowed to contain PTE's which point to physical
> addresses that does not have a struct page and may not be in the kernel
> direct map.
> 
> However ARM64 KVM relies on a simple conversion from physaddr to a
> kernel virtual address when it does cache maintenance as the CMO
> instructions work on virtual addresses. This simple approach does not
> work for physical addresses from VM_PFNMAP since those addresses may
> not have a kernel virtual address, or it may be difficult to find it.
> 
> Fortunately if the ARM64 CPU has two features, S2FWB and CACHE DIC,
> then KVM no longer needs to do cache flushing and NOP's all the
> CMOs. This has the effect of no longer requiring a KVA for addresses
> mapped into the S2.
> 
> Add a new function, kvm_arch_supports_cacheable_pfnmap(), to report
> this capability. From a core prespective it means the arch can accept
> a cachable VM_PFNMAP as a memslot. From an ARM64 perspective it means
> that no KVA is required.
> 
> CC: Jason Gunthorpe <jgg@nvidia.com>
> CC: David Hildenbrand <david@redhat.com>
> CC: Donald Dutile <ddutile@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

