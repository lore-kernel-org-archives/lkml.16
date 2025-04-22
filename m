Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0827C848
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324385; cv=none; b=dCuryTS8DQ1280XsLoFKL5LwWfxWBOiGYYsa6xV87BkKMuVAIFuJTrh+RHMlg0JQiX5tnVg6qvtKP+A7qX7us6p86PD3LK9bSlGKgHqSnS0L9RSm2LXPMA8uzLMQ0bM2Zn2szhu/F/9hPmmpfFahKx96I7ACahPNJqSrjFppqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324385; c=relaxed/simple;
	bh=UYc1eGDm674rDlkQnD76LWHSlX1JK2USIpGs3cMnGLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObsQLszVw3aO0qd1Exb4pY5ZB763AJLPKUSIhMOxRXSKmwNZtm5k2IR2agNPW0oKbmhbnY6Q3IVFwsRE0ynXyHv8NYaKUS/c1JM7ufOKUYEhgBrCzEX7eXDJo5sgIrMd3eHyG6CEICXYFQBcxiV87/mvDg06lpvcw31LOOSvLZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5CDA43B53;
	Tue, 22 Apr 2025 12:19:37 +0000 (UTC)
Message-ID: <8c6e4773-796b-47a2-97c4-e4504801ba48@ghiti.fr>
Date: Tue, 22 Apr 2025 14:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] riscv: uaccess: use 'asm_goto_output' for
 get_user()
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-6-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-6-cyrilbur@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetvdffkedvjeefkeegfefgteffleeltefggfdvheekfffhfeeghfeffffhtdelvdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhus
 egvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr

On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> With 'asm goto' we don't need to test the error etc, the exception just
> jumps to the error handling directly.
>
> Unlike put_user(), get_user() must work around GCC bugs [1] when using
> output clobbers in an asm goto statement.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [Cyril Bur: Rewritten commit message]
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 95 +++++++++++++++++++++++---------
>   1 file changed, 68 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 719c9179a751..87d01168f80a 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -96,27 +96,58 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>    * call.
>    */
>   
> -#define __get_user_asm(insn, x, ptr, err)			\
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +#define __get_user_asm(insn, x, ptr, label)			\
> +	asm_goto_output(					\
> +		"1:\n"						\
> +		"	" insn " %0, %1\n"			\
> +		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
> +		: "=&r" (x)					\
> +		: "m" (*(ptr)) : : label)
> +#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +#define __get_user_asm(insn, x, ptr, label)			\
>   do {								\
> -	__typeof__(x) __x;					\
> +	long __gua_err = 0;					\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
>   		"	" insn " %1, %2\n"			\
>   		"2:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
> -		: "+r" (err), "=&r" (__x)			\
> +		: "+r" (__gua_err), "=&r" (x)			\
>   		: "m" (*(ptr)));				\
> -	(x) = __x;						\
> +	if (__gua_err)						\
> +		goto label;					\
>   } while (0)
> +#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>   
>   #ifdef CONFIG_64BIT
> -#define __get_user_8(x, ptr, err) \
> -	__get_user_asm("ld", x, ptr, err)
> +#define __get_user_8(x, ptr, label) \
> +	__get_user_asm("ld", x, ptr, label)
>   #else /* !CONFIG_64BIT */
> -#define __get_user_8(x, ptr, err)				\
> +
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +#define __get_user_8(x, ptr, label)				\
> +	u32 __user *__ptr = (u32 __user *)(ptr);		\
> +	u32 __lo, __hi;						\
> +	asm_goto_output(					\
> +		"1:\n"						\
> +		"	lw %0, %2\n"				\
> +		"2:\n"						\
> +		"	lw %1, %3\n"				\
> +		_ASM_EXTABLE_UACCESS_ERR(1b, %l4, %0)		\
> +		_ASM_EXTABLE_UACCESS_ERR(2b, %l4, %0)		\
> +		: "=&r" (__lo), "=r" (__hi)			\
> +		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW])	\
> +		: : label);                                     \
> +	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
> +		(((u64)__hi << 32) | __lo)));			\
> +
> +#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +#define __get_user_8(x, ptr, label)				\
>   do {								\
>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>   	u32 __lo, __hi;						\
> +	long __gu8_err = 0;					\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
>   		"	lw %1, %3\n"				\
> @@ -125,35 +156,51 @@ do {								\
>   		"3:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
> -		: "+r" (err), "=&r" (__lo), "=r" (__hi)		\
> +		: "+r" (__gu8_err), "=&r" (__lo), "=r" (__hi)	\
>   		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));	\
> -	if (err)						\
> +	if (__gu8_err) {					\
>   		__hi = 0;					\
> -	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
> +		goto label;					\
> +	}							\
> +	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>   		(((u64)__hi << 32) | __lo)));			\
>   } while (0)
> +#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +
>   #endif /* CONFIG_64BIT */
>   
> -#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
> +#define __get_user_nocheck(x, __gu_ptr, label)			\
>   do {								\
>   	switch (sizeof(*__gu_ptr)) {				\
>   	case 1:							\
> -		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lb", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 2:							\
> -		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lh", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 4:							\
> -		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lw", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 8:							\
> -		__get_user_8((x), __gu_ptr, __gu_err);	\
> +		__get_user_8((x), __gu_ptr, label);		\
>   		break;						\
>   	default:						\
>   		BUILD_BUG();					\
>   	}							\
>   } while (0)
>   
> +#define __get_user_error(x, ptr, err)					\
> +do {									\
> +	__label__ __gu_failed;						\
> +									\
> +	__get_user_nocheck(x, ptr, __gu_failed);			\
> +		err = 0;						\
> +		break;							\
> +__gu_failed:								\
> +		x = 0;							\
> +		err = -EFAULT;						\
> +} while (0)
> +
>   /**
>    * __get_user: - Get a simple variable from user space, with less checking.
>    * @x:   Variable to store result.
> @@ -178,13 +225,16 @@ do {								\
>   ({								\
>   	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>   	long __gu_err = 0;					\
> +	__typeof__(x) __gu_val;					\
>   								\
>   	__chk_user_ptr(__gu_ptr);				\
>   								\
>   	__enable_user_access();					\
> -	__get_user_nocheck(x, __gu_ptr, __gu_err);		\
> +	__get_user_error(__gu_val, __gu_ptr, __gu_err);		\
>   	__disable_user_access();				\
>   								\
> +	(x) = __gu_val;						\
> +								\
>   	__gu_err;						\
>   })
>   
> @@ -369,13 +419,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   }
>   
>   #define __get_kernel_nofault(dst, src, type, err_label)			\
> -do {									\
> -	long __kr_err = 0;						\
> -									\
> -	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> -	if (unlikely(__kr_err))						\
> -		goto err_label;						\
> -} while (0)
> +	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
>   
>   #define __put_kernel_nofault(dst, src, type, err_label)			\
>   	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
> @@ -401,12 +445,9 @@ static inline void user_access_restore(unsigned long enabled) { }
>   	__put_user_nocheck(x, (ptr), label)
>   
>   #define unsafe_get_user(x, ptr, label)	do {				\
> -	long __err = 0;							\
>   	__inttype(*(ptr)) __gu_val;					\
> -	__get_user_nocheck(__gu_val, (ptr), __err);			\
> +	__get_user_nocheck(__gu_val, (ptr), label);			\
>   	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> -	if (__err)							\
> -		goto label;						\
>   } while (0)
>   
>   #define unsafe_copy_loop(dst, src, len, type, op, label)		\


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

