Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38391E51FA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068674; cv=none; b=oOctx6+1K24ns9g3HToe5bVyMk1FBV+VEvKO7uxdMVVT13o00nAzZum+mHiWUd/8IoF2ApY1iHDMIt3JcunN1XEyx3TTa9OxsNnWXhADb+s3K8TETu84YK7Gq5PmrdeJyvvaRhWs3prPImGEYkr5MWBhk7teFryQORPYI430HS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068674; c=relaxed/simple;
	bh=tZi2NdvmQc65SnA/rYIjU5Jj7gqR962wW3qNHQ5VACU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEIZPtV66XIPR03fHwwRXduvfqj3/pqbGddC3HqAYFd6bu1su5e5ZXAPceebE6aZeVQhoK04ta8ghYqt4HOzY9H7OHPxmMoO5OOOqXBNgGgyd3b58gLfGAH2FYcoIW8+EmOyl0hrvTHpwQaZtpINHe/Ej4+3sb28Ks3c7WZPUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DX2TzWsd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DX2TzWsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
	b=DX2TzWsdWKQu2ieuKDdj8hFhtvNEMdxPl8fH8WTcJv2SWmxy7gmnqGw4XMWKH0lDtav6WU
	kcbqxR9j0+UfEn6dPjhwt+jHaRsDvLNZkgM3r4tOpxCm0W0BpEdUb/tNQyNbtFNZRc2uiQ
	vJIJRg/HIs8ogMCFVRh8sLuz8D3hNHM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-PbVwAWZMMC2QIpGr0WUfPA-1; Wed, 30 Apr 2025 23:04:30 -0400
X-MC-Unique: PbVwAWZMMC2QIpGr0WUfPA-1
X-Mimecast-MFC-AGG-ID: PbVwAWZMMC2QIpGr0WUfPA_1746068669
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso8064255ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068669; x=1746673469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
        b=ODZfYSv2kCq/9A8s47Fm1irGNCM8es3TnhMml9nmzKRuHc3pP8fepU23EuHIAulFXe
         HftN2bF4D3PVPHCI5gTFct3B+AMY2AVQ8l4MNx3Rp0iagNkppQGFMP1xbs6eReC+wAIC
         BPzYVgu1xEcjTWOnZW+rYxCfUNg0rWI7F42jTUCaOv02gpJt7d7sDN3319IC2ymn2lld
         WUIokIWU7mi0CCWoj7xG7+d9kDaJZdXlDkFBCRMAn3rlvK/4KNuWowSZFuI2OaoF8FOv
         FlJltS8fYyDYemFbNKqMc/rCKdQ36yvwgCCuxW7De0YUbaL63uk2nsKcBw3OI5mV8zjz
         aQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNoBEP+xGozIHHBcj1rYWjZizvfSyMuF3AF6jyS6+42iyIvIE3xjzzNONdfVAdyJ1O/XrZmVdJwr1SF8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFxrZxMJaXtzdVm5yOtCLAehZwQvm4PZdm+kSt7gSfleswCpF
	K6khjxsaqLgXJ+AKuywcWgvRFClELS7ZEZHPYx4/Qbs/EIC5cqxRtNzbFw8Jttf5a/xR2QexWzg
	fZA2vKTWj/fUxZTyVYOygwxOKTzkWqRaip9w8LWcKep0hC37fse+pMtyYJw44oQ==
X-Gm-Gg: ASbGncurCTM2aOXUV1VRyObc9O4ifjj9qybTXUT1EP/mgCLHqeHVyjsomMXXudV2qDy
	kQJ6QgRnSuRGIFT/MAWFm2zqmGFVdIAkLBOb2ts8kyXaIp5x1HK3Wkkwpqhx7r31FPPyjxyAl99
	PvNGU20ssz8ZKT1zqtXIkLQPZyXdwAzlRVvkUpI2lFtSBb1J27qWE57ehkFccVUL533jiwPGGd1
	ysFaeSbK/Rjybd0JpkADEPSm2TaaKVv6pX44paMiVyBceMr78Z9NzZ0BpTV2fjEGH4QcDPfRw47
	IHO5AVe43YX1
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119485ad.48.1746068669228;
        Wed, 30 Apr 2025 20:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBHru6AxoF/0GFxqHSMv5iJLveZy61hLLoLevsQlDtlaYL5OE3bmqNgmfr/Tilhp0TcTxL9w==
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119055ad.48.1746068668908;
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a1dsm130579985ad.140.2025.04.30.20.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Message-ID: <b1ac33d6-13ed-4870-aa60-36393516d593@redhat.com>
Date: Thu, 1 May 2025 13:04:19 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 41/43] KVM: arm64: Expose support for private memory
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
 <20250416134208.383984-42-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-42-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> Select KVM_GENERIC_PRIVATE_MEM and provide the necessary support
> functions.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
>     function call.
>   * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
>     #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
>   * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
>     should trigger.
> ---
>   arch/arm64/include/asm/kvm_host.h |  6 ++++++
>   arch/arm64/kvm/Kconfig            |  1 +
>   arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
>   3 files changed, 31 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

