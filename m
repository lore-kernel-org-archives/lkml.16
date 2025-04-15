Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F7205ADB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696452; cv=none; b=MXBA2MFMzS32jSJWP/lzblklOrOloTO8uhnB2c51HN8hDCNxaGC6zimVWwLEKUoOr89ZokKxgJICDazPs6oSHkCaBSJVmVQVBzlMPepzz4eGzTKMYrZsRUTFklSCPYzxiwqmSKgjPdos8/UKYZMdCIDRQ8ppGrauTgTP1l5VWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696452; c=relaxed/simple;
	bh=VDKvhMa9a50oojknzBu63d8dM9RR6/Pw8yphqlF1nAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpJN3mHoTdzYtHo/8+LNLMuVYqqiBBqBlUiKM2pC42Kj/jAS6+LR2xOJXeU9ZvdyGTefR2C/BcEnxtpkIKT+1zL6SOk7pk5BM+1BAvKtVoXpaCyzSAKdDZ4gsmbsc9kPyry9NQaUUdrQfnW8eTzipenrCmlvakpxQ2p3HcK1Cfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B43B43A3B;
	Tue, 15 Apr 2025 05:54:05 +0000 (UTC)
Message-ID: <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>
Date: Tue, 15 Apr 2025 07:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
To: Nathan Chancellor <nathan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Kees Cook <kees@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrl
 hhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlughvsehsthhrrggtvgdrihhopdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Nathan,

On 09/04/2025 23:24, Nathan Chancellor wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
>
>    In file included from include/linux/string.h:392,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/riscv/include/asm/processor.h:55,
>                     from include/linux/sched.h:13,
>                     from kernel/ptrace.c:13:
>    In function 'fortify_memcpy_chk',
>        inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>    include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>      580 |                         __read_overflow2_field(q_size_field, size);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
>
> The fortified memcpy() routine enforces that the source is not overread
> and the destination is not overwritten if the size of either field and
> the size of the copy are known at compile time. The memcpy() in
> syscall_get_arguments() intentionally overreads from a1 to a5 in
> 'struct pt_regs' but this is bigger than the size of a1.
>
> Normally, this could be solved by wrapping a1 through a5 with
> struct_group() but there was already a struct_group() applied to these
> members in commit bba547810c66 ("riscv: tracing: Fix
> __write_overflow_field in ftrace_partial_regs()").
>
> Just avoid memcpy() altogether and write the copying of args from regs
> manually, which clears up the warning at the expense of three extra
> lines of code.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I omitted a Fixes tag because I think this has always been an overread
> if I understand correctly but it is only the addition of the checks from
> commit f68f2ff91512 ("fortify: Detect struct member overflows in
> memcpy() at compile-time") that it becomes a noticeable issue.
>
> This came out of a discussion from the addition of
> syscall_set_arguments(), where the same logic causes a more noticeable
> fortify warning because it happens without W=1, as it is an overwrite:
> https://lore.kernel.org/20250408213131.GA2872426@ax162/
> ---
>   arch/riscv/include/asm/syscall.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   					 unsigned long *args)
>   {
>   	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>   }
>   
>   static inline int syscall_get_arch(struct task_struct *task)
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
>
> Best regards,

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

IIUC, Andrew took this patch, if that changes, please let me know and 
I'll merge it through the riscv tree.

Thanks,

Alex


