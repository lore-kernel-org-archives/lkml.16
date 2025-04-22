Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066731EFFAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312707; cv=none; b=c0Ou/n2c8JYBjBjXQLFXg54GLjRqmoo1YjPcWRDYdU338bc3V48+9KzkZ3x8UYrQA9k6GcBqb0Cr0Q+qeEZatCaGfCcEX1r7QUyannmFU3W+X0Fd2e2YzWdouVD7ni/6lwuVOxhxheYOTMvkVStVsrgvvEVNj1jk6ZWWvnMHtFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312707; c=relaxed/simple;
	bh=kvFqZqPFPLrf+AXNRqtRi5kNmumBCHlZasr9Kaopxks=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZaK2GGuMZoPzM9Bl5hWWcPyZSunj7dc4OGN+2qI2VrKQVMoF16Kmr1P7TMeh/thdZ01Ydaeb1RSHVSkOhAcknZnz6j2yTF0OtgkeWdW0Olt3RNlIQN4ofuFHdCCKeUG8GuALiV1P0TZbjgVvRt/OsZiMRy2bqr2M4OxyaZugNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hYqdLi1c; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hYqdLi1c"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso49764335ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745312704; x=1745917504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sbWhyfY9HhbUloK/aOxoz84ZiMRz1BlzsEwnFKYVZM=;
        b=hYqdLi1c8lDxS5uTWt4tnCVXPFoFVIQY1kGsubjceziBpk2Bl89e6Hv0R8FEYfpZkh
         PtHIi6NrSMZGwohUreEjdtAHv9vtfdlGbqDmlVWxyTaM9GtEkVpZiRB9XPieWHuNf0Dq
         7Xd4AWc5QUoUqTRH6rlXk4aucxcDX6att0ySmOhErD38SoNcibpFge2w3fligFP+sG19
         n/QL9oDhrir6klD9V3xLQT5cPc1WTLACVYPBXrrFInz4DShJl89MlfKqonihpeES3QVf
         mcWlfTnFaUyKukLTgnylLwdJYQSxxsq/bUCkmg2vzqDvB3EQLg5W9bS/8mUJLBnY3yi4
         M/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312704; x=1745917504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sbWhyfY9HhbUloK/aOxoz84ZiMRz1BlzsEwnFKYVZM=;
        b=T51CzoinzCykgDzlghw1k+C/gcb4WVdORPWr0MOHFOtO3mlEwP2Nf8UTbu9cbXt4Kb
         TKdvsRxVy4pVMgGVtTfJ3FH+Jt9OtErEIwlH4/WWFV3s6s+bhsXmeEUe56Q1KA3uW9dU
         ER/mfz/UOG7qrh3ToUSyEQ4Dg2BAH4FxHRmpqtzRAOTtLvFKKUGhOBPN7gVBlT7bYfTq
         qgKAH0dUtFr5H8ZR9050PF4kuoD78tPZedwViTIITTDYpeQeQkeagqb5h4NYXWqsHBbi
         TJ6LYqZ8zSIHXvxI/BqcCcPpr0Cnx9Gwxjpzq9yHBRUcD/lq0CHscnW9A+wsadwcjrAM
         LG7A==
X-Forwarded-Encrypted: i=1; AJvYcCXFFmMvz8rOmKuv/hCOtup5lm+PQI4KMUO+Am1UsssGRukXBkypNfENb+Mvse204yaKihMl+nJefezVDuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWYqCrAHGP9pC4SBFzDLLElnsqAeskE5BLullmcZJR5x6ibpH
	TXa3rPYwjI7TWH5AJxjY6JPan0VfcRIhyqhvSY6C88hE5jwIHL4s/mW6RM8Nw3s=
X-Gm-Gg: ASbGncsdjDn6cVdZEAv1nTbZkPy6/YcdTliSNto85Y5/JwmcNd03yLZBOXPlgSylvNV
	1BEcW+NlfWG28nlmsspyrMRVwD+cKwE1iBWL+LyJ7yITXCYSvMMS/2I6bhJt/sNNvHKpc559HBT
	KDssL8lPV2kZZyFCq9Rq7U+7+GGRqVbCOJtIfmD1fOoYtBxKampTGLU2vutZCSge/xyF6t5CTJt
	aHFPMl9rq6xPwToYDgdFG9N4ESweTCo9nuuQogbTbBypixKfctMzXxBG7mDVHHwuY5GIo7ihJms
	uk/5lnU/QF8ZfAnVgpZafjhKdrWtSWZMSxeNy6pzZrIH6O0E4E1aBHEcEJug4fskHPxynbq6vt5
	b6+B1B2TzXQ==
X-Google-Smtp-Source: AGHT+IFQAi0wfUdXECfqD6I8bX3VpVnKTNf9yhWhTBL6GpAb8S8NxnHQlFHw5TO7+BUIVct0khX/5A==
X-Received: by 2002:a17:902:db03:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c5360dc1emr185868245ad.37.1745312704167;
        Tue, 22 Apr 2025 02:05:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaad1sm79600495ad.28.2025.04.22.02.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:05:03 -0700 (PDT)
Message-ID: <db59c652-c4ea-4ed9-abf3-75886924057a@rivosinc.com>
Date: Tue, 22 Apr 2025 11:04:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/04/2025 10:25, Alexandre Ghiti wrote:
> Simply fix a typo.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  arch/riscv/kernel/vector.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..2a589a58b291 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
>  				   RVFDQ_FL_FS_WIDTH_MASK); })
>  
> -#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
> +#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
>  
>  /*
>   * Get the immediate from a J-type instruction.
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 184f780c932d..901e67adf576 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
>  		return true;
>  	case RVV_OPCODE_VL:
>  	case RVV_OPCODE_VS:
> -		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
>  		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>  		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>  			return true;

Hi Alex,

Looks good to me,

Reviewed-By: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément
