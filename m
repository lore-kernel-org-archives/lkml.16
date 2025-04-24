Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415D1C5D55
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492796; cv=none; b=RJB0974MF+RmujLEQK2NPlcemerB4Oy9O08sTOWa8VB3ZEwu880sk2rDD4vi3p8Vpc0sL3yaoCMwu3o3pCDsNNPNuHXEmIeHVV29P31zJnRkg56enHv0phzmmckz3qwSuzVFlpsKv+tCddogPSMhrWq9aeGWRUCwuvqJaZg3d4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492796; c=relaxed/simple;
	bh=6ZbEQkK5v1recDZlp8qUumVPv5BX8yXmX7kuXiecGNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN1ciOQQxb6rDOcGvyshxZ/A4V399646cBAIkc0s0XPUJW3PoJd0Q4O6OAog9fovuVgM77Zu3TnaoSF8jE4CyBwos6ibk/f1O9KCWXQJrsj+PbMwK6jW2J42n1rI+yikyqi5Dqa222XTrHXIYBuf9x7HedKb9uBhDGMpZ7Pc6RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Gy0EJs10; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Gy0EJs10"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so3806135e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745492792; x=1746097592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaFlU49KHj/WqsyzkJFZpLzZkQa35ucQoiXjJp4Ub20=;
        b=Gy0EJs10rMvro03mVTAfkh2uOmSqhv5l6CqSh2herdP8uC3jkqB/pZ6fxqq/fOgXJH
         JhPkfyD2FELWaG9ZoWwKJA2sd/AHWYNuVAQ+4p3ohqdhFu3ODFLIC7rmC4KfngpeCKGh
         dNXtvoA67a+Q80x43HpEKcE13PsxgXybGrHtNFg5gUfaaDC+d9+kdwb+L0A4uAjHD7vO
         RRlW8co/etNkSCy7aDbO7+fXHYLJeglYLHM+Ew0EsRpRIKMJA6n2oBVs2IePUUdpLqP4
         2nUfKo8OmxUUZj7UqiBqjQEK02XBFWuBkWPU/GmuOc0bkZByY2LWSp0fXiYsdcwUOOqH
         lS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492792; x=1746097592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaFlU49KHj/WqsyzkJFZpLzZkQa35ucQoiXjJp4Ub20=;
        b=lzUuMQdrGJGJCmHqIzlUpuFnRZgDOOrUf3G80wbMGYqIWxPjEUjWtkBLiNHm3McVMZ
         bj1kKpSDvdyqLd94LMgqzH7lBHS6fbwswsPzreGtwK/vz3DuLgT6n/CqKbf9n8RZtdPS
         RfcgujBE5Z5mPIiNv7wywXoANqIvW6sZJDU9CMbq+UbY5lQ2q5ezQd7d13SZ7Qyqm6sz
         /lxDVNw7j8ZGTnDh16Jmti76xJAcaRG/CtKMPG1ZRLJkyGILXnevg++m30Dmfpy7cge8
         cQs9qxqpvJ83YShJN8LBiz74bgexs+Dz7Fh/4FwauHIfVQD3GioWo9FylQgn1UfXC5hi
         cRsg==
X-Forwarded-Encrypted: i=1; AJvYcCWU3ZtGa1gAYePLyMUFOgscS1ESXPe1QGUTd/Rk4xaW+AmG2ZOflb4jbnexGpaPLzSOKhakf3oy7OtUk2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwsx/UCDwv7JFrxyB7RBwroXRLJ/JgdGjpR/GP2T5w/pUPCEpg
	4l8XlmvHvEua9T74R4tE9bMQwFxSo9hWceTEyoQUVXsW7nd1gQ8QP0tQ3yi3BZI=
X-Gm-Gg: ASbGncsZzTqAk7ciqCNkUI14pGUEQIxLobzANxzgA0RTR2QyrVZ1rRu0HYxtD8gtKCB
	ENNlIG3Ztnj7Ewx8CTv6m0QBAwXnE1fG882IVT1y3M5yrDa3FF/ypVseqyFw/A7gsru4Lb2hAwg
	sWIQH800z3iwZGaSSGKuHbyHcWREoL3E6jAb6j/fPSRzFHjCxX0h0SVRXDpms6oUT8pNCQ1fsaW
	7KqZZk2Dkhd/FRMuiyEEdm6Uoa7rgleNFMJmQQzttDqV1jC4cXwT6Y804t0Xf3bhpqnFxvZqkaJ
	gOJlI9u2GI0gQJNXKBba+UQifVWQ
X-Google-Smtp-Source: AGHT+IGdWaGhxvTRb6GutdDIuLG/aiIZCV4CCAGWlaD0KDkW+nhzZtqNPgORxU7ENnJYG2P45T9aiQ==
X-Received: by 2002:a05:600c:1c93:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-4409bd32458mr16398415e9.19.1745492791956;
        Thu, 24 Apr 2025 04:06:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a13bdsm16546245e9.9.2025.04.24.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:06:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:06:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250424-c0700f89bcd29438d6d8d65c@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417122337.547969-5-cleger@rivosinc.com>

On Thu, Apr 17, 2025 at 02:19:51PM +0200, Clément Léger wrote:
> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
> provided as a separate commit that can be left out if needed.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 379981c2bb21..7b062189b184 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>  	return 0;
>  }
>  
> +static bool sbi_fwft_supported;

At some point we may want an SBI extension bitmap, but this is only the
second SBI extension supported boolean that I'm aware of, so I guess we're
still OK for now.

> +
>  /**
>   * sbi_fwft_set() - Set a feature on the local hart
>   * @feature: The feature ID to be set
> @@ -309,7 +311,15 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>   */
>  int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>  {
> -	return -EOPNOTSUPP;
> +	struct sbiret ret;
> +
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
> +	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
> +			feature, value, flags, 0, 0, 0);
> +
> +	return sbi_err_map_linux_errno(ret.error);
>  }
>  
>  struct fwft_set_req {
> @@ -348,6 +358,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
>  		.error = ATOMIC_INIT(0),
>  	};
>  
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
>  	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>  		return -EINVAL;
>  
> @@ -679,6 +692,11 @@ void __init sbi_init(void)
>  			pr_info("SBI DBCN extension detected\n");
>  			sbi_debug_console_available = true;
>  		}
> +		if ((sbi_spec_version >= sbi_mk_version(3, 0)) &&
> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {

Unnecessary (), but I see it's consistent with the expressions above.

> +			pr_info("SBI FWFT extension detected\n");
> +			sbi_fwft_supported = true;
> +		}
>  	} else {
>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
> -- 
> 2.49.0
>

Besides the () nit

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
