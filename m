Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005126F06B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772799; cv=none; b=O58JQWmAYvZUMR1StP9s367N7ksA+L7XGxIXmNuLD1gY/esFjwRkdXHHVmm9Zp/1oEt+qnxF/NXQsl/LWvu1ebVEpJUeYmPTpuY4WB8EcN62r6g1yAh1FAuwXQeRiA+XmzLK2fbYFPlYrSlsIRBqHHNq/NkE+BO4eAmEmMIQpfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772799; c=relaxed/simple;
	bh=qFIGByMEUAEOSSBSnLYh1bAg5aSZ7BTIORyI7l77KDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKp1KnRgkm9WJmPm77FaEb3ZwXpnnGqJ3XZMgfhK7/gPln6loViQKMC3gh1tmRpDHiDzaf2O8Lw4YCzbt/yOcI9iwB/ANjqpSPqj99Sh45IFpbgEEjrScYYqsMQhIreyo9bh2eyt1DcS+lT0WDiOuBKooYbFv6tZr05orD3lHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VArFSy3Z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VArFSy3Z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so323157f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772795; x=1751377595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=VArFSy3ZGa2rHx2ImUNrcH3AqgMipuLZsDGeK5wJpMsNk975l9Kp+8uf6jgSQX+sNp
         omEvfl5+RCgQ84RaEsK+X3xXqMP840LqonBppX60cOmV5mUr7Hmvj4oau03Xn3uS3LF2
         wwtGpAlPYSq0RymSYbFRkbg3b7n/B6HFLE2kskKz7UM3ps7PveTzIWdvUShzapM/qWbd
         TuK8sjPCepo4ey2zCETfm8/XTzQFAKbVvfUzBeVCshzpgy49eOBYMQE+p+togmg0XKjV
         /GVD17dQ3vmODDwDl78gaKTkIKKSzS6yzRe3OXgkGga7KmdIsq8KsAvO/Is0QRVyeleB
         tnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772795; x=1751377595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=Pn1WKnxzjQIJYke6X/kwLphb60rWQGgu/FeaIC2CdejdpH8J4by31/xRFPLg+NxiX3
         lvx+BJS+QjKsIgiRpgj1kNTaMwUX7KNN2wLreAWoOUiI1+kxb5/HCFlPR77YDjIx+fC/
         rgeXu4lShJOaXvQJ4UEhsMR2+2umkfMDw2pbaAeCnlEMjlXu60G6Mk7T4gEahLBknGWS
         1mKXfLs6/SXYAcue+n5II5Ejov6G5U+NujlrXeaTsse2YAQ0mvENvT0e/+WHZUq0U92m
         9YLdXM43tEQR15ILttbk54asEjRYl8Psmp/Yu+X6jOPQBHc6bBprVxh50n6uUIHsfVwJ
         xEzA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFSrkHA3Lm5qoSCj2EWgH1H+X8S5EYHqrvfxZbQ3P63hMWKEZayzzk/U5Rh6W5OJceHe1Au0RIB6qhog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4yFiX05QMkGGpg1Xz3yaWaZLawt4ecWpnyzMpb9VEzOj6ZUu
	g3zxbCBSj3dIndyWt5O75LwPQlHaXa5YJV6WhZJW4Qz3vV+1kXK5kMvE75gFVNEFUgY=
X-Gm-Gg: ASbGncsrPEwd2Kh1IBCY9A+m132QRqpJT6efVynNybjnkjpfhjFCwnuU1HfBmurGK9f
	RDvLP547hrjrMdG2VSHAlNi1m0bdGgn3tv8B5d4LL5soajZhLcjLrDE6G5MTHYCFv6CobihT6pN
	6wX/0OOfNSmPLftQWZCtNcan9QUoP3tYVbeREV7AAIJ0k3kl3nI7WbdECKsoNHbVrr+QdvRwa5s
	/09q6qYYSNzYU+FLcsjQANO3Oly44rzKHwwc6WVWvkWDuYRy72IZ+fMULJZWCb7iHjT7rXOA89z
	/TJt2vRIW9QTWmcvl4LM48e/WEqpRWP7jscoyxqGZbOpiPycmg==
X-Google-Smtp-Source: AGHT+IEt7t69RQwxRY3eEXaaUWMwhnlyw5hwc/9b4j97KSvQHGz9sdCKF+wVdRShxiN6h2dbaEha3A==
X-Received: by 2002:a05:6000:491d:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6d12d92e1mr13250210f8f.36.1750772795336;
        Tue, 24 Jun 2025 06:46:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f279dsm2047840f8f.64.2025.06.24.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:34 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] RISC-V: KVM: Allow bfloat16 extension for Guest/VM
Message-ID: <20250624-08753b120b1b5b7b88416057@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>

On Tue, Jun 17, 2025 at 09:10:35PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zfbmin/Zvfbfmin/Zvfbfwma extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 3 +++
>  arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 56959d277e86..79a5ac86597c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -186,6 +186,9 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
>  	KVM_RISCV_ISA_EXT_ZICBOP,
> +	KVM_RISCV_ISA_EXT_ZFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index d444ec9e9e8e..2ba3f2c942ee 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -65,6 +65,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZCF),
>  	KVM_ISA_EXT_ARR(ZCMOP),
>  	KVM_ISA_EXT_ARR(ZFA),
> +	KVM_ISA_EXT_ARR(ZFBFMIN),
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> @@ -89,6 +90,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZTSO),
>  	KVM_ISA_EXT_ARR(ZVBB),
>  	KVM_ISA_EXT_ARR(ZVBC),
> +	KVM_ISA_EXT_ARR(ZVFBFMIN),
> +	KVM_ISA_EXT_ARR(ZVFBFWMA),
>  	KVM_ISA_EXT_ARR(ZVFH),
>  	KVM_ISA_EXT_ARR(ZVFHMIN),
>  	KVM_ISA_EXT_ARR(ZVKB),
> @@ -170,6 +173,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZCF:
>  	case KVM_RISCV_ISA_EXT_ZCMOP:
>  	case KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_RISCV_ISA_EXT_ZFBFMIN:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZICBOP:
> @@ -192,6 +196,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_RISCV_ISA_EXT_ZVFBFWMA:
>  	case KVM_RISCV_ISA_EXT_ZVFH:
>  	case KVM_RISCV_ISA_EXT_ZVFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZVKB:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
