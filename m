Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102125C70D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929675; cv=none; b=eJLA4EkhcdN2AzCu0p6pzLZXrwWv+L5P4tni/8zd+NJbtNTFInW0r16xD+sshx/mMYznXDHPtBtFHHoDcDTAJEKXp7JiolC1STT0kn4b4XQwaekrIJn32sqvzkmQhBoPcUROIMuMP6CvksD2+9ibI0TtlJT97Kftqep/Ol1gCOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929675; c=relaxed/simple;
	bh=MC1tqkx0dq6JIK9w+hRVAVYH7jcS4hbI5NItNUnwQKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvcMz18L0ptFEG7ba7Rx1bJUbSgE/QbKkqgO68XBqKhHUWW6FlS01ZAUqtEyUrHW1kkbG7jEWewrylRbdK+a8TTxLWbZ4DYp97lqqRmbcGkO9u1PNR4YsTbveSqLMZnKRdCBY+7T5QE0dYPwWbH5fi/4Yg4PsPZBryU+jhrah/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OAwwd5bz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OAwwd5bz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453647147c6so7921565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750929672; x=1751534472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=OAwwd5bz6PxrI0EmaU816U3tsZkj5ubuvtYa6+oJ13PBGM9gjvHtZcHueuOqGIeoEx
         zw3MVbtTof0bOVrBEr63/FAZNHN5bpQs4vaafxZs7b3XIwqULym74hk7B4L0TL/7Zz9F
         JutzlplNEPmG7Jhs42RRrjVjJI8RhQXkOmhc/OL2Doo/FxvK2cgX5wc06Un1BtECTgzg
         5YNKnntsBgJHYRq7sAcdKm8+eOabJsi4Yv2c2HmS6LryGF9h1Yvxfrd7ZB1Ba+TJH82u
         0tmYuV3NcTGV3UlBr5f4AxDLLXlxnOFGqhk1xPNyB6RN6PY+KZGmNv76i6vpixCoY+Gi
         q/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929672; x=1751534472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=qdvKd9VxKaqPPsGdusxAPMEXoBAi98VYXmdgV090XxIHGNJbR9CD6xXeyUSv5GHGSh
         HctRxXXK6JFXdkd53MaJjnEANvV1XUk0T8pKlbck0OlJORCBqwCIAdNdWKGrGEULsqyY
         L4TSMEZ6Rh1TLjBnjfXybcHAb8Vob9fxGcYlZyHvGU/adWX6qkhjK/EbmrDeyloFbuR7
         yNuiUUmqKSb0l8bjQjXt89D8Jpv0niQE1WRhqpTYUsfz5wX+Fb8CElAUDHn03jIOhKkv
         ckp4XQ1LsEIeNzj8mimbMtzmdTSfLQy/z71N/noN6HZo7Njvo7sE746pWaKprHqXUCJo
         KJPw==
X-Forwarded-Encrypted: i=1; AJvYcCViBqxnkB3TmuwzVBu/9uO8PuM4yR0rBPjdeK3tt8odc6Ljl+WBQDVby0JPoVj4BqfhA+xCQvM/cTxIEX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBHPdnsoLCgv1ZM/CgW082AZO4Oiofd/Hd7dkBECTkbLc0qgh
	Rw9gstijUzIqA2knDVi0GxEI3OvuwdbRnG15V4Wch2T9R5BwxKeMPxE50SE9YYI9OTw=
X-Gm-Gg: ASbGncuhb/dPLRyt1Kt2qFTdJmGjHK6aCX3ifTT34pB9vqKCDIHTzrKRrIw/npKCPWs
	OulDMqgPwDhnL74EMSvY4bRrF7l5q4GiugRx+miZ5wZBBxDE8VpwkTn/cMjzoiyIiIZ1viBPy61
	/ctlZ3gesjPPmMT6BwRJyxAdCfOyMpAPHcZYygK+M4RO/nqZZNBhE2wPyUc3t5WvrUuMY0teL/F
	flGg9RKkzBcK+HEQyO7fvjG+w1QylmJfJF0SipNzbGUtdupy+el4aYV23ci5ux34HHO8b+c5gDp
	s52F2D731aNpcdagoYZQDCEf/pt5oNSgQOoBn4lN7ozqQLNZmw==
X-Google-Smtp-Source: AGHT+IHeq7BmdkNC1QZmLNEvB/p5lyP1vBsXS+C4YxORLxnk7NCsQMhF/36QZ4+0Ss1Q61RwIEK+Ag==
X-Received: by 2002:a05:600c:a44:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-45381b2155cmr60602115e9.29.1750929672028;
        Thu, 26 Jun 2025 02:21:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe587sm13667895e9.19.2025.06.26.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:21:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 11:21:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-a1aca9887bbf5410741e17c4@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>

On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> 
> Use the hwprobe syscall to decide which PAUSE instruction to execute in
> userspace code.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -4,26 +4,33 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <asm/hwprobe.h>
> +#include <sys/hwprobe.h>
> +#include <asm/vendor/mips.h>
>  #include <asm-generic/barrier.h>
>  
>  static inline void cpu_relax(void)
>  {
> +	struct riscv_hwprobe pair;
> +	bool has_mipspause;
>  #ifdef __riscv_muldiv
>  	int dummy;
>  	/* In lieu of a halt instruction, induce a long-latency stall. */
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>  #endif
>  
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> -	/*
> -	 * Reduce instruction retirement.
> -	 * This assumes the PC changes.
> -	 */
> -	__asm__ __volatile__ ("pause");
> -#else
> -	/* Encoding of the pause instruction */
> -	__asm__ __volatile__ (".4byte 0x100000F");
> -#endif
> +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> +
> +	if (has_mipspause) {
> +		/* Encoding of the mips pause instruction */
> +		__asm__ __volatile__(".4byte 0x00501013");
> +	} else {
> +		/* Encoding of the pause instruction */
> +		__asm__ __volatile__(".4byte 0x100000F");
> +	}
> +

cpu_relax() is used in places where we cannot afford the overhead nor call
arbitrary functions which may take locks, etc. We've even had trouble
using a static key here in the past since this is inlined and it bloated
the size too much. You'll need to use ALTERNATIVE().

Thanks,
drew


>  	barrier();
>  }
>  
> 
> -- 
> 2.34.1
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
