Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB91E3DE8;
	Thu, 19 Jun 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326004; cv=none; b=Fwh7J3YRrv0TVXbkrFAkggPX3p+decC1nQPxgBgQGF7tTPqRIk4tyTT8ebbGHi1oCuwq45pshE3kO+goq7PqAfmiRdBZNiWvT/iiUDoA80Ul8Paib11pyVJL2cVMC6+Kl02HEmnQzJWE4HWgVjCMJJO05lPgy7lU866Dg1Nz1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326004; c=relaxed/simple;
	bh=fZlPKatLYwNanCWk1nXGV7+CVjeRqV2c1wAmnP45Qm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgTnMOItZqceMJnARBVaC+FeMj25+24oabDzn2TYV9iLLM2XTKvYl6tL6Vg/Jto+bnQhDCBjp4arqgf0jgQAI5mC9Kj0tJIneKgvTHmv3k0Znz8ccojSntEJvUqRelqU5Xlv/Lf4cfoF7ZhqLsNHs4P3ydl7A2QuppJLTIyRCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oLY2Jgmb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oLY2Jgmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A77C4CEEA;
	Thu, 19 Jun 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750326003;
	bh=fZlPKatLYwNanCWk1nXGV7+CVjeRqV2c1wAmnP45Qm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLY2Jgmby5OXr8e6VFw0ZJRi0yWT9ESi+JJQ3OroiymaPBvBmDfMdRh0AIXs7Fxwa
	 GO6RzZGwTEYNCFZvNVEp+oN/LkJdrZjFcv7vWwDDaG6VK4UmUiMi6ULgCqBeA38XMM
	 m+6uYLCwzahdQ6WoOR2qITOTKl0uLZqFSvTRZqz0=
Date: Thu, 19 Jun 2025 11:40:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: hsyemail2@gmail.com
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: Re: [PATCH v2 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
Message-ID: <2025061941-dexterous-basket-fc7f@gregkh>
References: <2025060325-everyone-padlock-931a@gregkh>
 <20250604025154.10165-1-syhuang3@nuvoton.com>
 <20250604025154.10165-2-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604025154.10165-2-syhuang3@nuvoton.com>

On Wed, Jun 04, 2025 at 10:51:54AM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add support for the Nuvoton USB-to-serial adapter, which provides
> multiple serial ports over a single USB interface.
> 
> The device exposes one control endpoint, one bulk-in endpoint, and
> one bulk-out endpoint for data transfer. Port status is reported via
> an interrupt-in or bulk-in endpoint, depending on device configuration.
> 
> This driver implements basic TTY operations.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
>  drivers/usb/serial/nct_usb_serial.c | 1480 +++++++++++++++++++++++++++
>  1 file changed, 1480 insertions(+)
>  create mode 100644 drivers/usb/serial/nct_usb_serial.c

This patch does not actually allow the .c file to be built, so how was
this tested?

confused,

greg k-h
