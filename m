Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55C14E2E2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038220; cv=none; b=Shyl1reLdkshOTJ7OcpVJyQFOsug9w2KEt43SkQOgWOWPj3Dr+KYlNnN0pZDZKI2Ru5aakEzEgziNHXH5W3EHGPBiOQcgF6xItIjs1z5ObkCHQeB3WyA45ODz86lHHiX25AX6pQ4hekbYmUADSXiKcDT6WGmWqUPKIPzSAuMp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038220; c=relaxed/simple;
	bh=9Z2VDGaxg3hA3dx2AQrLUPV0bdjRYVKPmpcwAiPu6Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBSUvRmqT47CtsXQ4pUYY+ceqZXQ0whxZkJq/RmyeyYyAXFeDA7O9yOdfVuR0grYxLf6/EUzS8sud/wrAg5a9+JYCIEG5p9NUELDqn7V1ZL58+Z6es7nhYhkezzGMMzpToTfVPk0jamm9/0KpRVQUy2ulPGZkqGh2Map80FB4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A97C11F4F3;
	Wed,  4 Jun 2025 11:56:53 +0000 (UTC)
Message-ID: <185b2f71-38df-4656-932c-1d0e0304441d@ghiti.fr>
Date: Wed, 4 Jun 2025 13:56:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>,
 David Laight <david.laight.linux@gmail.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
 <20250602193918.868962-4-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250602193918.868962-4-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdeingdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepr
 ghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmrggtrhhosehorhgtrghmrdhmvgdruhhkpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhm
X-GND-Sasl: alex@ghiti.fr

On 6/2/25 21:39, Clément Léger wrote:
> Doing misaligned access to userspace memory would make a trap on
> platform where it is emulated. Latest fixes removed the kernel
> capability to do unaligned accesses to userspace memory safely since
> interrupts are kept disabled at all time during that. Thus doing so
> would crash the kernel.
>
> Such behavior was detected with GET_UNALIGN_CTL() that was doing
> a put_user() with an unsigned long* address that should have been an
> unsigned int*. Reenabling kernel misaligned access emulation is a bit
> risky and it would also degrade performances. Rather than doing that,
> we will try to avoid any misaligned accessed by using copy_from/to_user()
> which does not do any misaligned accesses. This can be done only for
> !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
> a bit more code for this config.
>
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 046de7ced09c..d472da4450e6 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -169,8 +169,19 @@ do {								\
>   
>   #endif /* CONFIG_64BIT */
>   
> +unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
> +	const void *from, unsigned long n);
> +unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
> +	const void __user *from, unsigned long n);
> +
>   #define __get_user_nocheck(x, __gu_ptr, label)			\
>   do {								\
> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&	\
> +	    !IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {	\
> +		if (__asm_copy_from_user_sum_enabled(&(x), __gu_ptr, sizeof(*__gu_ptr))) \
> +			goto label;				\
> +		break;						\
> +	}							\
>   	switch (sizeof(*__gu_ptr)) {				\
>   	case 1:							\
>   		__get_user_asm("lb", (x), __gu_ptr, label);	\
> @@ -297,6 +308,13 @@ do {								\
>   
>   #define __put_user_nocheck(x, __gu_ptr, label)			\
>   do {								\
> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&	\
> +	    !IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {	\
> +		__inttype(x) val = (__inttype(x))x;			\
> +		if (__asm_copy_to_user_sum_enabled(__gu_ptr, &(val), sizeof(*__gu_ptr))) \
> +			goto label;				\
> +		break;						\
> +	}							\
>   	switch (sizeof(*__gu_ptr)) {				\
>   	case 1:							\
>   		__put_user_asm("sb", (x), __gu_ptr, label);	\
> @@ -450,11 +468,6 @@ static inline void user_access_restore(unsigned long enabled) { }
>   	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
>   } while (0)
>   
> -unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
> -	const void *from, unsigned long n);
> -unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
> -	const void __user *from, unsigned long n);
> -
>   #define unsafe_copy_to_user(_dst, _src, _len, label)			\
>   	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
>   		goto label;


Even if as noted by David, there is room for improvement, for now the 
simplicity of this is good enough to me, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

