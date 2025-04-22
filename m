Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF87280A3A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334496; cv=none; b=q/h8xuT4QBj5v+gvgJLbrKK77JkRxxvt5+kkgdEudkhAg0Wm7ENkCVPQIeQV6kuSsEdECqPXspIoaBMrRmDWmcQymiPTdKIdDhIMEdqeFpp0zqDn6Z1f8AhUKf6vaBM0F3AGJm022lp0lHmof/ImgHhL5JCe1u33mkzJQtOev4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334496; c=relaxed/simple;
	bh=MPTqHoJty3QjKZFEKSJBDq/4OB2qEWqyhdoI60fOG/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4he+w+KkXGCbhMxXM7b54KFqfLbpzzPXspN65xZttYV88lFUqbbtgd29xPdb6l8WixNOYJcWKf+j6i6QZW1pNSfhoxYf8Ecpnv2IygV6caxdoMvExiWBE/8qeSHbAwl9CVCywjs1XabZCjiza7XBV7FrZ8+o5UmIB7lAEr8NK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id B659443A1B;
	Tue, 22 Apr 2025 15:08:10 +0000 (UTC)
Message-ID: <56bbe957-734a-49af-8f14-9523cb8cf3a0@ghiti.fr>
Date: Tue, 22 Apr 2025 17:08:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make regs_irqs_disabled() more clear
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@loongson.cn>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250422113156.25742-1-yangtiezhu@loongson.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250422113156.25742-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtohephigrnhhgthhivgiihhhusehlohhonhhgshhonhdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Tiezhu,

On 22/04/2025 13:31, Tiezhu Yang wrote:
> The return value of regs_irqs_disabled() is true or false, so change
> its type to reflect that and also make it always inline.
>
> Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/riscv/include/asm/ptrace.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index 2910231977cb..a7dc0e330757 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -175,7 +175,7 @@ static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
>   	return 0;
>   }
>   
> -static inline int regs_irqs_disabled(struct pt_regs *regs)
> +static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
>   {
>   	return !(regs->status & SR_PIE);
>   }

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

