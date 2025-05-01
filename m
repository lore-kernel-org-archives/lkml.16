Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2AAD4B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 02:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068359; cv=none; b=GLk9uioHdJqTC1gLaeBaUz4R3ygsd+7oetR7Bh7EmqB787PkF+ZwDDgWd3rBoVNiRWLn4DpG9pTWid2C0W25F5DcbKKcjgvP47xaHqTtchz+jChxWD4XgkAJP1QYEVQ2djw6YND4dPTOFpJg26e/dt5/bP33dDPM0lkaTbWKJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068359; c=relaxed/simple;
	bh=Zko5+xN7riZiMuZ1pSKeoiFEaqg2+CWZlT1tk47iQVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgXwoxcoM4Q/YjhUUnizzzm+4YOAT/bgVtTu1veF7oGW18rxcTbsuBY2t/r4CZ+kW/24DdNFG2XqN27MaC+22ZJRCZrWoLKj2kbXvuLrY68YveDqzKgTX1jg6jlCiUHtvim7gRg2KzTFK+nweSyMohbi7PafJs+dkFb1WyXeGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CemDA3RC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CemDA3RC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWDv7QgtWpFRbFd8EFQQNhSn0JvkvImiDgitgfxQfQw=;
	b=CemDA3RCJqzjnvq1R/Ye6HurinvNIG5G7yzcUTdfBiekUfwjq6jMmW8IdyBZYe59bDN2Gj
	qm+A8FuPJXBgDNDNVuzLsa0ImVCmxWI/zSy45Xu1BwycZj1TUQkX63NNgg4d9BAcj9j8vv
	77RmAVxexsMv2ufQR/zjbEaAZN0K37o=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-HMK5PAIAOX-WxjIFHd4bLw-1; Wed, 30 Apr 2025 22:59:13 -0400
X-MC-Unique: HMK5PAIAOX-WxjIFHd4bLw-1
X-Mimecast-MFC-AGG-ID: HMK5PAIAOX-WxjIFHd4bLw_1746068353
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b5f9279cso501964b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068353; x=1746673153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWDv7QgtWpFRbFd8EFQQNhSn0JvkvImiDgitgfxQfQw=;
        b=IqHJDSeAC1lKFGQV1yLZboNUn7x7XpSStAHGS+7QATvE/l/T9ijfPBnW+k4JzLIZxk
         dlzzYM/vWWUOEmRpBkIz/V6pC1+VTCbR8yi32/nbRj9CvzTDkQkmsKR0nVvrZhe40/9L
         wWtBR2ZiTOcH2eQRjL+EZrZ9caZmL/sUjGebkLngYt49AY+vEtgdW7/i2hLuchdnIQ1p
         7ILpRu2wm2xl7wjEvL4H2OaAa6oGmsmZin03YRCHUcVCGjaJJk/KOy1K2rQrC2miz09V
         sw3O0Fz+Rg8lkOXkow33Pfr89GKsf/w3RE9X1rvdWMzAL6LjioG3dsfLgC4SIziUIFub
         VTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCLpaHy6tKKmx8cr1+n4ZoYP8y0ceT0kSBLo9k4Sxubmag1v81l+G6s2nyrYGVvDnWKn7nvhNC66mLH7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDycqHaOTtL6vqWHIRTDCyfeeMDE69NUSwo5mKl7VGVtw8OuM
	tQeCBsaA4Vl+RhopR9LPgJKtrQreNdCFhoEQxgH9oSg4Fc5vXURHoglyB/6i8F69OwgzmIcvkV8
	FblQiSyzFxFZMHRLRGQXlcprLHRjagEc6gS72rLqwo2yJMVZ/yB471X5c3wNCEA==
X-Gm-Gg: ASbGncvTr7TPM8j1xNQEl8Dlzo9I1REaqXycR8hh0C1fgjy49TwlY8ZiUB6H0jqy1hN
	74Az9Sv7oVJKZWpurVSi4BVU2EUCZXhTSC25Cd1OG3fpTj2wjEFrm1ezLTwtnT4JhuGbqFYK4OS
	PrV3ypcWSBIfiPtP+wjnCK0/ZesdLavcE91jIM3EHhOskCeBZsGCAp0FPxa85B792IYaEyv+J5P
	1nCgUgTH62mY7dV5VmT+T8AxPyQidS66/kPUjzKJzVvT1ezcyUdnxCIqzhjIOLo42a1+bPDeucg
	v73bAAHqdKEH
X-Received: by 2002:a05:6a00:3a25:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-7403a77bf00mr7642173b3a.8.1746068352819;
        Wed, 30 Apr 2025 19:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SD+HY6HsoDRs4fU8wKvcmnTLQD3iURrjVjXooMLHosKIAp3vt2EoNdzvtsz4Y2FqbqtOvg==
X-Received: by 2002:a05:6a00:3a25:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-7403a77bf00mr7642161b3a.8.1746068352436;
        Wed, 30 Apr 2025 19:59:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7403991fcbfsm2480425b3a.49.2025.04.30.19.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:59:11 -0700 (PDT)
Message-ID: <0cd3d811-1e05-4cdc-aaea-b45fddfc9e2d@redhat.com>
Date: Thu, 1 May 2025 12:59:03 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 29/43] arm64: RME: Always use 4k pages for realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-30-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-30-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> Guest_memfd doesn't yet natively support huge pages, and there are
> currently difficulties for a VMM to manage huge pages efficiently so for
> now always split up mappings to PTE (4k).
> 
> The two issues that need progressing before supporting huge pages for
> realms are:
> 
>   1. guest_memfd needs to be able to allocate from an appropriate
>      allocator which can provide huge pages.
> 
>   2. The VMM needs to be able to repurpose private memory for a shared
>      mapping when the guest VM requests memory is transitioned. Because
>      this can happen at a 4k granularity it isn't possible to
>      free/reallocate while huge pages are in use. Allowing the VMM to
>      mmap() the shared portion of a huge page would allow the huge page
>      to be recreated when the memory is unshared and made protected again.
> 
> These two issues are not specific to realms and don't affect the realm
> API, so for now just break everything down to 4k pages in the RMM
> controlled stage 2. Future work can add huge page support without
> changing the uAPI.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Rewritten commit message
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

One nitpick below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 02b66ee35426..29bab7a46033 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1653,6 +1653,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active || is_protected_kvm_enabled()) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (vcpu_is_rec(vcpu)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;

		/* Force PTE level mappings for realms */

>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Thanks,
Gavin

