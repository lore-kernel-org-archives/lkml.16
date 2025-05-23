Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90C1F1317
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990445; cv=none; b=kERJMjHTQu8YAuVqOdHcpmp69LJPTvRc/7UYZHWlK0OfPpEjB338tyu+dgbB1bzHXFOyJT2I5oDm3bba7xaJvYNnDmpjtn5X6rmKBPqwfcBq03Cifh0gSlgupFoRhTRh9sg3Q70tXJyhFwTQK/lv+QCIwMo0Cv5l0YhardNUL9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990445; c=relaxed/simple;
	bh=8x1ZoTKR89XhhRzAxNM2SETR2cHprshyhZR7QbKd0RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7vV9KMPJ8uZgWo+F8qpDlf4b1AxJFke+m/JyZhdP1gk48ZJGDGujbIdezT/EQ6tlVQTjSUi5b4tla2tGUkPwlnOfNJOXrfh+Z3PuLa6rnhr6akbxpftxC2MTOlrpqE6f0pYk/rtRmW0gZG3gxR1s3AQ9SZ8q7i3TlHkayvchEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1137943AD8;
	Fri, 23 May 2025 08:53:59 +0000 (UTC)
Message-ID: <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
Date: Fri, 23 May 2025 10:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekgeefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhgrsggvnhgurgdrtghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhgvshhsvgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghnugihsghnrggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Han,

On 5/22/25 19:27, Han Gao wrote:
> Fix [1] save/restore vector register error
>
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]


Would you mind rephrasing the log? It should explain what was wrong and 
how you fixed it.

Thanks,

Alex


>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/include/asm/vector.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index e8a83f55be2b..7df6355023a3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
>   			THEAD_VSETVLI_T4X0E8M8D1
>   			THEAD_VSB_V_V0T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V8T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V16T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V24T0
>   			: : "r" (datap) : "memory", "t0", "t4");
>   	} else {
>   		asm volatile (
> @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>   			THEAD_VSETVLI_T4X0E8M8D1
>   			THEAD_VLB_V_V0T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V8T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V16T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V24T0
>   			: : "r" (datap) : "memory", "t0", "t4");
>   	} else {
>   		asm volatile (
