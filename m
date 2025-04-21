Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8715855C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221674; cv=none; b=JVHSpDOkNY3P7G4Bw19reMK1pKAWYARuHYuqtg4U+lvnLI2DOFvkch3d31utNjAo8WAyzHu1W3G5mk91J4hHv1xzqWSWd6jleL+lTLiMkz4rxQQdNxkxvNt3+nxR/RRUhjjDnXBqGK0PzKNUUnmSyAqWDFgWBpsUcmhZFVHvcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221674; c=relaxed/simple;
	bh=62a2DWNdMgeu8D4/KjhURE1I2RQGTzeMONSQbFTP4OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yei2Qd7NGb5rTaRD1kiF2yisYZNhWQ88rcVDmEO6DH67wFVwuu7yZKAr/TtZaMmfvTrW8AldcAXaJ+a2eBh9VPu9HulhQwLthqc3ltX2/ovW9MCx7w+n019k0AxqFF90OpKhzrheemSW6hWvnU/wryzHjSp64XIOAbi03fC0v9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98578442A6;
	Mon, 21 Apr 2025 07:47:46 +0000 (UTC)
Message-ID: <c7941874-758b-49eb-af58-23c371b7d1e8@ghiti.fr>
Date: Mon, 21 Apr 2025 09:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: misaligned: Add handling for ZCB instructions
Content-Language: en-US
To: Nylon Chen <nylon.chen@sifive.com>, linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-2-nylon.chen@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250411073850.3699180-2-nylon.chen@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehnhihlohhnrdgthhgvnhesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvhesl
 hhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhgvshhsvgesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Nylon,

On 11/04/2025 09:38, Nylon Chen wrote:
> Add support for the Zcb extension's compressed half-word instructions
> (C.LHU, C.LH, and C.SH) in the RISC-V misaligned access trap handler.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>


I would add the following fixes tag:

Fixes: 956d705dd279 ("riscv: Unaligned load/store handling for M_MODE")


> ---
>   arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 7cc108aed74e..d7275dfb6b7e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -88,6 +88,13 @@
>   #define INSN_MATCH_C_FSWSP		0xe002
>   #define INSN_MASK_C_FSWSP		0xe003
>   
> +#define INSN_MATCH_C_LHU		0x8400
> +#define INSN_MASK_C_LHU			0xfc43
> +#define INSN_MATCH_C_LH			0x8440
> +#define INSN_MASK_C_LH			0xfc43
> +#define INSN_MATCH_C_SH			0x8c00
> +#define INSN_MASK_C_SH			0xfc43
> +
>   #define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
>   
>   #if defined(CONFIG_64BIT)
> @@ -431,6 +438,13 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>   		fp = 1;
>   		len = 4;
>   #endif
> +	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
> +		len = 2;
> +		insn = RVC_RS2S(insn) << SH_RD;
> +	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
> +		len = 2;
> +		shift = 8 * (sizeof(ulong) - len);
> +		insn = RVC_RS2S(insn) << SH_RD;
>   	} else {
>   		regs->epc = epc;
>   		return -1;
> @@ -530,6 +544,9 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
>   		len = 4;
>   		val.data_ulong = GET_F32_RS2C(insn, regs);
>   #endif
> +	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
> +		len = 2;
> +		val.data_ulong = GET_RS2S(insn, regs);
>   	} else {
>   		regs->epc = epc;
>   		return -1;


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

