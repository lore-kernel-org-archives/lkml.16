Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E565674E
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694564; cv=none; b=Fh1CiQA79cp/Oc7DpfOVCpKBHidDkUwhetwXjYNcTST8STX4rOdx9eRKNrO6QTaIBDTaw9lLrcVOti1monDVx7MEeZLfhDh6jYr8yiO66r+DgOFaCimLvkXJ0/Sj/a8PPikzeLMN0AvUkUicPgfSCaziPoMpREK4OEr6mz7Ang8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694564; c=relaxed/simple;
	bh=Yg9kC64CMtNIIlt3Uj0hiP5VPJ5Z4qwfGaD2Qr7TK2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFKObiga4XWGCQny1rcvgVOIOIhd9ALeKN0sHQw6v1uFFXrwQXX7mr90j91/w+bGFOtNY+EmGXPKiu/q0XXgpwMqCxAHfdX6hp1msNBd4cra6oDmfjXFEd9eqSHjN9LUchocd3F32QBmqVa9wXFGQTqk38KcTh9boE/HzsrkP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A7C743192;
	Sat, 31 May 2025 12:29:10 +0000 (UTC)
Message-ID: <58244005-b071-4e21-ade1-8cdf4b35664f@ghiti.fr>
Date: Sat, 31 May 2025 14:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: process: use unsigned int instead of unsigned
 long for put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-2-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250530205658.624195-2-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedujeeirddugeejrddugeehrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddugeejrddugeehrdeggedphhgvlhhopegludelvddrudeikedruddrudehfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsv
 ghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 5/30/25 22:56, Clément Léger wrote:
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

