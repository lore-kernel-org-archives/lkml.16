Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49C23ED56;
	Mon, 23 Jun 2025 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683197; cv=none; b=luEwPvDd8bjKM5/U36H+xqJqEUsic7K7M/FvXIJ3+5fpDGIQDxSHqX3VzEsOLYj49R3FV+YeOHgLpwin1vgYFl10OTgjft8DnzA1ErYDI63YzWMbgb3QWARFS4IqiZEDr1N1S9nmTmIBnoQmGh5OkB6gdPyLH7CUzghIFu9IvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683197; c=relaxed/simple;
	bh=8se5YPln/DXgqu+xjzAPHvxG2uWSb27S0x9TuNNRnhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoqjTjAh7U5uCTMeTYPoZQs70VhJqnO5MzBODQJFkdE8cYLMo979evBd7HziUY9Iow1gxfs6d7jLIyac2qccOk0Bae6qBYajgF8kLAPjUdn0uq6BtfK4cjCmww9mRAe5irbn9NbLI9mKl66b2cgfcoJFbQJgkfkdqiLTYml1TF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3B8E44418;
	Mon, 23 Jun 2025 12:53:06 +0000 (UTC)
Message-ID: <eb8f5a3b-edee-4525-be69-7a4ad55168a2@ghiti.fr>
Date: Mon, 23 Jun 2025 14:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] riscv: helper to parse hart index
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-2-vladimir.kondratiev@mobileye.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250609134749.1453835-2-vladimir.kondratiev@mobileye.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdpr
 hgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-GND-Sasl: alex@ghiti.fr

Hi Vladimir,

On 6/9/25 15:47, Vladimir Kondratiev wrote:
> RISC-V APLIC specification defines "hart index" in [1]
> And similar definitions found for ACLINT in [2]
>
> Quote from [1]:
>
> Within a given interrupt domain, each of the domain’s harts has a unique
> index number in the range 0 to 2^14 − 1 (= 16,383). The index number a
> domain associates with a hart may or may not have any relationship to the
> unique hart identifier (“hart ID”) that the RISC-V Privileged
> Architecture assigns to the hart. Two different interrupt domains may
> employ entirely different index numbers for the same set of harts.
>
> Further, [1] says in "4.5 Memory-mapped control region for an
> interrupt domain":
>
> The array of IDC structures may include some for potential hart index
> numbers that are not actual hart index numbers in the domain.
> For example, the first IDC structure is always for hart index 0, but 0 is
> not necessarily a valid index number for any hart in the domain.
>
> Support arbitrary hart indices specified in an optional property
> "riscv,hart-indexes" which is specified as an array of u32 elements, one
> per interrupt target, listing hart indexes in the same order as in
> "interrupts-extended". If this property is not specified, fallback to use
> logical hart indices within the domain.
>
> If property not exist, fall back to logical hart indexes


does not


>
> Link: https://github.com/riscv/riscv-aia [1]
> Link: https://github.com/riscvarchive/riscv-aclint [2]
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>   arch/riscv/include/asm/irq.h |  2 ++
>   arch/riscv/kernel/irq.c      | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
>
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 7b038f3b7cb0..59c975f750c9 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -22,6 +22,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
>   void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
>   
>   struct fwnode_handle *riscv_get_intc_hwnode(void);
> +int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
> +			 u32 *hart_index);
>   
>   #ifdef CONFIG_ACPI
>   
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 9ceda02507ca..efdf505bb776 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -32,6 +32,40 @@ struct fwnode_handle *riscv_get_intc_hwnode(void)
>   }
>   EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
>   
> +/**
> + * riscv_get_hart_index() - get hart index for interrupt delivery
> + * @fwnode: interrupt controller node
> + * @logical_index: index within the "interrupts-extended" property
> + * @hart_index: filled with the hart index to use
> + *
> + * Risc-V uses term "hart index" for its interrupt controllers, for the


s/Risc-V/RISC-V


> + * purpose of the interrupt routing to destination harts.
> + * It may be arbitrary numbers assigned to each destination hart in context
> + * of the particular interrupt domain.
> + *
> + * These numbers encoded in the optional property "riscv,hart-indexes"
> + * that should contain hart index for each interrupt destination in the same
> + * order as in the "interrupts-extended" property. If this property
> + * not exist, it assumed equal to the logical index, i.e. index within the
> + * "interrupts-extended" property.
> + *
> + * Return: error code


This does not add a lot of value, maybe something like that "Return: 0 
on success, a negative error code otherwise"?


> + */
> +int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
> +			 u32 *hart_index)
> +{
> +	static const char *prop_hart_index = "riscv,hart-indexes";
> +	struct device_node *np = to_of_node(fwnode);
> +
> +	if (!np || !of_property_present(np, prop_hart_index)) {
> +		*hart_index = logical_index;
> +		return 0;
> +	}
> +
> +	return of_property_read_u32_index(np, prop_hart_index,
> +					  logical_index, hart_index);
> +}
> +
>   #ifdef CONFIG_IRQ_STACKS
>   #include <asm/irq_stack.h>
>   


With those nits above fixed, you can add:

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

