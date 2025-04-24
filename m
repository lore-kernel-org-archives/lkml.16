Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F21E0083
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484352; cv=none; b=N0HIp2nanNI5lfJZcc0oKgxmil/8M+MRccD6yEtlTt2oAnb2EeC1LhVTBl1El9G00z7J4qQ3i/+OSxLWmGllYJWvtUclAnQbcrGGKIE4e/JdFEFIBpb3dvARg9LcPmQiD2HebCX13wP7mztHmMhNWYL6tqibDFVZGQjXAJ2Y9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484352; c=relaxed/simple;
	bh=3ztsM8qbbkFemqNafDPhupNpXzWGGUyIKfomTM+y6cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDejuCKdadocu/SUGtjnQ37SjkSmRLwZe1QhuGNXY3zK/G5zucUy9282r3p55A64YkwZp9eyzJiOVD15Qvusicz00X24UeQIll50ScFmSMfK+qxiLIpZL3Sl2cCU/Bd9O+vDuB1JgOZJgR8h/sSWNPajWMBGfOE79tywXtl6egE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=n6DmAHWV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="n6DmAHWV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfba946so498785f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745484348; x=1746089148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cpfniZwlegMvSvblIXZcmgKGzHhGwzkwQ2fo2qopaps=;
        b=n6DmAHWVU+sarZLPyZDn18L6HTCYbqsYsMDdWUM1X+Vu4gS5c4ejyQPhCuzK5q8lR+
         ULQj7ErlXDNvarWN/32PUGn/a/XCggcEbvSDz15Iz7q4AxQ1RZik8ITK5GwF+HPGn9w5
         o+3nWADk73IKPNW6+i102UeFzw41PCbGVIi0GUViLq3R8avPiB7A9aKPc77awINNGawz
         fjtmmALJ4TpYH7HqffN2ohKnEgpPG11iLBWUZ1Uj3tgbVZHKxYJ2Qv4KgoRidvqpPPEH
         YkppobmsKy75l3tddp4WRK0Ugb1X/XwUUkX5wlPI2C9tEa4v2VKrl75yJzkv7Giq9Dlo
         3DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484348; x=1746089148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpfniZwlegMvSvblIXZcmgKGzHhGwzkwQ2fo2qopaps=;
        b=SFdf/oY2OvZu6wIn/tK50pOqSjLGG4KcqcylGqJA18u1+TZt0m1WbNxwaR1Sy6v8It
         vz5mTzhMBju/jYnZ0Kf0yFpuCTjcUDyDj7pEzQTn79VRgbNGVLI45KkEC/bj2YSq/Xzu
         r3mBxCBykSqaAM8eJbJdF/zoEz9WMxWT3/YH6h4qFEajgV4nV6KRxOoJu0zMbjWc3VAT
         mYvLTdhzY0moyCJOBcBDlt7NKJfBiARlLxWN2eKDXWcVdkNWSG15KXqjJO1BfPrVbLMI
         PmlCmVYlR3w6AbI3m5s5+/wRLMVmWEp21DxCYao7ZQXESgEwjvZCp8IsEyg4zv5SFmoN
         EpAg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQKOhJ9HbZOiBjm6zcOC3vL3Ii/BY3Yhou/SxxIlUH3iYhyfTEy1Uzud387jnUIDt1scG2cPeyNOWPP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwknF91swRvUVCJaNE9Fz7K4B/jQs1OhTh/atjR3kSFnaiQM0Z7
	AVAMZk/cCC0NpxkpKfVor4cjPmpO8xvEcEfQmoNXplFpaXSuM2MqyPfOYACLFNlm+Hsm1qQKgad
	JyCg=
X-Gm-Gg: ASbGncsfvh6YtxNr9TQJm3Ec+7zSPC3/F7NfLEYUXWHpQW1yygthNv8UDWZDih41lRg
	3zRPCufvsnQgfHYS8DhxTGd26Va+yAbCLPzDcQyDvhA05t1qfjaWWlPCUOtpLzQne5YCTi8fZNL
	cXpyUbW6N/aYYqEMG/2yy74YesPS4LpKh1p+xH+tyXQbiTprIiXq7h9qXmeYtyV2RI5EncGvw/f
	WvZiGJL0JqCnBw0DYRemjHAu54oU2Vqcocvs50k+kfQmlUNyRqNZN7rfLH16HI6zhoR63xxAgbe
	1LA9FwrM4yVXkzg0wKqLbejph2wY
X-Google-Smtp-Source: AGHT+IHa85PG4qEjs29oVTV0lIFZzwktXz39JAxGkANuBNfdNGLagzd4Kpk6GR7N5o12prPoNooS8w==
X-Received: by 2002:a5d:47ab:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a06cfab9bdmr1392834f8f.59.1745484347709;
        Thu, 24 Apr 2025 01:45:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a80bbsm1362860f8f.11.2025.04.24.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:45:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:45:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250424-f322adab22126ae97dd7c5b4@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-3-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-3-alexghiti@rivosinc.com>

On Tue, Apr 22, 2025 at 10:25:44AM +0200, Alexandre Ghiti wrote:
> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
>  arch/riscv/kernel/elf_kexec.c        |  1 -
>  arch/riscv/kernel/traps_misaligned.c |  1 -
>  arch/riscv/kvm/vcpu_insn.c           |  1 -
>  4 files changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 2a589a58b291..4063ca35be9b 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  
>  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
>  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
> -#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> -#define RVC_X(X, s, mask) RV_X(X, s, mask)
> +#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))

Assuming n is arbitrary then we should be using BIT_ULL.

Thanks,
drew
