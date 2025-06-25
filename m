Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795431E9B04
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836458; cv=none; b=evWMLCtKG4LngJFXWxOSUGldmll/evsw4Y7OWMpGcrQC/ffWF4lMx8/W1RvSa1daMrPuB8OqikTqFaQmwrK7SHZWS0a2kAEK28mlwCouqLvRCTTqdVC3GQgxDg7lCTWnVXXoqDXTOUl/y8gyuNFfPZFNbG58IjFHXv0Sop96z2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836458; c=relaxed/simple;
	bh=gb2wGiZu74RqqJqhX1esbflHF0cg3aU9V15dfrHTPuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZbWQJYSymNdGJc8IgUCE8w57R9dXylUDdyBIMT8QoKNd/owzZxdjpCop8FBxIezW4RxztyWPgXX0kG72JKVz3UC5NgbbgI//SFcmmw9BQ548jfD1nxY3ffijWBcNdBWwjG6UPoK0Uy+2KNdgOPFwm/I+h2kWzV9nKC2piK1EEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bRAqsqkb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bRAqsqkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CTJ7
	m01QlF0COGdgm0pbIkw/ui2APLrwIzfMjYyoeZU=; b=bRAqsqkb/n1EJw8V39JM
	y4BM8n/PZ/CWzXVJ0sLa6VM1mOco8HInKGbvm3OnWBLiYJ2yuE06xCpAsOVMVc0P
	vEBzs4VNzxojXLO3kwAGymyKXFUl6Fn8LKVfQ76+aaYignnBCIOJVkeB+QYJGLSk
	dCvlXMzhG8vQaouw7XAtmFaMd9CSQU/n3/GjoKVvBYCKhr6yDbQkunas/ImB/Bk9
	oALJBllPC4MXuUdFov7N1p3G4VyFH0SB1FblGTC/jdIlpeh9yVOMz6f7+eAQrTJ7
	gT1yv8anJmuNWzUK6Y0IuiBpBZKs5kfFdxghzYe7myGnTm2vafcl+6nQA6u9JJPd
	8A==
Received: (qmail 548001 invoked from network); 25 Jun 2025 09:27:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:27:33 +0200
X-UD-Smtp-Session: l3s3148p1@2abSYGA4UL1tKLNf
Date: Wed, 25 Jun 2025 09:27:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: dw: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFuk5IBH9N0ljNIK@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>


>  static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>  				       u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
> +	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
>  }

Same question as patch 2, why not remove the surrounding functions?

