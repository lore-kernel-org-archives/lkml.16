Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C691E3DF7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259705; cv=none; b=uBD2+fSV/jbq1AxMLCbh+XhT8waV+7yxjR9nEf/STzLWROo0JPZ7mRnAhbO/pIjr2YkJ/VokPHdDcRaiUeid62I7/yFw2kGF3pslrjgc6O96zGlu8HLxrwTCn8LOj95lssK8wCK7Uenu1WD6Tjrlyutm4zI6HOs3rJsDOGO3JAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259705; c=relaxed/simple;
	bh=kWxFaMlYO0+tlGmA13acV2IkaSig3a2c1wF7byrkIYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZYLPtIGx4c4J06AZhkJ/YL8bMiWuuVFGxTv/cj09Mf18ll4rKT11C39NrMN8gCoOemtunwMTELVp2+VOVv/6O0HWc5D8uMBrWG/oTfeuTP8hX9y6MI4WC3uAkYKtEUR3CaghG7Bj6F5ZThZ1kfVttVX6pk9KaeuFQDWItecC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53F0044388;
	Tue, 11 Feb 2025 07:41:39 +0000 (UTC)
Message-ID: <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
Date: Tue, 11 Feb 2025 08:41:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250210155615.1545738-1-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250210155615.1545738-1-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueeigeevgeduffeivdevjefhjeeihfeghfekjedtueefudefhefhueefudelheeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrs
 egurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 10/02/2025 16:56, Clément Léger wrote:
> Comparison of bitmaps should be done using bitmap_equal(), not memcmp(),
> use the former one to compare isa bitmaps.
>
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>   arch/riscv/kernel/cpufeature.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c6ba750536c3..40ac72e407b6 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -479,7 +479,7 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
>   			if (bit < RISCV_ISA_EXT_BASE)
>   				*this_hwcap |= isa2hwcap[bit];
>   		}
> -	} while (loop && memcmp(prev_resolved_isa, resolved_isa, sizeof(prev_resolved_isa)));
> +	} while (loop && !bitmap_equal(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX));
>   }
>   
>   static void __init match_isa_ext(const char *name, const char *name_end, unsigned long *bitmap)


Since bitmap does not guarantee the value of the 'extra' bits 
(https://elixir.bootlin.com/linux/v6.13.1/source/lib/bitmap.c#L24), this 
is a fix so I would add a Fixes tag:

Fixes: 625034abd52a8c ("riscv: add ISA extensions validation callback")

You can also add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

