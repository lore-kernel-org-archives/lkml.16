Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA715F9DA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726148; cv=none; b=ZoqSNQE2/cnIf3q7ClqRt8agaRu1SrbTCHxIab3BIiv81+IQ+docXZSb+Y9PHKtFk4WTAGDlUAdROK0N3UB+LhiCp21opmEBQrBwOoVlHP+OT5tD+M0IZbomBEKDSFQyTufEQC1whz7WWDbbuvnNQuygOTTqZcMf3s23Y054OC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726148; c=relaxed/simple;
	bh=9O5wa5Rs0wo0+8sUHTgUxaPCY7KJc0sY05QQCfHijsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jO1/k98gS7USG0abRKwnIDW527sV4pyDiUnGLDZcuJ+UKoFyioFf/jaJkbp+cPL/q/VFMzbXs3wGY4D5MhFCBQPUTeXm1L1UYfpuqMp/9ARmk8Mbd3O2pXkA69dNtMMlQmHKVTmrD7cIemlWYED7ur1tBjPaODGBKmUvHmZUelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AMLo3qd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AMLo3qd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B754C4CEDD;
	Tue, 15 Apr 2025 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744726148;
	bh=9O5wa5Rs0wo0+8sUHTgUxaPCY7KJc0sY05QQCfHijsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMLo3qd5SELRCapzPXnfBgTAZXUfEuwI+FN/uwO2ndARHZ//jZL7qxRW8K5Xdetjy
	 JxTV/CTbenNxELSpGUNNx5z4mmZs5JWsTs+X3T3c7mDn3pQj0eOXQ0zvybyM3HSKhv
	 1bTK8EBVsNe654f6uHwMFzs74HNVOWK1J6t+3prI=
Date: Tue, 15 Apr 2025 16:09:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Tsygunka <aitsygunka@yandex.ru>
Cc: markus.elfring@web.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] misc: sram: Fix NULL pointer dereference in sram_probe
Message-ID: <2025041528-garment-senior-1c71@gregkh>
References: <84969aba-67ba-4990-9065-6b55ce26ff92@web.de>
 <20250307143442.4125844-1-aitsygunka@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307143442.4125844-1-aitsygunka@yandex.ru>

On Fri, Mar 07, 2025 at 05:34:42PM +0300, Andrey Tsygunka wrote:
> Add a check for the return value from platform_get_resource() call
> to be NULL.
> 
> If the passed device-tree contains a node for sram-device
> without a specified '<reg>' property value, for example:
> 
>     sram: sram@5c0000000 {
>         compatible = "nvidia,tegra186-sysram";
>     };
> 
> and the of_device_id[] '.data' element contains a sram_config*
> with '.map_only_reserved = true' property, we get the error:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.96 #1
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>   sram_probe+0x134/0xd30
>   platform_probe+0x94/0x130
>   really_probe+0x124/0x580
>   __driver_probe_device+0xd0/0x1f0
>   driver_probe_device+0x50/0x1c0
>   __device_attach_driver+0x140/0x220
>   bus_for_each_drv+0xbc/0x130
>   __device_attach+0xec/0x2c0
>   device_initial_probe+0x24/0x40
>   bus_probe_device+0xd8/0xe0
>   device_add+0x67c/0xc80
>   of_device_add+0x58/0x80
>   of_platform_device_create_pdata+0xd0/0x1b0
>   of_platform_bus_create+0x27c/0x6f0
>   of_platform_populate+0xac/0x1d0
>   of_platform_default_populate_init+0x10c/0x130
>   do_one_initcall+0xdc/0x510
>   kernel_init_freeable+0x43c/0x4d8
>   kernel_init+0x2c/0x1e0
>   ret_from_fork+0x10/0x20
> 
> Fixes: 444b0111f3bc ("misc: sram: use devm_platform_ioremap_resource_wc()")
> Signed-off-by: Andrey Tsygunka <aitsygunka@yandex.ru>
> ---
> v2: Description changed based on comments from Markus Elfring 
> at https://lore.kernel.org/linux-kernel/84969aba-67ba-4990-9065-6b55ce26ff92@web.de/,
> added tag 'Fixes', removed useless information from backtrace.
> 
>  drivers/misc/sram.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index e5069882457e..c8ba8ebd4364 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -410,8 +410,13 @@ static int sram_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -	ret = sram_reserve_regions(sram,
> -			platform_get_resource(pdev, IORESOURCE_MEM, 0));
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (unlikely(res == NULL)) {

Only use likely/unlikely if you can actually benchmark the difference.
For probe() callbacks, that is never the case, so just rely on the
compiler and cpu to get it right (hint, it almost always will.)

thanks,

greg k-h
