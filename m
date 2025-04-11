Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF76278E71
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370503; cv=none; b=A9L86OogvYtI9JgGsVrb+Xjm1Qe0cI7IokLF9GxDGa2Y7//4UzVJk+EsXv734qe2XQSpXh0rr+XlnJZnMGMC3g1AWWhZsOKC7iX4RNaTwWbx9gTTJfVi4OyNWY9OrwsfW1mn2RtI/Kp6S1pLjXIoLuGs+840ZdfB1yNd1lyGr4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370503; c=relaxed/simple;
	bh=JDAbwElWq9f31bGZZEoXwFZyQww6129ByhyJOsPDbdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtkfGrVMHwBR544vSqMpjYmUKkD0IFtmrcwNBtTwm2MtssOI+dTrmYn+OvFBZii/jjWeAJZu1uZAeoELRDGB4r5kXDuF3ms9Ie6oZiJuOrvdcXyiiwFoW0OHKhSxkyHZDj+/XKepgWOCudC//pFMHPq56ZP92EWtKEpbg7dOn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A5BA442BD;
	Fri, 11 Apr 2025 11:21:36 +0000 (UTC)
Message-ID: <fb65fc45-b1f1-47ef-b700-e90c6ef84957@ghiti.fr>
Date: Fri, 11 Apr 2025 13:21:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Amma Lee <lixiaoyun@binary-semi.com>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Maxim Kochetkov <fido_max@inbox.ru>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtohepphhinhhkvghshhdrvhgrghhhvghlrgesvghinhhfohgthhhiphhsrdgto
 hhmpdhrtghpthhtohepphhrihhtvghshhdrphgrthgvlhesvghinhhfohgthhhiphhsrdgtohhmpdhrtghpthhtohepuggrrhhshhgrnhdrphhrrghjrghprghtihesvghinhhfohgthhhiphhsrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuh
X-GND-Sasl: alex@ghiti.fr

Hi Samuel,

On 09/04/2025 19:14, Samuel Holland wrote:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
>
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - New patch for v2
>
>   arch/riscv/kernel/module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 47d0ebeec93c..060f576cc988 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -859,7 +859,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   				}
>   
>   				j++;
> -				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
> +				if (j == num_relocations)
>   					j = 0;
>   
>   			} while (j_idx != j);


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

