Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86EA2989BA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772724; cv=none; b=mSOBdCrLZ60otoLICwLbhn5sOSHsaBXYTetbBe8LDDjRHHtgNHU8ihpqPeZkGStUsojltBA+Zj4yo+hklLnJlGIRvHD8JEVQi3sU9JJZmEf9Y4k95UdhwDfQjVoC8SwEaBNUlhCgUNgsxql2A31GuIAMcxRxvm6AYIyZS+caJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772724; c=relaxed/simple;
	bh=GhI68Gy4cRPXeBqql/DtpMXFO8eaM2MI/m57WTrNKGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLUDMibTrsD9X49IH199XsmrjKV1n6isByWAPG1PVgnr6v6irhVyshVG8nmV63Tf0LgonYNLV9e8OEenLeuQ6eo70VFPYRCFcG9eUQ+PkHmDIXW+1HXWWDCwdme+rsx6nGqlOt9JY1uHd0L+/Uj06pP8zIiCYjIVok8u7fCdtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ie4BZVsD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ie4BZVsD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so305979f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772721; x=1751377521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhHOBARS9lr0Jne2Zdn1kpqzowPhY12GIzjucW3MJHM=;
        b=ie4BZVsDTW97BhRYTPEka/0m1gIr5AXXDdFKxvk1/4Dhe3VnpCOVF4NqEoCrhA99aG
         /gVFZbNr04Vkfn1R0AAwx73GFGEuZEj+YeIX7IqaAy0RoeNzVAz5yJAmYN1WyjbD5Iwk
         RvbcUMrnkW0uIMKsEuSsksuzlAeGw+xPp6nFoz2Bm6HjbmtCasrJyccePZ6OWw83sA6T
         ec1x/cs6vHa7Lncv2wzdqdyubNZsIzN1dT4nXK54MaesmomxFQXgYgjp+qkgIJOTY6uF
         J/NQJo0j7ZWgzG8n4K95M1AzU7UuutsD07t3/jURYcFca/3AVVZH7cOqPY9yH7ztEI2E
         xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772721; x=1751377521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhHOBARS9lr0Jne2Zdn1kpqzowPhY12GIzjucW3MJHM=;
        b=eCtfd24+FUprADXtBCCkE+ah2nmtM+aV4oTNAqAOBjIQ1CPcuMuBpkDs7EsYcctpTH
         CPJ/6qdKbH7jZicjpgko56fjNIXRrnY9KQ5rQXVDqnF7jGiCgAinHgJuYnNY+asPVQaQ
         sD3E1IrU+CFrhNgAhQz0Ueo85sbbBlJGCZ6tW+mOo6mYpbHJFuj4q/zngvO2YA98MOFk
         E0j9rajY6TMqL4TA4XKKuNVywpE1I+8+plTa6HugyLWuNIdZZmpKHvyCBWxXFI1/Vnq4
         64BrhSYBaknW+C5BxUpWqiVJRTvd/ZiD5va7vqo0+tuCd7y1tXRlAWGvInljJTzPVOmz
         /0sA==
X-Forwarded-Encrypted: i=1; AJvYcCWeKzkZIWGQQdFIMJKGkWuC3jTvHBnswAITG1UhWUdVA/jJBlsbQAD5JwhvH5hiaqCOnXkjVIQt2GidFLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoC8EbMt1EgN4dfeXeHlWRGov+7ThxW6AkPO3DUV1EL/h3COLF
	2qMFe4cr7YkiDc9AugceXeyoU8nsEiMpgRwebD/2A61inlVFcI+qBlAbS8eDeyYmoBk=
X-Gm-Gg: ASbGncvF6grsrauxVAy714UpsepaL6SHys5QJF5h/NT+nMMq1NpxuW4sZdJLQXAjeI7
	Av4ZwD6UaIA5rX7sCJ2wYQ++yIDt/a02aa7jYnE7mKhyFpDK2gSG5mDxn823IPMxHzOs9wOStQN
	bDkmV+qkm1Yl3mLRausnA1Sy+0YhwGuaVaj57/dqViUiXoClS+BPi6GNOiqDPmhXoCGUEg7uFyJ
	qMyWlaueHr1udWxkmw9XBXkeXrbvOypWQZD5FOQworKdtBbK8tQWBTNgHuk3ZTheDMYdPoSi0QV
	GsW8VWoBfjDl5tjW6W87E68lyJtCzYY0foOXVA0Bj4g6TqOkbg==
X-Google-Smtp-Source: AGHT+IEU5StVqiMNMsimuk7TXSreScYWyjj3lITH71NZEaq/8EdSLIayk4NRO4nj9hFeb35RGbbQ/A==
X-Received: by 2002:a05:6000:2405:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a6d12e1329mr12765077f8f.38.1750772721155;
        Tue, 24 Jun 2025 06:45:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm153049215e9.1.2025.06.24.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:45:20 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:45:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] RISC-V: KVM: Provide UAPI for Zicbop block size
Message-ID: <20250624-c01c528dd9ec524ed3f5e17e@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>

On Tue, Jun 17, 2025 at 09:10:22PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 5f59fd226cc5..0863ca178066 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -55,6 +55,7 @@ struct kvm_riscv_config {
>  	unsigned long mimpid;
>  	unsigned long zicboz_block_size;
>  	unsigned long satp_mode;
> +	unsigned long zicbop_block_size;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 2e1b646f0d61..b08a22eaa7a7 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -256,6 +256,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  			return -ENOENT;
>  		reg_val = riscv_cboz_block_size;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))

I realize this is the same as what we do for zicbom and zicboz, but I
think we should actually check riscv_isa_extension_available(NULL, ZICBOP)
instead. The reason is that we otherwise create an ioctl order dependency
on the VMM.

I suggest adding a patch to this series, which would come first, to change
zicbom and zicboz block size registers to depend on the host, not the
guest, isa. The patch should also change the reg list filtering in
copy_config_reg_indices() to use the host isa. And then this patch should
change to also use the host isa. Also, this patch is missing the reg list
filtering for zicbop, so it should be added too.

Thanks,
drew

> +			return -ENOENT;
> +		reg_val = riscv_cbop_block_size;
> +		break;
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>  		reg_val = vcpu->arch.mvendorid;
>  		break;
> @@ -347,6 +352,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		if (reg_val != riscv_cboz_block_size)
>  			return -EINVAL;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		if (reg_val != riscv_cbop_block_size)
> +			return -EINVAL;
> +		break;
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>  		if (reg_val == vcpu->arch.mvendorid)
>  			break;
> -- 
> 2.34.1
> 
