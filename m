Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C95E1F3FE8;
	Mon, 23 Jun 2025 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663160; cv=none; b=rAR4S3zCQj9m0hhllkJTig3JKOGTiw9XpWR+ay1L2+Zisg17JnskBL+z3z6VHm/09atien83Y5yZMgFa9/BREgJsta6e26NtmnnCanI0RnLs19NmwZMyTf7LII1e1YGfWHNRHCiWVcGZK8P+lblNIDbR5qRgawjJiiz4C+jiT2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663160; c=relaxed/simple;
	bh=avq5GSOpmlAjDpFvdLk3ekAvTWbX29Z9+MPrZVT0QmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8EFa/O2BsOsWt/JfU36HsDU6kWOBAssUZkbXcnwu2ecpvyKX1KnNBeaRrsYHgQz381Jif9ZtHCISWLQJ3fre6IsqG1808X9HfVm+Mz/mILlXhn/plwvwcphwg/DSSBqoLEtspCfvzQNctYkQHIzMDrFaUKGlMIDLwxVv9Fuc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L3CB5ov4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L3CB5ov4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957F3C4CEED;
	Mon, 23 Jun 2025 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750663159;
	bh=avq5GSOpmlAjDpFvdLk3ekAvTWbX29Z9+MPrZVT0QmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3CB5ov49BFO3mcFgc1jfxdnpFJ8pU813wFSa11t6BFh8aj/LDIhjwUKpcO03X+dx
	 Mngjod4kQru3gGTO4OuTcKx4TZDiBHEPa1WnaA+M1E44RnyrIs8U6XA0LXVmO4SGoI
	 EQbdlbm95hIQ7WCMdqd3HkRdHOqnqbg3fYySh7NQ=
Date: Mon, 23 Jun 2025 09:19:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steffen =?iso-8859-1?Q?B=E4tz?= <steffen@innosonix.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: imx-ocotp: fix MAC address byte length
Message-ID: <2025062357-pulp-unlaced-cdd9@gregkh>
References: <20250623070901.1733755-1-steffen@innosonix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623070901.1733755-1-steffen@innosonix.de>

On Mon, Jun 23, 2025 at 09:08:49AM +0200, Steffen Bätz wrote:
> The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
> extension of the "mac-address" cell from 6 to 8 bytes due to word_size
> of 4 bytes.
> 
> Thus, the required byte swap for the mac-address of the full buffer length,
> caused an trucation of the read mac-address.
> >From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14
> 
> After swapping only the first 6 bytes, the mac-address is correctly passed
> to the upper layers.
> 
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
> Signed-off-by: Steffen Bätz <steffen@innosonix.de>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 2 ++
>  drivers/nvmem/imx-ocotp.c     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e..3af7968f5a34 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
>  
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes = 6;
>  		for (i = 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
>  
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 79dd4fda0329..63e9974d9618 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
>  
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes = 6;
>  		for (i = 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
>  
> -- 
> 2.43.0
> 
> 
> -- 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
