Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868162135DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326914; cv=none; b=cEWCcI9biv7Cn5mtKgBIUJFJitWy2lzPcabnwwUgQPGYk7F/57VTKpSuKpKSASMpJr5bSd9Omqz1LPUUEMeNGtHc+pUuDbxSMySJFPS/w4y0+iqYx2FKPlyCHw+pKkUtnSu0IX4+DNIDMbi7gACvunGLLZDSwWydq96uHbdire4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326914; c=relaxed/simple;
	bh=9RbKJiTqHj1K7Ly0QGY1qk4MpGVxJWCwdsvhyrRs0HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCvhzuSjBbHAl65XUOj8qLLAxIcvfQwIezp/5dhVdNpRkePesZMlhd2O1MjZZmMz6tz4IeNAi7fn5X5gEVfyigTVeWfAGg/rSV1FnYkI/UdA3zzsiXmNVH7g+arkj2iL6G6/Uv5+eRwdNVQRwRmnDnekUeJCG0V6c9nBor0ZsdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3AA143AED;
	Tue, 22 Apr 2025 13:01:48 +0000 (UTC)
Message-ID: <9d4b7987-40e9-4bed-8869-a514e6c96697@ghiti.fr>
Date: Tue, 22 Apr 2025 15:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Content-Language: en-US
To: Yeking@Red54.com
Cc: aou@eecs.berkeley.edu, dmaliotaki@gmail.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mick@ics.forth.gr, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
 <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepjeekuefgtdehhfevleffvdegteegleetieejkeehheefvedtuddvgfetvefgheffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepjggvkhhinhhgseftvgguheegrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegumhgrlhhiohhtrghkihesg
 hhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhitghksehitghsrdhfohhrthhhrdhgrhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr

Hi,

On 21/04/2025 12:16, Yeking@Red54.com wrote:
> LoongArch (merged):
> https://lore.kernel.org/all/tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com/
>
> RISC-V:
> https://lore.kernel.org/all/tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com/
>
> PowerPC:
> https://lore.kernel.org/all/tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com/
>
> SH:
> https://lore.kernel.org/all/tencent_40B6A6E7C79AEEEFEC79A07DE00724909A05@qq.com/
>
> ARM (rejected):
> https://lore.kernel.org/all/tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com/
>
> ARM64 (rejected):
> https://lore.kernel.org/all/tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com/
>
> Russell King (Oracle) wrote:
> "
> ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
> 6893/1: Allow for kernel command line concatenation") dated 4 May
> 2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
> supplied arguments.
>
> In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
> April 2016, which _post_ _dates_ the introduction on ARM, and the
> commit even states that it's fixing the lack of appending compared
> to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
> to the FDT arguments which come from the boot loader.
>
> It is DT that implemented this wrongly.
>
> No, we are not going to change arch/arm to conform to something
> that was implemented in a broken way. drivers/of needs fixing
> to actually implement it as it was *originally* intended - and
> there is five years of arch/arm doing this *before* DT started
> to do it.
>
> If drivers/of maintainers also don't want to change, then I'm
> sorry, but you have to then put up with the fact that it got
> wrongly implemented by drivers/of and thus has a different
> behaviour there.
> "


Thanks for the follow-up.

Since riscv always had the behaviour you describe in your patch, I'll 
take your patch.

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
