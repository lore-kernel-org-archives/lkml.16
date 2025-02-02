Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873A8C07
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738462565; cv=none; b=SgwwTd1zXSyrC3WegZ2pPXVPf+uirnJaomMb6G72mLXYxlrP7029KCGmC98H0sbNwqw/n7UbjJ0rVyTcIF0EO+37u0TZgK/EzlVWTNyd/VAUotORjt4xVcuxI5gzj7Xz+hti2/7Fdcy7LyT2rlsao0DBYiRXxpzDkxKVQtTUKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738462565; c=relaxed/simple;
	bh=YpG5rQ2KFsWWjOCvMTMldtm0ojXwxSh6Ny+S3WE3jww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VycmHRPPiJyg6XpK2UXUir/seOyvsilmZgniUJgcKJJvt3zeQ2HB+jpfe06i4YpCLRz9NDq5YWN8U+YsmJLEpb/HUeSmqTtYwFtOfkRijghOg5jW3P604H3I+co56p1dPiLReaMNpN3lgCqNizlmpM9n8BzVpkU1yrojEwnt+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+Zya/uz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+Zya/uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
	b=H+Zya/uzs2s8lq440k5zOvKoWbQc08gHuhl4PyvRPEOxvTBzK/0E0J2s02LOepONmXD93P
	JMVGNZFH8d5FdhtVF7aTHMUHBCIBOj58opv9eTLvlsjeG0mJb4tHXwQAM9wF3nqdROW4DS
	Zbt/OQ3DZh0Itn9g7kNjRlXcapxVjls=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-r92N6dRHNEyp1mZd1B3pFQ-1; Sat, 01 Feb 2025 21:16:00 -0500
X-MC-Unique: r92N6dRHNEyp1mZd1B3pFQ-1
X-Mimecast-MFC-AGG-ID: r92N6dRHNEyp1mZd1B3pFQ
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so8142743a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 18:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462560; x=1739067360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
        b=iqpUEXagmgHNCm9WZNxJdO5zV/D9d9oxAXyYJCyQXMfVrMGLqoBgliWQdpKF8n51hR
         Zq1w44oWhjXy+XYkLLg8qnuVvlV+PXpcv325XEQwwSbjwVBMum9ok236F+LDOLMTnAT1
         c+0U+ZNbx0DcqobaCQd/WOrW4fFCMU7UwR6pFGnL0ij0bWUf+NPWMy4Xi2PjctiPDyx0
         7SpBBPdMBfxSQkah6gS7v2UNilZBV6p/bSKqWuoFq6h4gfs74YL5Zn5uqEWV8zU64hml
         xnJ55lQH6s87nIwj/9Yh+BXks97HKTeA/tRN3iVdkwHYB23yfdoXPXnh1DW+x02VWJH8
         4aMA==
X-Forwarded-Encrypted: i=1; AJvYcCVVlN3WIaNlPwoB30wYc5/XSeurhc6fTMxBpfnp+q5sE546Bk9RMcIcZIbsicoKQrB9Y/Pbthq/6GVo09Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LMcQgLEIKS472jF76r6A06nELs4XfxKKW7P3U+S4DhJnYj6f
	FgVTt39nUq9c0O+3JUawoXT/JrKSJBe9CPkaxQF+XtkkarcuJsuao3zWBT2jxVd7VclRl/3gmgn
	rID6lTK1faJ3ABiSfY2ltFOoAjWWuxldaG+8tOEL7hXb+Tqe44uDe97CjFyrntQ==
X-Gm-Gg: ASbGncuDbnr3Ak2Y7xXYoxukr/FqJa9VvvDCIC0jtPsPaTwqqzZiiF/rsmtEETo4Cg5
	NEtKyEfnl28TLMnE5e0z2b2mXq/K+W+X5Sj6uGuyU3oXFGGWN7J1VdhVirDFRAYaXPbbnlDnCbe
	sb20zLzylvIWu6MoDtWJH+kSNxZPcGnBno002aOfH5zw6aq5a86HHuSx0bPuiX7rafVp8MeU/Ky
	aRJARWMFaCgokRi96BC9BBM4cht/RMZ8eqWmbLVf4NqIANtlnMhcdZzgZjVpdyv8c/mVGUriObH
	+qZuUQ==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769157b3a.9.1738462559690;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwN4JpbwAKVJUbVg+/34hGwQp5HKYXpKcr/Eo2PO+gIzPd+r9+tV930pBIODwVO11f1VYIuw==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769126b3a.9.1738462559318;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm5834225b3a.96.2025.02.01.18.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:15:58 -0800 (PST)
Message-ID: <ae13e762-bd0d-4525-8919-f6b1bcfc8fee@redhat.com>
Date: Sun, 2 Feb 2025 12:15:51 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/43] arm64: Don't expose stolen time for realm guests
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
 <20241212155610.76522-26-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-26-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> It doesn't make much sense as a realm guest wouldn't want to trust the
> host. It will also need some extra work to ensure that KVM will only
> attempt to write into a shared memory region. So for now just disable
> it.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eff1a4ec892b..134acb4ee26f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -432,7 +432,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();
>   		break;

kvm_vm_ioctl_check_extension() can be called on the file descriptor of "/dev/kvm".
'kvm' is NULL and kvm_is_realm() returns false, which is the missed corner case.

>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);

Thanks,
Gavin

