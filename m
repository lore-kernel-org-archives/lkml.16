Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98C1ACEDA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772774; cv=none; b=Ik7YAdWbFnaKs7nKwFxsi/QsbgiyP9ns166rILuFnN7+/oabL9Gn4RdWC5lx2ohakDxXpjpzuoH7fI7gUclh2PbQa3TnTToFuRxA9sG5jfGPR2qE1Kq/MkjXYWZX+e3rsXhIWG1KuFDXVg4S5SmJd0Qfys0teyg4g7FJ7m3CBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772774; c=relaxed/simple;
	bh=jbVm1C8GcylpmFH0UtsGkzTR+h6r1Vp3GAFyh6KopKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyQTkUpkVHG519/NeEjuSHAS5123DrFjpGJdjZD46YUH56kzzNa8nKCZdnw/KhijiD2OxDAMj9MrVZyijFDDYjbMX/tvKGmkd42HRE4yse2MOrZRja7e+Vz4MTrSCS7t22kuKl/zCFHdNefW7fSlY97KyAvTbW1n1L3S2HO+toY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Bdk3jzkf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Bdk3jzkf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so39717095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772770; x=1751377570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=Bdk3jzkf56AgdBaGqEzBmLoMpC2SSKkH9dD6gYGskBVmWVDfKz/A9+PnRqcWVqAk5r
         3v+HXG0lscoDUYsS7Q0cAli9HMsSwPOG4mzoaRPNc7HIvFHcPRoiyAAANrSuacp5zv0R
         h/owfusUfl+9LFajWjtk59GxNKFv6D+q61kfP8HSkT4q5hh6R+rDUkIphs/h6o2VyDZZ
         MyfCyK7yl55s0KnUPTQZbDkp6RKMvFuNsz1iEWuvLvwKmrFnHX4937KoU3vcHXs5FB5x
         XOiOB3RnV25WdVNIhWuunDNoDBoOO0hqQSn4b+U3EZXhl1x7YWB355sadPP1Ub20YMFu
         L+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772770; x=1751377570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=Q4PN6vo5qNdKaN7PCVOMSBvorWgxkHzjjmmobE31epOoyBRiquL9bXKwuVtl7qR5jo
         IzNz8KmrTSNw+YTyRNq4+mdoB8d2USNkoD5Lum6jzqD0OKsutW//fKjSt6IVeEqk/GOd
         eQaOD11qqMivjkao2/zpS8vKmrOuqNvGuMKBkuXQSJcnzPdpEQVx1fjC7HKwjKOH2oYB
         UD6vjJkqOoUsN+hHz6cttb7ksSZgYZsx3SgHKoQQ5obk6LztC5/kPAGkJTvSsxBdkQRm
         PSbKnJlrIpDQ3p6lE70i6LdpdHQKFPFbD/2bbuZp6JLxt5gpfe0SKOs2eiCErsMzCXcK
         4+9g==
X-Forwarded-Encrypted: i=1; AJvYcCVUgRAYjXZzpFNrukG3RcfunRKSVluRpqNfBSC+u9t437QCDoKqNY2rVGiAbQaxk7tdbPTfNJ4YVCd3XEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2EVXfaw5Vz1MCj73AJLUDRHYA0tADN7CwDo/Y+yzHSVykM6P
	hLq8EBpLGjJxte68STeubj9pYICxtd9Kf1oGnlXhiIBDKtvRrMLJDPDUg2mpidmhWw4=
X-Gm-Gg: ASbGncusncc7XfQjGvlYkRqiS6kS3nzMDfUECj8OkvLj8EJqeRA6UL2SrmyYWNAtn6v
	DyeUPCPIi/hlTgFYTGKR5hHVPpc/rhfz0R5QMQwcu/ILKeSNanG9h21l8Nr2DYDzwU5/eL8LoLh
	/K3P/5HOLyAyrElIYaxrAWXImX/tOA3KDxRfozm1o9R+okxF7Yg4kWiS17jy9jZhxHOUISisfoe
	RCogf9rVLnxavepqeHYQYhn06u6Is4cJM3f3RyAXh+W6Q6/uODekXLAB/uk14Pfr6xJRB8/OR1J
	EoKGekdyzSKRpXmbIPMiNJNrCxKnr+rjIHYG34j6y+eO/vMqLA==
X-Google-Smtp-Source: AGHT+IFEAC1W+Y170mCC2sU03t16kmaicwlOVBXCKZyNDj9U1iBSb9Gp5uGrQiBVTIpsYnn7B2iLdA==
X-Received: by 2002:a05:6000:2583:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6e71d4cf3mr2905989f8f.16.1750772770139;
        Tue, 24 Jun 2025 06:46:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068fd0sm2066068f8f.38.2025.06.24.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:09 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] RISC-V: KVM: Allow Zicbop extension for Guest/VM
Message-ID: <20250624-fd191a60c31c732c0d401f46@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>

On Tue, Jun 17, 2025 at 09:10:30PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zicbop extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 0863ca178066..56959d277e86 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZICCRSE,
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
> +	KVM_RISCV_ISA_EXT_ZICBOP,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b08a22eaa7a7..d444ec9e9e8e 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -68,6 +68,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOP),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICCRSE),
>  	KVM_ISA_EXT_ARR(ZICNTR),
> @@ -171,6 +172,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZFA:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_RISCV_ISA_EXT_ZICBOP:
>  	case KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
