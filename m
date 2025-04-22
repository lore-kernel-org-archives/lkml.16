Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D727CB1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323848; cv=none; b=rI7gtAMJuDT0rBFI56PtPAdmaCXcd1RhRk09m3Zzp4hp3jBs6I8ClWifhBZJ+bnZonnACgzEz6teP/+aPHJnzh6iG7ZzFPb7ZV2cPPZ7sG4Vt839SI15WQ1yB25DVlcBz41d9kff4IFL1pq5vueNihlz889hrhyPXcXyqv2jwho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323848; c=relaxed/simple;
	bh=7wGcjDU8PngIFhOxsrFzEFsCxKeIWbmcBClEWPF2xQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLNcp2mOgdl2cIlHEMn908yfKQZEYXdRsDmgpWh0S8niVNdj5XCx5x2zk3JzEZBrp0Ow5JDzQbxBtTONMKBbVLrZCE1Q9AUBlQLvTVmMCzhJvMkB1K6q8txMO4GcoIYcOV5D+8JuYKyi5JIALj2XuZgaBlh0RBxyOJKvld5eaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43B7F43B4C;
	Tue, 22 Apr 2025 12:10:41 +0000 (UTC)
Message-ID: <6cefe9be-c103-4533-9f44-4666d3fba2f5@ghiti.fr>
Date: Tue, 22 Apr 2025 14:10:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] riscv: uaccess: use input constraints for ptr of
 __put_user()
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetvdffkedvjeefkeegfefgteffleeltefggfdvheekfffhfeeghfeffffhtdelvdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhus
 egvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr


On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Putting ptr in the inputs as opposed to output may seem incorrect but
> this is done for a few reasons:
> - Not having it in the output permits the use of asm goto in a
>    subsequent patch. There are bugs in gcc [1] which would otherwise
>    prevent it.
> - Since the output memory is userspace there isn't any real benefit from
>    telling the compiler about the memory clobber.
> - x86, arm and powerpc all use this technique.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [Cyril Bur: Rewritten commit message]
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index c9a461467bf4..da36057847f0 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -219,11 +219,11 @@ do {								\
>   	__typeof__(*(ptr)) __x = x;				\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
> -		"	" insn " %z2, %1\n"			\
> +		"	" insn " %z1, %2\n"			\
>   		"2:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> -		: "+r" (err), "=m" (*(ptr))			\
> -		: "rJ" (__x));					\
> +		: "+r" (err)					\
> +		: "rJ" (__x), "m"(*(ptr)));			\
>   } while (0)
>   
>   #ifdef CONFIG_64BIT
> @@ -236,16 +236,16 @@ do {								\
>   	u64 __x = (__typeof__((x)-(x)))(x);			\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
> -		"	sw %z3, %1\n"				\
> +		"	sw %z1, %3\n"				\
>   		"2:\n"						\
> -		"	sw %z4, %2\n"				\
> +		"	sw %z2, %4\n"				\
>   		"3:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
>   		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
> -		: "+r" (err),					\
> -			"=m" (__ptr[__LSW]),			\
> -			"=m" (__ptr[__MSW])			\
> -		: "rJ" (__x), "rJ" (__x >> 32));		\
> +		: "+r" (err)					\
> +		: "rJ" (__x), "rJ" (__x >> 32),			\
> +			"m" (__ptr[__LSW]),			\
> +			"m" (__ptr[__MSW]));			\
>   } while (0)
>   #endif /* CONFIG_64BIT */
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

