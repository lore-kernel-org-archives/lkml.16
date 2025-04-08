Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4671FC0FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094271; cv=none; b=nUsgU6uDhxbmOXn+lcWeWyGklAgbk1dOJLLAjXFRuV7vucLaxFM4k8SJ5HnraEo5ACqBd1FNdQpi5+0/qs0M2xcfFa0+6+N/gbnch/nFk0KRBbDs6AdNeNa08epJQez9NQKc3777t1kHMYrdAjTATJw8fs2dftVmCy+J0zr0PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094271; c=relaxed/simple;
	bh=Oz3GUpFJ10kwqmVTG/QRdcwv51pw9nvmSjTO6MPD85c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF0CFo3eH14TgQ4eIDCjzjwQAo1Xvy90gMcQF9Yb/jLnC6zIifo9EdPKgNstZo9mO8wLmN2Sd1l41PCfjlvqEtaJUrO8awbX63wWqkzQm8SME+UFwRXjDUSgnrxN2pJ7JrShUsnvIrI2ouS+EPXUQFmuc+845ozFFjjAoR8PN9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMhFCtEK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMhFCtEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744094269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
	b=HMhFCtEK5ZgVfKms2Lltn5cmsy5dglbPg1mGbEjODKqNO77HCGlylqs+tb63rtJjf6+J+G
	GGbtthDAYg868nT8LO+Ttf6O8gmr1qXT/qxZiFa0yw2gBxNgvdUB/PYKj1NgHF8RptKpZf
	9+12yLK/EIHiWfszpTLPX6P1Q4Au20Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-lTWeXuLVNEuwfLY-uHRmLA-1; Tue, 08 Apr 2025 02:37:47 -0400
X-MC-Unique: lTWeXuLVNEuwfLY-uHRmLA-1
X-Mimecast-MFC-AGG-ID: lTWeXuLVNEuwfLY-uHRmLA_1744094266
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so4870123a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094266; x=1744699066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
        b=VE6+jJQDlPuKlCgD6RjMj6vTwRSPzoMgnb/N8spjgTDw1fy6sNEYYIOk6UnisHoyQL
         qG0NEhXG/gcukIMnFNczu4+XQm0X6GaUC4qOoPnFT3ScYSoeL+tg63g++/6DGCfrUmir
         Ti8fHv5WIg5nJ+9u7W58UhIFS0SHCr1N0JW3H9qfxJS1qnsU8les8U/GAf5hTW3jfgAj
         b9dyTVLAOB61loK8z7oJb5TJos+5pgHIKXCUdYWuCtiw65Eit5g54ABvgTF8a+GPs08C
         z4jmgBYN6UQG8+tpQE286iu8IlFT3y40Ki8DvYr+NkadW1fJ5BmMJsps7KXD45kJYvhN
         fkfA==
X-Forwarded-Encrypted: i=1; AJvYcCX7RTEZqIruwK2m8rMTiBiKsS3k+PPX/3hBtE4JgeuvIdKbGDwVXOIkuamE/u8vtviXmvtFUr6pKbMTt4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBqU1pcENzAazE5cF1NF5F2UwLL/Q0FiWWlFt/gc9WGXk0Dsc
	2Ec7/FvHExXt5ApqoJ2yjOhPjteCPtzUK3HhC0XLX1nHvt7X70pOIS4ybDThXICkQm7THXhqIIi
	GacU3niifY2jjEOinOxkeiXPiIXyv98BgCxjBqywfhUSHmmzpGYBqo8OX8ogzqw==
X-Gm-Gg: ASbGncsQunFPsqq9ejGJob4BMRIiiawCdRXb6TeyHw2MKu4qxfhGGjOZTVUCS0QfURO
	CXUOGt/pI1hq8g/R1cq6uegQ8Txb9VReuDBPZifA4HlWpAWGlf88rIUG2Q7k1rUOB1WeyuSpRhO
	XTfRaM2DZRtLqtlhSv5NFQcfjVBwet0hXRnBU8Ki5mYsMfOeD0TO+3sAwEUfRraEqB5CYT7Qr0n
	3qlgxdS8NPNO+P48Ofs453O3KkN+aj7rFTctI60i6BpqyvkyCxHo7v4tyo7U4tnQK/D2NVsWdPS
	C0lJUIrUpeCXw7Br
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510594a91.22.1744094266483;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqBBqwWUYhtFhCnTMpC42RqocSQyCJuLXXFnIrjI7SQP3rPRugb4tcWmMuJB3JDe5p/oXtw==
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510574a91.22.1744094266139;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983bce79sm10080504a91.37.2025.04.07.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 23:37:45 -0700 (PDT)
Message-ID: <7fa4269b-a20c-4cfc-b6e7-e70214ec6366@redhat.com>
Date: Tue, 8 Apr 2025 16:37:36 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
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
 <20250213161426.102987-35-steven.price@arm.com>
 <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
 <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 11:51, Gavin Shan wrote:
>> On 2/14/25 2:14 AM, Steven Price wrote:
>>> For protected memory read only isn't supported. While it may be possible
>>> to support read only for unprotected memory, this isn't supported at the
>>> present time.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    arch/arm64/kvm/arm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>
>> It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
>> negative impact. It's something to be done in the future if I'm correct.
> 
> I'll add to the commit message:
> 
>      Note that this does mean that e.g. ROM (or flash) data cannot be
>      emulated correctly by the VMM.
> 

Please also to mention this if you agree: At present, there is no exposed
APIs from RMM allowing to specifying stage-2 page-table entry's permission.
read-only regions for ROM and flash have to be backed up by read-write stage-2
page-table entries. It's going to rely on the stage-1 page-table to have the
proper permissions for those read-only regions.

>>  From QEMU's perspective, all ROM data, which is populated by it, can
>> be written. It conflicts to the natural limit: all ROM data should be
>> read-only.
> 
> Yes this is my understanding of the main impact. I'm not sure how useful
> (shared) ROM/flash emulation is. It can certainly be added in the future
> if needed. Protected read-only memory I don't believe is useful - the
> only sane response I can see from a write fault in that case is killing
> the guest.
> 

Yes, VMM is still able to write to those regions even they're read-only
since they're emulated. For misbehaving guest where those regions are also
mapped as read-write, the data resident in those regions can be corrupted
by guest. It's not the expected output.

Since RMM doesn't have exposed APIs allowing to specify page-table entry's
permissions, meaning all entries have read-write permissions, we have to
give read-write permission to those read-only regions for now. In long run,
it's something to be fixed, starting from RMM.

Thanks,
Gavin

> Thanks,
> Steve
> 
>> QEMU
>> ====
>> rom_add_blob
>>    rom_set_mr
>>      memory_region_set_readonly
>>        memory_region_transaction_commit
>>          kvm_region_commit
>>            kvm_set_phys_mem
>>              kvm_mem_flags                                    // flag
>> KVM_MEM_READONLY is missed
>>              kvm_set_user_memory_region
>>                kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)
>>
>> non-secure host
>> ===============
>> rec_exit_sync_dabt
>>    kvm_handle_guest_abort
>>      user_mem_abort
>>        __kvm_faultin_pfn                       // writable == true
>>          realm_map_ipa
>>            WARN_ON(!(prot & KVM_PGTABLE_PROT_W)
>>
>> non-secure host
>> ===============
>> kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
>>    kvm_populate_realm
>>      __kvm_faultin_pfn                      // writable == true
>>        realm_create_protected_data_page
>>
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 1f3674e95f03..0f1d65f87e2b 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_ONE_REG:
>>>        case KVM_CAP_ARM_PSCI:
>>>        case KVM_CAP_ARM_PSCI_0_2:
>>> -    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_MP_STATE:
>>>        case KVM_CAP_IMMEDIATE_EXIT:
>>>        case KVM_CAP_VCPU_EVENTS:
>>> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_COUNTER_OFFSET:
>>>            r = 1;
>>>            break;
>>> +    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_SET_GUEST_DEBUG:
>>>            r = !kvm_is_realm(kvm);
>>>            break;
>>
>> Thanks,
>> Gavin
>>
> 

