Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE65222F75D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627085; cv=none; b=GnvRk4GK5pCnHj0WAkdEzTZFlskW2bc9n2TlWj1P6WChsz6rbW4Zt4k/6Qd1sz3AihU5q2146KiZO5abfbnbLILoExLkj9v6k3tZxb8OAgWfomt8lpAH6xXIQ2HTVSTRSZ2FFU4eZq7OtU5vv7LQYWWPBkxh+6PkKdJc79V3uSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627085; c=relaxed/simple;
	bh=T1U4EL57DYQYZnP+jC+6otuijyh3wOR+W2q/Q44Bgcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OACyWc8E/1I7YRLivAsk0PVKN2b2/m7eu9XkeY4T7euQkU6UdsHP8/hnorSnuReuHY2J+5xY+nXejZ5QKEC+XDm3WzGr2t0gvfiA30OuJ2M72i8LnR1Wmwfdmvw+77ku21W6ESPClmKrRNnhOHw5DjREpVHTAAGNmaso9Esu96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9EDB443D4;
	Wed, 11 Jun 2025 07:31:18 +0000 (UTC)
Message-ID: <de5e9d8d-c620-4371-8c74-7ef804d97d53@ghiti.fr>
Date: Wed, 11 Jun 2025 09:31:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 cyrilbur@tenstorrent.com, jszhang@kernel.org, cleger@rivosinc.com,
 samuel.holland@sifive.com, linux-kernel@vger.kernel.org
References: <20250610213058.24852-1-palmer@dabbelt.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250610213058.24852-1-palmer@dabbelt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiess
 hhifhhivhgvrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehjshiihhgrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr

On 6/10/25 23:30, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
>
> I must have lost this rebasing things during the merge window, I know I
> got it at some point but it's not here now.  Without this I get warnings
> along the lines of
>
>      include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>       3975 |         if (unlikely(get_user(c, path)))
>            |                      ^
>      arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>        274 |                 __get_user((x), __p) :                          \
>            |                 ^
>      arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>        244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>            |         ^
>      arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>        207 |         __ge  LD [M]  net/802/psnap.ko
>      t_user_nocheck(x, ptr, __gu_failed);                        \
>            |         ^
>      arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>        196 |                 __get_user_8((x), __gu_ptr, label);             \
>            |                 ^
>      arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>        130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>            |         ^
>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index d472da4450e6..525e50db24f7 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -127,6 +127,7 @@ do {								\
>   
>   #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>   #define __get_user_8(x, ptr, label)				\
> +do {								\
>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>   	u32 __lo, __hi;						\
>   	asm_goto_output(					\
> @@ -141,7 +142,7 @@ do {								\
>   		: : label);                                     \
>   	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>   		(((u64)__hi << 32) | __lo)));			\
> -
> +} while (0)
>   #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>   #define __get_user_8(x, ptr, label)				\
>   do {								\


I had come up with the same fix so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

