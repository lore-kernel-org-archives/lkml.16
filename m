Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7623BE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272645; cv=none; b=ksahnrTdww88jvTK1rGsX6Xo1VH0Zmj1ySaOSEWt7I95mUqzeAu/cqFXNFot9qM7CTcQJxvCrEylvDdDHVhDruKfAZuQuWsTnCRwEATHfoMYKYNqhlbkvr7iOPegqe1a7QzFPp4/mOqZSm6kUKRH0n+KIR3lcjFsmLiZzMPk5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272645; c=relaxed/simple;
	bh=7d11dxMUWSlUIvsx1ISMixfrtiUXfAzjI3gLaGSALKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6SS00BNM9kIoyIqDCx2EVBZDAhqdNVxOOdSAa/FgKJEEt+TW188g6I4maSYDyZ667fRcLQ3fNfmV8U0BkIejkbQirGLzAKDALlPsSgYYRDz5v8cJVLaxb4JmjfTGpRgcDp159SnXhuUCAbq84mp8fUUz5m/U/f7bFqix/u3BAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aBaWm5U+; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aBaWm5U+"
Message-ID: <7135de9f-4372-4e12-994d-ecdc234bff28@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747272641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ciAFAPUHoqP7kxDTaOJWSofaP2GTW0t32HqF5a7B428=;
	b=aBaWm5U+V54ipnws5yhyd78b0OCayavJMYV1WP4Do40m7+AZKeVhiwXPNb1Vh6DBT/FQbj
	vJA1nJOn4XmwrE4UwRcPtYvDzpfZFAsDpASr85yAyd7JE8fAe7Uyhq4qOCzyLLGsswApKE
	nnouiomU3pAY4gGj1KnCcoUmOIBCc08=
Date: Thu, 15 May 2025 09:30:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Save and restore CSR.CNTC for hibernation
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Xianglai Li <lixianglai@loongson.cn>
References: <20250514144643.1620870-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250514144643.1620870-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/14/25 10:46 PM, Huacai Chen 写道:
> Save and restore CSR.CNTC for hibernation which is similar to suspend.
> 
> For host this is unnecessary because sched clock is ensured continuous,
> but for kvm guest sched clock isn't enough because rdtime.d should also
> be continuous.
> 
> Host::rdtime.d = Host::CSR.CNTC + counter
> Guest::rdtime.d = Host::CSR.CNTC + Host::CSR.GCNTC + Guest::CSR.CNTC + counter
> 
> so,
> 
> Guest::rdtime.d = Host::rdtime.d + Host::CSR.GCNTC + Guest::CSR.CNTC
> 
> To ensure Guest::rdtime.d continuous, Host::rdtime.d should be at first
> continuous, while Host::CSR.GCNTC / Guest::CSR.CNTC is maintained by KVM.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   arch/loongarch/kernel/time.c     | 2 +-
>   arch/loongarch/power/hibernate.c | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index e2d3bfeb6366..bc75a3a69fc8 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -111,7 +111,7 @@ static unsigned long __init get_loops_per_jiffy(void)
>   	return lpj;
>   }
>   
> -static long init_offset __nosavedata;
> +static long init_offset;
>   
>   void save_counter(void)
>   {
> diff --git a/arch/loongarch/power/hibernate.c b/arch/loongarch/power/hibernate.c
> index 1e0590542f98..e7b7346592cb 100644
> --- a/arch/loongarch/power/hibernate.c
> +++ b/arch/loongarch/power/hibernate.c
> @@ -2,6 +2,7 @@
>   #include <asm/fpu.h>
>   #include <asm/loongson.h>
>   #include <asm/sections.h>
> +#include <asm/time.h>
>   #include <asm/tlbflush.h>
>   #include <linux/suspend.h>
>   
> @@ -14,6 +15,7 @@ struct pt_regs saved_regs;
>   
>   void save_processor_state(void)
>   {
> +	save_counter();
>   	saved_crmd = csr_read32(LOONGARCH_CSR_CRMD);
>   	saved_prmd = csr_read32(LOONGARCH_CSR_PRMD);
>   	saved_euen = csr_read32(LOONGARCH_CSR_EUEN);
> @@ -26,6 +28,7 @@ void save_processor_state(void)
>   
>   void restore_processor_state(void)
>   {
> +	sync_counter();
>   	csr_write32(saved_crmd, LOONGARCH_CSR_CRMD);
>   	csr_write32(saved_prmd, LOONGARCH_CSR_PRMD);
>   	csr_write32(saved_euen, LOONGARCH_CSR_EUEN);

