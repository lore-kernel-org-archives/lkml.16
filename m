Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800E76410
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612467; cv=none; b=hwmc8AIhHyI6h3eKL/3RteA+M1FntQ9WUAiHZGYIYHyHBuySrNhRAhrfPL1Guv+FdwywXHh8iwrm724PFtVvjaDtajtMvPhRa5ah9PK87AHzlZGduKdDcjEqUGDZuyqQ8k3FhM4p9Zzs9p24EI9JliILRobDocmUpKf0o2yAxuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612467; c=relaxed/simple;
	bh=ntPKyH4AeKm5EpQcny23modMZ3zXstBwuBAobSMglyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGsjcKULnZT4KTvzBbjgOhH/jsucScEdd4PSbHX74ick8oRAI2Gy7uYbG0Gip+u1nw6CVXu1KUo2kCYmwvNSc8RCGs9GnrHtW23kos/5TKhkKY73w/8IX/uk4oKi0R/MZvgbkazP5Ym9W+tVmy19bfbbGxRuQR1SEewvAwJaR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ta6/7MHV; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ta6/7MHV"
Message-ID: <728f6bff-d029-4ce5-a760-520fadee26ac@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746612462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTC16He7H4sfi6zl/Fcqt7U/WheDL1YGEFsDZlcsXoU=;
	b=ta6/7MHVPhoC3q+0hg3Ujsv15a3XhYk+m6El5Vp1KBpJZjNOtmvmOsktID84KLb7Tm5iKe
	gjbHsmoIAXz6F5cpV/V/zagoxZrdOX4iyfFSiT27LCI7YT+sLXzaYw3tjj8OS+15z26w/a
	wNwNM+OtYN2x/McywzKwyeBg8YI2khA=
Date: Wed, 7 May 2025 18:07:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Increase max supported CPUs up to 2048
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
References: <20250507073428.216090-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250507073428.216090-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/7/25 3:34 PM, Huacai Chen 写道:
> Increase max supported CPUs up to 2048, including:
> 1. Increase CSR.CPUID register's effective width;
> 2. Define MAX_CORE_PIC (a.k.a. max physical ID) to 2048;
> 3. Allow NR_CPUS (a.k.a. max logical ID) to be as large as 2048;
> 4. Introduce acpi_numa_x2apic_affinity_init() to handle ACPI SRAT
>     for CPUID >= 256.
> 
> Note: The reason of increasing to 2048 rather than 4096/8192 is because
>        the IPI hardware can only support 2048 as a maximum.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/Kconfig                 |  6 ++--
>   arch/loongarch/include/asm/acpi.h      |  2 +-
>   arch/loongarch/include/asm/loongarch.h |  4 +--
>   arch/loongarch/kernel/acpi.c           | 41 ++++++++++++++++++++++----
>   4 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 38706186cf13..0c356de91bc4 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -496,10 +496,10 @@ config HOTPLUG_CPU
>   	  Say N if you want to disable CPU hotplug.
>   

>   config NR_CPUS
> -	int "Maximum number of CPUs (2-256)"
> -	range 2 256
> +	int "Maximum number of CPUs (2-2048)"
> +	range 2 2048
> +	default "2048"
I'm curious. As a new architecture, why did you write
such a small value at the beginning?


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
