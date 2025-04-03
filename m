Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4E246348
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674339; cv=none; b=XBKUjKO72ZagfsXj0+c4ODoUn42Ra5BMlK9XzuoUND4SqRSRJI2SYWgu8z0D26/3VweP0mHyO+qcJoGWPIVMnkY8NnRIVA8ileCg+1dPWJ/5abl9w+a38gNkaLT4+fJHp6/d6XpEb50tlnD96PJOhEKEMFQ/L8ncc0mpBYXMlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674339; c=relaxed/simple;
	bh=FEwNJo5t+BtzkVXN3mBYnuVN4gQ7esKaEacovNTnEf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXA4NdkDyi4M/yTNf/hQKvoeMqs5NlG+q+aCuID0JVeYXE2pQbIBIUiZ7YR1lUkNtuOlSZnmBYxVMH9TzlbKdTNYAzdMtkeQrTZebBb53+XH3GxVmjgMYD+/q6N/2jujKISL64QxxrRsnSr9oiamUDVY04GLJntn6AZXKiBIDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AFF943231;
	Thu,  3 Apr 2025 09:58:50 +0000 (UTC)
Message-ID: <5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr>
Date: Thu, 3 Apr 2025 11:58:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Huacai Chen <chenhuacai@loongson.cn>
References: <330B3BAFC6FDB763+20250402074247.64483-1-wangyuli@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <330B3BAFC6FDB763+20250402074247.64483-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepfigrnhhghihulhhisehunhhiohhnthgvtghhrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpt
 hhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdgthhgvnhesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi WangYuli,

On 02/04/2025 09:42, WangYuli wrote:
> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
> symbol using inline assembly.
>
> There's a potential issue where the compiler might inline
> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst


I guess you meant kgdb_compiled_break.


> symbol multiple times, leading to fail to link vmlinux.o.
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
>   *v1->v2: Add the missing __ASSEMBLY__ check and substitute
> ".option rvc/norvc" with ".option push/pop".
> ---
>   arch/riscv/include/asm/kgdb.h | 9 +--------
>   arch/riscv/kernel/kgdb.c      | 8 ++++++++
>   2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 46677daf708b..d9f6a8fc387f 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -19,16 +19,9 @@
>   
>   #ifndef	__ASSEMBLY__
>   
> +extern void arch_kgdb_breakpoint(void);


The "extern" is not needed here.


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
> index 2e0266ae6bd7..5873d3970360 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>   	regs->epc = pc;
>   }
>   
> +noinline void arch_kgdb_breakpoint(void)
> +{
> +	asm(".global kgdb_compiled_break\n"
> +	    ".option push\n"


Here you forgot .option norvc. But this fix as mentioned by Samuel 
should be in a separate patch.

Thanks,

Alex


> +	    "kgdb_compiled_break: ebreak\n"
> +	    ".option pop\n");
> +}
> +
>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>   				char *remcom_out_buffer)
>   {
