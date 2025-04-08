Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E702046A5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 04:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088167; cv=none; b=XmjAljgpRfp4L5KMLPva5WyuWnClcANn7WsUrJT7ZEt76UkRn0SD+zJdJS05PqourI4FCqcHqUjVewOnvdO/R2cfwMDxMiyTI6GPRkCOB5bbNgIa1hrUfidAOzIHrHaR6Ol05/e/mfPd3GH7G4PrpB2VuMmoKEmhhBoQCwuEoK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088167; c=relaxed/simple;
	bh=kbIFUgPRmxBM6rMpSRDzsY1WwtHsPMOTaMx3Srpxpww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKtsSvD9ME9m+q8JXN0M+q7l8t9bKi8WMsmN5wFE/yZC2OsyNJGNxotp+ecRuLhvvzzFiIbUe3nLFQVJd9pNZIJNNVO9K1VCjXvlhFQa+x59AuCG1ocgureT1OXDpUQ4heolPe8x2uFsYPGxeFXF571Gjvqf9gEdRvW3vq4k1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GeUCmBY8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GeUCmBY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744088164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIjjOoByUI2pIOPhMAIlcgJI8+NphePBM49vRMjEqNQ=;
	b=GeUCmBY8kCsqu0swXBbhv1huOd5QwzBP5H5JdsKJKX2slay4WXaeg8DRX5EujcG1rsBNT0
	mZ6Aa4/6mXlj8HmyHEC14fbYubLaS4d8ieMhH6YWqhwkPcc85igR6bvK9AVOlrkYmFCx0f
	1agZ7nIpMGGtY8Z/FDt5XJbG2cr40xk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-yZNLdjPwP5iqYjvjzHpWQA-1; Tue, 08 Apr 2025 00:56:02 -0400
X-MC-Unique: yZNLdjPwP5iqYjvjzHpWQA-1
X-Mimecast-MFC-AGG-ID: yZNLdjPwP5iqYjvjzHpWQA_1744088161
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7395095a505so3968176b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 21:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088161; x=1744692961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIjjOoByUI2pIOPhMAIlcgJI8+NphePBM49vRMjEqNQ=;
        b=LpH4wFiRPQ8QymgqvsitjnW3/fnaMmTDEM3sUGWnDQqSfiKnxANNIfIWyknWLPl/YA
         3bYiw6p5fa8jIoAaisMIF4uN8KcSJrwUKKlnRc2BiTkoPdTNIzixq9bISgujVr5O4tVU
         rjrVoaGhqVeUiJ3k2okuZaHMPay+0CZs97AwXiUXuFy8iZ0Fs9QY6x44kyHXIvP7Qc+K
         vvizdQnIQMgQpdOA++QqLl0XhOU8pMQsZDqWxGonv7djXUsp6ytY7nWCDTSHsznut+FS
         10oRtPPEVLF8k2bq+9JRnZ6WULkYY54mmGWKSCOSxUzCeCRLXXC70sYZDDQUdBl8V6g4
         uMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY2006SEqiP2IqRckYsegK2qYouvBEKqMrWuJCkVBi1KYjb6Ey5o0UkxoMmcN2yuZ0trU4dnnB/gpND2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yweg+4bosf3MrLEHYiwQBLPdMegIh7yopcaoSFlHBr7u6uu8tF3
	KR2+rdXJjzcl0D/VoPW0vvAgqqKxaI1q0tNbpUd1xp5607gyuDXm5jkbA2PhqbV9YseW2rk0lP3
	ADyIjKfXtPqYCfOkiuODOcKs0+QhXfmbzxFV6KUwBakUbQz+3P+BSX8jsYLOJnQ==
X-Gm-Gg: ASbGnct82XxdKH7xlek67KLmcjdE8WRHQXo6jMIIpHDS9JiWjsT4y50UrT5BjE1uzxu
	LYr9ZQ7qs/HZ+3qX86fvSOGKpPrNce1mSv/x5/+aXz6UOUo+8M34NpNfBpXfGJw4gby9aNnBjUH
	AggbTHYNiIxmsILPxSYhaejerTWE1hMUv5nJVwbxwgOFyr7b/tIkatzs68t4KzNMMAeu2YfWzgo
	lebgTFkOOA33qoVSZI8QH1UbnE0DHwBJw0gX+o+a/UwrakNOFzRLeCsfflrW52fwMVcQc4MNBL8
	vsuWw3YxKhfHEGP7
X-Received: by 2002:a05:6a20:c89b:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-2010468efe3mr21310697637.21.1744088161222;
        Mon, 07 Apr 2025 21:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERbmBP4PLZ4lD5fRaruKvT92VMq6IeMtLHrpj4YwtyvzhMXIT9jbuvqEjkQzxoAS5XwcPooA==
X-Received: by 2002:a05:6a20:c89b:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-2010468efe3mr21310671637.21.1744088160876;
        Mon, 07 Apr 2025 21:56:00 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9806e9csm9495071b3a.83.2025.04.07.21.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 21:56:00 -0700 (PDT)
Message-ID: <822a348f-46e1-44cb-b475-1b120bf96de4@redhat.com>
Date: Tue, 8 Apr 2025 14:55:52 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/45] arm64: RME: Allocate/free RECs to match vCPUs
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-13-steven.price@arm.com>
 <7639eca7-8fd8-491c-90bd-1be084fbd710@redhat.com>
 <4566d2d1-1f59-49e3-ad75-45c27ac4dfda@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4566d2d1-1f59-49e3-ad75-45c27ac4dfda@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steven,

On 3/8/25 1:43 AM, Steven Price wrote:
> On 03/03/2025 07:08, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> The RMM maintains a data structure known as the Realm Execution Context
>>> (or REC). It is similar to struct kvm_vcpu and tracks the state of the
>>> virtual CPUs. KVM must delegate memory and request the structures are
>>> created when vCPUs are created, and suitably tear down on destruction.
>>>
>>> RECs must also be supplied with addition pages - auxiliary (or AUX)
>>> granules - for storing the larger registers state (e.g. for SVE). The
>>> number of AUX granules for a REC depends on the parameters with which
>>> the Realm was created - the RMM makes this information available via the
>>> RMI_REC_AUX_COUNT call performed after creating the Realm Descriptor
>>> (RD).
>>>
>>> Note that only some of register state for the REC can be set by KVM, the
>>> rest is defined by the RMM (zeroed). The register state then cannot be
>>> changed by KVM after the REC is created (except when the guest
>>> explicitly requests this e.g. by performing a PSCI call). The RMM also
>>> requires that the VMM creates RECs in ascending order of the MPIDR.
>>>
>>> See Realm Management Monitor specification (DEN0137) for more
>>> information:
>>> https://developer.arm.com/documentation/den0137/
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v6:
>>>    * Avoid reporting the KVM_ARM_VCPU_REC feature if the guest isn't a
>>>      realm guest.
>>>    * Support host page size being larger than RMM's granule size when
>>>      allocating/freeing aux granules.
>>> Changes since v5:
>>>    * Separate the concept of vcpu_is_rec() and
>>>      kvm_arm_vcpu_rec_finalized() by using the KVM_ARM_VCPU_REC feature as
>>>      the indication that the VCPU is a REC.
>>> Changes since v2:
>>>    * Free rec->run earlier in kvm_destroy_realm() and adapt to previous
>>> patches.
>>> ---
>>>    arch/arm64/include/asm/kvm_emulate.h |   7 ++
>>>    arch/arm64/include/asm/kvm_host.h    |   3 +
>>>    arch/arm64/include/asm/kvm_rme.h     |  18 +++
>>>    arch/arm64/kvm/arm.c                 |  13 +-
>>>    arch/arm64/kvm/reset.c               |  11 ++
>>>    arch/arm64/kvm/rme.c                 | 179 +++++++++++++++++++++++++++
>>>    6 files changed, 229 insertions(+), 2 deletions(-)
>>>
>>
>> With the following one comment addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>> [...]
>>
>>>      /*
>>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>>> asm/kvm_rme.h
>>> index 698bb48a8ae1..5db377943db4 100644
>>> --- a/arch/arm64/include/asm/kvm_rme.h
>>> +++ b/arch/arm64/include/asm/kvm_rme.h
>>> @@ -6,6 +6,7 @@
>>>    #ifndef __ASM_KVM_RME_H
>>>    #define __ASM_KVM_RME_H
>>>    +#include <asm/rmi_smc.h>
>>>    #include <uapi/linux/kvm.h>
>>>      /**
>>> @@ -65,6 +66,21 @@ struct realm {
>>>        unsigned int ia_bits;
>>>    };
>>>    +/**
>>> + * struct realm_rec - Additional per VCPU data for a Realm
>>> + *
>>> + * @mpidr: MPIDR (Multiprocessor Affinity Register) value to identify
>>> this VCPU
>>> + * @rec_page: Kernel VA of the RMM's private page for this REC
>>> + * @aux_pages: Additional pages private to the RMM for this REC
>>> + * @run: Kernel VA of the RmiRecRun structure shared with the RMM
>>> + */
>>> +struct realm_rec {
>>> +    unsigned long mpidr;
>>> +    void *rec_page;
>>> +    struct page *aux_pages[REC_PARAMS_AUX_GRANULES];
>>> +    struct rec_run *run;
>>> +};
>>> +
>>
>> REC_PARAMS_AUX_GRANULES represents the maximal number of the auxiliary
>> granules.
>> Since the base page size is always larger than or equal to granule size
>> (4KB).
>> The capacity of array @aux_pages[] needs to be REC_PARAMS_AUX_GRANULES.
>> Ideally,
>> the array's size can be computed dynamically and it's allocated in
>> kvm_create_rec().
> 
> This is indeed another example of where pages and granules have got
> mixed. The RMM specification provides a maximum number of granules (and
> there's a similar array in struct rec_params). Here the use of
> REC_PARAMS_AUX_GRANULES is just to keep the structure more simple (no
> dynamic allocation) with the cost of ~128bytes. Obviously if
> PAGE_SIZE>4k then this array could be smaller.
> 

Exactly. The confusion is caused by the mismatched size between page and granule.
We're declaring an array of pages and the array's capacity is REC_PARAMS_AUX_GRANULES.
A comment is needed to explain for now. In long run, I think it's nice to allocate
them dynamically. The buddy allocator allocates 2^N pages and memory waste will be
existing without perfect alignment.

>> Alternatively, to keep the code simple, a comment is needed here to
>> explain why
>> the array's size has been set to REC_PARAMS_AUX_GRANULES.
> 
> Definitely a valid point - this could do with a comment explaining the
> situation.
> 

Ack.

>> An relevant question: Do we plan to support differentiated sizes between
>> page
>> and granule? I had the assumption this feature will be supported in the
>> future
>> after the base model (equal page and granule size) gets merged first.
> 
> Yes I do plan to support it. This series actually has the basic support
> in it already, with an experimental patch at the end enabling that
> support. It "works" but I haven't tested it well and I think some of the
> error handling isn't quite right yet.
> 
> But there's also a bunch more work to be done (like here) to avoid
> over-allocating memory when PAGE_SIZE>4k. E.g. RTTs need an
> sub-allocator so that we don't waste an entire (larger) page on each RTT.
> 

Ok. Frankly I didn't expect it when I reviewed the first patches of this
series. I thought it would be an incremental feature, meaning a separate
series to support it after the base series is accepted. Anyway, it's something
I need to review on the next respin (v8) if it's going to be supported
together with the base functionalities :-)

Thanks,
Gavin

