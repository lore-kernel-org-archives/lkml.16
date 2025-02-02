Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724C20ED
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738476041; cv=none; b=DfLZT3JcYyxWXijK7oT+Yhpx/IPOJ187s1Sa+/axAEw7bUHIB5hSsInkOQngGrQd69S7uo+xaNmyvDY6WlHvFbUC8Xbf9a+2Hd0i8DAhIDYlCPA4T7DCnyNO+uLuEDmsI3+MPa9WvSJ/xDgSG8MEAxdFsjkU5pNACuCm33E1YBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738476041; c=relaxed/simple;
	bh=t4oY2eeSqSQ09U11mxMs90mVSWWyvFwiP6VcUrlpOsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGv2x16rM7RmSWVaPvD2XZD9uFFPcbYM5Y2NLGkyKLi7p5Wz+jNPoJVp5Ca/OsCkWDEMsCA7PJUHhFsAd6ZDuLq0Pww7GV1Cu88DmR/sNxBScMEc/s2PeTW3bnN80/D0OgNslv2HiqQM76kAMdQby0GzzB3ycMbabj5KOlwMaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZIR/+arG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZIR/+arG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738476038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjlJ37q+gVBxHg8p/iKgIH4lKOr26qVR6N2QdXuX3CE=;
	b=ZIR/+arGIL5Mk5I8HDh9WQ1XxqNo25Qx/lggrymZ3ud+XkZXmWqw+oBuoMCUStEXYAJIm+
	2aQwGLHiYKRSq6bF7rEripvKoWU+DcGv6VWOFlVPHJrYpIEvEcI8tiaa/20JrthY8hSeJY
	a5iKcESQHvzPxoKvuAhdQYLNHQAtpPc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-NjvrW4QuPJOyTajXzFA4vg-1; Sun, 02 Feb 2025 01:00:36 -0500
X-MC-Unique: NjvrW4QuPJOyTajXzFA4vg-1
X-Mimecast-MFC-AGG-ID: NjvrW4QuPJOyTajXzFA4vg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163a2a1ec2so109327875ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 22:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738476035; x=1739080835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjlJ37q+gVBxHg8p/iKgIH4lKOr26qVR6N2QdXuX3CE=;
        b=deAMWGh7KWIHoxx1leU14wLU9qwNZTWofiXOjef9HSqAtBkaQ33xbCG2M/X2MqMDyD
         JG9qQmTSRIZSJMNITQvE2V77BF4p4HUh//hDypW9jhGDO/1a0cfcrFL61dVKDQRXXn0a
         SuiA2qD1O+EuD7SSuIH1oFwPFkHG+AWeC0NwdeCOdKidAuSzgd+5IbiAjTJoZPMPm90z
         kukUHTOapSA7aE7VC1AFHCa9WyiGCfvRq/TTxvRQjP2FSm01KSkV99hEDfSJ+YiAU28Q
         MRGqSnKKvZOKtTzgnZusn1XYbz3Wov78Cl9VIiOdRo2LZQC4j9bPJ9QgoJR3fn4QJtiS
         3jEA==
X-Forwarded-Encrypted: i=1; AJvYcCWlD1Ga0SNS/JF3bCHRBodqJLbBebr49js6H6ZK6KsLgcDa9Qhb1ZqiRtkQifG8hdzPoMORPSoJyTyjNg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWESOeb7xQ7AIH0tkOLZfA+jMzP9zTiJyv6WmcWMT28LOeFtaw
	OF0ESU4jG30GstoMhKdvQfVBhETsqvevawyavTTkPP/uCWmoafnJKgDUpqe5qbyRB9XCfYhOuXp
	CEmUPJLfSiHo3BlWBYcJbkh+fO5/6s41gDNySO7JGeQlDkI1mQdmsU04vUfVgyw==
X-Gm-Gg: ASbGncsEddpncPotz3wZ4Upd2ZDX0gcJwSHdrAJOo7SyHRc8cN3tvNoxuXJ4KtFz2sv
	eINPvOrNRCvyGhmdYvCwCDYlharrxlIHm2DE2gci0fZKVG0luSWmS5hwfAm03f3xuQGs+Oavxu9
	L+0EYdy7Kp8x8Xhw7B0P97E5MZxq/f+LbP57sEZIVvqB7rNPMtFXbmKPPQ4mRH9SW/7DzYINcIx
	4NnJWoxPatQWuxvrvyXkpzJyTCNSKNi40CaXGDZ0wuuxFb+M6dr/eiCvfDWQneTUBKDM6djpMqc
	0hGyLQ==
X-Received: by 2002:a17:903:2286:b0:216:2bd7:1c36 with SMTP id d9443c01a7336-21dd7c4c5fdmr262741515ad.1.1738476035649;
        Sat, 01 Feb 2025 22:00:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8sh+1yR6eIL3z2ruF+In49PMNICNRbXw6lt1qSpPO4OvbSNdtKO0P+Pt1zVlA9G23+OiuCw==
X-Received: by 2002:a17:903:2286:b0:216:2bd7:1c36 with SMTP id d9443c01a7336-21dd7c4c5fdmr262741275ad.1.1738476035348;
        Sat, 01 Feb 2025 22:00:35 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489adf7csm6566390a91.13.2025.02.01.22.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:00:34 -0800 (PST)
Message-ID: <4cd1b360-6902-4800-93a2-905cfd8ca7f8@redhat.com>
Date: Sun, 2 Feb 2025 16:00:25 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/43] arm64: rme: Allow checking SVE on VM instance
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-29-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-29-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Given we have different types of VMs supported, check the
> support for SVE for the given instance of the VM to accurately
> report the status.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 2 ++
>   arch/arm64/kvm/arm.c             | 5 ++++-
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 90a4537ad38d..0d89ab1645c1 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   u32 kvm_realm_vgic_nr_lr(void);
>   
> +bool kvm_rme_supports_sve(void);
> +
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 134acb4ee26f..6f7f96ab781d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -456,7 +456,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = get_kvm_ipa_limit();
>   		break;
>   	case KVM_CAP_ARM_SVE:
> -		r = system_supports_sve();
> +		if (kvm_is_realm(kvm))
> +			r = kvm_rme_supports_sve();
> +		else
> +			r = system_supports_sve();
>   		break;

kvm_vm_ioctl_check_extension() can be called by ioctl(KVM_CHECK_EXTENSION) on the
file descriptor of '/dev/kvm'. kvm is NULL and kvm_is_realm() returns false in
this case.

kvm_dev_ioctl
   kvm_vm_ioctl_check_extension_generic  // kvm is NULL
     kvm_vm_ioctl_check_extension

>   	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>   	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 5831d379760a..27a479feb907 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -20,6 +20,11 @@ static bool rme_supports(unsigned long feature)
>   	return !!u64_get_bits(rmm_feat_reg0, feature);
>   }
>   
> +bool kvm_rme_supports_sve(void)
> +{
> +	return rme_supports(RMI_FEATURE_REGISTER_0_SVE_EN);
> +}
> +

If rme_supports() becomes a public helper, it can be directly used. In turn,
kvm_rme_supports_sve() can be dropped. RMI_FEATURE_REGISTER_0_SVE_EN is obvious
to indicate the corresponding feature.

>   static int rmi_check_version(void)
>   {
>   	struct arm_smccc_res res;

Thanks,
Gavin

