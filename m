Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1922759C;
	Thu, 17 Apr 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881834; cv=none; b=AkVdC1Veh6HjM45jC+vgNy112Gmt4OzY3yItO61YF5xtneZAn21+RKpzvDsF+17AllSRlFutdE1oUs1glyf9IICEoEXByvvTr/NVvzYZO9Yliz08HYZa5BSqjdRvVvonofB8U8Q1ihF9vKMAz9ewflhjIXOJX2JcdYQ7ayhdG9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881834; c=relaxed/simple;
	bh=YQUpCefNdvI8xpA5dQVESLiw7iqk9yusKmURdiL8tQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avGAkMzktepDFWR3UEYzi1drmwp8jSufAuY6Ey5Qarh1RtcTG5ubPxhloy1w+BNPhjLVO0WtbJLFiC3CpU4h6qNt7NClYJYg6EnU6t3vEILb+Iw3V3KmjPFTdrq8Nx8QmnELn7zMjWz8pXZcvNSjQ4yAkU0Tsvhwp8jIzs1CoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kQBQPf08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kQBQPf08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE65BC4CEE4;
	Thu, 17 Apr 2025 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744881833;
	bh=YQUpCefNdvI8xpA5dQVESLiw7iqk9yusKmURdiL8tQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQBQPf08ZcVqf73uYBCJG9Wndk66wcIM2I8PRErtj1KdapZKGmXggrguLa2j4GFBW
	 X9AbflVTWlrFclN53MInor6dmR2FEl2Bo46BU75GRIqCa/XPXW1SERyGNVeG+p295h
	 pcpc9pGjMvA/9hpsMCBWbxvqV45mRQJuVfuW87YA=
Date: Thu, 17 Apr 2025 11:23:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: include: fixes multiline comments style
Message-ID: <2025041748-opposing-macaroni-8a89@gregkh>
References: <20250416210411.9300-2-paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416210411.9300-2-paul.retourne@orange.fr>

On Wed, Apr 16, 2025 at 02:04:09PM -0700, Paul Retourné wrote:
> Fixes the style of multiline comments to comply with the linux kernel
> coding style.
> 
> Signed-off-by: Paul Retourné <paul.retourne@orange.fr>

I've applied this (took some manual intervention on my side), but:

> @@ -37,11 +38,13 @@ struct gpib_board_config {
>  	unsigned int ibirq;
>  	/* dma channel to use for non-pnp cards (set by core, driver should make local copy) */
>  	unsigned int ibdma;
> -	/* pci bus of card, useful for distinguishing multiple identical pci cards
> +	/*
> +	 * pci bus of card, useful for distinguishing multiple identical pci cards
>  	 * (negative means don't care)
>  	 */
>  	int pci_bus;

For these, and the other definitions in this file, can you move the
comments to use the proper kerneldoc format for the structure, so that
the tools can properly document the structures in here?  Having comments
above the variables really is not the best way to do this.

thanks,

greg k-h
