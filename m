Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B03594B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291983; cv=none; b=HLaK0hjNleBqYThxpcV5jr3zOp1+RD8ejLVKgG2cQqbYQ0l0dif6jglJFYlLgf3IncZSICqSCnR9FzgdkLEkzyitmAsJoack7FLjBTrVCequg78GNANueORLltY503NQQ3HI1ILfu/bfTZ3CB+G+xRYkwQhN5lqLkuiU9XGGXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291983; c=relaxed/simple;
	bh=ERi5YTbguzqq4OHrDyVQB9/NLONl5boeXhq3Tqi8l4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njAOq74GWCcJA/0gaCnHIO4MzCI9pH1yD6FPZYjsdTQ9fEiluPQXi9mYmMk88AeUrfBAvzrNDjEYH/S5gZQHnQyIojkeohzkBykdXNKTGuQ94e8VhZP0i7odwJoL/DfKviPFVJUHmxRw9uv3WUwjl+nj5R8QQiN0G7ql39EqcuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E29444DA;
	Mon, 26 May 2025 20:39:35 +0000 (UTC)
Message-ID: <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
Date: Mon, 26 May 2025 22:39:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
To: Cyril Bur <cyrilbur@tenstorrent.com>, samuel.holland@sifive.com,
 ben.dooks@codethink.co.uk, palmer@dabbelt.com, linux-kernel@vger.kernel.org
Cc: jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddukeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteekfeetveffgfehgfeiieefvedukeejtdevhffgudfffeevieeigffhudeuueetnecuffhomhgrihhnpegvnhhtrhihrdhssgdpkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgdtieemleeikehfmeekrgegieemledvtggrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegstdeimeelieekfhemkegrgeeimeelvdgtrgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgdtieemleeikehfmeekrgegieemledvtggrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehsrghmuhgvlhdrhhhol
 hhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtohepsggvnhdrughoohhkshestghouggvthhhihhnkhdrtghordhukhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshiihhgrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr

+cc linux-riscv, Andy, Deepak

On 5/22/25 18:09, Cyril Bur wrote:
> During switch to csrs will OR the value of the register into the
> corresponding csr. In this case we're only interested in restoring the
> SUM bit not the entire register.
>
> Fixes: 788aa64c0 ("riscv: save the SR_SUM status over switches")
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
> I've put the Fixes tag in but I assume this will get squashed into the
> patch. Either way I hope this works to fix the immediate issue.
>
>   arch/riscv/kernel/entry.S | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 00bd0de9faa2..6ed3bd80903d 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -399,14 +399,18 @@ SYM_FUNC_START(__switch_to)
>   	REG_S s11, TASK_THREAD_S11_RA(a3)
>   
>   	/* save the user space access flag */
> -	li    s0, SR_SUM
> -	csrr  s1, CSR_STATUS
> -	REG_S s1, TASK_THREAD_STATUS_RA(a3)
> +	csrr  s0, CSR_STATUS
> +	REG_S s0, TASK_THREAD_STATUS_RA(a3)
>   
>   	/* Save the kernel shadow call stack pointer */
>   	scs_save_current
> -	/* Restore context from next->thread */
> +	/*
> +	 * Restore context from next->thread. csrs will OR the bits from s0 and
> +	 * only want to restore the SR_SUM bit
> +	 */
>   	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
> +	li    s1,  SR_SUM
> +	and   s0,  s0, s1
>   	csrs  CSR_STATUS, s0
>   	REG_L ra,  TASK_THREAD_RA_RA(a4)
>   	REG_L sp,  TASK_THREAD_SP_RA(a4)

To conclude the discussion we had here 
https://lore.kernel.org/linux-riscv/aDCtATl2N21fBsyT@debug.ba.rivosinc.com/#t, 
in addition to Cyril's patch above, to me we only have to rename the 
status field into sum and we're good to go. @Andy, @Deepak @Samuel Do 
you agree?

As this is an important fix (along with 2 other fixes, one for thead 
vector and vdso static values), I'd like to send another PR soon for 
inclusion in 6.16-rc1, I did not want to delay the second PR any longer.

Thanks for your feedbacks,

Alex


