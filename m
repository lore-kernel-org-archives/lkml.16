Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292DC19D8B7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982615; cv=none; b=XpOizTgCVGNcMPZJiSLfrEym35d03D4ol1wbF7C4u7ljUhHJYWerMuwoFFsEf+7571NofTyW/eMP7eMnXsWL73L3cWpDgbji5BqewLGjKnTZxA8Lm8MQt/8zl0UETr6ayGPJXrBinY2KfGiH1jC6bR+tOjfpNV06/w/alI02z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982615; c=relaxed/simple;
	bh=K3LHh5smnTrZnCr6oGKjBk9SCGo95PI4g5B2KlxG7jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZNVxOGOKYkdm39nLJlQkJt3NatnFlQmyKh43ekmR7ODyYY7XhLcG6aIryLIDL40deRqEad5qXibO8McyZig16K7XVVnb/3acYZGuLiHDJa+jwAhxzis2F5QpNcnqnk+2OVnPUF2/9pL/P3F1uC6PRn9LnDuBmU0QhWsjj5BUuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jB1Cz9ji; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jB1Cz9ji"
Message-ID: <c491ab26-dc44-4bc9-b481-29b4ba62f658@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747982610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJJ+pU32sx4Yy5ZF3W5MNBuswj8wCkrqLbPd3tq++B0=;
	b=jB1Cz9jiqVkv9BvLbBNgmCOtxZSMQbwz1d6pHZXR4QNG13vaLZqWjpkRAbfxLBxUtm8wUd
	+TyLBdLJR2sYg8L2DegSjzC+QdJHHeGjPwlziVju7AIvFtI1WeE0TYFjLKRqFjCdI7K0+b
	0adK55YH+Y+7lijAyVxRS5dlFPZ45Z8=
Date: Fri, 23 May 2025 14:43:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, WANG Rui <wangrui@loongson.cn>
References: <20250522125050.2215157-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250522125050.2215157-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/22/25 8:50 PM, Huacai Chen 写道:
> When building kernel with LLVM there are occasionally such errors:
> 
> In file included from ./include/linux/spinlock.h:59:
> In file included from ./include/linux/irqflags.h:17:
> arch/loongarch/include/asm/irqflags.h:38:3: error: must not be $r0 or $r1
>     38 |                 "csrxchg %[val], %[mask], %[reg]\n\t"
>        |                 ^
> <inline asm>:1:16: note: instantiated into assembly here
>      1 |         csrxchg $a1, $ra, 0
>        |                       ^
> 
> The "mask" of the csrxchg instruction should not be $r0 or $r1, but the
> compiler cannot avoid generating such code currently. So force to use t0
> in the inline asm, in order to avoid using $r0/$r1.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: WANG Rui <wangrui@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   arch/loongarch/include/asm/irqflags.h | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/irqflags.h b/arch/loongarch/include/asm/irqflags.h
> index 319a8c616f1f..003172b8406b 100644
> --- a/arch/loongarch/include/asm/irqflags.h
> +++ b/arch/loongarch/include/asm/irqflags.h
> @@ -14,40 +14,48 @@
>   static inline void arch_local_irq_enable(void)
>   {
>   	u32 flags = CSR_CRMD_IE;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   
>   static inline void arch_local_irq_disable(void)
>   {
>   	u32 flags = 0;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   
>   static inline unsigned long arch_local_irq_save(void)
>   {
>   	u32 flags = 0;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   	return flags;
>   }
>   
>   static inline void arch_local_irq_restore(unsigned long flags)
>   {
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   

