Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312B1DB125
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059884; cv=none; b=PshA1bCgQyvHk1880pICZ2O0xddxdRlz3ZRpZMyS8G++TsTK3vv75bQhtP3WwkL54BNKm3GGE2W6ExXeokJM0u0AZdOw4O1b1x3efy1sR1+/zskUulVOeE+c9IqOpXJi3Zd0gVZpFkDb48rlT1b7Go8AfRTaUBtqJwYna5DlgRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059884; c=relaxed/simple;
	bh=11QPqRLdD1jSx6Ddqs+FG9Kf+M08IkOtR4+wgtp/NpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K+JHzvF3909FkIZI1jeDiSy0XfLuqfowniqYJ18asQBG6CcBt5YegbkNVBWdaZfDLcyHHOi2M85fRJH6VZAskXqMQEyCQts59mrpgwVuG2Ul4d21N4o/teeu+3p5gWWdjRJqp14mxj0IB7Cv4ZrPu6f+8ehBxh28WYPNEVoKKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ynR0ViI9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hUqPEX1Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ynR0ViI9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hUqPEX1Y"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747059880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nu6e7u4zlEaPLOwI3OMMxF8f3AfgQopTfH9NxUGGPeA=;
	b=ynR0ViI9LVzx68V4gW83WzzLgoAXtjBBlPCJ4V/aRqIbqP3ZwPCEE12ncdQ3nvbqN3VcMH
	3Jo5W0sBzYNfIWiu4Y9yupFDWloPxOX9a/4lc59bcC0D98QOK7qFyRx5GpHeUxjzBm8GiI
	mBI4TSNyc6FwaYTqNAAf6h/qBUEufXotJhiBjt6JFOVk6NFFXM4YFtXE6LALa72EELjfY5
	7bHhsMeVGE60GvJKZzPpmZYOxh4cNbiGc5tsXDVEOy5ZzG9LrRTjPdTglo7UMjRvThl9yj
	22D2Tn6bi8Yb46z263s7DdZSY3S20sKYPBNBmVcb3FSVWYK3WecFxeu5kNJHSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747059880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nu6e7u4zlEaPLOwI3OMMxF8f3AfgQopTfH9NxUGGPeA=;
	b=hUqPEX1Ytc3z55oLoyPx9rrmwlywl/Bkxiedg7qUAH0+sBE5ICcZeaBi/nUywnfuSKDmOr
	eq+I/DxAhXWcRNBQ==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 3/4] genirq/msi: Move prepare() call to per-device
 allocation
In-Reply-To: <20250511163520.1307654-4-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-4-maz@kernel.org>
Date: Mon, 12 May 2025 16:24:39 +0200
Message-ID: <87jz6llxeg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 17:35, Marc Zyngier wrote:
> The current device MSI infrastructure is subtly broken, as it
> will issue an .msi_prepare() callback into the MSI controller
> driver every time it needs to allocate an MSI. That's pretty wrong,
> as the contract between the MSI controller and the core code is that
> .msi_prepare() is called exactly once per device.

That contract is nowhere written in stone.

There are some MSI controller which get confused about that, but that's
a problem of said controllers

> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index 0a44a2cba3105..68a8b2d03eba9 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -513,12 +513,14 @@ struct msi_domain_info {
>   * @chip:	Interrupt chip for this domain
>   * @ops:	MSI domain ops
>   * @info:	MSI domain info data
> + * @arg:	MSI domain allocation data (arch specific)

arg is a horrible name. Can this please be alloc_info or such?

> @@ -1025,6 +1026,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	bundle->info.ops = &bundle->ops;
>  	bundle->info.data = domain_data;
>  	bundle->info.chip_data = chip_data;
> +	bundle->info.alloc_data = &bundle->arg;
>  
>  	pops = parent->msi_parent_ops;
>  	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
> @@ -1053,21 +1055,28 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	msi_lock_descs(dev);

Please work against tip irq/msi which carries the guard() replacement
for msi_lock_descs(). This patch heavily conflicts with the queued
changes.

> +static int __populate_alloc_info(struct irq_domain *domain, struct device *dev,
> +				 unsigned int nirqs, msi_alloc_info_t *arg)
> +{

Why does this need double underscores?

> +	struct msi_domain_info *info = domain->host_data;
> +	int ret = 0;
> +
> +	/*
> +	 * If the caller has provided a template alloc info, use that. Once
> +	 * all users of msi_create_irq_domain() have been eliminated, this
> +	 * should be the only source of allocation information, and the
> +	 * prepare call below should be finally removed.

That's only a matter of decades :)

> +	 */
> +	if (info->alloc_data)
> +		*arg = *info->alloc_data;
> +	else
> +		ret = msi_domain_prepare_irqs(domain, dev, nirqs, arg);
> +
> +	return ret;

	if (!info->alloc_data)
        	return msi_domain_prepare_irqs(domain, dev, nirqs, arg);

	*arg = *info->alloc_data;
        return 0;

perhaps?

Thanks,

        tglx

         
