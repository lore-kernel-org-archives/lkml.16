Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC84A04
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738538250; cv=none; b=Ae8wF7WI+8Ff+HuwGSzUJu1gdfDGkSBAYTzCBZAx2f0YOxlIJ4AsxIQdsd1BNHJydxPw4MqJCTfyxvtJec0P3xdyPa+At26v2fHxjSkRFK29TSHlT+nKmIEh+z+YF9V47jbpz/SKvadspcJcxkRs2YH4zutfcLGzpg75b8cVtQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738538250; c=relaxed/simple;
	bh=oWut+e6BjlnQ1t1a7UfTOn69NfRO8clBIxfqu43+0pQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dVaK4IVtUMqtU41BYJ5+hJDLBL3sxfapeQwoEgfzDGjQOUXJ2B4Nb8ttZkD3aPAMuZP+/rMkAI+0xS+PeYHXb3tvkOUDlbCITPkVg98HtBRiSgaM9GY2MZRlEPIw8o1C8nTZTZPOrichGQVuTZGsfPiKChBgGewY9Kdk4NmZclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C4uZZKNS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4uZZKNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738538246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRA7lWgwDKj6UV5o7i7BX8BX6gq8Cn4M7Ftrg8fkVDM=;
	b=C4uZZKNSeBejYRD/NyKeKVNbNtjhgoiMyolvr2MtGoRtCLbB42/kAwepygO5P9pGOy8mON
	VjAg5v6+Yvl2hwZuW+c44PuRvE++3IYqTy6MB4IQbpS2AdRZRxhVqQqGH2mmBeEkEKT3nu
	FsGapwtGqBI3xavzT8N82491HaoC7Uc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-y38039KpPauhJWK0lK6SRQ-1; Sun, 02 Feb 2025 18:17:25 -0500
X-MC-Unique: y38039KpPauhJWK0lK6SRQ-1
X-Mimecast-MFC-AGG-ID: y38039KpPauhJWK0lK6SRQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso7171898a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 15:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738538244; x=1739143044;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRA7lWgwDKj6UV5o7i7BX8BX6gq8Cn4M7Ftrg8fkVDM=;
        b=ddTXpW366WkP037HBPI2XHlvj7eZee2PEanoDJWjjZVdm0iVK9m7+54wmr3Lzh63Y7
         I2HW36Se0/IMQ9JhNR0XHQwP54RGWyDM/73H44O/YkVNC2wKbRz9jgEUoIJB+BPuyrS3
         uAgEDb0X8dXcxO0YOhVlWq5RD7V9BMILYhxWig9t53T+BuaVCZ1spdHZmHPS5HiFCo28
         D3Miyv9RQ3clozNYB2sJIoQ8GfBEMIQLbcB5gbnvUiYPHX1SC2KoACHeA3jbWG7q6qTQ
         qoXKJuoykLcLa3oq1HCCwmA8LuPayGK1VsoJ6pNLmvsSleBPWZCN8Vwhr7JF28u1ijkC
         i8ew==
X-Forwarded-Encrypted: i=1; AJvYcCX3kk7MlMKULJDZBCQhprooiZD+YUVjhqll0qm32h4EO6EPLzK4dSYcL+YL3rIRQ1uXszCCh0bpRoQ8cJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIl3VG0rrq6c0qp6vnwFqDuz9ODHJydmnPoBgyap6O3QwrwR2i
	7gSSUtq/BBq1SpAYAau6XXPRzS/fcDj45hav8wP4j5/hNprplj5X4HJ6Xe15PHcPZPL3jsfNjON
	I7wuIqZS4nY55x0y089UtPgyW/m3BJW3eCqsiYI9yG2YTYUWBKn1p345pOBaKzg==
X-Gm-Gg: ASbGnctnGdy73QeJRTDD2S8r8tcVhaojqC7NJR4FiuZCAtJGCwK043gR2hRuj+sXzuM
	H6UeSOvzxW5BnYUluCRwm7iqHHG0B9PkIYDCJDctE3ofAn1gVygbdlReawcm9w/yUJU0V+kdJUN
	dbomTdDN7yhh+oiwh5DgLHgvsdduq+W7/GlHgHeLZ0vC94nhFv5Jgyxz1q4jDHA992gcxB/ArMM
	69dS8AXYJ2RZzt4ntl5t77RmobHFDEUrzmPEu13+nyYy6GScmr6S/jHOvFn/6b4BVDi1s3bL/TX
	rjRp+A==
X-Received: by 2002:a05:6a00:80a:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-72fd0beabb1mr27783715b3a.7.1738538244200;
        Sun, 02 Feb 2025 15:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDd7NX+s9VmJsk4Gu/C5cdF+xO9wYV1JktzYhBU9uRWjBep69A7UQIF0gV3XEciNO6G3kkpg==
X-Received: by 2002:a05:6a00:80a:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-72fd0beabb1mr27783675b3a.7.1738538243767;
        Sun, 02 Feb 2025 15:17:23 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6429a98sm7393173b3a.67.2025.02.02.15.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 15:17:23 -0800 (PST)
Message-ID: <e76aaa8f-b2cb-4b89-ab9c-6ca4cac8af9a@redhat.com>
Date: Mon, 3 Feb 2025 09:17:15 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
From: Gavin Shan <gshan@redhat.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-35-steven.price@arm.com>
 <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
Content-Language: en-US
In-Reply-To: <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/3/25 9:15 AM, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> The RMM describes the maximum number of BPs/WPs available to the guest
>> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
>> which is visible to userspace. A VMM needs this information in order to
>> set up realm parameters.
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>>   arch/arm64/kvm/sys_regs.c        |  2 +-
>>   3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
>> index 0d89ab1645c1..f8e37907e2d5 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>>   u32 kvm_realm_ipa_limit(void);
>>   u32 kvm_realm_vgic_nr_lr(void);
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>> +
>>   bool kvm_rme_supports_sve(void);
>>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index e562e77c1f94..d21042d5ec9a 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -63,6 +63,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>>       return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>>   }
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>> +{
>> +    u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
>> +    u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
>> +    u32 ctx_cmps;
>> +
>> +    if (!kvm_is_realm(vcpu->kvm))
>> +        return val;
>> +
>> +    /* Ensure CTX_CMPs is still valid */
>> +    ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
>> +    ctx_cmps = min(bps, ctx_cmps);
>> +
>> +    val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
>> +         ID_AA64DFR0_EL1_CTX_CMPs);
>> +    val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
>> +           FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
>> +           FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
>> +
>> +    return val;
>> +}
>> +
> 
> The the filed ID_AA64DFR0_EL1_WRPs_MASK of the system register ID_AA64DFR0_EL1 is
> writtable, as declared in sys_reg.c. We need to consolidate the field when the
> system register is written.
> 
>          ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
>                      ID_AA64DFR0_EL1_DoubleLock_MASK |
>                      ID_AA64DFR0_EL1_WRPs_MASK |
>                      ID_AA64DFR0_EL1_PMUVer_MASK |
>                      ID_AA64DFR0_EL1_DebugVer_MASK),
> 

Please ignore this comment. The consolidation when the system register is
written has been covered by PATCH[35/43].

>>   static int get_start_level(struct realm *realm)
>>   {
>>       return 4 - stage2_pgtable_levels(realm->ia_bits);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index a4713609e230..55cde43b36b9 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1806,7 +1806,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>>       /* Hide SPE from guests */
>>       val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
>> -    return val;
>> +    return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>>   }
>>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,

Thanks,
Gavin

