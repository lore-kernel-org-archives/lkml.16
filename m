Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB561C6B4
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748227058; cv=none; b=QOJwa5OBKflyGkdzj8KGS9cwNZPwfd6zeTLSio9+kv0vgGaSqwrl2TUehgRbcnFHlOONoDJ7UCh2Y0oaFxWS99VdFr5RWDCf3djB7QAfVzLxW5FjZZK0IJ7ah9wlYLgBUMVQwZOztTbrstf05NpSkaFn0fWqf7191wq0fBajCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748227058; c=relaxed/simple;
	bh=BY4ErxoAP9augDOLnkIcoFs771/iVqBR1pRf44PMqxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYrp0B34T/2mEZLfqrdoahjJZlbE+wpg+Cbaxp0TWdJAG/0W3ZSbt3U9lqShxIFTf3Zh2ukGWJ1fjto2YMPkI5dTd/7/pgdh9K6uvS/HlXFJGTKNSzSTsfVkhhW8jC2wOHOTVD32Nj/q3ovahwRxRxlihal5rinZ8eD7DntllZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hzps+WCn; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hzps+WCn"
Message-ID: <0f20ac8a-317c-4ce9-8c17-113f7eb6ad90@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748227054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7neqG58J+Ahj4nQSiH5zkGET3BZ/oA3S9VE4hGMMq20=;
	b=hzps+WCnA2GLYz0L+XZeVTim2hgrK8TVQHIypRyLTq5k+W6Cvlp6ZGsEKxqIxkUGuISH6c
	ISPYvh+Nyux23qZAe5bWlmdUDxr7Cpzs0Ce91mzkCHa+/o03qErNGXn59nuTrvl7bR8asI
	qh9rx8lU1h/CjsnX5tpG+YOPGrIe73c=
Date: Mon, 26 May 2025 10:37:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with
 xtheadvector
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Jesse Taube <jesse@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>, linux-kernel@vger.kernel.org
References: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/23/25 6:25 PM, Han Gao 写道:
> Previously only v0-v7 were correctly saved/restored,
> and the context of v8-v31 are damanged.
> Correctly save/restore v8-v31 to avoid breaking userspace.
> 
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
> 
> Changes in v2:
>    Add fix tag
>    Improve commit mesage
> 
> v1: https://lore.kernel.org/linux-riscv/c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com/
> 
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

