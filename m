Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FA2512F5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749918; cv=none; b=UeHOVaJFhIGNurR/nAqlP6DUrtDWHZITuN80jLDZ+Ti5KRmE/T0/GY7j1E1te35RIjbGh9BATOnGWYzJL20kMXLg6fc7lcQbBsgT5u+cGJjFuK0AxahKh5KTC/gmEPM/+88fDjEwray1GhlKW1xXNarENvPoVfRJjYo0xzk4ZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749918; c=relaxed/simple;
	bh=qTT6SpXUX/0g2pQ5HFQSiMgz0tQTApfNyxJ2okysEzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kKlTpzFDUXC9hTwh3CxMmX2u+VNhkRGp4K0vIQD0v5fhOVo7NUdhu8qi94lw1GFxGV3NBMrJJFLsukGgLpClSBXFpsgM0V2DtDJzHlP+vQIcbjomHguAPhD6VNM3y+TiBHwk3ZGhe3GX2HB/tSI9kDNtO+1KjBoQY8qHOfAUsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SLVekQZf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLVekQZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750749915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgRiV0j85PSRtreLAuxfC6pTAXhw9pPRAHrk5ra/5Es=;
	b=SLVekQZfJaZMc3VZ+aH0pytnpWd/hLFCEnvQpU1j+jEzrH8FmjmlYd/1WZD5Gv8Ud5/JZW
	JT7pQK/DWqtNYTAFDbkmBQGr1rn40oNiduEdqVw/x6979IrIsLmCO/4msfCHUGXLYWC1GF
	cU0jAvhFaSersCjPjfuLSfWzpfvjBes=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-iAjSm20lNkikQFgYtNoAmA-1; Tue, 24 Jun 2025 03:25:12 -0400
X-MC-Unique: iAjSm20lNkikQFgYtNoAmA-1
X-Mimecast-MFC-AGG-ID: iAjSm20lNkikQFgYtNoAmA_1750749911
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704cdbso34491515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749911; x=1751354711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgRiV0j85PSRtreLAuxfC6pTAXhw9pPRAHrk5ra/5Es=;
        b=vyvZEIptW/vNOxPB9tOwlaj9RbIn//DW7Xs15gW40/EC8yLBcmwunKM34NNSLbiTy0
         twI+6pE4fFibTPjAuVnBXpcVUJIjK01AdivrWqZIfylBnIhXtNfK5c2oIgSp04a8vevu
         8RoVmKG8YXPQ3wszUQSt3KIDbU+hzmr3/3OY2atvhQObo0eD4pPEQ5gYdFXIVVfSh2TB
         ZG/SqPwMYGhFLHzkxQJ9IYza5ICqnTo3tL4xSyjyyLtJdsZRxorZ3cawnls6KeBZ9QmM
         x3yyjKjE0S46s/M2+l9yr3mvd4/vwbRaZresXCeB27BEN4soqjcrbDvpSJw36gjqf0Mk
         yicQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7kxOyPl0di/3XluWTpFAI/YjJHc7kqgjmX21V9VUYAp1Y0z7BxxUuwAAou+j/Ob6OQH74Kq2jAiR9lPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmVyRne4XCHBQogeIFN7zhiZbiP94yiT4GoDIod6Gl1gpet+G
	xY1SCehT4cvERGwp0HZ3l85TxQ3WFRbqtbpVZQlJEGlXSYWxFgLO8kYqyDcXDve3/CgfJ1UnSGz
	TL/VWiVGBIj6ehki8GB+gyamrqbiEPN8AAvJ3Z8g5wcTmS5cNdz7h8knV9mIEFce+GA==
X-Gm-Gg: ASbGncs9/ag/TGxFqyhe7cngzVVPJfDy9993QLTIabgy9QE61R2k+FA3dnuNBe8uSK8
	w/AIRU+N0tZQQj3kQMA7CUpncxD9cmPdLc16ZWGOrRjcuAmGkyWnVliLyx5hS5KcbtdQ5f5lmud
	iuAR9NpSM4wBrHMKBfgdxO++iX+tcmV8EgxyMK3kijxtFc5StdoXzFOxCEY3+qiXoCsIQFFAWN4
	LzeV7ZrefsQ054lyi8a4E9o+ViTXmryzTAjtu70DuYc5jlFn0HAx0Z5p0S4SWiF1E2MRDYe/lzt
	hx5iymPvYW+Dnzd/xE2SKYalm/LdZ5aDX267R5H5Y3bNMNWY0jBbWscDLoipuaoa
X-Received: by 2002:a05:600c:c168:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4536c253eecmr103886145e9.14.1750749911187;
        Tue, 24 Jun 2025 00:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2um9Qis2AN3HWQ37ati9BBnYWI6SS4ICJEoxMmUlVQC8nuNq4Mjr5VoRjvDjjSGN48+TTXw==
X-Received: by 2002:a05:600c:c168:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4536c253eecmr103885875e9.14.1750749910798;
        Tue, 24 Jun 2025 00:25:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8105f93sm1186791f8f.76.2025.06.24.00.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:25:09 -0700 (PDT)
Message-ID: <5e22442e-ddf8-4f5d-b7e4-5e2c9bf783b0@redhat.com>
Date: Tue, 24 Jun 2025 09:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: arm64: vgic-its: Return -ENXIO to invalid
 KVM_DEV_ARM_VGIC_GRP_CTRL attrs
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jing Zhang <jingzhangos@google.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 6/23/25 3:22 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> A preliminary version of a hack to invoke unmap_all_vpes() from an ioctl
> didn't work very well. We eventually determined this was because we were
> invoking it on the wrong file descriptor, but not getting an error.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
In the corresponding doc (virt/kvm/devices/arm-vgic-its.rst)
it is said about possible returned values:
     -ENXIO  ITS not properly configured as required prior to setting
             this attribute
which does not exactly match your situation. Shouldn't we also update
the doc or change the returned value?

Thanks

Eric

> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 534049c7c94b..b34f8976c9cc 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2694,6 +2694,9 @@ static int vgic_its_ctrl(struct kvm *kvm, struct vgic_its *its, u64 attr)
>  	case KVM_DEV_ARM_ITS_RESTORE_TABLES:
>  		ret = abi->restore_tables(its);
>  		break;
> +	default:
> +		ret = -ENXIO;
> +		break;
>  	}
>  
>  	mutex_unlock(&its->its_lock);

