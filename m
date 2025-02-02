Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070388F6D
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738459393; cv=none; b=Sk1Ff84pjcHsJj560eXH/+3UBSTFTPXPCptny1UiaAUHVl3jcsH/lS/y5VPw7Vqlu3xQC2dVI8CmMSNExZ8ZsKXkbotWP81ZhLPsHfu0AbvegYRnSZQYqoyko6+qIB6u8gZbrN5tFnrZeySF/VliiISkXX4nh6x8pNHtvKzI0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738459393; c=relaxed/simple;
	bh=laaJN879foDpMaPWrRy6D9kpMKcmzC5+VrbzCSXuhpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovVRduodCbNSA1AItIgJhhS7dja1dNoTxEuq8nIeZP3NXKDfAC4xJ9EGIgCj9MUFMISqQ4uMpkAsUGGmy5wi+PSjGiNm3tCkFdRU2KYCdybRxjdkaR9fL3JQ0S387jonz1YY58VxVWZchiKEhFQUa83TueiIe2QsIMFpJZJoDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbGRMMPH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbGRMMPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738459390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAAI3E0WlUEH8QGHAO5vUmuOkyQG4sKUrRj2kW9NJz0=;
	b=DbGRMMPHYaLUXFMo8B6Vu3A2yukX/wJG+BQlWgHuOqcuzMTkpfNU7Gno6cm81ZXvJJmtK2
	yWr/MOpt2cFl/hPf8ctlRz+Mc/frpDDA1ik36rjLqHJsazYmYlxWjLsmu+VpgoP0q+ey6d
	3Kx8rsYBsSjivHSoN6BrKMXbtlwKP60=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-qGkxOdzDOB2u6dGnqE5uQA-1; Sat, 01 Feb 2025 20:23:09 -0500
X-MC-Unique: qGkxOdzDOB2u6dGnqE5uQA-1
X-Mimecast-MFC-AGG-ID: qGkxOdzDOB2u6dGnqE5uQA
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso6396756a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 17:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738459388; x=1739064188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAAI3E0WlUEH8QGHAO5vUmuOkyQG4sKUrRj2kW9NJz0=;
        b=lvtyH2baeDxy24pEjJItYX35cm0NwHaJgfVV2oxYAKkAayPhYsQOeAD0SdxPvA923s
         KFj8d5WfL0+0zXffYaykCWgfo2K94QynK+/PzsN5/BhDTMzvUb3bty6fQHRttkV6Zns1
         ecU3dO+tPz/cnl7dnLBb5WFFdUpGJBx+i6dF2SUa+6shTI5CYksI2jYg3/SlPabZuD0u
         nD2Nw/ULxm3T+jNAltR6dhJh8FuOuPJPyK/cnO6scukv8/PTvBVhOsHSlp6sL5xa+NTv
         bvp+BGGLPsA3sHNObgH6AS0KkJtKnM9vd93uvfooqt8CxSmoaTB3y4/OCSpAfjXkQ375
         Sn9g==
X-Forwarded-Encrypted: i=1; AJvYcCWIHSvN0beNakthkL4JysC7br1NzGKWbCTuvt/W0tIfGHsfJYgrBJvpMOSPRC0XJ8dX+AM85WxYGhJS7eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFXRMWpgMqT+Bv4tsjNevk8TF3onFVDgJ7dcTEhr+KpqvqBgHF
	n1I/THdHU1QOVbWB4/rLwAuyfi0LRBwEOgmfpd6a+3r9JB9PVA3cfaQPxnxn2Q4hwPpfPExrEHB
	7YE2Yy4rUFQevZ0rLPVy+eQOD/WP2kgMhnkmL9TKG/DmC5f2r1V1ARvlXQBbOig==
X-Gm-Gg: ASbGncuCAQqYCw5Tfgx+KxzbHSQBbeDkzssCZ1zuUINvfxgzoPiL0yiMaZaqeYYCc/f
	HJYeC1a++J9R/VOQ8jcESHeBpkfZ+QD+y4l3WqIGh9nIWOKyRBCE4P30kTsqTXmxkzgkjblQu64
	nl2n9eh8Sy3c+YAbRG1V7cPauXCeY8J2bnkKCWJJCmoQoTMDXe01vbFC8dBG+IH5hzndwHBuKwh
	3K0FEMTUC53GIUDMpisui++NVRfydAQ6GGAoj9BYdG5RWZBFranJXmI+G3bdrEX9yIYbFh+YYid
	CVSk1w==
X-Received: by 2002:a05:6a00:a84:b0:725:e405:6df7 with SMTP id d2e1a72fcca58-72fd0bf50d0mr22072034b3a.10.1738459388635;
        Sat, 01 Feb 2025 17:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+rGTDJTNwVR5Fk0Ockt+Y4TXvcEQynR1IiX2sbu3+KwKdR5uE+ZGwPGUav29lR64slwel7g==
X-Received: by 2002:a05:6a00:a84:b0:725:e405:6df7 with SMTP id d2e1a72fcca58-72fd0bf50d0mr22072011b3a.10.1738459388254;
        Sat, 01 Feb 2025 17:23:08 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm5660892b3a.7.2025.02.01.17.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 17:23:07 -0800 (PST)
Message-ID: <09f42dc3-9c43-49ef-b4eb-8aeab387f0fd@redhat.com>
Date: Sun, 2 Feb 2025 11:22:58 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/43] KVM: arm64: Validate register access for a Realm
 VM
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-23-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-23-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
> suitable error return if other registers are accessed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>     test to allow them.
> ---
>   arch/arm64/kvm/guest.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 12dad841f2a5..1ee2fe072f1a 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -73,6 +73,24 @@ static u64 core_reg_offset_from_id(u64 id)
>   	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
>   }
>   
> +static bool kvm_realm_validate_core_reg(u64 off)
> +{
> +	/*
> +	 * Note that GPRs can only sometimes be controlled by the VMM.
> +	 * For PSCI only X0-X6 are used, higher registers are ignored (restored
> +	 * from the REC).
> +	 * For HOST_CALL all of X0-X30 are copied to the RsiHostCall structure.
> +	 * For emulated MMIO X0 is always used.
> +	 */
> +	switch (off) {
> +	case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
> +	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
> +	case KVM_REG_ARM_CORE_REG(regs.pc):
> +		return true;
> +	}
> +	return false;
> +}
> +
>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>   {
>   	int size;
> @@ -115,6 +133,9 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>   	if (vcpu_has_sve(vcpu) && core_reg_offset_is_vreg(off))
>   		return -EINVAL;
>   
> +	if (kvm_is_realm(vcpu->kvm) && !kvm_realm_validate_core_reg(off))
> +		return -EPERM;
> +
>   	return size;
>   }
>   
> @@ -783,12 +804,34 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   	return kvm_arm_sys_reg_get_reg(vcpu, reg);
>   }
>   
> +/*
> + * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
> + * that are available depends on the Realm state and the reason for the last
> + * exit.  All other registers are reset to architectural or otherwise defined
> + * reset values by the RMM, except for a few configuration fields that
> + * correspond to Realm parameters.
> + */
> +static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg)
> +{
> +	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_CORE) {
> +		u64 off = core_reg_offset_from_id(reg->id);
> +
> +		return kvm_realm_validate_core_reg(off);
> +	}
> +
> +	return false;
> +}
> +
>   int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   {
>   	/* We currently use nothing arch-specific in upper 32 bits */
>   	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
>   		return -EINVAL;
>   
> +	if (kvm_is_realm(vcpu->kvm) && !validate_realm_set_reg(vcpu, reg))
> +		return -EINVAL;
> +
>   	switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
>   	case KVM_REG_ARM_CORE:	return set_core_reg(vcpu, reg);
>   	case KVM_REG_ARM_FW:

It looks the core registers in kvm_arm_set_reg() has been validated for twice.

   ioctl(KVM_SET_ONE_REG)
     kvm_arm_set_reg
       validate_realm_set_reg
         kvm_realm_validate_core_reg        // 1
       set_core_reg
         core_reg_offset_from_id
         core_reg_addr
           core_reg_offset_from_id
           core_reg_size_from_offset
             kvm_realm_validate_core_reg    // 2
         copy_from_user

Besides, there are other types of registers that can be accessed by KVM_{GET, SET}_ONE_REG:
firmware and bitmap registers, SVE registers, timer registers, system registers. Need we
to hide any of them from the user space? As I can understand, the SVE registers are owned
by RMM at least and won't be exposed to user space.

Thanks,
Gavin


