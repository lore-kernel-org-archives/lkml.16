Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735F8145355
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813273; cv=none; b=a7GQUU31at+1PGG57vJ95M2XLo8nMCYsSb/Su70eLjtQW6LEIB6rRTy+6tnOfggYevGEvlsQGJlBLBtQmTq0uk+SZKvi/CL/zSbB77zRNt4hsgdvD9KyCDDXlAk9BGk7O4H9R2gZA2BYQqmxTDdWIDHZyaRagMN8wmVbo/udN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813273; c=relaxed/simple;
	bh=eFyFyO+XYfj88o6DdnN3CjU/LPr5Dvhoivob0SdoP7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToYGlevFRL8pJ+EimSigl989bkhU+EBeL3np9+xT+SXXh5nqPK8TrCo3vA7dcpNX8rStm6CCskJ397aXpKV4yn4ytIpbJ2ZUDcztqd4/OVQA8o8TUFPUGgr/QKCCHyme/Bui2h6m4dvqEBHyuZYg5vqlb+6S1QnJZ6P0bYEiH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrHSGMYk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrHSGMYk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso8661572a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744813269; x=1745418069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXnvk8XQNhx0TXzhv37WADjp3Ermfxa39z+e6RYkwbc=;
        b=GrHSGMYk5N+v9YrJ7UsV/tpQRjzTyaLNdW2roDBUreaRSd44rM0moLl/2QLpTLPVkK
         esfIgXVs0M37OQJbjI7AIGyP0ktGIEdWtDEQTMO0kqFq9VPIk3GpAinDxFmPcJTk7Pna
         GRAQpnlcvfWvS3AcK2fJOD28SooX5fU/xTvH3Kq4SwOqts04Pj3r0nhaTQEV7EhfU2OL
         dprik0/AMwo2nBqa8A4XsxPC90ZMNT9cEiPVWq1gPacisTib+XZYV7Qb+VMePlFXKMHD
         WnjgghDc6aR2rJMWbmqnMduKV8FonnYqJ5YotAkI3n9L0UbvNbzyvLsQZTxEsOUUzzjk
         zL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813269; x=1745418069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXnvk8XQNhx0TXzhv37WADjp3Ermfxa39z+e6RYkwbc=;
        b=AgxkT6ax0M2QLAcpb6RkSCKJeX8rGK4p3PhL1yuXRLnwihdCqOfyw9yWs07wfOmevj
         5XLMrOjfU3G9h8U3NFVbrP+XZGaHvK0gc7FQMa+VTXD7bgqYMvzihWtxsTS3iOG3JcZg
         cKs+xT1CKwV1eUcVhpWLPcDE/xuja565Toucv6P6PxbIiAQ2ecJWXssfNxAuwol7xADt
         g+PQ6DilCwz4LpeH88OIYA4WynLF+xCYqNhfFCRoOzsvuOzw2aPI08IrN9mId0Nr7cxL
         +jFKhA7ctmVgV6999aLhSqAU8pza38pQVKI7/qiF7L8q4dqKrWoHY+N16QorKSKZ4f+T
         owhw==
X-Forwarded-Encrypted: i=1; AJvYcCWMBOgbs0/u6Dzw8toUFw39ITyx9njzKqRrvefBq0dmXalNiE2bdje1CPkh/BPuW3DrdtI8CKfyM92DJJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9t6lGVe2H24k2faUl1aEs6UrOn3koDK26he3b6cFJECSNSwyC
	Sp4tTelpcOsqLZMsVvbI6L88OhNx6D/ZSTTtCmV2hKtdyHcyFSEU
X-Gm-Gg: ASbGncvJLmxlWaj4Ap72F86BDg+gJ7vrFj4ytB2gQnjQqhYXVr/wuF+ds42XjWsPo0A
	gFdri3P+1K4vblzHwx8DBm7puMn2+ETOvhRn9ruXo7OST9ZFPOaVnTrSvX8W+9Ep87752rgNImt
	b4d5+5Mci1upG5x9OJbyh6XNI5C5OCHid/ctHdclkjhZsyjO4CajRUiGpZ4rhwHDCboWP6eiu2o
	mUuBU99/AoCR4hCYypkjRSid3xuRPjd7kEPxRz/uvAzWciSyyyMi6yyTGaqeoVvHauyVfhZ5epU
	d1Tkz9pLqTQZ09cu3Qy4LRr74AMKpoijScTyFPgE3XAApHWwPBQL
X-Google-Smtp-Source: AGHT+IEys/Oramf0RFC3AI2fDdY2kIk48KqU/dF51mFhcVKpFTd5zTnQnZYHaGnoEijXiX2xL0d5+g==
X-Received: by 2002:a05:6402:4017:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5f4b746d191mr1948775a12.18.1744813269430;
        Wed, 16 Apr 2025 07:21:09 -0700 (PDT)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef56ea4sm8877286a12.25.2025.04.16.07.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:21:09 -0700 (PDT)
Message-ID: <cb6d98dc-49e9-2d3b-1acc-f208e4fd13fc@gmail.com>
Date: Wed, 16 Apr 2025 16:21:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/7] x86: objtool: add support for R_X86_64_REX_GOTPCRELX
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, x86@kernel.org,
 Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov
 <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250416085446.480069-1-glider@google.com>
 <20250416085446.480069-7-glider@google.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250416085446.480069-7-glider@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16. 04. 25 10:54, Alexander Potapenko wrote:
> When compiling modules with -fsanitize-coverage=trace-pc-guard, Clang
> will emit R_X86_64_REX_GOTPCRELX relocations for the
> __start___sancov_guards and __stop___sancov_guards symbols. Although
> these relocations can be resolved within the same binary, they are left
> over by the linker because of the --emit-relocs flag.
> 
> This patch makes it possible to resolve the R_X86_64_REX_GOTPCRELX
> relocations at runtime, as doing so does not require a .got section.
> In addition, add a missing overflow check to R_X86_64_PC32/R_X86_64_PLT32.
> 
> Cc: x86@kernel.org
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>   arch/x86/include/asm/elf.h      | 1 +
>   arch/x86/kernel/module.c        | 8 ++++++++
>   arch/x86/um/asm/elf.h           | 1 +
>   tools/objtool/arch/x86/decode.c | 1 +
>   4 files changed, 11 insertions(+)
> 
> diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> index 1fb83d47711f9..15d0438467e94 100644
> --- a/arch/x86/include/asm/elf.h
> +++ b/arch/x86/include/asm/elf.h
> @@ -63,6 +63,7 @@ typedef struct user_i387_struct elf_fpregset_t;
>   #define R_X86_64_8		14	/* Direct 8 bit sign extended  */
>   #define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
>   #define R_X86_64_PC64		24	/* Place relative 64-bit signed */
> +#define R_X86_64_REX_GOTPCRELX	42	/* R_X86_64_GOTPCREL with optimizations */
>   
>   /*
>    * These are used to set parameters in the core dumps.
> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> index 8984abd91c001..6c8b524bfbe3b 100644
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -133,6 +133,14 @@ static int __write_relocate_add(Elf64_Shdr *sechdrs,
>   		case R_X86_64_PC32:
>   		case R_X86_64_PLT32:
>   			val -= (u64)loc;
> +			if ((s64)val != *(s32 *)&val)
> +				goto overflow;
> +			size = 4;
> +			break;
> +		case R_X86_64_REX_GOTPCRELX:
> +			val -= (u64)loc;
> +			if ((s64)val != *(s32 *)&val)
> +				goto overflow;
>   			size = 4;
>   			break;

These two cases are the same. You probably want:

		case R_X86_64_PC32:
		case R_X86_64_PLT32:
		case R_X86_64_REX_GOTPCRELX:
			val -= (u64)loc;
			if ((s64)val != *(s32 *)&val)
				goto overflow;
			size = 4;
			break;

Uros.
