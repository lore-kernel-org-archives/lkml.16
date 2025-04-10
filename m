Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD91F0E39
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285902; cv=none; b=QHcbl297JVagtu8nobhYOm/sB62u5WTrnCg5P9RiITKVm06QvNVESEWdNTMz4YVbg4UrUBQ4dhFvxMBAlkVoVNQ1mZzyn6gRB0nnYQC+rcToeUaALoo8Oo1zU5L4zdnP0udPk/Q56kNceGUXTMrVbt5rCxDWWgi5nDbpwh1rJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285902; c=relaxed/simple;
	bh=TFdyn+2Q4CrMW9IPz1Lpwi47mtufgHesFnoPsrosV+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIypxzxCdqm4mnpBVFpQZJLSa4oHLHj8Td8ECgaXhPGQwsUyk6weLNFF1Tbr2/VZWgY6JLU98q/hXoTAbpOGCwb+mrNwxNTKE/MNlxHnC54oXGHxzGmRB7o7W1KxEurSW90xaZuKtAuzua/EoFAK5XNE8VteFYLDrR31I80Bwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BPzfYau8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BPzfYau8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144CEC4CEDD;
	Thu, 10 Apr 2025 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744285901;
	bh=TFdyn+2Q4CrMW9IPz1Lpwi47mtufgHesFnoPsrosV+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPzfYau8yZr1TdLKn/g34Y1HmzGG0MjkQh0gtpS4iR6TKM5rZC4hqhiRn/9Wf1ELx
	 m5maSe5lNG4/z0qUbxtMVILCs6emyTMiry2nEjaMqEAxJwoSDZeaPg09JgxSjICxC5
	 q8NZSrjR5X6+agZPe5mwCYJ1Ufy1hH0LSCWBDgmc=
Date: Thu, 10 Apr 2025 13:50:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: arnd@arndb.de, jpanis@baylibre.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe
Message-ID: <2025041049-pushing-paced-3a3e@gregkh>
References: <20250410105256.70310-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410105256.70310-1-hanchunchao@inspur.com>

On Thu, Apr 10, 2025 at 06:52:53PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in tps6594_pfsm_probe() is not checked.
> Add NULL check in tps6594_pfsm_probe(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/misc/tps6594-pfsm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
> index 0a24ce44cc37..05c4e081a8d2 100644
> --- a/drivers/misc/tps6594-pfsm.c
> +++ b/drivers/misc/tps6594-pfsm.c
> @@ -281,6 +281,11 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
>  	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
>  					    tps->chip_id, tps->reg);
> +	if (!pfsm->miscdev.name) {
> +		devm_kfree(dev, pfsm);
> +		return -ENOMEM;
> +	}

How was this found and tested?

thanks,

greg k-h
