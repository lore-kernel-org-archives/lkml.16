Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E85239E6B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733181; cv=none; b=L3O18HIo4AlhhRbHeM3MrH1oOqXEA3aAd0zId/PRknNwYSL3Ei+eh4xFHYt75TjNMN1KJnLTnVKMel9WqJ9Hyg2UsV769YzMGvMZm2gsS3pKtrlmnqceYjLrfglXS2DwUT9BG53+ZtHlA4lJSflD6+YBYnoZxRR2sLHaLi0Wf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733181; c=relaxed/simple;
	bh=qSAyXuJ8H56M/vtRw/yCjYUJR5sWogP3cA04nZot1a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEYYR2m1L7bx6gPmCnCMb9Wujh5EXP2p3lGBRRsWJp4teVuyf1i4dGqG5CN/1EZ5Dab0oDHsrukg3Z3cCIrppqdcWzPD+8cbVrAIvJsjYptzzsv4nOsJUx93losZqTPAGpIgnI/mcBEiFSKJD+LwcsSJNkXt/XVA7kBsVJlxWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0882E4433C;
	Thu, 12 Jun 2025 12:59:24 +0000 (UTC)
Message-ID: <b74f5717-bab6-4d8c-8afb-fe3fcb6e29ff@ghiti.fr>
Date: Thu, 12 Jun 2025 14:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] riscv: Optimize gcd() code size when
 CONFIG_RISCV_ISA_ZBB is disabled
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
 <20250606134758.1308400-3-visitorckw@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606134758.1308400-3-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepvhhishhithhorhgtkhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrk
 hgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshgvrhhvsegttghnshdrnhgtkhhurdgvughurdhtfi
X-GND-Sasl: alex@ghiti.fr

Hi Kuan-Wei,

On 6/6/25 15:47, Kuan-Wei Chiu wrote:
> The binary GCD implementation depends on efficient ffs(), which on
> RISC-V requires hardware support for the Zbb extension. When
> CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
> GCD, as runtime logic will always fall back to the odd-even
> implementation.
>
> To avoid compiling unused code and reduce code size, select
> CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.
>
> $ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
> Function                                     old     new   delta
> gcd                                          360      86    -274
> Total: Before=384, After=110, chg -71.35%
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bbec87b79309..f085adc6f573 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -95,6 +95,7 @@ config RISCV
>   	select CLINT_TIMER if RISCV_M_MODE
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)


In v2, Andrew asked if he could merge it, so:

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

