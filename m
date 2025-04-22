Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8831215783
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317613; cv=none; b=S3yiwKQvKYSKM2QyRwZrcHRfdbtd/5nnSBrY2KcIGta8OQB/oYare5RJuZu0ZTJ+6Zy3N1zjlZMsxzZNmXypsKB0rhImsV5H6JhIreSW3G1GtHKTPKg9gZPtmuQwXYMWH59atb1wERFHFyoeCgSYaB0QmFj/io8Yboh0o5HenHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317613; c=relaxed/simple;
	bh=XyET5h5hjYz++3+OG72+DRdzzXlIPOpG891VI92YSRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbHLHLNsVYw2TCZrkTL4NyP+CFcarmWY0asisMeZGuiFeHB2y5AD4wSHCB+kBcEuKpYZVlNUzsoJEzw1WCWnQx/ufobmVABggevCXyAml/+BD3+d8GlS99IAWGp0EG8SRCuc9Xhc9OMoLMymnLbyZvzku6MjlGXsFPzscv0xGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 859C2433EB;
	Tue, 22 Apr 2025 10:26:47 +0000 (UTC)
Message-ID: <48151446-1ffd-484a-ac21-511b14fa1511@ghiti.fr>
Date: Tue, 22 Apr 2025 12:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] riscv: implement user_access_begin() and families
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvu
 ghupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr

On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Currently, when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled
> for every word read.
>
> By implementing user_access_begin() and families, the protection
> is disabled at the beginning of the copy and enabled at the end.
>
> The __inttype macro is borrowed from x86 implementation.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 76 ++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index fee56b0c8058..c9a461467bf4 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -61,6 +61,19 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>   #define __disable_user_access()							\
>   	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
>   
> +/*
> + * This is the smallest unsigned integer type that can fit a value
> + * (up to 'long long')
> + */
> +#define __inttype(x) __typeof__(		\
> +	__typefits(x, char,			\
> +	  __typefits(x, short,			\
> +	    __typefits(x, int,			\
> +	      __typefits(x, long, 0ULL)))))
> +
> +#define __typefits(x, type, not) \
> +	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> +
>   /*
>    * The exception table consists of pairs of addresses: the first is the
>    * address of an instruction that is allowed to fault, and the second is
> @@ -368,6 +381,69 @@ do {									\
>   		goto err_label;						\
>   } while (0)
>   
> +static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
> +{
> +	if (unlikely(!access_ok(ptr, len)))
> +		return 0;
> +	__enable_user_access();
> +	return 1;
> +}
> +#define user_access_begin user_access_begin
> +#define user_access_end __disable_user_access
> +
> +static inline unsigned long user_access_save(void) { return 0UL; }
> +static inline void user_access_restore(unsigned long enabled) { }
> +
> +/*
> + * We want the unsafe accessors to always be inlined and use
> + * the error labels - thus the macro games.
> + */
> +#define unsafe_put_user(x, ptr, label)	do {				\
> +	long __err = 0;							\
> +	__put_user_nocheck(x, (ptr), __err);				\
> +	if (__err)							\
> +		goto label;						\
> +} while (0)
> +
> +#define unsafe_get_user(x, ptr, label)	do {				\
> +	long __err = 0;							\
> +	__inttype(*(ptr)) __gu_val;					\
> +	__get_user_nocheck(__gu_val, (ptr), __err);			\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +	if (__err)							\
> +		goto label;						\
> +} while (0)
> +
> +#define unsafe_copy_loop(dst, src, len, type, op, label)		\
> +	while (len >= sizeof(type)) {					\
> +		op(*(type *)(src), (type __user *)(dst), label);	\
> +		dst += sizeof(type);					\
> +		src += sizeof(type);					\
> +		len -= sizeof(type);					\
> +	}
> +
> +#define unsafe_copy_to_user(_dst, _src, _len, label)			\
> +do {									\
> +	char __user *__ucu_dst = (_dst);				\
> +	const char *__ucu_src = (_src);					\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
> +} while (0)
> +
> +#define unsafe_copy_from_user(_dst, _src, _len, label)			\
> +do {									\
> +	char *__ucu_dst = (_dst);					\
> +	const char __user *__ucu_src = (_src);				\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
> +} while (0)
> +
>   #else /* CONFIG_MMU */
>   #include <asm-generic/uaccess.h>
>   #endif /* CONFIG_MMU */


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

