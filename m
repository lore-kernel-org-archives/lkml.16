Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A62E7184
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547611; cv=none; b=N9F0nf0mgl6qgS1m01pEPx7pHoHewFMnm1T74XW0tSRYaQhENxGt3+Y7mn6U21VH30+csH8gRW6BRIwrukQPdHdctPiSDUxzAJT8jykvasMsLRVzmIhTxo5F9pAqiaZk/pIlCEDmjQ2AZ6K+gWmJ1iT6WFL8Ew1/qHxW65qNzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547611; c=relaxed/simple;
	bh=3cqMsvSpwuo6+zniGfSZZ4pa49CTErkAL8QZnOHiHoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/cSf3CBxVnu2/DDOoDX60qmZhlWAhBvTUR94+i1qyurHLjfy1FejRPAHU7D2LQMD0FHBY0VP92rURGt0bihoq4TZ9Gi9fwy92Wsyn9F1GzK80Y7RoPwACZWoT8ph/nsqYYzcQyEOcGmVd7uIoP0d0cGSSDcFafwd4dyQN4DXls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C14A643A2D;
	Thu,  3 Jul 2025 13:00:02 +0000 (UTC)
Message-ID: <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
Date: Thu, 3 Jul 2025 15:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: ChenMiao <chenmiao.ku@gmail.com>,
 Linux RISCV <linux-riscv@vger.kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "rostedt@goodmis.org" <rostedt@goodmis.org>
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250703084502.394406-1-chenmiao.ku@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghhvghnmhhirghordhkuhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi ChenMiao,

On 7/3/25 10:45, ChenMiao wrote:
> From: chenmiao <chenmiao.ku@gmail.com>
>
> When I was reading the source code of ftrace, I learned that
> ftrace has two types: static and dynamic. Initially, I planned
> to prioritize reading the static source code, so I disabled
> the enable dynamic option in RISCV.
>
> [*]   Kernel Function Tracer
> [ ]   Kernel Function Graph Tracer
> [ ]   enable/disable function tracing dynamically (NEW)
>
> However, when I tried to compile it, the build failed.
>
> ./include/linux/ftrace.h:190:16: error: implicit declaration of
> function ‘arch_ftrace_get_regs’; did you mean ‘arch_ftrace_regs’?
> [-Wimplicit-function-declaration]
>    190 |         return arch_ftrace_get_regs(fregs);
>        |                ^~~~~~~~~~~~~~~~~~~~
>        |                arch_ftrace_regs
>
> After comparing it with the ARM64 architecture, I found that
> ARM64 automatically enables DYNAMIC_FTRACE by default once
> FUNCTION_TRACER is turned on, and this cannot be set to "no".
> Therefore, I believe the optional DYNAMIC_FTRACE setting in
> RISC-V has a logic flaw—if FUNCTION_TRACER is enabled,
> DYNAMIC_FTRACE should also be enabled, and vice versa. Moreover,
> it's clear that RISC-V lacks the necessary support to successfully
> compile the kernel when DYNAMIC_FTRACE is disabled.


We could support static ftrace, but I don't think we should, so I agree 
with this patch. In fact I had just prepared a patch for this here 
https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3 
which is a bit more complete since I have removed some dead code.

Let's see what other people think about supporting static ftrace, I have 
added Steven in cc if he has an opinion.

Thanks,

Alex


>
> [*]   Kernel Function Tracer
> [ ]   Kernel Function Graph Tracer
> -*-   enable/disable function tracing dynamically
>
> Signed-off-by: chenmiao <chenmiao.ku@gmail.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36061f473..f7fc8b460 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -97,6 +97,7 @@ config RISCV
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> +	select DYNAMIC_FTRACE if FUNCTION_TRACER
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
>   	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
