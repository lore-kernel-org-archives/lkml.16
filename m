Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6AA1D619D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318202; cv=none; b=YVzbT4E+RE60HizCuySiXw3GjSlR+7wFoCt0qrRD7aUmDI86IbmQIpZaETRFAw81lRHE40fxrHcZZ1NsR+P4f2JxkmuTu+fw9F2Wk5NXDgiBcYxPH1Dpxf19utRIyE3VwEWZQQraI7oDuqFKQEfB4X9tSSvQk4w3YisqSuwpIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318202; c=relaxed/simple;
	bh=vLJmUydte4hHRifvvJRLy2f6DVes26JddpFu0AW0mTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmCJa6y2A4kPXInSd/6f0S4dF/SnxRx8jl1Qw3+wQIpwEQQ3ybWHK4ZS7xfWfSmR0VghQdaMIED0s5dG0ozCQYWbOA2430e5HTLTMF56iQGFVFv61fNvEwvJF/bPMWGrB6qQUqGXRi2lEq9KbY1/g6x8kYbODHZSK2Iu6prd0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55C421FCEC;
	Tue, 22 Apr 2025 10:36:29 +0000 (UTC)
Message-ID: <a1150501-d15c-4844-b5d9-39ded3979e2d@ghiti.fr>
Date: Tue, 22 Apr 2025 12:36:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] riscv: uaccess: use 'asm goto' for put_user()
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-5-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-5-cyrilbur@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetvdffkedvjeefkeegfefgteffleeltefggfdvheekfffhfeeghfeffffhtdelvdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhus
 egvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr


On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> With 'asm goto' we don't need to test the error etc, the exception just
> jumps to the error handling directly.
>
> Because there are no output clobbers which could trigger gcc bugs [1]
> the use of asm_goto_output() macro is not necessary here. Not using
> asm_goto_output() is desirable as the generated output asm will be
> cleaner.
>
> Use of the volatile keyword is redundant as per gcc 14.2.0 manual section
> 6.48.2.7 Goto Labels:
>> Also note that an asm goto statement is always implicitly considered
>    volatile.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [Cyril Bur: Rewritten commit message]
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 71 +++++++++++++++-----------------
>   1 file changed, 33 insertions(+), 38 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index da36057847f0..719c9179a751 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -214,61 +214,66 @@ do {								\
>   		((x) = (__force __typeof__(x))0, -EFAULT);	\
>   })
>   
> -#define __put_user_asm(insn, x, ptr, err)			\
> +#define __put_user_asm(insn, x, ptr, label)			\
>   do {								\
>   	__typeof__(*(ptr)) __x = x;				\
> -	__asm__ __volatile__ (					\
> +	asm goto(						\
>   		"1:\n"						\
> -		"	" insn " %z1, %2\n"			\
> -		"2:\n"						\
> -		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> -		: "+r" (err)					\
> -		: "rJ" (__x), "m"(*(ptr)));			\
> +		"	" insn " %z0, %1\n"			\
> +		_ASM_EXTABLE(1b, %l2)				\
> +		: : "rJ" (__x), "m"(*(ptr)) : : label);		\
>   } while (0)
>   
>   #ifdef CONFIG_64BIT
> -#define __put_user_8(x, ptr, err) \
> -	__put_user_asm("sd", x, ptr, err)
> +#define __put_user_8(x, ptr, label) \
> +	__put_user_asm("sd", x, ptr, label)
>   #else /* !CONFIG_64BIT */
> -#define __put_user_8(x, ptr, err)				\
> +#define __put_user_8(x, ptr, label)				\
>   do {								\
>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>   	u64 __x = (__typeof__((x)-(x)))(x);			\
> -	__asm__ __volatile__ (					\
> +	asm goto(						\
>   		"1:\n"						\
> -		"	sw %z1, %3\n"				\
> +		"	sw %z0, %2\n"				\
>   		"2:\n"						\
> -		"	sw %z2, %4\n"				\
> -		"3:\n"						\
> -		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
> -		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
> -		: "+r" (err)					\
> -		: "rJ" (__x), "rJ" (__x >> 32),			\
> +		"	sw %z1, %3\n"				\
> +		_ASM_EXTABLE(1b, %l4)				\
> +		_ASM_EXTABLE(2b, %l4)				\
> +		: : "rJ" (__x), "rJ" (__x >> 32),		\
>   			"m" (__ptr[__LSW]),			\
> -			"m" (__ptr[__MSW]));			\
> +			"m" (__ptr[__MSW]) : : label);		\
>   } while (0)
>   #endif /* CONFIG_64BIT */
>   
> -#define __put_user_nocheck(x, __gu_ptr, __pu_err)					\
> +#define __put_user_nocheck(x, __gu_ptr, label)			\
>   do {								\
>   	switch (sizeof(*__gu_ptr)) {				\
>   	case 1:							\
> -		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
> +		__put_user_asm("sb", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 2:							\
> -		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
> +		__put_user_asm("sh", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 4:							\
> -		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
> +		__put_user_asm("sw", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 8:							\
> -		__put_user_8((x), __gu_ptr, __pu_err);	\
> +		__put_user_8((x), __gu_ptr, label);		\
>   		break;						\
>   	default:						\
>   		BUILD_BUG();					\
>   	}							\
>   } while (0)
>   
> +#define __put_user_error(x, ptr, err)				\
> +do {								\
> +	__label__ err_label;					\
> +	__put_user_nocheck(x, ptr, err_label);			\
> +	break;							\
> +err_label:							\
> +	(err) = -EFAULT;					\
> +} while (0)
> +
>   /**
>    * __put_user: - Write a simple value into user space, with less checking.
>    * @x:   Value to copy to user space.
> @@ -299,7 +304,7 @@ do {								\
>   	__chk_user_ptr(__gu_ptr);				\
>   								\
>   	__enable_user_access();					\
> -	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
> +	__put_user_error(__val, __gu_ptr, __pu_err);		\
>   	__disable_user_access();				\
>   								\
>   	__pu_err;						\
> @@ -373,13 +378,7 @@ do {									\
>   } while (0)
>   
>   #define __put_kernel_nofault(dst, src, type, err_label)			\
> -do {									\
> -	long __kr_err = 0;						\
> -									\
> -	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
> -	if (unlikely(__kr_err))						\
> -		goto err_label;						\
> -} while (0)
> +	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
>   
>   static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
>   {
> @@ -398,12 +397,8 @@ static inline void user_access_restore(unsigned long enabled) { }
>    * We want the unsafe accessors to always be inlined and use
>    * the error labels - thus the macro games.
>    */
> -#define unsafe_put_user(x, ptr, label)	do {				\
> -	long __err = 0;							\
> -	__put_user_nocheck(x, (ptr), __err);				\
> -	if (__err)							\
> -		goto label;						\
> -} while (0)
> +#define unsafe_put_user(x, ptr, label)					\
> +	__put_user_nocheck(x, (ptr), label)
>   
>   #define unsafe_get_user(x, ptr, label)	do {				\
>   	long __err = 0;							\


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

