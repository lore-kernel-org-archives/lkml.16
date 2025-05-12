Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F501BD035
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060184; cv=none; b=iLLW08Wf2YOgUk/zZBFwBCRU8KegsIBtOQCGlWyu2D6yNOqyj2uGFxwMdaKjn/VcRYh+bgK5uy4hiuPfHO86rsJdnnKKun9Ar6tBfVv3+N/ZgmhU6DWM22SxY1vhcnuldht+sxh15lKDpcggTveH4QutBCLoFwE/4Mx7YV26TOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060184; c=relaxed/simple;
	bh=EcI0vp4wo0rPFoOwXHb46js93DbpKg70V1aJeQEW+rQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nso9y9M/5DJ+qfHm6nMKqvAXQywgVQDc1aaL1wh8SISwfEH6PxeB6It9YGIqBVHHoPst6Q+7KlC+dliPArnCeKUYAmezq0ysskyhPPVTYMBW08al+BxqcjcaV2L2kCfNaI5NfUr9otXBDPdDhX2XcprwT8a05JauzZ/EXMxc3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4rinRmW/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hdgwawyo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4rinRmW/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hdgwawyo"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747060180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bulm+OAY6G9mwFtOIOO/nNbm8lthx9J/UosG91L7fxY=;
	b=4rinRmW/uHX018N9DTYr1SW3h7Gu25O2gbpdwtFNhPlVbNQvUwcr9VHWmVpF3nfsYzqqmc
	KVce5f4CcEK9fIKVKT0LGr1vwauRVdMqo6Zeosa4WxKBPuKdxrWmxXQWRU53sNvP4Eg04H
	bdMUpaO2SBM1JzYM/GpCWzXbxomu1h5XIHxQAIktWV1ZeTSoz1iq1xqYBBv+ZH1YyXah0c
	ml30ow+kz8VjwD9/kmNpLQGMa5ssSvMRjk6UjPiYbiTCyp3Wx908+6gCvMd5QKcf9Kfrev
	mFrJwvC8ijh/viUhHQRt3bhXB22TGZ6tSwCvbt5Szvg+Di3gbkrMvnnSP4OEEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747060180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bulm+OAY6G9mwFtOIOO/nNbm8lthx9J/UosG91L7fxY=;
	b=hdgwawyoaz9LAbwRHhGPcvSIjfXofFwW37OX343vDtRGeIc57x8igVldAwumhSllL9Gpi1
	3YktCIBb4sSGy1Bg==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the
 reverse of .msi_prepare()
In-Reply-To: <20250511163520.1307654-2-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-2-maz@kernel.org>
Date: Mon, 12 May 2025 16:29:39 +0200
Message-ID: <87h61plx64.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 17:35, Marc Zyngier wrote:

> While the MSI ops do have a .msi_prepare() callback that is
> responsible for setting up the relevant (usually per-device)
> allocation, we don't have a callback reversing this setup.

..., there is no callback reversing ...

> For this purpose, let's a .msi_teardown() callback. This is

'let's a ...' is not a sentence. Just say: add a .... calback.

> reliying on the msi_domain_info structure having a non-NULL

  ^^^^^ spell check is your friend.

> alloc_data field.
>
> Nobody is populating this field yet, so there is no change

No driver is ..

>  
> +static void msi_domain_ops_teardown(struct irq_domain *domain,
> +				    msi_alloc_info_t *arg)

No line break required.

> +{
> +}
> +
>  static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc)
>  {
> @@ -821,6 +826,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
>  	.get_hwirq		= msi_domain_ops_get_hwirq,
>  	.msi_init		= msi_domain_ops_init,
>  	.msi_prepare		= msi_domain_ops_prepare,
> +	.msi_teardown		= msi_domain_ops_teardown,
>  	.set_desc		= msi_domain_ops_set_desc,
>  };
>  
> @@ -842,6 +848,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
>  		ops->msi_init = msi_domain_ops_default.msi_init;
>  	if (ops->msi_prepare == NULL)
>  		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
> +	if (ops->msi_teardown == NULL)
> +		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
>  	if (ops->set_desc == NULL)
>  		ops->set_desc = msi_domain_ops_default.set_desc;
>  }
> @@ -1088,6 +1096,10 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
>  
>  	dev->msi.data->__domains[domid].domain = NULL;
>  	info = domain->host_data;
> +
> +	if (info->alloc_data)
> +		info->ops->msi_teardown(domain, info->alloc_data);

Hmm, that's weird.

Why not call it unconditionally. The empty teardown() default callback
does not care about @arg being NULL. No?

Thanks,

        tglx
