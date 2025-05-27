Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC31FC7C5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333046; cv=none; b=JcH9uNF/hGsXUppXYPS+9iJrXHj0EDnh+7loBkPIFIwiy98BjqSkP+8zmPNkfqeT2/4cVHNrN2BTopD4y0WXdQ2b5QqOvJHUYFzqa/TnwkO3BhcZu+cKeOpRT/1OPfVg+fEbuXF13wz2LO4YduAOHltY7EK6UGEbE2rlOmI6LFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333046; c=relaxed/simple;
	bh=Uq/9D10lXbzi1KS9peiBWoTnlesyT7braxLVqsqImiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb7C8gjpTWFtudC3UPP5KJfUqNQ/xd/5AlvjG+CwhziLyQ848Gt91i4VjFhFJKtrDGywK8YncoMEFYfiqX7za4uiUS1Au3V8esqWfBHV8oAWEnu4vN0A5iCZEHn5bxSZuj7FIDkgcruwq2wt3waIS1wpbPlzweulkY1BdPIH5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=l3ZoZbD1; arc=none smtp.client-ip=62.149.155.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="l3ZoZbD1"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id JpEwuS0HSvoVFJpEwu7YT6; Tue, 27 May 2025 10:00:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1748332851; bh=Uq/9D10lXbzi1KS9peiBWoTnlesyT7braxLVqsqImiQ=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=l3ZoZbD1NkzS4NsmBPcoCgSRCouxgptrPuA9hatTIHVH1frCQXcbXQ+kaIGHED3EW
	 G+da3/apX5FnecjGp0rYRLgS3RFdymWqLg7PAyGGqo/2DjTY+NfjO8/XHbIZsSH9bc
	 cAEDyt7sdhl6M/Czve4zxlYFyGOFe+aTk3cSWgJwnZsvgLmLftiKrHwFvKIXir2f9K
	 exkA5nIEjf8gINWTb6NH5QGPBtCdMcuZRl26B+2CtKOZSj8MwVyVV7IplVlpTqipxF
	 xvDPoiVhHPch/mTEfwkijflPy70hac0p1bSda+CvfoO7+Bj5bhb06tDI7KPRgfKCzk
	 QiuVqiddkCe6Q==
Message-ID: <64886460-b8b2-4ad7-bf87-b3b98971e355@enneenne.com>
Date: Tue, 27 May 2025 10:00:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pps: clients: gpio: fix interrupt handling order in
 remove path
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>
Cc: jonnyc@amazon.com, gregkh@linuxfoundation.org, mschmidt@redhat.com,
 calvin@wbinvd.org, u.kleine-koenig@pengutronix.de, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
References: <20250527053355.37185-1-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20250527053355.37185-1-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPLB87f2GF6duPKGLDNszVPAXhyDtTVOTuWPHUOeKOlYaNpn4s6uQxgaVzGB7pnSb1kQNebc9DgbGK7c29qM9WJskmQ2BcrnL3FJ8C8Y1oMbfjljl60g
 lK17rk0zGA5zEe+HuRdYTF3TmqN7k0dbhgXSdi6/gwCldxO8DWWHfjrvvJ1N7NuKr/Z4QA/+wxWCpVzTZtKWGXuDjnyLNy1i/zEGvRVJq1GXzgwpd7BjqdNa
 eQqacTOGXMPEVNr+HREC9MMD4mokcnIL3jTAnyuUcewKBsKwQ4zicbG+N1BQODXdCJKnEZSXavN7WXZDeGliT9CElM6dim1HTN9yx8SFTPIdZu198Ef9E7lQ
 /KJ6uIzN1nvOCy+GlOUhipBRFTwOLziV/JqbzOS2gK2LwSgzGGyvM9kTNXm/qukmCdcCK2F5ZRfGQqMhKY9rty6hRa8+aQ==

On 27/05/25 07:33, Eliav Farber wrote:
> The interrupt handler in pps_gpio_probe() is registered after calling
> pps_register_source() using devm_request_irq(). However, in the
> corresponding remove function, pps_unregister_source() is called before
> the IRQ is freed, since devm-managed resources are released after the
> remove function completes.
> 
> This creates a potential race condition where an interrupt may occur
> after the PPS source is unregistered but before the handler is removed,
> possibly leading to a kernel panic.
> 
> To prevent this, switch from devm-managed IRQ registration to manual
> management by using request_irq() and calling free_irq() explicitly in
> the remove path before unregistering the PPS source. This ensures the
> interrupt handler is safely removed before deactivating the PPS source.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>   drivers/pps/clients/pps-gpio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
> index 374ceefd6f2a..2866636b0554 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c
> @@ -210,8 +210,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
>   	}
>   
>   	/* register IRQ interrupt handler */
> -	ret = devm_request_irq(dev, data->irq, pps_gpio_irq_handler,
> -			get_irqf_trigger_flags(data), data->info.name, data);
> +	ret = request_irq(data->irq, pps_gpio_irq_handler,
> +			  get_irqf_trigger_flags(data), data->info.name, data);
>   	if (ret) {
>   		pps_unregister_source(data->pps);
>   		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
> @@ -228,6 +228,7 @@ static void pps_gpio_remove(struct platform_device *pdev)
>   {
>   	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
>   
> +	free_irq(data->irq, data);

Why not just use devm_free_irq()?

>   	pps_unregister_source(data->pps);
>   	timer_delete_sync(&data->echo_timer);
>   	/* reset echo pin in any case */

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

