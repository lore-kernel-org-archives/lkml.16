Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB8224AEB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143979; cv=none; b=p5FGpV+avGMahjXkonrQinpnPHGC7tp2PS2nEyJMon2JgtVZGpEPj6j5lq2QPQfJWrNZEb7iqUOuxjdd1883h+eBMc2JGfWb0MsKQuN2Rnf+Ck9/f9MVE5He6XfmSjacU5Bl+1yNaWmfOj1E02vmfxVmAj11P8SiecU8ukjbQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143979; c=relaxed/simple;
	bh=0dKoIngO2U3OwRkNoIpYh9lZw9hPMv1MG1wI2ft80KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edAkrhsMwMHJHvMAFYC1iGOUYNTnwX5sq2OKUTp100MdC6A+pLsnmH7H1CXBIrZBa1i2AUCMJD5Z/3168UCaEx6s0x/9t3Boje0hrZnCLohWynM1hM/zi1kXyou4ynTdE3A0fq9cDh8qhv36NqflJisE742pq/zVqcvGTuYQzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jgw66BxQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jgw66BxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746143976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBANZxuf9Ewcq9UHI1RdTA5tF6P0Odc/vpt5hBmkkMY=;
	b=Jgw66BxQO/FGWTLR5ausNpI4SOr085EvZnh+qkDq0cg/rggXnl0q+tVeN4LOGj/pgFpuwQ
	xGQ+pN3zSyx48IAcJ1jbldz8TMgb0J1VbwKf3L1KRPjJX7CkfYODhUqrlGbiVNJSMq28ug
	xzDTHMSZgppOS82X/GCriioAFBPFzHc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-HCmUN8z5NIy8HtiUU8lkPQ-1; Thu, 01 May 2025 19:59:35 -0400
X-MC-Unique: HCmUN8z5NIy8HtiUU8lkPQ-1
X-Mimecast-MFC-AGG-ID: HCmUN8z5NIy8HtiUU8lkPQ_1746143974
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b22717f1so1411390b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143974; x=1746748774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBANZxuf9Ewcq9UHI1RdTA5tF6P0Odc/vpt5hBmkkMY=;
        b=iKGYXBYR4oDdta0aVApk4/wIIZoqkfH7jFBvZL73Rk7y1VSFwvk2Zx5XDE48s9Tvas
         7WqrT2lFrGlgIrcqiBm7gQRBiNe++ek3dWufdfVSg1mywx6wgC9BqZHzj/yiQp9N2yZt
         gZFljx/5fLNCPsQLaUj0DSMW4T9CdFnTUgxFWlAByPHh4TxzdjbdyH38Mq8rgdOuG2OA
         mvSihA1BmQM/DnlMf20PJn3gMrzz8Hsmy+mfTeXfMppEFPmiTRwr4XVQVOPqNWeJHkn9
         C//DpZyQyhoZl4G3C7pbV19gRbdIfq9KKtBAMw3XQeDWX83bDquT67Aj7tQBVdST/CC2
         tgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNXo5Q7SDAevdYfxDyQ7XELLXNdQb4iTjx8jpMCYWGJYJ3cXe6xTdskrxSuGT3rm1j9Hh+4b74Tq/lIRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7DZ4TL63tgYeaT63OaL+Ybk0XpShkau2jef9GPiPtVFsXWRDf
	e7HEbBxoeeVG9j8lNleXhuK9dq4WGVhpaC31nGsx6PGUxnoglJw3zIA81cWrjsFe//C9eK6z0tR
	7WpiCMR28YGQ/hbd/0gVl9V5YlMQJ+FszbnJQNr18mCNwPc68oO/OVShixEdm/w==
X-Gm-Gg: ASbGncvZyrVKZIM4HLqv5s+fa5ROuiVAxWiofRach8fMwuiSXSqermnwii59ZXvLOVk
	FnSJlQrod7dW1ykSDpyLEiadF6WjF61L6MMEb1rWemoVTmoqEUjPF19a4Ji9JKAeyf3PxAjWF0T
	XvfeyPnQJhnxoUBbrn8NA2WwocAGv6/VEh03TVV2nxqxwNdK6MBPwgLax1cLQXCTF+sR+uy0/OB
	CT4EaqIX2D1MAincUfMH42DDqrMNdU+AOqZl9jagzHGUtFwzQSmFuCgTOFAlCl8zm8L/3J8Ym3G
	L/E8BVTfFjNk
X-Received: by 2002:a05:6a21:3a95:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-20ccd77ed42mr1244504637.17.1746143973966;
        Thu, 01 May 2025 16:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpgyoNeMNenmpM+HSomoVyyuNDLKcDkubN3MpNbx1DHID/acstvVT2f8CfagoMMSqLqN1+A==
X-Received: by 2002:a05:6a21:3a95:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-20ccd77ed42mr1244475637.17.1746143973557;
        Thu, 01 May 2025 16:59:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a497sm279346b3a.33.2025.05.01.16.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:59:32 -0700 (PDT)
Message-ID: <15b37ee8-2aeb-442e-b683-705e30f3b0ca@redhat.com>
Date: Fri, 2 May 2025 09:59:24 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/43] arm64: RME: Allow VMM to set RIPAS
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
 <20250416134208.383984-16-steven.price@arm.com>
 <cc2c5834-c942-4454-903d-11b53f8f5451@redhat.com>
 <d2caa472-01da-4dc2-8c38-bf0cd4524bcd@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d2caa472-01da-4dc2-8c38-bf0cd4524bcd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/25 2:00 AM, Steven Price wrote:
> On 30/04/2025 12:38, Gavin Shan wrote:
>> On 4/16/25 11:41 PM, Steven Price wrote:
>>> Each page within the protected region of the realm guest can be marked
>>> as either RAM or EMPTY. Allow the VMM to control this before the guest
>>> has started and provide the equivalent functions to change this (with
>>> the guest's approval) at runtime.
>>>
>>> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
>>> unmapped from the guest and undelegated allowing the memory to be reused
>>> by the host. When transitioning to RIPAS RAM the actual population of
>>> the leaf RTTs is done later on stage 2 fault, however it may be
>>> necessary to allocate additional RTTs to allow the RMM track the RIPAS
>>> for the requested range.
>>>
>>> When freeing a block mapping it is necessary to temporarily unfold the
>>> RTT which requires delegating an extra page to the RMM, this page can
>>> then be recovered once the contents of the block mapping have been
>>> freed.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v7:
>>>    * Replace use of "only_shared" with the upstream "attr_filter" field
>>>      of struct kvm_gfn_range.
>>>    * Clean up the logic in alloc_delegated_granule() for when to call
>>>      kvm_account_pgtable_pages().
>>>    * Rename realm_destroy_protected_granule() to
>>>      realm_destroy_private_granule() to match the naming elsewhere. Also
>>>      fix the return codes in the function to be descriptive.
>>>    * Several other minor changes to names/return codes.
>>> Changes from v6:
>>>    * Split the code dealing with the guest triggering a RIPAS change into
>>>      a separate patch, so this patch is purely for the VMM setting up the
>>>      RIPAS before the guest first runs.
>>>    * Drop the useless flags argument from alloc_delegated_granule().
>>>    * Account RTTs allocated for a guest using kvm_account_pgtable_pages().
>>>    * Deal with the RMM granule size potentially being smaller than the
>>>      host's PAGE_SIZE. Although note alloc_delegated_granule() currently
>>>      still allocates an entire host page for every RMM granule (so wasting
>>>      memory when PAGE_SIZE>4k).
>>> Changes from v5:
>>>    * Adapt to rebasing.
>>>    * Introduce find_map_level()
>>>    * Rename some functions to be clearer.
>>>    * Drop the "spare page" functionality.
>>> Changes from v2:
>>>    * {alloc,free}_delegated_page() moved from previous patch to this one.
>>>    * alloc_delegated_page() now takes a gfp_t flags parameter.
>>>    * Fix the reference counting of guestmem pages to avoid leaking memory.
>>>    * Several misc code improvements and extra comments.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   5 +
>>>    arch/arm64/kvm/mmu.c             |   8 +-
>>>    arch/arm64/kvm/rme.c             | 384 +++++++++++++++++++++++++++++++
>>>    3 files changed, 394 insertions(+), 3 deletions(-)
>>>

.../...

>>> +static int kvm_init_ipa_range_realm(struct kvm *kvm,
>>> +                    struct arm_rme_init_ripas *args)
>>> +{
>>> +    gpa_t addr, end;
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +
>>> +    addr = args->base;
>>> +    end = addr + args->size;
>>> +
>>> +    if (end < addr)
>>> +        return -EINVAL;
>>
>> The check needs to cover 'end <= addr'. RMI_ERROR_INPUT is returned from
>> RMM::smc_rtt_init_ripas()
>> if 'end' is equal to 'addr', but we're returning 0, inconsistent to that.
> 
> I agree we're different to smc_rtt_init_ripas(), but I don't really see
> why we should prevent args->size==0. Calling the low level SMC in that
> case would clearly be wrong (the kernel should be validating and that
> would show a lack of validation), but we handle that with the while loop
> in realm_init_ipa_state().
> 
> Do you think it's important to define this uAPI to disallow size==0?
> 

No, it's not a big deal since it's just a nitpick. The current implementation
isn't wrong because 0 will be returned when size is 0, meaning it succeeds
but no work to do there. Please leave the code as of being :)

>>      if (end <= addr)
>>          return -EINVAL;
>>
>>> +
>>> +    if (kvm_realm_state(kvm) != REALM_STATE_NEW)
>>> +        return -EPERM;
>>
>> To keep the consistency, kvm_realm_is_created() can be used here.
>>
>>      if (kvm_realm_is_created(kvm))
>>          return -EPERM;
> 
> This isn't the same - kvm_realm_is_create() is checking for
> REALM_STATE_NONE, but we want to check for REALM_STATE_NEW.
> 

Hmm, sorry for the noise. The current code is good enough then :)

Thanks,
Gavin

