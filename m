Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE9231A21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490946; cv=none; b=oeqvgV/KyjhI5cuMZLxzevEFNuecozR+pFdATK+OpsDAud6MDXX2SLnFbXvvHWCPrExyUtJoKR5m/WgBcPllHfMZdojUtB0hdtWO9eA7hKm04nI7pYXfvfQfOk1GorvpNzima6gClQ/VvsnIl0IZUJ7rBU7eT1G1AElfM4kufVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490946; c=relaxed/simple;
	bh=B0ZiRolrSfi+H6wyYXiznygVH1gb8LyA5qmriNgEOfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBi752BHcQ9RpLFiE/6eePgZBbqWhD7MEGh3OA1kClyP4As3ZvFr72NhoGTcqmQaknN+FTZ/BGZnq6pC27dkrzDHWsb/xM8fDC6zkLHX0zguxGjJIs1OWHqclWQtnrd7EpwQ1EET/HoiGUoxmDHuih9Co6erKFpCKTFMULZqUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZFQbXmZ2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZFQbXmZ2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so772189f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745490943; x=1746095743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=ZFQbXmZ2pgZiTTwC8vIgEVrWdleenTd89g3orkew/QSipa8UVf+VNYI3jl31pjpW28
         8Kxt/6F+GF+cvHEZ5nRUZ4oWcvhHAiDxfSXvv9FeEQ12bVYudrbcCZ9hp8zBIRF3AXYg
         BFHApXv65WomT6OKxDoHcdfW6tia9GmZ56JUWZ+Coek9/DqcQA+3RSn+z9u1WjgQYHkQ
         VmFF8bPKvrncxBmPf5+DkeBbIzihTKqvIEhdwTVDfXC6zg4pYSveQNVSV7F38U3C0gbt
         53ELJ6sMijN1ZrzRHNp8u8Mn4BwCkwxph+YAgrKb1bRAZgOEsZOiwQTsz3dS19lpLsYr
         txDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490943; x=1746095743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=f8x2YHjTpnoL4+9Cy8sd1ubVlGyFumthQ82H7FAZVtfpN2y8qlTgxpCRqFMBaPnMIl
         1OkRIj1DSkqn7nYWU8GygQBVnBkpXAj4P5cSs5PRvLFRPz2zuqemYPRRZr0jrJflPC7Q
         FkZDPQ6Y0jD7umbPwE4WPgVmVjHXPyGkPAvFqKhFP/D1HXDjf5YnCSGgaOx/7yDDbmRf
         b5QeKhuVBxZi2Laiqkz7+aC6SshM+OGb02mJmg4s1npy7raJ9qKiOiumBLF9Lfy/i5HZ
         ucXvqwRhj/voWHfsAZNvhAFnEk3ROrAphaEt9x1BU/Ng9iGFJsATlupKp2kg4UuICzKl
         HQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCPUyD9d9shBUrUSi695mcAVwYLlZAzAET44j4JWcJAvjj6uFiiPk0lkVQD2lb1183RQr3/TSXapLT7xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEiHn/HENDO5QULDhFLyTGVX+L2JmL5jmZ9BRuJJIrMsjIacX
	DjaebdnRosu6Sr+Aa2v0mcl3NMCwBYfr+snOwwPEUClr85BI8/ZF2uEtvdRNvik=
X-Gm-Gg: ASbGncsCa0pH6W7RsHhO+pEhx2CQODmnTmaHKd7yT4MjkBxgPoxukGdI5iyLcmY+hAS
	yPSdjDTLSz5dHUc9iWWSyl8Eb6xX4TyEJGQ2/SuPBeW5D50gPIMiSv2Wn8uHvsN2KrCc0v8TR1U
	CJ1sPqT/qOWZORneUEDxVYmz1I0YQSaArh2fE28WKap0OR0LAMnm0VR/eyysJExC1aDwm2ePv6q
	PEEtOxIKVnqzXeY644mWtEYVO+8jroqwVtj/vRtfeK2bsEre2pw5mgfFrQEy0DR4wXVriFmkU+s
	JHNbVyRBaW4Hce1CZDC1UbLQjyqD
X-Google-Smtp-Source: AGHT+IEMMNUAVFSZJW72EDWo3VFnQwnHK3P23aJgYipjy3Fyv7YBKouXm/RCEBGe7MUaHxg7wn5VXw==
X-Received: by 2002:a05:6000:4022:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-3a06cf5ee5amr1527452f8f.22.1745490942932;
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c30ccsm1653633f8f.49.2025.04.24.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:35:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Message-ID: <20250424-93c64fdbb15c142ee458d857@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>

On Tue, Apr 22, 2025 at 10:25:43AM +0200, Alexandre Ghiti wrote:
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
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
