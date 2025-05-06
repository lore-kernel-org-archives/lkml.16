Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AD22DFB1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520418; cv=none; b=rjQF6fFDzxiwN8AAG9esVhAy7qawlshDx1LpAO5YjZfQFAYMEm79Er6myv2jS4A916hMuglRmS9ycBZWf+y+I8G7EaCI4BaUT5zeYD3/LJBoqYxKOyYgSUDg8A1Z8A85IbFmvHz/EYErQEa2uJ7e7dbZTKg4+zy8LK2/R1fKodc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520418; c=relaxed/simple;
	bh=BoA998ebdqwIKwKd0cWcO+2gTKCjQY+nHK4425uKFdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=llLqJyyadGBgVImVjptNQAJVD9m7kqH6l0j1ICLtd2jlqt8DWT8w9vQejSg3SkAqBmRr9GeS8IpxsbnmC08psDyqybbuDo2PPMQyK7oPYHlc9gAfM1HCaj0+MPTIbWgynsXKpqPzzI5FbF7noyI8Otj8QhqQMuieJYMbsCmJuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FBA243A6C;
	Tue,  6 May 2025 08:33:24 +0000 (UTC)
Message-ID: <ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr>
Date: Tue, 6 May 2025 10:33:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
Content-Language: en-US
To: mikisabate@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250501130309.14803-1-mikisabate@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250501130309.14803-1-mikisabate@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhefgvdetjeeigfdvveekgfduheekkeehgfekvddtueegtdevffefjeehkedtgfenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhhikhhishgrsggrthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvhesl
 hhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Miquel,

Your patch title should be prefixed with "riscv" or "RISC-V", but no 
need to resend, I'll fix it when I merge your patch.

On 01/05/2025 15:03, mikisabate@gmail.com wrote:
> From: Miquel Sabaté Solà <mikisabate@gmail.com>
>
> Fix a couple of spelling issues plus some minor details on the grammar.
>
> Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>
> ---
>   arch/riscv/Kconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1fd197afd2f7..3f40e33bc115 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -664,12 +664,12 @@ config RISCV_ISA_V_PREEMPTIVE
>   	default y
>   	help
>   	  Usually, in-kernel SIMD routines are run with preemption disabled.
> -	  Functions which envoke long running SIMD thus must yield core's
> +	  Functions which invoke long running SIMD thus must yield the core's
>   	  vector unit to prevent blocking other tasks for too long.
>   
> -	  This config allows kernel to run SIMD without explicitly disable
> -	  preemption. Enabling this config will result in higher memory
> -	  consumption due to the allocation of per-task's kernel Vector context.
> +	  This config allows the kernel to run SIMD without explicitly disabling
> +	  preemption. Enabling this config will result in higher memory consumption
> +	  due to the allocation of per-task's kernel Vector context.
>   
>   config RISCV_ISA_ZAWRS
>   	bool "Zawrs extension support for more efficient busy waiting"


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


