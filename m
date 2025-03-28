Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12417F7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166317; cv=none; b=qVRqV93UtUM2iLriQS8Q/Zb1SkdLs0rWB66zHa8oC7mTCVHj3osfPCXvLn9c+yuTyIsBO2C/aFDeofmYG3DEfFyRQXffIetnh/pQNHG4EDEnUDI12SHUKuilbr/JXXDCpZ6HwDFEjyhikSXqZ0JsTeSlLTsV0rtZ+nnqJbCYQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166317; c=relaxed/simple;
	bh=H5kjjJYxOmxAyhv1STeoOuROMzK8wJoZuDm+Uy/SQUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iqubn2mXkXSLC47TC/z+F7EtLOhC0Wf5mz3wt9kJu4G6eqPPszKt3oex9Ah3p8ztwcxrcA6sol4OW4lvhpeBePpggV2NAK53ITHJo4BwiBefJYdrUp67w+mvkXilPnSBpKiJJTB70b/bnS/Jtq9CEeavfrnd8VfKN4jiiabQAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XVWR61lc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XVWR61lc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264aefc45dso56664325ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743166314; x=1743771114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe32V1AOUoNid6dXG/LxqLElZalfwawJFPaFc8U87DU=;
        b=XVWR61lcIEzq+6A/NgriTNbU+aQsNtI83+hmQhngLPcA+XM39VuGGzTaoVsHi7NIWA
         b8Z2At0XBFwc6l+zWRUadARbBhqfTCXgVmDAvTikWtm0aR7irrfWzjbCiW/vss5778ao
         OuKEiRrEYjzsXLPpkwCOLXU0jT5Znwe8pieQ1gXhSGuQU8ND2Aeq7SseCLTTR2IS9dDw
         CdGqVd/vJnPPc+X1PHUIbsZKvQMnnzjik0XQec+HdfNcHJsqTojNpZi2B2gz/qq+swMY
         rtCCFP4R/+2OzAIkgWEaXDkQCi2ugjU8cz+LionP+i4RSqcANepx4DI5POi1P2SjCyTp
         K5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166314; x=1743771114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe32V1AOUoNid6dXG/LxqLElZalfwawJFPaFc8U87DU=;
        b=oW/02W36XefH6tiqeYgrdUacru2dyEx/m1aCjmTItX/+2vih8xpU16Bbm+unUBNhst
         QjlRBEl9Ypit+SvdbQ+kslAQSmFDUgLu5EVWRSPSi5Bg92SJnqObRkfqFVc1OFPCUAwj
         Ixz8tameM1X269F3CsWmnBAd1GAr8wUK1V/jOEmLckXcuINA6xUCzFxKB7QDQdRxWAq+
         Tk5LboBok1vu16yS+aBrVtlWn6q9qOC2g3or+txd65O2FZXCAK6SFfmUB9VRtLKbEuTB
         DOn/eoLR7gMmmxYU9No6Zzt8lCz4llkfZTBwuUjYQVkDKcbniFq20a2c2Ljv/fx99HF0
         ItaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkhOpgrr7kL7G1Qve8vV1/tdK7LwmmsCPsAmdYOWkkX84i+QkC7iFs4RZILr6aEyBodpcFhbgNyWw1log=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13YUkoK1SbugQ5wk2URkRhrmtfcJrzb3J2cpA24MDFeGuzi0N
	L2in48J6sqWAS8u+oMeGli/63c5bHCqcTKfA0/AvLSYmKWRX+AmnmUZ96ORFe4U=
X-Gm-Gg: ASbGncvnR5tH/ewmnB7rxDUoO1Pu8LIieNdsVhVyVOd8AklNHsVKx1Oi14f92TBl9IT
	VsuxDdM4NvGS9Ht1iac0mIPHCypXho5jGhWwgW/7AZKd+2JV5TZgLorkhKETyZ2mBehaW9QUilO
	qmZWTStdatkdr+yF8K3nzlQojwR34BpYFgY5ucnxkN4q9UxW8x0bu5AJUXO17Tdz2Md6JJ893D8
	viQ8zo4p/9SQGxK2EJYCQp8/PwnY1XtJRqfVi437PN+AuMvTw8gBz0RjIoxpTzsLHhZWmlE6OHz
	fYpJ74SBsp8+T+bkzgfHlsm8NTL4VA9qeHFaDQA1kpwmQE8x7jdu4SL60zsPzyjqFPWa/obDXff
	GOnPgEDJ4eIm8qw==
X-Google-Smtp-Source: AGHT+IHVvBzZimSyhVPNOYC9F8CUUttEixWwVyBeDUvKgk8rv9Nlh214Sm121OpyaZmCMCs+bFFzFg==
X-Received: by 2002:a05:6a00:4f89:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-73960e4674dmr8779512b3a.13.1743166313575;
        Fri, 28 Mar 2025 05:51:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e222f4sm1620649b3a.41.2025.03.28.05.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 05:51:52 -0700 (PDT)
Message-ID: <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
Date: Fri, 28 Mar 2025 13:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250328115422.253670-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/03/2025 12:54, Alexandre Ghiti wrote:
> Old toolchain like gcc 8.5.0 does not support zba, so we must check that
> the toolchain supports this extension before using it in the kernel.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig                     | 8 ++++++++
>  arch/riscv/include/asm/runtime-const.h | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0d8def968a7e..ae6303f15b28 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -735,6 +735,14 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
>  
> +config TOOLCHAIN_HAS_ZBA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
>  config RISCV_ISA_ZBA

Hi Alex,

Why not add a "depends on TOOLCHAIN_HAS_ZBA" here so you don't have to
check for that config option when using CONFIG_RISCV_ISA_ZBA ? This is
done like that for ZBB and ZBC.

Thanks,

Clément

>  	bool "Zba extension support for bit manipulation instructions"
>  	default y
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index ea2e49c7149c..c07d049fdd5d 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -77,7 +77,8 @@
>  	".long 1b - .\n\t"					\
>  	".popsection"						\
>  
> -#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
> +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)	\
> +	&& defined(CONFIG_RISCV_ISA_ZBKB)


>  #define runtime_const_ptr(sym)						\
>  ({									\
>  	typeof(sym) __ret, __tmp;					\
> @@ -93,7 +94,7 @@
>  		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
>  	__ret;								\
>  })
> -#elif defined(CONFIG_RISCV_ISA_ZBA)
> +#elif defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)
>  #define runtime_const_ptr(sym)						\
>  ({									\
>  	typeof(sym) __ret, __tmp;					\

