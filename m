Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA3C2F2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747195330; cv=none; b=rfWA8iZ0x+V8k6o/lZUNrsOzLkm2qzycu9sVs12zyJBsdsUnaP6MZrt6vzStJOOaKgIwPTPvt22cGpgzvVE0yGeZ5B1wSZmrw/K2cxqXiz5KOkxOIlstG8KhnhG4jK0Deu9i45LfU9idVVIBQXdu3x2St4vdiLii1wJDF8fbBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747195330; c=relaxed/simple;
	bh=S7JukqHOYkDYz0VYozJOAFKe/VpuXSWKVBZM8Ghy/5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Aw5vwmZsVCcDjYF5zZUhev1jY2kUQxw6jSJOcu6hNlCW/1NT087YjcQ6OrS5zqyul9qYSbFDQffq757SIHWYCeqE2AsA2BQvDE1x5eMA4MFWkqaj7UT/fTCXUk5zQ9xrAUzyRZ0gmvuTETn6cirDN9NVXYGrxB6nX4x9UWtbbqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Zy0573zj0z2TRxp;
	Wed, 14 May 2025 12:01:15 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id A9AC11401E9;
	Wed, 14 May 2025 12:01:58 +0800 (CST)
Received: from [10.174.179.113] (10.174.179.113) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 14 May 2025 12:01:58 +0800
Message-ID: <f37e647d-7b17-4440-9d1b-f44d0ebab352@huawei.com>
Date: Wed, 14 May 2025 12:01:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] mailbox: mchp-ipc-sbi: Fix COMPILE_TEST build error
To: <jassisinghbrar@gmail.com>, <afd@ti.com>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-kernel@vger.kernel.org>
References: <20250411075747.3716565-1-yuehaibing@huawei.com>
Content-Language: en-US
From: Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <20250411075747.3716565-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)

ping..

On 2025/4/11 15:57, Yue Haibing wrote:
> If COMPILE_TEST is y but RISCV_SBI is n, build fails:
> 
> drivers/mailbox/mailbox-mchp-ipc-sbi.c: In function ‘mchp_ipc_sbi_chan_send’:
> drivers/mailbox/mailbox-mchp-ipc-sbi.c:119:23: error: storage size of ‘ret’ isn’t known
> 	struct sbiret ret;
> 	              ^~~
>   CC      drivers/nvmem/lpc18xx_otp.o
> drivers/mailbox/mailbox-mchp-ipc-sbi.c:121:15: error: implicit declaration of function ‘sbi_ecall’ [-Werror=implicit-function-declaration]
> 	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, command, channel,
> 	      ^~~~~~~~~
> 
> move COMPILE_TEST to ARCH_MICROCHIP dependency as other drivers.
> 
> Fixes: e4b1d67e7141 ("mailbox: add Microchip IPC support")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/mailbox/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ed52db272f4d..e8445cda7c61 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -191,8 +191,8 @@ config POLARFIRE_SOC_MAILBOX
>  
>  config MCHP_SBI_IPC_MBOX
>  	tristate "Microchip Inter-processor Communication (IPC) SBI driver"
> -	depends on RISCV_SBI || COMPILE_TEST
> -	depends on ARCH_MICROCHIP
> +	depends on RISCV_SBI
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	help
>  	  Mailbox implementation for Microchip devices with an
>  	  Inter-process communication (IPC) controller.
