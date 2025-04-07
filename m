Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E724CEFD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030059; cv=none; b=EmzaEHlz30sOrdCeOV9TMMHbqat98Rq1QuQQjz9GzI8xtManOi9aO58GLQXz3CnDrvsAe8cY2QoDDkli/Ozvjd3DC07GIqiDGSCZdwqwY+2VnPqPqqOMcuN1EOOBRDUIMmmYHUMbiMArKVGwv0txh6MPVRVpE6swQvRhhJucXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030059; c=relaxed/simple;
	bh=XTk5PsG8uayg5LAmbSO+vTuCSziVUwoF9sUJ4XPFQJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXemqTZC+2nRF90Sdb5X/R3WGIiXJgn6zCBStC3mp6MT9J/D/OhQgFiIGMMzWEihiwZKBUP16TJmkB/lRKztUZOlrbh6tGDyeeRYEje0gOb5oqEKSynDIq/MoIj3MGYInIHc1emj97dmKjwFcEv/fgFiVtLZNYlDGX0KDO1ZG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2996543160;
	Mon,  7 Apr 2025 12:47:31 +0000 (UTC)
Message-ID: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
Date: Mon, 7 Apr 2025 14:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Content-Language: en-US
To: Yeking@Red54.com, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Kossifidis <mick@ics.forth.gr>, Debbie Maliotaki
 <dmaliotaki@gmail.com>, linux-kernel@vger.kernel.org
References: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuieegveegudffiedvveejhfejiefhgefhkeejtdeufedufeehhfeufeduleehieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepjggvkhhinhhgseftvgguheegrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpr
 ghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhitghksehitghsrdhfohhrthhhrdhgrhdprhgtphhtthhopegumhgrlhhiohhtrghkihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi XIE Zhibang,

On 28/03/2025 11:14, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
>
> It is the built-in command line appended to the bootloader command line,
> not the bootloader command line appended to the built-in command line.
>
> Fixes: 3aed8c43267e ("RISC-V: Update Kconfig to better handle CMDLINE")
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> ---
>   arch/riscv/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 54ed2a8cd7af..4cd18d0d07b3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1144,8 +1144,8 @@ config CMDLINE_FALLBACK
>   config CMDLINE_EXTEND
>   	bool "Extend bootloader kernel arguments"
>   	help
> -	  The command-line arguments provided during boot will be
> -	  appended to the built-in command line. This is useful in
> +	  The built-in command line will be appended to the command-
> +	  line arguments provided during boot. This is useful in
>   	  cases where the provided arguments are insufficient and
>   	  you don't want to or cannot modify them.
>   


It seems that you're correct 
(https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/of/fdt.c#L1065).

I noticed that all the architectures that define this config have the 
same text, so I guess the behavior changed at some point.

I would suggest to fix all the architectures and find which commit 
changed this behavior.

Thanks,

Alex


