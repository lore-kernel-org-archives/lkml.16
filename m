Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258822A4DA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038141; cv=none; b=FobWXRwgzAcXM0Pk8GMbwMfKwYP2XjMxlo5RZ0SFW497pS35IKHtVojiJAkuZ+jmqwx+ip1QI9OvH1sseAkBy7aJcvBCHy5jWCkDgIrr2Hg5O3hpFucqhJ8EDXiNVhUMnAH/2JL04O1l7plFn3oYB8PirlOJb2aobwfsVGM/LWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038141; c=relaxed/simple;
	bh=qQA6KOcXSDs8+2RWAQENkMP3pc5baNbMl6nrgh95vQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sB/Cp7CrUeNQyBzPyP4XzdE5RiydAUrclwQh0wwGfhDZKeFEWZDzGZ3yBx/sxZXxDOrZFkqLLfAOgbzkPEgUlfZKFUI7Zn2AZkZ5OlwshN8aEe2dkPkdvoDi0pg2zcVnUAyBigdoOHzcgwCMUCRK2wEUP5uoqSSe4HP+gn5LatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4421643B20;
	Wed,  4 Jun 2025 11:55:28 +0000 (UTC)
Message-ID: <dc2b9e86-29f7-406e-a7c5-3f949f3999db@ghiti.fr>
Date: Wed, 4 Jun 2025 13:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: process: use unsigned int instead of
 unsigned long for put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>,
 David Laight <david.laight.linux@gmail.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
 <20250602193918.868962-3-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250602193918.868962-3-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdeingdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepr
 ghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmrggtrhhosehorhgtrghmrdhmvgdruhhkpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 6/2/25 21:39, Clément Léger wrote:
> The specification of prctl() for GET_UNALIGN_CTL states that the value is
> returned in an unsigned int * address passed as an unsigned long. Change
> the type to match that and avoid an unaligned access as well.
>
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>   arch/riscv/kernel/process.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 15d8f75902f8..9ee6d816b98b 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -57,7 +57,7 @@ int get_unalign_ctl(struct task_struct *tsk, unsigned long adr)
>   	if (!unaligned_ctl_available())
>   		return -EINVAL;
>   
> -	return put_user(tsk->thread.align_ctl, (unsigned long __user *)adr);
> +	return put_user(tsk->thread.align_ctl, (unsigned int __user *)adr);
>   }
>   
>   void __show_regs(struct pt_regs *regs)


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

