Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B01B4241
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028988; cv=none; b=iOW5e8i7jdLHQZhijCAgpsHHgDDzD+RMo4cWxamcfxADiupevQIEcmFotn0Otq8GllmgnwzETbN3RKwwGc9xVk6iR4DrdjO1yJbbbKwEjgHf+sV4omqJpybMyevmHVG0Fb94EmEHXKty4UMk45d+Uf/kFlnLFfKH1MPPOQ6IEwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028988; c=relaxed/simple;
	bh=yqM4kYCDpAUqPTOIbrEf40vDqq2eOClb2DURvAkPXWQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bcQCeNsDObFf8qh8938FMvr7EujIxISimuxK9WsNMO/RuV5m9ksyzvpWCtODXGLUZV5HQ3crSb899fhsH9xF3Zte2FBoei+WpXAnLb7V9W83xwxPwmt+2JyDu2tf17LFbE0g1c5+BJO2o2WUuHo16z0flO1VEa9lzfDjgPWV4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4/UGyeG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4/UGyeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748028985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kidTGWLf8HiPqYlSnvvASEQy1JGrgJc/URV408B3d04=;
	b=E4/UGyeGvsIHDug87T+NwmrE9Rugg1L0cvdGXvDxIcmDVIAaz7U/9fqgkTiUjRBsIT5mYe
	IRIZElQiQsjLZ6ApZawl3xZdHPpQEyLmd8pa4dSJjqjjbOgnWmPAQjsZ3PtX2PAYQCd5bd
	fIi2M8n3AW4GG/XYSsTrtOZavmCg01k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-u4l-ypEgNCeLwzigW2VVjg-1; Fri, 23 May 2025 15:36:24 -0400
X-MC-Unique: u4l-ypEgNCeLwzigW2VVjg-1
X-Mimecast-MFC-AGG-ID: u4l-ypEgNCeLwzigW2VVjg_1748028984
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so20604885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028984; x=1748633784;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kidTGWLf8HiPqYlSnvvASEQy1JGrgJc/URV408B3d04=;
        b=qA0Tq3CIO6TFxqLLn2qjvmAZTskKOq8NRT0QmY0mJOKLuke7IUOmBfXxq+q7/OhfJT
         6vtqNs7bHXaHP2SpOZlVgvzdeKzRQaa88w/obBXAC54SmBcqgvt+aNjUCsauaiKSK+xq
         fBvXp0VINBGgc5MSo1IuS0fFfIOoHWazEdW6fFg8IW5H9+M70LEVRkpUvglwHaI+6xw+
         thg4FBi3b7ZhsBFQqs0CkcWdRRJhUM/azNuIsvbViTE3Ta5rnXNGgdD8qcblziP6cMiE
         wFPCsOCq2FsVZJtt7WSz/KMNmnl//sbNzOrZlQWiGcYGy8X9Jb5i3r5/vorF7UPdyhR4
         8uZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXb6vhwDSSQ9N3O5hfLszqeY0+4YaaBHCXKT5KQqnKZld0kAc9LMkxeODwFPBDxgBKLjhHZO5ArmN41Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0DYdWOiDq+S7CxiI3cFrHYFxJzQapF82Nb9BkEUjHnT3Jsez
	+xfPF8nrSK95LXx4Bgt8hN8WAQ3SmQq8RaIOof4mkiUO95ls1LsGeE1YL/jibBEHRVZnTyw773A
	1sSiKBWcr7GxqLgn0Dk3D3SCpWOBAdYnVKUh+vNljXmdInrNycC8HSPV+VnHhUwY6yg==
X-Gm-Gg: ASbGncu5464P7w48zSEVBM+ecD3h1/ZNjZsDIlk+DWoU8U2mX3OC7pk3uVLqzD1AkX9
	U25JoBCNsSnpoa/DMXkX8tdG7cqXg6uFCZ+RWLPj80kv7vtdKXd4JI6sFgBcw6xumt73lveemdb
	NSdL/986ftXBPCh5m7AouTcWmpFE9AFqy0M30NrASQavtqnON4MUxMqYGcuREEmVbtMoxy4HEnB
	G3sVeFdJOIQMj2uUTQ5rsii9alr2WybmMXGczioR8ASvKiRfQeKwBzwW+n3O68WkXxQScoYtFHj
	LTFydV4ncThx
X-Received: by 2002:a05:620a:3711:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7ceecba7654mr76808185a.13.1748028983747;
        Fri, 23 May 2025 12:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFJKxqzX44nUMqHLBCLT+KOS9BdkBLIZeUURW51Zp0jpVCGq7Lz+5dSD9ytJb95co0Y6Sxbg==
X-Received: by 2002:a05:620a:3711:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7ceecba7654mr76804085a.13.1748028983347;
        Fri, 23 May 2025 12:36:23 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ccd94sm1220015185a.109.2025.05.23.12.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:36:22 -0700 (PDT)
Message-ID: <9b429da4-8db6-407e-9721-178e01fd1ebb@redhat.com>
Date: Fri, 23 May 2025 15:36:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: New function to determine hardware
 cache management support
Content-Language: en-US
From: Donald Dutile <ddutile@redhat.com>
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
 david@redhat.com
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, tabba@google.com, qperret@google.com, seanjc@google.com,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
References: <20250523154445.3779-1-ankita@nvidia.com>
 <20250523154445.3779-3-ankita@nvidia.com>
 <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
In-Reply-To: <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/23/25 3:30 PM, Donald Dutile wrote:
> 
> 
> On 5/23/25 11:44 AM, ankita@nvidia.com wrote:
>> From: Ankit Agrawal <ankita@nvidia.com>
>>
>> The hardware supports safely mapping PFNMAP as cacheable if it
>> is capable of managing cache. This can be determined by the presence
>> of FWB (Force Write Back) and CACHE_DIC feature.
>>
>> When FWB is not enabled, the kernel expects to trivially do cache
>> management by flushing the memory by linearly converting a kvm_pte to
>> phys_addr to a KVA. The cache management thus relies on memory being
>> mapped. Since the GPU device memory is not kernel mapped, exit when
>> the FWB is not supported. Similarly, ARM64_HAS_CACHE_DIC allows KVM
>> to avoid flushing the icache and turns icache_inval_pou() into a NOP.
>> So the cacheable PFNMAP is contingent on these two hardware features.
>>
>> Introduce a new function to make the check for presence of those
>> features.
>>
>> CC: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
>> ---
>>   arch/arm64/kvm/mmu.c     | 12 ++++++++++++
>>   include/linux/kvm_host.h |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 305a0e054f81..124655da02ca 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1287,6 +1287,18 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>>       kvm_nested_s2_wp(kvm);
>>   }
>> +/**
>> + * kvm_arch_supports_cacheable_pfnmap() - Determine whether hardware
>> + *      supports cache management.
>> + *
>> + * Return: True if FWB and DIC is supported.
>> + */
>> +bool kvm_arch_supports_cacheable_pfnmap(void)
>> +{
>> +    return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
>> +           cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
>> +}
>> +
>>   static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
>>   {
>>       send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 291d49b9bf05..3750d216d456 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -1231,6 +1231,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
>>   /* flush memory translations pointing to 'slot' */
>>   void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>>                      struct kvm_memory_slot *slot);
>> +/* hardware support cache management */
>> +bool kvm_arch_supports_cacheable_pfnmap(void);
> Won't this cause a build warning on non-ARM builds, b/c there is no
> resolution of this function for the other arch's?
> Need #ifdef or default-rtn-0 function for arch's that don't have this function?
> 
ah, I see you have the weak function in patch 5/5.
But I think you have to move that hunk to this patch, so a bisect won't cause
a build warning (or failure, depending on how a distro sets -W in its builds).

- Don
>>   int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
>>                  struct page **pages, int nr_pages);

