Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E320FAA8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207504; cv=none; b=uRgB5NK9v89m39CPpn2UuR5bqtFHSM7HUYWlkYT97e8rYMvvUOYtBjvL3csYRKXVInqSAbxiGZltccxxTGbYI2qh3LqCS9urmjKGzF5vALhZttzeePUSw0tslA5n+ukYD8f9OgA+DQaNK2IutabowDHjl894j9EEERHK6Jt9L20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207504; c=relaxed/simple;
	bh=WcsezBt7zk1OwtbAR4+bBHA60/kUhzeK0Wkrdkb9QG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YSrW+H+M6zGnJHlVehEWKNOFDCYEA/Mad/LiIrWKEbpGqXPenaiocgVxhaErSjs7IlhkTRlzqj+SraK1mkLo+LArbhgHMLuoxK5aHawsLg0qpEgwV4a46H5oNG1e2v+x77yN+sOaxvggsuHKm3dyULqi5f2C7aj6fHvO3RymYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08D08442BC;
	Wed, 14 May 2025 07:24:55 +0000 (UTC)
Message-ID: <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
Date: Wed, 14 May 2025 09:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746997351.git.namcao@linutronix.de>
 <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeifeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveetvdfhvdeuheekvdettdegheetgeejiefgjeetvedtfeeuvddvtefhjeffgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlm
 hgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Nam,

On 11/05/2025 23:17, Nam Cao wrote:
> Similar to other instruction-processing macros/functions, branch_rs2_idx
> should be in insn.h.
>
> Move it into insn.h as RV_EXTRACT_RS2_REG. This new name matches the style
> in insn.h.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/insn.h            | 5 +++++
>   arch/riscv/kernel/probes/simulate-insn.c | 5 +----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..debac13a3476 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -64,6 +64,7 @@
>   #define RVG_RS2_OPOFF		20
>   #define RVG_RD_OPOFF		7
>   #define RVG_RS1_MASK		GENMASK(4, 0)
> +#define RVG_RS2_MASK		GENMASK(4, 0)
>   #define RVG_RD_MASK		GENMASK(4, 0)
>   
>   /* The bit field of immediate value in RVC J instruction */
> @@ -295,6 +296,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>   	({typeof(x) x_ = (x); \
>   	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
>   
> +#define RV_EXTRACT_RS2_REG(x) \
> +	({typeof(x) x_ = (x); \
> +	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })


RV_X() definition was inconsistent across multiple files, so I 
harmonized RV_X() it in this patch 
https://lore.kernel.org/linux-riscv/20250508125202.108613-3-alexghiti@rivosinc.com/

So here you use the "old" version, would you mind rebasing on top this 
patchset and use RV_X_mask() instead?

If you can't, let me know and I'll find some time, I'd like to merge 
those cleanups in 6.16.

Thanks,

Alex


> +
>   #define RV_EXTRACT_RD_REG(x) \
>   	({typeof(x) x_ = (x); \
>   	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 6c166029079c..77be381bb8b4 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
>   #define branch_rs1_idx(opcode) \
>   	(((opcode) >> 15) & 0x1f)
>   
> -#define branch_rs2_idx(opcode) \
> -	(((opcode) >> 20) & 0x1f)
> -
>   #define branch_funct3(opcode) \
>   	(((opcode) >> 12) & 0x7)
>   
> @@ -157,7 +154,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
>   	unsigned long rs2_val;
>   
>   	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
> -	    !rv_insn_reg_get_val(regs, branch_rs2_idx(opcode), &rs2_val))
> +	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
>   		return false;
>   
>   	offset_tmp = branch_offset(opcode);
