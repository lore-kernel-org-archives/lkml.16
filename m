Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045622839A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764915; cv=none; b=SVPMLte2dRTg6enTMMLGKXRLieoOFHSh4UyNviaQTVO2k9oBd97E1Xh2W8+6fIfCw8RF/E1oaFzA0MEoxZ9ehRGKrpMzuOctOWA/J+6+ykYqcIBELAauDG5GTR93xixxU08XvIBERvBdREIPEJWyQGTzshFDe6q0GpZ1iWkhsoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764915; c=relaxed/simple;
	bh=ya4kfp7iDLnvpazWT8X5vx1FqFLcX+UfiMMsZwuqQ6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEzoewnuOFp+8WNjRhlA9oX0oW70X+DYvvDfbHuUim5RTzBufPCLdn5NzY/Djmb2kBpkaG21VatptDbyvOtMbHziqgul6VTS8JAzNUsij7GQBgf5x0jb3uKMALPP0a55faHc0sGiQvF2Opb3bFkOtren8rvU+3xLQYyTqIzjmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uDKreJzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uDKreJzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD277C4CEF0;
	Tue, 24 Jun 2025 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750764915;
	bh=ya4kfp7iDLnvpazWT8X5vx1FqFLcX+UfiMMsZwuqQ6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDKreJzKN7psHsFTPkQtK32txKS8+tHCf0gk6HxZktH154bHxabOFqkI5KF6OSY9r
	 8yqfRhshGEqWIVHfR5EF788+iJKl+YxU8P4DjPnF9mj/E1kGhOa3O1ZJ5GwWy5513C
	 1yK/3jlR68qa9b1V9+DtSRM7ex4zQKg16pEz99xI=
Date: Tue, 24 Jun 2025 12:35:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2] mei: bus: fix device leak
Message-ID: <2025062458-sadness-pregnancy-94b6@gregkh>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624110520.1403597-1-alexander.usyskin@intel.com>

On Tue, Jun 24, 2025 at 02:05:20PM +0300, Alexander Usyskin wrote:
> The bus rescan function creates bus devices for all clients.
> The fixup routine is executed on all devices, unneeded
> devices are removed and fully initialized once set
> is_added flag to 1.
> 
> If link to firmware is reset right after all devices are
> initialized, but before fixup is executed, the rescan tries
> to remove devices.
> The is_added flag is not set and the mei_cl_bus_dev_destroy
> returns prematurely.
> Allow to clean up device when is_added flag is unset to
> account for above scenario.
> 
> Fixes: 6009595a66e4 ("mei: bus: link client devices instead of host clients")
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/bus.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
> index 67176caf5416..f2e5d550c6b4 100644
> --- a/drivers/misc/mei/bus.c
> +++ b/drivers/misc/mei/bus.c
> @@ -1430,17 +1430,14 @@ static void mei_cl_bus_dev_stop(struct mei_cl_device *cldev)
>   */
>  static void mei_cl_bus_dev_destroy(struct mei_cl_device *cldev)
>  {
> -
>  	WARN_ON(!mutex_is_locked(&cldev->bus->cl_bus_lock));
>  
> -	if (!cldev->is_added)
> -		return;
> -
> -	device_del(&cldev->dev);
> +	if (cldev->is_added) {
> +		device_del(&cldev->dev);
> +		cldev->is_added = 0;
> +	}
>  
>  	list_del_init(&cldev->bus_list);
> -
> -	cldev->is_added = 0;
>  	put_device(&cldev->dev);
>  }
>  
> -- 
> 2.43.0
> 

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

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
