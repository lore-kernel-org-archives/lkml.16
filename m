Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAF27CCD3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324810; cv=none; b=VnwWv62PrpTdbpAhVDEjR0lnIBALRvKJAw7xOjMy15fiGhVmK9asPMSjAsjel6F7HZFPFEor7vuFnQ7EMV5pdlsiVClSJBpjLGcZoROjmCA51iP1Uw3opqbmaUDEPdPF2kNA8wSDlJBifZD8u+2otsc7msyJCbkz7OSka/JzhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324810; c=relaxed/simple;
	bh=LLXHRatZj2PvaijONGLFKN+FvvEMGNg7tIQKXKpD0pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=myRxPC8Oz2C1LXWCACfESf6/Ftp3mmrWcw8DHCQVBksyDtFymdsPQ5VV/EHv5UlhbCAkfld2MywtmsA6uPUBDXcwOJaJZkLDRyWckvy3BOO6GbKSHDOicWf7aA724GL9ENXlREvsVJPMzeAfcT6JRFZmjZKq/k39txnFjDOq5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LyxxGc5J; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LyxxGc5J"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4467442b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745324807; x=1745929607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9WpxPhhtI0tv8acTJTkX27lGaWBDufWmxeLB5TCpcOY=;
        b=LyxxGc5JLCfw9lR8VTg4OMDHsMGXAAthBSC+Kma+b8TrQTAlsJcqi8GFrWDiKB0vR5
         9V7HiuV3xNxVSZ1ufDmB42ryiIroLzXxdKMeGwOHNKQWAq0N+aUpvPHoF01YmP+pQfR4
         AjwclAAhZEMGv/1us5VxRr5+4TPcdjNS6tQuGfL7TtQ3F0u12mRPbrfqcvTGUttVCrVa
         S2Fea5e54XoTjXQLDKyUBbHyZgLEZezpdTINOw11VnzrdmY97OPIoxrp508WVaXHy1UA
         SPzXfsseyNiEjZ2Df+7Xsosn3p7mOsdsjSBV40E0qiehJbe5dGhUdNk6RWmAiZWR/jVs
         +Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745324807; x=1745929607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WpxPhhtI0tv8acTJTkX27lGaWBDufWmxeLB5TCpcOY=;
        b=gXbHaKkMPajNoacO/XRMcSc0x05bbvVgA7ltTx5oTXXXvK4l38re/9c0gE6BKPi7lP
         UWVtm793P+KoaBJUj43xAtE8+VF4/s+zZhJi1o8hUan0oYuNJjT4PZ9JzgQhdIdloGLZ
         aFvmfwgELdExEdnax+mnDg75NzOyMp8NEqzQoRT6DliQpv1PnNWTNoAx9WG29zIbwxiI
         X4RIMqDnDOuaMnNehIRkRbCmbsp6gPSEL4JUixDGFPoPvSLFaqiTClL0FKyZXB/wsnYl
         bsmR/s1WCLR9ifzeNOUz5xFZJasxJvFC+a2j4K6pniPqS16Du3PMytgxBDuadA4Ko0Y5
         CO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSoh8X053PKGsjGrXOyaDLV/6AjHFVBhFf2IHdxp5pVP0hgro0Lp+jQrnNsgGSWJQ+0gYV2pj+ky5QCZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGDyK/86iuscCc7Tn8viIpVuLoeE33Pe5svooO30G1+DaX63h
	kIb+yRK5gezL6FmZixHtOPi2AtsZEwKf8mNzr0tlz4ZM5WTFo7nEyfuVV9g6UZc=
X-Gm-Gg: ASbGncsr/xMedjKIUOxlam1feN+HC3k3MRNApityADjF9k1By96oOdX4NnnKodIrXh2
	yepSeSjbxRPPsV+wd1VDMGFbarkWS1glrDYOepf3tPpLaC5ql5MxrvcDQMGmA2kJZQ1W9SzT3Gw
	P8GiC7EGkr7Byvb1CqwpqNarWkbuIrMMcR/NAZ8miGGwUD/PMn9C2a6K/KAdoSCqmJx1vK7RQB6
	3xdCfmkUAcdZLNbkwThZWq7h16M8hwQQAAGlUXcmd/uYmjO3rVnm/OwkSVqDP4yI7V6M2GwW8kj
	xesk3QPpGGfe1bkTAi5Wn1l6Ef1qK60mKymbK+skuBStlv4XNXVUwI+uxH7SnwSqbVaijDsuThK
	hZsh/IUvDHQ==
X-Google-Smtp-Source: AGHT+IE0G/bhySn5dFs4NG10U9hH5GrpSnoHbsOXXW2kvsx0u/k+6aJGLwWHt3Ba28Q1C2PZqy1syQ==
X-Received: by 2002:a05:6a20:12cd:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-203cbc05557mr22264643637.4.1745324807191;
        Tue, 22 Apr 2025 05:26:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beb00sm8735522b3a.14.2025.04.22.05.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 05:26:46 -0700 (PDT)
Message-ID: <4b950430-6f12-4b4d-a516-e09a38b83ff0@rivosinc.com>
Date: Tue, 22 Apr 2025 14:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zabha extension
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421141413.394444-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250421141413.394444-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/04/2025 16:14, Alexandre Ghiti wrote:
> Export Zabha through the hwprobe syscall.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index f60bf5991755..a4998ad2dfe0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -271,6 +271,10 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
>         ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
> +       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
> +       riscv-zabha.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 3c2fce939673..fca15f2bf6f3 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -81,6 +81,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
>  #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
>  #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
> +#define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 249aec8594a9..ed3123396a96 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		 * presence in the hart_isa bitmap, are made.
>  		 */
>  		EXT_KEY(ZAAMO);
> +		EXT_KEY(ZABHA);
>  		EXT_KEY(ZACAS);
>  		EXT_KEY(ZALRSC);
>  		EXT_KEY(ZAWRS);

Hi Alex,

Looks good to me,

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément

