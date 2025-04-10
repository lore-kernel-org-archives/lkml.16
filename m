Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8F28A408
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292581; cv=none; b=CpMPLltxLmZRmYzzcW/tNXTH2V5E4UH5EpQEJ2vXj052vMsz3WnGv7AI+ISRWg4aKxPZSUtT7zz1juJbvTBg0eUyqTlq1MOLbuNc+1n7x2eT607LKY9h2IWNrretCBWIhIUrdCodJ8zb7lmImpwOum4j+f5NpZTDeOKjjPw5PvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292581; c=relaxed/simple;
	bh=+LXrRIcEu41AlQb5940bRqeST5vTt6XWbhMiXC8N1Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPQQIiBbzKaakBzZSQfIH59z4gKzaZDWcwmskE4sYen2AER0g37/nhj/TEIafDE2NQM2cNaSggiVtWrJqSAH2dIaZhyc2UPAHh3wlwrNXAJfc2hCPDaMqakaWmL0y2midCfzk592W4LyEBaKYEDKWVbBLNHoDWrb59Z8hPvMQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 372934431A;
	Thu, 10 Apr 2025 13:42:46 +0000 (UTC)
Message-ID: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
Date: Thu, 10 Apr 2025 15:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeltdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepfigrnhhghihulhhisehunhhiohhnthgvtghhrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpt
 hhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdgthhgvnhesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi WangYuli,

On 08/04/2025 11:54, WangYuli wrote:
> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
> symbol using inline assembly.
>
> There's a potential issue where the compiler might inline
> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst


You forgot to replace kgdb_breakinst into kgdb_compiled_break.


> symbol multiple times, leading to fail to link vmlinux.o.
>
> This isn't merely a potential compilation problem. The intent here
> is to determine the global symbol address of kgdb_compiled_break,
> and if this function is inlined multiple times, it would logically
> be a grave error.
>
> Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> Changelog:
>   *v1->v2:
>      1. Add the missing __ASSEMBLY__ check and substitute
> ".option rvc/norvc" with ".option push/pop".
>    v2->v3:
>      1. Remove "extern".
>      2. Restore the inadvertently deleted .option norvc to prevent
> a change in semantics.
> ---
>   arch/riscv/include/asm/kgdb.h | 9 +--------
>   arch/riscv/kernel/kgdb.c      | 9 +++++++++
>   2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 46677daf708b..cc11c4544cff 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -19,16 +19,9 @@
>   
>   #ifndef	__ASSEMBLY__
>   
> +void arch_kgdb_breakpoint(void);
>   extern unsigned long kgdb_compiled_break;
>   
> -static inline void arch_kgdb_breakpoint(void)
> -{
> -	asm(".global kgdb_compiled_break\n"
> -	    ".option norvc\n"
> -	    "kgdb_compiled_break: ebreak\n"
> -	    ".option rvc\n");
> -}
> -
>   #endif /* !__ASSEMBLY__ */
>   
>   #define DBG_REG_ZERO "zero"
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index 2e0266ae6bd7..7f2d3d956167 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -254,6 +254,15 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>   	regs->epc = pc;
>   }
>   
> +noinline void arch_kgdb_breakpoint(void)
> +{
> +	asm(".global kgdb_compiled_break\n"
> +	    ".option push\n"
> +	    ".option norvc\n"
> +	    "kgdb_compiled_break: ebreak\n"
> +	    ".option pop\n");
> +}


You are fixing 2 things here, you need to split this patch into 2. And 
as noted by Palmer, we actually don't need norvc here, so you can remove 
it instead.

Thanks,

Alex


> +
>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>   				char *remcom_out_buffer)
>   {
